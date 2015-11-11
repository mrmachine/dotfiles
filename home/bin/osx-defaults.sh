#!/bin/bash

# 1Password, View, Item List Layout
# [x] Top
defaults write com.agilebits.onepassword4 MainWindowLayout 'H'

# 1Password, Preferences, Watchtower
# [x] Enable 1Password Watchtower
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper watchtowerService -int 1

# 1Password, Preferences, Browser
# [ ] Automatically submit logins after filling
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper autosubmit -int 0

# 1Password, Preferences, Advanced
# [ ] Verify browser code signature
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper OPPrefBrowserCodesigningRequirementDisabled -int 1

# Activity Monitor, Network
# Network Graph Type: [DATA]
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1

# Aperture, Preferences, Appearance
# [x] Show number of versions for projects and albums
defaults write com.apple.Aperture showProjectVersionCount -int 1

# Aperture, Crop
# [x] Show Guides
defaults write com.apple.Aperture CropGuidesOnOff -int 1

# Contacts, Preferences, General
# Show First Name: [x] Before last name
# Sort By: [Last Name]
defaults write com.apple.AddressBook ABNameDisplay -int 0
defaults write com.apple.AddressBook ABNameSortingFormat 'sortingFirstName sortingLastName'

# Finder, Preferences, General
# Show these items on the desktop:
#   [x] Hard disks
#   [x] Connected servers
# New Finder windows show: (tailee)
defaults write com.apple.finder ShowHardDrivesOnDesktop -int 1
defaults write com.apple.finder ShowMountedServersOnDesktop -int 1
defaults write com.apple.finder NewWindowTarget 'PfHm'
defaults write com.apple.finder NewWindowTargetPath "'file://$HOME'"

# Finder, Preferences, Advanced
# [ ] Show warning before changing an extension
# [ ] Show warning before emptying the Trash
# When performing a search: [Search the Current Folder]
defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0
defaults write com.apple.finder WarnOnEmptyTrash -int 0
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'

# Finder, View
# [x] Show Path Bar
# [x] Show Status Bar.
defaults write com.apple.finder ShowPathbar -int 1
defaults write com.apple.finder ShowStatusBar -int 1

# Finder, View, Show View Options (Desktop)
# Icon size: 48
# Grid spacing: 100
# Label position: [x] Right
# Sort by: [Name]
defaults write com.apple.finder DesktopViewSettings '{ "IconViewSettings" = { "iconSize" = 48; "gridSpacing" = 100; "labelOnBottom" = 0; "arrangeBy" = "name"; }; }'

# Macs Fan Control, HDD, Custom
# [x] Sensor-based value: (HDD)
# Temperature that fan speed will start to increase from: [42]
# Maximum temperature: [52]
defaults write com.crystalidea.macsfancontrol Fan_1 '2,WDC WD40EFRX-68WT0N0,42,52'

# Safari, Preferences, General
# Safari opens with: [All windows from last session]
# [ ] Open "safe" files after downloading
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -int 1
defaults write com.apple.Safari AutoOpenSafeDownloads -int 0

# Safari, Preferences, Privacy
# Website tracking: [x] Ask websites not to track me
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -int 1

# Safari, Preferences, Notifications
# [ ] Allow websites to ask for permission to send push notifications
defaults write com.apple.Safari CanPromptForPushNotifications -int 0

# Safari, Preferences, Advanced
# Smart Search Field: [x] Show full website address
# [x] Show Develop menu in menu bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -int 1
defaults write com.apple.Safari IncludeDevelopMenu -int 1

# Safari, View
# [x] Show Status Bar
defaults write com.apple.Safari ShowStatusBar -int 1

# System Preferences, General
# Show scroll bars: [x] Always
defaults write -g AppleShowScrollBars 'Always'

# System Preferences, Dock
# Size: 32
# [ ] Magnification: 48
defaults write com.apple.dock tilesize -float 32
defaults write com.apple.dock magnification -int 0
defaults write com.apple.dock largesize -float 48
# Hidden settings:
#   [x] Dim hidden applications
#   [x] Immutable size
defaults write com.apple.dock showhidden -boolean true
defaults write com.apple.dock size-immutable -boolean true

# System Preferences, Security & Privacy, General
# [x] Require password [1 minute] after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 60  # 60 Seconds = 1 minute.

