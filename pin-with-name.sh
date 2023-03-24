#!/bin/bash

# Set the name of the file containing the list of CIDs and folder names
filename="list_of_strings.txt"

# Read the file line by line
while read -r line; do
    # Split the line into the CID and folder name
    cid="$(echo "$line" | cut -d ' ' -f 1)"
    foldername="$(echo "$line" | cut -d ' ' -f 2)"

    # Execute the command for each line
    ipfs files cp /ipfs/"$(ipfs pin add "$cid" --progress | cut -f 2 -d ' ')" "/$foldername"
done < "$filename"
