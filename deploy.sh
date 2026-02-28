#!/bin/bash

# Salesforce Deployment Script

# Load environment variables from .env file if it exists
if [ -f "$(dirname "$0")/.env" ]; then
  # shellcheck disable=SC1091
  source "$(dirname "$0")/.env"
fi

# Variables
SOURCE_USERNAME="${SOURCE_ORG:-${SOURCE_USERNAME:-source@example.com}}"
DESTINATION_USERNAME="${DESTINATION_ORG:-${DESTINATION_USERNAME:-destination@example.com}}"
METADATA_DIR="${METADATA_DIR:-path/to/metadata}"

# Retrieve metadata from the source org
echo "Retrieving metadata from source org: $SOURCE_USERNAME"
sf project retrieve start --metadata ApexClass --source-org "$SOURCE_USERNAME" --target-dir "$METADATA_DIR"

# Deploy metadata to the destination org
echo "Deploying metadata to destination org: $DESTINATION_USERNAME"
sf project deploy start --source-dir "$METADATA_DIR" --target-org "$DESTINATION_USERNAME" --test-level RunLocalTests --wait 30

echo "Deployment completed."