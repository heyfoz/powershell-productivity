#!/usr/bin/env pwsh
# File header specifies pwsh interpreter location for Linux and MacOS

# Define parameters type/name
param([string]$p1Directory, [string]$p2FileName)

# Set execution policy to allow local script creation with digital signature
Set-ExecutionPolicy RemoteSigned

# Navigate to script directory
cd $p1Directory

# Generate code signing certificate to sign script for 1 year
New-SelfSignedCertificate -Subject "CN=My Code Signing Certificate" -CertStoreLocation "Cert:\CurrentUser\My" -Type CodeSigningCert -NotAfter (Get-Date).AddYears(1)
# Console output example:
# PSParentPath: Microsoft.PowerShell.Security\Certificate::CurrentUser\My

# Thumbprint                                Subject
# ----------                                -------
# 1234567890abcdef1234567890abcdef12345678  CN=My Code Signing Certificate


# Get the path to the certificate
Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert

# Sign the script with the thumbprint
Set-AuthenticodeSignature -FilePath .\scriptName.ps1 -Certificate (Get-ChildItem Cert:\CurrentUser\My\1234567890abcdef1234567890abcdef12345678)