# System Preferences, Keyboard, Keyboard
# Key Repeat: 2 * 15ms = 30ms
# Delay Until Repeat: 25 * 15ms = 375ms
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 25

# System Preferences, Keyboard, Shortcuts
# Mission Control:
#   [ ] Mission Control
#   [ ] Application Windows
#   [ ] Move left a space
#   [ ] Move right a space
#   [ ] Switch to desktop (n)
# Full Keyboard Access: [x] All controls
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 33 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 35 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 79 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 80 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 81 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 82 "{ enabled = 0; }"
defaults write -g AppleKeyboardUIMode -int 2

# System Preferences, Trackpad, Point & Click
# [x] Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# System Preferences, Trackpad, More Gestures
# [ ] Swipe between pages
# [x] App Expose
defaults write -g AppleEnableSwipeNavigateWithScrolls -int 0
defaults write com.apple.dock showAppExposeGestureEnabled -int 1

# System Preferences, Sound
# [x] Show volume in menu bar
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Volume.menu"

# System Preferences, Network, (VPN)
# [x] Show VPN status in menu bar
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/VPN.menu"

# Menu Bar, VPN status
# [x] Show Time Connected
defaults write com.apple.networkConnect VPNShowTime -int 1

# System Preferences, Dictation & Speech, Dictation
# Shortcut: [Off]
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 0

# System Preferences, Date & Time, Clock
# [ ] Show AM/PM
# [ ] Show the day of the week
defaults write com.apple.menuextra.clock DateFormat 'h:mm'

# System Preferences, Users & Groups, Login Options
# [x] Show fast user switching menu as [Icon]
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/User.menu"
defaults write -g userMenuExtraStyle -int 2

# System Preferences, Hazel, Trash
# [x] Delete files sitting in the Trash for more than [1] [Week]
# [x] Enable App Sweep
# [x] Enable multi-user sweep
defaults write com.noodlesoft.Hazel TrashPurgeOldFiles -int 1
# TODO: Set [1] and [Week].
defaults write com.noodlesoft.Hazel TrashUninstallApps -int 1
defaults write com.noodlesoft.Hazel UninstallLogEnabled -int 1

# VMware Fusion, Virtual Machine, Settings, Applications Menu
# Show applications menu in menu bar: [Never]
defaults write com.vmware.fusion showStartMenu3 -int 0

# Kill affected applications
killall Contacts Dock Finder Safari "VMware Fusion Start Menu"

cat <<EOF

Here are some more defaults that need to be set manually:

    Calendar, Preferences, General
        Default Calendar: (Tai)

    Finder, File, Get Info
        Open with:
            .md [Sublime Text]

    Finder, Preferences, Sidebar
        [ ] All My Files
        [x] iCloud Drive
        [x] AirDrop
        [x] Applications
        [x] Desktop
        [ ] Documents
        [x] Downloads
        [ ] Movies
        [ ] Music
        [ ] Pictures
        [x] (tailee)
        [x] Back to My Mac
        [x] Connected servers
        [x] Bonjour computers
        [ ] (this mac)
        [x] Hard disks
        [x] External disks
        [x] CDs, DVDs, and iPods
        [x] Recent Tags

    Finder, View, Show View Options (tailee)
        [x] Show Library Folder

    iTunes, View
        [x] Show Status Bar

    iTunes, Preferences, General
        Ratings: [Stars & Loves]

    iTunes, Preferences, General, Import Settings...
        [x] Use error correction when reading Audio CDs

    iTunes, Preferences, Sharing
        [x] Share my library on my local network
        [x] Home Sharing computers and devices update play counts

    iTunes, Preferences, Advanced
        [ ] Copy files to iTunes Media folder when adding to library

    Macs Fan Control, Preferences, General
        [x] Autostart minimized with system

    System Preferences, General
        Default web browser: [Google Chrome]

    System Preferences, Desktop & Screen Saver, Desktop
        [x] Change picture [every 30 minutes]
        [x] Random order

    System Preferences, Desktop & Screen Saver, Screen Saver
        [Shifting Tiles]
        Source: [National Geographic]

    System Preferences, Sharing
        [x] Screen Sharing
        [x] File Sharing
            [x] (tailee)
        [x] Remote Login

EOF
