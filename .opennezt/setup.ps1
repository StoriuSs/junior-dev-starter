Write-Host "------------------------------------------------"
Write-Host "OpenNezt: Running custom setup script (Windows)..."
Write-Host "------------------------------------------------"

# Practical Example: Auto-create .env from .env.example
$examplePath = Join-Path $PSScriptRoot "..\\.env.example"
$envPath = Join-Path $PSScriptRoot "..\\.env"

# Note: PSScriptRoot is inside .opennezt/, so we go up to the root
if (Test-Path ".env.example") {
    if (-not (Test-Path ".env")) {
        Write-Host "Creating .env from .env.example..."
        Copy-Item ".env.example" ".env"
        Write-Host "✓ .env file created"
    } else {
        Write-Host "Note: .env already exists, skipping creation"
    }
} else {
    Write-Host "Warning: .env.example not found"
}

# Create a test file to verify the script ran
$now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"Setup script executed successfully on $now" | Out-File -FilePath "setup_test.txt"

Write-Host "✓ Custom setup complete!"
Write-Host "------------------------------------------------"
