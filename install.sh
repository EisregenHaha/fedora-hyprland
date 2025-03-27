#!/bin/bash
set -e
t="$HOME/.cache/depends/"
rm -rf $t
mkdir -p $t
cd $t

sudo dnf4 group install "Development Tools"
sudo dnf install cmake clang
sudo dnf install gtksourceviewmm3-devel
sudo dnf copr enable atim/starship
sudo dnf copr enable solopasha/hyprland
sudo dnf install python3-pip python3-devel
sudo dnf install gnome-bluetooth bluez-cups bluez
sudo dnf install gtk4-devel libadwaita-devel
sudo dnf install coreutils wl-clipboard xdg-utils cmake curl fuzzel rsync wget ripgrep gojq npm meson typescript gjs axel
wget https://github.com/sentriz/cliphist/releases/download/v0.5.0/v0.5.0-linux-amd64 -O cliphist
chmod +x cliphist
sudo cp cliphist /usr/local/bin/cliphist
sudo dnf install tinyxml tinyxml2 tinyxml2-devel
sudo dnf install python3-build python3-pillow python3-setuptools_scm python3-wheel
sudo dnf install hyprland
sudo dnf install xrandr xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland

sudo dnf install pavucontrol wireplumber libdbusmenu-gtk3-devel libdbusmenu playerctl swww

sudo dnf install yad

sudo dnf install scdoc

sudo dnf install ydotool
sudo systemctl daemon-reload
sudo systemctl enable ydotool
sudo systemctl start ydotool
ln -sf /tmp/.ydotool_socket /run/user/$(id -u $(whoami))/.ydotool_socket

sudo dnf install webp-pixbuf-loader gtk-layer-shell-devel gtk3 gtksourceview3 gtksourceview3-devel gobject-introspection upower
sudo dnf install brightnessctl ddcutil gammastep

sudo dnf install hyprpicker hyprutils hyprwayland-scanner hyprlock wlogout pugixml

#dart-sass

cd $t
wget https://github.com/sass/dart-sass/releases/download/1.77.0/dart-sass-1.77.0-linux-x64.tar.gz
tar -xzf dart-sass-1.77.0-linux-x64.tar.gz
cd dart-sass
sudo cp -rf * /usr/local/bin/


sudo dnf install python3-pywayland python3-psutil hypridle wl-clipboard hyprlang-devel libwebp-devel file-devel libdrm-devel libgbm-devel pam-devel libsass-devel libsass


sudo dnf install cargo
cd $t
git clone https://github.com/Kirottu/anyrun.git # Clone the repository
cd anyrun # Change the active directory to it
cargo build --release # Build all the packages
cargo install --path anyrun/ # Install the anyrun binary
sudo cp $HOME/.cargo/bin/anyrun /usr/local/bin/
mkdir -p ~/.config/anyrun/plugins # Create the config directory and the plugins subdirectory
cp target/release/*.so ~/.config/anyrun/plugins # Copy all of the built plugins to the correct directory
cp examples/config.ron ~/.config/anyrun/config.ron # Copy the default config file

sudo dnf install gnome-themes-extra adw-gtk3-theme qt5ct qt6-qtwayland qt5-qtwayland fontconfig jetbrains-mono-fonts gdouros-symbola-fonts lato-fonts fish foot starship

sudo dnf install swappy wf-recorder grim tesseract slurp

sudo dnf install appstream-util python3.12 python3.12-devel libsoup3-devel uv

sudo dnf install gobject-introspection-devel gjs-devel pulseaudio-libs-devel

# color-generation
sudo dnf install python3 python3-regex unzip
sudo dnf install python3-gobject-devel libsoup-devel blueprint-compiler
sudo dnf install python3-libsass libxdp-devel libxdp libportal
sudo dnf4 config-manager --add-repo https://download.opensuse.org/repositories/home:sp1rit:notekit/Fedora_Rawhide/home:sp1rit:notekit.repo
sudo dnf install clatexmath-devel
sudo dnf install aylurs-gtk-shell 
sudo dnf install kvantum kvantum-qt5
