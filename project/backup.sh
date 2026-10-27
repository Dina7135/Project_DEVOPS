#!/bin/bash

# ===========================================================
# backup.sh
# Automatic backup script for info.txt
# ===========================================================

# Directory where this script and info.txt are located
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source file to back up
SOURCE_FILE="$PROJECT_DIR/info.txt"

# Backups directory
BACKUP_DIR="$PROJECT_DIR/backups"

# Step 1: Create backups directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Check that the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found!"
    exit 1
fi

# Step 2 & 3: Create a timestamped copy of info.txt in backups/
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
BACKUP_FILE="$BACKUP_DIR/info_${TIMESTAMP}.txt"

cp "$SOURCE_FILE" "$BACKUP_FILE"

# Step 4: Print success message
echo "Backup completed successfully"
