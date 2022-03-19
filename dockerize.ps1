try { Remove-Item -Path $PSScriptRoot\WebApiDatabase.db -Confirm:$false -Force -ErrorAction Stop } catch { }
try { Get-ChildItem -Path $PSScriptRoot\Migrations -Recurse -File -ErrorAction Stop | ForEach-Object -Parallel { Remove-Item -Path $_.FullName -Confirm:$false -Force } } catch { }
dotnet ef migrations add AddTables
dotnet ef database update
docker build --rm --tag optechx/webapi --file "${PSScriptRoot}/Dockerfile" $PSScriptRoot
