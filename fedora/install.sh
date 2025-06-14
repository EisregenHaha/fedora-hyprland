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
sudo dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:luisbocanegra/Fedora_42/home:luisbocanegra.repo --overwrite
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release -y

# Core development tools
sudo dnf install cmake clang -y
sudo dnf install cargo -y

# Python packages
sudo dnf install python3 python3-devel -y
sudo dnf install unzip hypridle libsoup-devel -y

# Hyprland and related packages
sudo dnf install hyprland hyprland-qtutils -y
sudo dnf install hyprpicker hyprutils hyprshot hyprwayland-scanner hyprlock wlogout pugixml -y
sudo dnf install hyprlang-devel -y

# GUI and toolkit dependencies
sudo dnf install gtk4-devel libadwaita-devel -y
sudo dnf install gtk-layer-shell-devel gtk3 gtksourceview3 gtksourceview3-devel gobject-introspection upower -y
sudo dnf install gtksourceviewmm3-devel -y
sudo dnf install webp-pixbuf-loader -y
sudo dnf install gobject-introspection-devel gjs-devel pulseaudio-libs-devel -y

# Desktop integrations and utilities
sudo dnf install xrandr xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland -y
sudo dnf install gnome-bluetooth bluez-cups bluez blueman -y
sudo dnf install gammastep mate-polkit -y

# Core utilities
sudo dnf install coreutils wl-clipboard xdg-utils curl fuzzel rsync wget ripgrep gojq npm meson typescript gjs axel eza -y
sudo dnf install brightnessctl ddcutil -y

# Audio & media
sudo dnf install pavucontrol wireplumber libdbusmenu-gtk3-devel libdbusmenu playerctl swww -y

# Other individual tools
sudo dnf install yad -y
sudo dnf install scdoc -y
sudo dnf install ydotool -y
sudo dnf install tinyxml -y
sudo dnf install tinyxml2 tinyxml2-devel -y
sudo dnf install file-devel libwebp-devel libdrm-devel libgbm-devel pam-devel libsass-devel libsass -y

# Theming and appearance
sudo dnf install gnome-themes-extra adw-gtk3-theme qt5ct qt6ct qt6-qtwayland kcmshell6 qt5-qtwayland fontconfig jetbrains-mono-fonts gdouros-symbola-fonts lato-fonts fish kitty starship -y
sudo dnf install aylurs-gtk-shell -y
sudo dnf install kvantum kvantum-qt5 -y
sudo dnf install libxdp-devel libxdp libportal -y

# Screenshot and screen recording tools
sudo dnf install swappy wf-recorder grim tesseract slurp -y

# AppStream and web libs
sudo dnf install appstream-util libsoup3-devel uv -y

# Power tools
sudo dnf install -y make --allowerasing

# Custom tool: cliphist
wget -O cliphist "$(curl -s https://api.github.com/repos/sentriz/cliphist/releases/latest | grep browser_download_url | grep -v '\.tar\.gz' | grep linux-amd64 | cut -d '"' -f 4)"
chmod +x cliphist
sudo cp cliphist /usr/local/bin/cliphist

# Custom tool: dart-sass
cd "$t"
wget "$(curl -s https://api.github.com/repos/sass/dart-sass/releases/latest | grep browser_download_url | grep linux-x64.tar.gz | cut -d '"' -f 4)"
tar -xzf dart-sass-*-linux-x64.tar.gz
cd dart-sass
sudo cp -rf * /usr/local/bin/

# Build & install anyrun
cd "$t"
git clone https://github.com/anyrun-org/anyrun.git
cd anyrun
cargo build --release
cargo install --path anyrun/
sudo cp "$HOME/.cargo/bin/anyrun" /usr/local/bin/
mkdir -p ~/.config/anyrun/plugins
cp target/release/*.so ~/.config/anyrun/plugins
cp examples/config.ron ~/.config/anyrun/config.ron

rm -rf "$t"

# Quickshell stuff

sudo dnf install -y \
qt5-qtbase qt5-qtdeclarative qt5-qtsvg qt5-qttranslations qt5-qtwayland \
qt6-qt5compat qt6-qtbase qt6-qtdeclarative qt6-qtimageformats qt6-qtmultimedia \
qt6-qtpositioning qt6-qtquicktimeline qt6-qtsensors qt6-qtsvg qt6-qttools \
qt6-qttranslations qt6-qtvirtualkeyboard qt6-qtwayland kdialog kf6-kirigami plasma-workspace 

sudo dnf install wtype matugen quickshell grimblast kde-material-you-colors -y

# Final message
echo -e "\e[1m✅ Installation complete. Proceed with the fonts script.\e[0m"

