# Creating a module class and importing it to another file

## Step 1: Creating file and defining your class
Create a file named mat.py
* Define your class
* Define your methods(functions), objects and variables. This forms the attributes of the class
Example:
```
# A Script a class with simple arithmetic attribute (Function)

class SimpleArithmetic:
    def addition(self, a, b):
        adding = a + b
        return adding

    def subtraction(self, a, b):
        subtracting = a - b
        return subtracting

    def multiplication(self, a, b):
        multiplying = a * b
        return multiplying

    def division(self, a, b):
        try:
            dividing = a/b
            return dividing
        except: ZeroDivisionError
        print("Can not be divided by zero")
```

## Step 2: Creating another file and importing the module above
Create the new file and import the class defined in **mat.py** 
Example:

```
import mat

make_obj = mat.SimpleArithmetic()
addit = make_obj.division(76, 9)
print(addit)
```
In the snippet above, the class **SimpleArithmetic** was imported and was assigned to **make_obj** variable. The **make_object** was further assiged to **addit** variable and was printed using print function, inputing two parameters 76 and 9.
