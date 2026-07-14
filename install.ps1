$dotnetPath = (Get-Command dotnet).Source | Split-Path -Parent

$latestVersion = (Get-ChildItem "$dotnetPath\sdk" | Sort-Object Name -Descending | Select-Object -First 1).Name

$targetPath = "$dotnetPath\sdk\$latestVersion\sdk\Bemole"
New-Item -ItemType Directory -Force -Path $targetPath

$sourcePath = ".\src\Bemole.Sdk"

Copy-Item -Path "$sourcePath\SDK" -Destination "$targetPath" -Recurse -Force
Copy-Item -Path "$sourcePath\Core" -Destination "$targetPath" -Recurse -Force
Copy-Item -Path "$sourcePath\Tasks" -Destination "$targetPath" -Recurse -Force

$debugPath = ".\bin\Debug\$latestVersion"
$tasksBinPath = "$targetPath\Tasks\bin"
New-Item -ItemType Directory -Force -Path $tasksBinPath
Copy-Item -Path "$debugPath\*" -Destination $tasksBinPath -Recurse -Force

Write-Host "Installation successfull"
