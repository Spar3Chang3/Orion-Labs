#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail

echo "Building latest project files..."
if ! npm run build; then
    echo "Build failed. Please check the error logs."
    exit 1
fi

echo "Cleaning public directory..."
if [ -d "./public" ]; then
    rm -rf ./public/*
else
    mkdir ./public
fi

echo "Copying files from ./build to ./public..."
cp -r ./build/* ./public/

echo "Files copied successfully."

echo "Handing off to \"firebase deploy\"..."
firebase deploy