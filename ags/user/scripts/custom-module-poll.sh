#!/bin/bash

# This script is for the custom module in ags
# It will output a Font Awesome icon and a number

# Configuration
ICON="" # Font Awesome heart icon
MIN_NUMBER=0
MAX_NUMBER=100

# Generate a random number
RANDOM_NUMBER=$(shuf -i $MIN_NUMBER-$MAX_NUMBER -n 1)

# Output for ags
echo "${ICON} ${RANDOM_NUMBER}%"
