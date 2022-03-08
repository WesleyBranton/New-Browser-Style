#!/bin/bash

# Clean old files
echo "Creating demo..."
echo -n "Cleaning old files... "
rm -r -f ../demo
echo "Done!"

# Create directories
echo -n "Creating directories... "
mkdir ../demo
mkdir ../demo/src
mkdir ../demo/src/icons
echo "Done!"

# Copy files
echo -n "Creating files... "
cp -r ../src/. ../demo/src
cp ../docs/* ../demo
cp ../*.md ../demo
cp ../*.html ../demo
echo "Done!"

echo "Demo created!"