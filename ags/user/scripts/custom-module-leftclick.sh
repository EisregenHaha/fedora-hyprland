#!/bin/bash

# This script is for the custom module's left-click action in ags
# It will simulate opening an application or performing an action

# Configuration
APPLICATION_COMMAND="notify-send 'Heart Monitor' 'Opening application...'" # Example command

# Execute the command
eval $APPLICATION_COMMAND
