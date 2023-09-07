#!/bin/bash

# Get the repository name from the user
read -p "Enter Repository Name: " DIRECTORY_NAME

# Create the directory
mkdir "$DIRECTORY_NAME"

cp directory.sh $DIRECTORY_NAME

# Change into the directory
cd "$DIRECTORY_NAME"

# Define the content for README.md
README_CONTENT="#This repository contains directories for ALX $DIRECTORY_NAME project by **Chika Achebe** as part of requirements for _12 months SE programme._"

# Create README.md and write content to it
echo "$README_CONTENT" > README.md

# Initialize Git
git init


# Display a success message
echo "Directory '$DIRECTORY_NAME' created with README.md."

