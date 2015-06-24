#!/bin/bash

# Fix unity
gsettings set com.canonical.desktop.interface scrollbar-mode normal
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set com.canonical.unity.webapps integration-allowed false

# Improve dash speed
#gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ dash-blur-experimental 1

# Remove grid dashes on login
gsettings set com.canonical.unity-greeter draw-grid false

# Menu and Button Icons
#gsettings set org.gnome.desktop.interface menus-have-icons true
#gsettings set org.gnome.desktop.interface buttons-have-icons true

# Configuring time-applet
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-day true

# Set edge scrolling ('disabled', 'edge-scrolling', 'two-finger-scrolling')
gsettings set org.gnome.settings-daemon.peripherals.touchpad scroll-method 'edge-scrolling'

