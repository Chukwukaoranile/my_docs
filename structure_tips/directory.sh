#!/bin/bash

# Get the directory name from the user
read -p "Enter directory name: " DIRECTORY_NAME

# Create the directory
mkdir "$DIRECTORY_NAME"

# Change into the directory
cd "$DIRECTORY_NAME" || exit

# Define the content for README.md
README_CONTENT="#This directory contains files for ALX $DIRECTORY_NAME project by Chika Achebe as part of requirements for 12 months SE programme."

# Create README.md and write content to it
echo "$README_CONTENT" > README.md

# Display a success message
echo "Directory '$DIRECTORY_NAME' created with README.md."

