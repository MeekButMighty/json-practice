#!/bin/bash

# Fetch METAR data and save it to aviation.json
curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85" > aviation.json

# Extract the receiptTime field
jq -r '.[0:6] | .[].receiptTime' aviation.json

