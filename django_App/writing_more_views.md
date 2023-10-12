# TAsk - Writting more views in Django App

## Objective of the task: Create views and templates to 1) register and view a bug and 2) list all bugs registered.
**Steps:**

- Read the [third](https://docs.djangoproject.com/en/3.2/intro/tutorial03/) and [fourth](https://docs.djangoproject.com/en/3.2/intro/tutorial04/) parts of the Writing your first Django app tutorial.
- Create one view to register a bug into the database.
- Create a html template with a simple form to add the bug to database.
- Create another view to view the fields of the bug.
- Create a html template with a simple list of the fields of the bug.
- And finally, create a view to list all the bugs in the database.
- Create a html template with a simple list with links to the detail page of each bug.

To achieve the objective of creating views and templates for registering, viewing, and listing bugs in a Django web application, you can follow these steps. This example assumes you have a Django project and an app named "bug" set up:

### Step 1: Read the Django Tutorial

Before starting, make sure to read the third and fourth parts of the official Django tutorial to gain a better understanding of creating views, templates, and working with forms in Django:

[Django Tutorial Part 3: Views and Templates](https://docs.djangoproject.com/en/3.2/intro/tutorial03/)
[Django Tutorial Part 4: Form and Generic Views](https://docs.djangoproject.com/en/3.2/intro/tutorial04/)

### Step 2: Create a Model for Bugs
In your app's models.py, create a model to represent bugs:

```
from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

# Create your models here
class bug(models.Model):
    BUG_TYPES = [
        ('error', 'Error'),
        ('feature', 'New Feature'),
        ('enhancement', 'Enhancement'),
        ('other', 'Other'),

    ]

    STATUS_CHOICES = [
        ('todo', 'To Do'),
        ('in_progress', 'In Progress'),
        ('done', 'Done'),

    ]

    description = models.TextField()
    bug_type = models.CharField(max_length=35, choices=BUG_TYPES, default='error')
    report_date = models.DateField(default=datetime.now)
    status = models.CharField(max_length=35, choices=STATUS_CHOICES, default='todo')

    def __str__(self):
        return self.description

```

### Step 3: Create Forms

Create a form for bug registration and display. In your app's forms.py, you can create a form like this:

```
from django import forms
from .models import Bug

class BugForm(forms.ModelForm):
    class Meta:
        model = Bug
        fields = ['title', 'description']


```

### Step 4: Create Views

In your app's views.py, create views for bug registration, detail view, and listing bugs:

```

from django.shortcuts import render, redirect, get_object_or_404
from .models import Bug
from .forms import BugForm

def register_bug(request):
    if request.method == 'POST':
        form = BugForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('bug_list')
    else:
        form = BugForm()
    return render(request, 'bug/register_bug.html', {'form': form})

def view_bug(request, bug_id):
    bug = get_object_or_404(Bug, pk=bug_id)
    return render(request, 'bug/view_bug.html', {'bug': bug})

def bug_list(request):
    bugs = Bug.objects.all()
    return render(request, 'bug/bug_list.html', {'bugs': bugs})


```

### Step 5: Create Templates


Create templates for registering a bug, viewing a bug, and listing bugs. These templates should be placed in the templates/bug directory inside your app directory.

**base.html**
```
<!DOCTYPE htlm>
<html>
        <head>
                <meta charset="utf-8">
                <meta author="Chika Luke Achebe">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Bug App</title>

        </head>
        <body>
                {% block content %} {% endblock%}

        </body>
</html>
```

**register_bug.html:**

```
{% extends "blog/base.html" %}
{% block content %}

<h1>Register a Bug</h1>
<form method="post">
    {% csrf_token %}
    {{ form.as_p }}
    <button type="submit">Submit</button>
</form>

{% endblock content %}
```
**view_bug.html:**
```
{% extends "blog/base.html" %}
{% block content %}

<h1>Bug Details</h1>
<ul>
        <li><strong>Description: </strong>{{ bug.description }}</li>
        <li><strong>Bug Type: </strong>{{ bug.bug_type }}</li>
        <li><strong>Report Date: </strong>{{ bug.report_date }}</li>
        <li><strong>Status: </strong>{{ bug.status }}</li>
</ul>

{% endblock content %}
```

**bug_list.html**

```
{% extends "blog/base.html" %}
{% block content %}

<h1>List of Bug Fields of the Bug</h1>
<ul>
    {% for bug in bugs %}
    <li> <strong>Description: </strong>{{ bug.description }}</li>
    <li><strong>Bug Type: </strong>{{ bug.bug_type }}</li>
    <li><strong>Report Date: </strong> {{ bug.report_date }}</li>
    <li><strong>Status: </strong> {{ bug.status }}</li><br>
    {% endfor %}
</ul>

{% endblock content %}
```

**bug_list_link.html**
```
{% extends "blog/base.html" %}
{% block content %}

<h1>List of Bugs in the Database With links to their Individual Details</h1>
<ul>
    {% for bug in bugs %}
    <li><a href="{% url 'view_bug' bug.id %}">{{ bug.description }}</a></li>
    {% endfor %}
</ul>

{% endblock content %}

```
### Step 6: Define URLs

Define the URLs for the views in your app's `urls.py`:

```
from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_bug, name='register_bug'),
    path('bug/<int:bug_id>/', views.view_bug, name='view_bug'),
    path('bugs/', views.bug_list, name='bug_list'),
    path('link/', views.bug_link, name='bug_list_link'),
]
```

### Step 7: Run Migrations and Start the Server

Run migrations to apply changes to the database schema:

```
python manage.py makemigrations
python manage.py migrate

```

Run server:

```
python3 manage.py runserver
```
