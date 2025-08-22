#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# remove kde plasma
dnf5 -y remove plasma-* kde-*

# install necessary packages
dnf5 -y install			\
	whiptail			\
	pciutils			\
	git					\

# install rpm-copr
#curl -L https://github.com/34N0/rpm-copr/releases/download/v0.9-beta/rpm-copr-v0.9-beta-linux-amd64.tar.gz | sudo tar zx -C /usr/local/bin

dnf5 -y copr enable							\
	solopasha/hyprland					\
	erikreider/SwayNotificationCenter	\
	errornointernet/packages			\
	tofik/nwg-shell					\

# install necessary dependencies
dnf5 -y install 			\
  grim						\
  gvfs-mtp					\
  hyprpolkitagent			\
  inxi						\
  kitty						\
  kvantum					\
  network-manager-applet	\
  pamixer					\
  pavucontrol				\
  playerctl					\
  python3-pyquery			\
  qt5ct						\
  qt6ct						\
  rofi-wayland				\
  slurp						\
  swappy					\
  unzip						\
  waybar					\
  wlogout					\
  brightnessctl
  cava						\
  loupe						\
  gnome-system-monitor		\
  mpv-mpris					\
  qalculate-gtk				\
  cliphist					\
  nwg-look					\
  SwayNotificationCenter	\
  pamixer					\
  swww						\
  wallust					\
  aylurs-gtk-shell			\
  dunst						\
  mako						\
  rofi						\
  adobe-source-code-pro-fonts #fonts
  fontawesome-fonts-all		\
  jetbrains-mono-fonts		\
  google-noto-emoji-fonts	\

# install JetBrainsMono
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xJkf JetBrainsMono.tar.xz -C $HOME/.local/share/fonts/JetBrainsMonoNerd
rm -r JetBrainsMono.tar.xz

# install FantasqueMonoNerdFont
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip
mkdir -p "$HOME/.local/share/fonts/FantasqueSansMonoNerd" && unzip -o -q "FantasqueSansMono.zip" -d "$HOME/.local/share/fonts/FantasqueSansMono"

# install VictorMono
wget -q https://rubjo.github.io/victor-mono/VictorMonoAll.zip
mkdir -p "$HOME/.local/share/fonts/VictorMono" && unzip -o -q "VictorMonoAll.zip" -d "$HOME/.local/share/fonts/VictorMono"

dnf5 -y install		\
  hyprland			\
  hypridle			\
  hyprlock			\

git clone --depth=1 https://github.com/JaKooLit/Hyprland-Dots
cd Hyprland-Dots
chmod +x copy.sh
./copy.sh
cd ..
rm -rf Hyprland-Dots

# setup hyprland from COPR
# dnf5 -y copr enable solopasha/hyprland
# dnf5 -y install			\
# 	hyprland			\
# 	hyprpaper			\
# 	hyprpicker			\
# 	hypridle			\
# 	hyprlock			\
# 	hyprsunset			\
# 	hyprpolkitagent		\
# 	hyprsysteminfo		\
# 	hyprpanel			\
# 	qt6ct-kde			\
# 	hyprland-qt-support	\
# 	hyprland-qtutils
# dnf5 -y copr disable solopasha/hyprland
#
# # more desktop-environment utils
# dnf5 -y install		\
# 	kitty			\
# 	sddm			\
# 	pipewire		\
# 	wofi			\
# 	brightnessctl

systemctl enable podman.socket
#systemctl --global enable hyprpanel.service
