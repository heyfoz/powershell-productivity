#!/usr/bin/env pwsh
# File header specifies pwsh interpreter location for Linux and MacOS

# Use cmdlet to prompt user to enter a string.
# Pipeline operator used to send Read-Host output to Trim method
$stringVariable = Read-Host "Please enter a string:" | Trim

