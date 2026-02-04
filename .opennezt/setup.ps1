Write-Host "------------------------------------------------"
Write-Host "OpenNezt: Running custom setup script (Windows)..."
Write-Host "------------------------------------------------"

# Practical Example: Auto-create .env from .env.example
# PSScriptRoot is d:\ZENT\assessment-repos\junior-dev-starter\.opennezt
$examplePath = Join-Path $PSScriptRoot "..\\.env.example"
$envPath = Join-Path $PSScriptRoot "..\\.env"

Write-Host "Checking for: $examplePath"

if (Test-Path $examplePath) {
    if (-not (Test-Path $envPath)) {
        Write-Host "Creating .env from .env.example..."
        Copy-Item $examplePath $envPath
        Write-Host "✓ .env file created"
    } else {
        Write-Host "Note: .env already exists, skipping creation"
    }
} else {
    Write-Host "Warning: .env.example not found at $examplePath"
}

# Create a test file to verify the script ran
$logPath = Join-Path $PSScriptRoot "..\\setup_test.txt"
$now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"Setup script executed successfully on $now" | Out-File -FilePath $logPath

Write-Host "✓ Custom setup complete!"
Write-Host "------------------------------------------------"
