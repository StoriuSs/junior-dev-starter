#!/bin/bash
echo "------------------------------------------------"
echo "OpenNezt: Running custom setup script (Unix)..."
echo "------------------------------------------------"

# Practical Example: Auto-create .env from .env.example
if [ -f ".env.example" ]; then
    if [ ! -f ".env" ]; then
        echo "Creating .env from .env.example..."
        cp .env.example .env
        echo "✓ .env file created"
    else
        echo "Note: .env already exists, skipping creation"
    fi
else
    echo "Warning: .env.example not found"
fi

# Create a test file to verify the script ran
echo "Setup script executed successfully on $(date)" > setup_test.txt

echo "✓ Custom setup complete!"
echo "------------------------------------------------"
