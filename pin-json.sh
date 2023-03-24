#!/bin/bash

# Set the name of the JSON file containing the list of CIDs and folder names
filename="cids.json"
# Format: [{"cid":"CID","folderName":"FolderName"}]

# Read the JSON file line by line, assuming it contains an array of objects
jq -c '.[]' "$filename" | while read -r line; do
    # Extract the CID and folder name from the line using jq
    cid="$(echo "$line" | jq -r '.cid')"
    foldername="$(echo "$line" | jq -r '.folderName')"

    # Execute the command for each line
    ipfs files cp /ipfs/"$(ipfs pin add "$cid" | cut -f 2 -d ' ')" "/$foldername"
done
