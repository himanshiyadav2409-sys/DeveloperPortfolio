#!/bin/bash

# Author: Himanshi Yadav
# Roll Number: 2601730035
# Purpose: Create a compressed backup of a folder

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

# Store the source folder
SOURCE="$1"

# Check if the folder exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

# Create backup directory
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup filename
BACKUP_FILE="backup_${TIMESTAMP}.tar.gz"

# Create compressed backup
if tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then

    SIZE=$(du -h "$BACKUP_DIR/$BACKUP_FILE" | awk '{print $1}')

    echo "Backup created successfully!"
    echo "Backup filename: $BACKUP_FILE"
    echo "Backup size: $SIZE"

    echo "$TIMESTAMP - SUCCESS: $BACKUP_FILE ($SIZE)" >> "$BACKUP_DIR/backup.log"

else
    echo "Error: Backup creation failed."
    echo "$TIMESTAMP - FAILED: $BACKUP_FILE" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
