#!/usr/bin/env bash

sudo -v

# Magnified icon and tile size.
defaults write com.apple.dock largesize -float 48
defaults write com.apple.dock tilesize -float 32

# Dim hidden apps.
defaults write com.apple.dock showhidden -boolean true

# Prevent changes to Dock size.
defaults write com.apple.dock size-immutable -boolean true
