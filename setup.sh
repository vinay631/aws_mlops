#!/bin/bash

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Create virtual environment using uv
echo "Creating virtual environment..."
uv venv

# Activate virtual environment
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# Install dependencies using uv
echo "Installing dependencies..."
uv pip install -r requirements.txt

# Install dev dependencies
uv pip install --deps

# Initialize CDK project
cd cdk
cdk init app --language python

echo "Setup complete!"