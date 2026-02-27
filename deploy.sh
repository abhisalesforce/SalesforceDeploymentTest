#!/bin/bash

# Salesforce Deployment Script

# Variables
SOURCE_USERNAME="source@example.com"
DESTINATION_USERNAME="destination@example.com"
METADATA_DIR="path/to/metadata"

# Retrieve metadata from the source org
echo "Retrieving metadata from source org..."
sfdx force:source:retrieve -u "$SOURCE_USERNAME" -m CustomObject, ApexClass, ApexTrigger, etc. -r "$METADATA_DIR"

# Deploy metadata to the destination org
echo "Deploying metadata to destination org..."
sfdx force:source:deploy -u "$DESTINATION_USERNAME" -p "$METADATA_DIR"

echo "Deployment completed."