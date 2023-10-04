param(

)

if ($null -eq (Get-Command "wails" -ErrorAction SilentlyContinue)) {
    Write-Verbose -Message "Installing wails"
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
}


Write-Verbose "Start running the script..."

$projectRoot = Split-Path -Parent $PSScriptRoot

Write-Verbose "Going to project root: $projectRoot"

Set-Location -Path $projectRoot

if (-Not (Test-Path -Path "go.mod")) {
    Write-Error "This is not the project root"
}

Write-Verbose "Current Go version: $(go version)"

Write-Verbose "Start building the app for windows platform..."
wails build --clean --platform windows/amd64
