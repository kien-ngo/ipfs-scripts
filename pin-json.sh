#!/bin/bash

# Check if the filename parameter is provided
if [ -z "$1" ]; then
    echo "Please provide the filename as a parameter."
    exit 1
fi

# Set the name of the JSON file containing the list of CIDs and folder names
filename="$1"
# Format: [{"cid":"CID","label":"Label Name"}]

# Read the JSON file line by line, assuming it contains an array of objects
while IFS= read -r line; do
    # Extract the CID and Label from the line using Bash string manipulation
    cid=$(grep -o '"cid":"[^"]*' <<< "$line" | cut -d':' -f2 | tr -d '"')
    label=$(grep -o '"label":"[^"]*' <<< "$line" | cut -d':' -f2 | tr -d '"')

    # Execute the command for each line
    echo "|Pinning data for $label"
    ipfs files cp /ipfs/"$(ipfs pin add "$cid" --progress | cut -f 2 -d ' ')" "/$label"
    echo "|_____Done"
done < "$filename"
