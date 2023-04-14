#!/usr/bin/env pwsh
# File header specifies pwsh interpreter location for Linux and MacOS

# 2 Strings to Text File PowerShell Script

# Define parameters type/name
param([string]$p1UserString, [string]$p2FilePath)

# Use cmdlet to prompt user to enter a string.
# Pipeline operator used to send Read-Host output to Trim method
$stringVariable = Read-Host "Please enter a string:" | Trim

# Display the args (values of the params) in the console
Write-Host "File path: $p2FilePath"
Write-Host "User string: $p1UserString"

# Add-Content -Path $p2FilePath -Value $1UserString
# Append the user string to the specified file contents
Add-Content -Path $p2FilePath -Append $1UserString
