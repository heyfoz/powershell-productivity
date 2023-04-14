#!/usr/bin/env pwsh
# File header specifies pwsh interpreter location for Linux and MacOS

param()

# Navigate to script directory
cd 'C:\path\to\directory

# Generate code signing certificate to sign script
New-SelfSignedCertificate -Subject "CN=My Code Signing Certificate" -CertStoreLocation "Cert:\CurrentUser\My" -Type CodeSigningCert -NotAfter (Get-Date).AddYears(1)

# Get the path to the certificate
Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert

# Sign the script with the thumbprint
Set-AuthenticodeSignature -FilePath .\scriptName.ps1 -Certificate (Get-ChildItem Cert:\CurrentUser\My\thumbprintHere)
