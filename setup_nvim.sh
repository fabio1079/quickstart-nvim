#!/bin/bash

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Define the Neovim config path
NVIM_CONFIG="$HOME/.config/nvim"
LAZY_PATH="$HOME/.local/share/nvim/lazy.nvim"

# Create necessary directories
echo "Creating Neovim config directories..."
mkdir -p "$NVIM_CONFIG/lua"

# Copy configuration files
echo "Copying configuration files..."
cp init.lua "$NVIM_CONFIG/"
cp config.lua "$NVIM_CONFIG/lua/"
cp plugins.lua "$NVIM_CONFIG/lua/"

# Install Lazy.nvim if not installed
if [ ! -d "$LAZY_PATH" ]; then
  echo "Installing Lazy.nvim..."
  git clone https://github.com/folke/lazy.nvim "$LAZY_PATH"
else
  echo "Lazy.nvim is already installed."
fi

# Install plugins using Neovim
echo "Installing plugins..."
nvim --headless "+Lazy sync" +qa

echo "Neovim setup completed! 🎉"

