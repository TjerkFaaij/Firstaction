#!/bin/bash

echo "Starting deployment..."

cd /path/to/your/app || exit

echo "Pulling latest changes..."
git pull

echo "Restarting the application..."
systemctl restart my-project

echo "Deployment completed. Checking status..."
systemctl status my-project
