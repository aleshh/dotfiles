# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Reduce transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Appearance: Light
defaults delete NSGlobalDomain AppleInterfaceStyle 2>/dev/null || true

# Accent color: Graphite
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# Show scroll bars: Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Show window title icons (document proxy icons)
defaults write -g NSDocumentShowIcon -bool true

# Dock: bottom
defaults write com.apple.dock orientation -string "bottom"

# Dock: automatically hide
defaults write com.apple.dock autohide -bool true

# Dock: remove autohide animation delay
defaults write com.apple.dock autohide-delay -float 0

# Trackpad: three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Restart Dock to apply Dock settings
killall Dock

