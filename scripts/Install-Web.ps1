$ErrorActionPreference = 'Stop'
Install-WindowsFeature -Name Web-Server -IncludeManagementTools | Out-Null
Import-Module WebAdministration
$root = 'C:\inetpub\wwwroot'
New-Item -ItemType Directory -Path "$root\vm-a","$root\vm-b" -Force | Out-Null
$html = '<html><body><h1>VM B</h1><p>gateway-lab-b | private IP 10.60.1.10</p></body></html>'
foreach ($folder in @($root, "$root\vm-a", "$root\vm-b")) {
  Set-Content -LiteralPath "$folder\index.html" -Value $html -Encoding UTF8
}
Set-Content -LiteralPath "$root\health.txt" -Value 'OK' -Encoding ASCII
Set-Service W3SVC -StartupType Automatic
Start-Service W3SVC
if ((Invoke-WebRequest -UseBasicParsing http://localhost/health.txt).StatusCode -ne 200) { throw 'IIS health check failed' }
