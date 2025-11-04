#!/bin/bash
set -e

t="$HOME/.cache/depends/"
rm -rf "$t"
mkdir -p "$t"
cd "$t"

# Update System
sudo dnf update --refresh -y

# Group installation
sudo dnf install @development-tools -y

# COPR repositories
sudo dnf copr enable atim/starship -y
sudo dnf copr enable solopasha/hyprland -y
sudo dnf copr enable errornointernet/quickshell -y
sudo dnf copr enable deltacopy/darkly -y
sudo dnf copr enable alternateved/eza -y
sudo dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:luisbocanegra/Fedora_43/home:luisbocanegra.repo --overwrite

# Core development tools
sudo dnf install cmake clang -y

# Python packages
sudo dnf install python3 python3-devel python3.12 python3.12-devel -y
sudo dnf install unzip hypridle libsoup-devel -y

# Hyprland and related packages
sudo dnf install hyprland -y
sudo dnf install hyprpicker hyprutils hyprshot hyprwayland-scanner hyprlock wlogout pugixml -y
sudo dnf install hyprlang-devel cliphist -y

# GUI and toolkit dependencies
sudo dnf install gtk4-devel libadwaita-devel -y
sudo dnf install gtk-layer-shell-devel gtk3 gtksourceview3 gtksourceview3-devel gobject-introspection upower -y
sudo dnf install gtksourceviewmm3-devel -y
sudo dnf install webp-pixbuf-loader -y
sudo dnf install gobject-introspection-devel gjs-devel pulseaudio-libs-devel -y

# Desktop integrations and utilities
sudo dnf install xrandr xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-hyprland -y
sudo dnf install gnome-bluetooth bluez-cups bluez -y
sudo dnf install hyprsunset mate-polkit qalc translate-shell -y

# Core utilities
sudo dnf install coreutils wl-clipboard xdg-utils curl fuzzel rsync wget ripgrep gojq npm meson typescript gjs axel eza -y
sudo dnf install brightnessctl ddcutil -y

# Audio & media
sudo dnf install pavucontrol wireplumber libdbusmenu-gtk3-devel libdbusmenu playerctl cava -y

# Other individual tools
sudo dnf install yad -y
sudo dnf install scdoc -y
sudo dnf install ydotool -y
sudo dnf install tinyxml -y
sudo dnf install tinyxml2 tinyxml2-devel -y
sudo dnf install file-devel libwebp-devel libdrm-devel libgbm-devel pam-devel libsass-devel libsass -y

# Theming and appearance
sudo dnf install gnome-themes-extra adw-gtk3-theme qt5ct qt6ct qt6-qtwayland kcmshell6 qt5-qtwayland fontconfig jetbrains-mono-fonts gdouros-symbola-fonts lato-fonts darkly fish kitty starship -y
sudo dnf install kvantum kvantum-qt5 -y
sudo dnf install libxdp-devel libxdp libportal -y

# Screenshot and screen recording tools
sudo dnf install swappy wf-recorder grim tesseract slurp -y

# AppStream and web libs
sudo dnf install appstream-util libsoup3-devel uv -y

# Power tools
sudo dnf install -y make --allowerasing

# Quickshell stuff
sudo dnf install -y --allowerasing python-opencv plasma-desktop plasma-nm kdialog bluedevil plasma-systemmonitor kde-material-you-colors wtype matugen quickshell-git grimblast mpvpaper ffmpeg

#upscayl
read -rp "Do you want to install/Update Upscayl? (y/n): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then

    cd "$t" || { echo "Directory $t not found"; exit 1; }


    url=$(curl -s https://api.github.com/repos/upscayl/upscayl/releases/latest \
      | jq -r '.assets[] | select(.name | test("\\.rpm$")) | .browser_download_url')

    wget "$url"
    rpm_file="${url##*/}"
    sudo dnf install -y "$rpm_file"
else
    echo "Skipped Upscayl installation."
fi

rm -rf "$t"


