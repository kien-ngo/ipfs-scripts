#!/bin/bash

# Set the name of the file containing the list of strings

filename="cids.txt"

# Read the file line by line
while read -r line; do
    # Execute the command for each line
    ipfs pin add "$line" --progress
done < "$filename"
