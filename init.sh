#!/bin/bash

# Install Homebrew if not already installed
if [ ! -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install the latest version of Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Copy your customized .zshrc file to your home directory
cp ~/dotfiles/.zshrc ~/.zshrc

# Restart the terminal to activate changes
source ~/.zshrc


# Install thefuck
if [ ! -x "$(command -v thefuck)" ]; then
    brew install thefuck
fi

# Copy your customized .zshrc file to your home directory
cp ~/dotfiles/.zshrc ~/.zshrc

# Restart the terminal to activate changes
source ~/.zshrc

brew install hammerspoon
mkdir ~/.hammerspoon

mkdir ~/.hammerspoon/init.lua

brew install cliclick
brew install koekeishiya/formulae/skhd

# Install the Fira Code font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
