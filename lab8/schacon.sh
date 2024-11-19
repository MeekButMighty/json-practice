#!/usr/bin/python3

import json

with open('../data/schacon.repos.json', 'r') as file:
    data = json.load(file)

# Assume the JSON has been read into the variable 'data'
# Example structure: a list of dictionaries
# data = [{"name": "repo1", "html_url": "...", "updated_at": "...", "visibility": "public"}, ...]

# Open the output CSV file in append mode
with open('chacon.csv', 'a') as file:
    # Write the header line (optional, comment out if headers aren't needed)
    file.write("name,html_url,updated_at,visibility\n")
    
    # Limit the output to 5 lines
    for entry in data[:5]:
        # Extract the required fields, ensuring all keys exist
        name = entry.get("name", "")
        html_url = entry.get("html_url", "")
        updated_at = entry.get("updated_at", "")
        visibility = entry.get("visibility", "")
        
        # Assemble the fields into a comma-separated line
        line = f"{name},{html_url},{updated_at},{visibility}\n"
        
        # Append the line to the CSV file
        file.write(line)

