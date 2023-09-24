#!/bin/bash

# Check if the filename parameter is provided
if [ -z "$1" ]; then
    echo "Please provide the filename as a parameter."
    exit 1
fi

# Set the name of the JSON file containing the list of CIDs and folder names
filename="$1"

# Read the CSV file line by line, skipping the header line
tail -n +2 "$filename" | while read -r line; do
    # Split the line into the CID and folder name
    cid="$(echo "$line" | cut -d ',' -f 1)"
    label="$(echo "$line" | cut -d ',' -f 2)"

    # Execute the command for each line
    echo "Pinning data for $label"
    ipfs files cp /ipfs/"$(ipfs pin add "$cid" --progress| cut -f 2 -d ' ')" "/$label"
done
