#!/bin/bash

# Set the name of the CSV file containing the list of CIDs and folder names
filename="cids.csv"

# Read the CSV file line by line, skipping the header line
tail -n +2 "$filename" | while read -r line; do
    # Split the line into the CID and folder name
    cid="$(echo "$line" | cut -d ',' -f 1)"
    foldername="$(echo "$line" | cut -d ',' -f 2)"

    # Execute the command for each line
    ipfs files cp /ipfs/"$(ipfs pin add "$cid" | cut -f 2 -d ' ')" "/$foldername"
done
