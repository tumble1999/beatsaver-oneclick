#!/bin/sh

install_deps() {
	echo "Installing dependacies"

    # Debian
	if which apt 1> /dev/null 2> /dev/null; then
	echo "installing wget, unzip and jq from apt (sudo apt install wget unzip jq)"
		sudo apt install wget unzip jq
		return
	fi

	# Arch
	if which pacman 1> /dev/null 2> /dev/null; then
		echo "installing wget, unzip and jq from pacman (sudo pacman -S --needed wget unzip jq)"
		sudo pacman -S --needed wget unzip jq
		return
	fi
	echo "Linux distro not supported (yet)"
	lsb_release -a
	exit 1
}

install_deps

if [ ! -n "${BEATSABER_DIR}" ]; then
	env|grep beat
	read -p  'Enter location to BeatSaber: ' BEATSABER_DIR
	echo "export BEATSABER_DIR=\"${BEATSABER_DIR}\"">>~/.bash_profile
fi
echo "Creating BeatSave Custom Folder"
mkdir -p "${BEATSABER_DIR}/Beat Saber_Data/CustomLevels" -v

echo "copying oneclick files"
cp beat-saver.desktop ~/.local/share/applications -v
cp beat-saver.sh ~/.local/share/ -v


sed -i 's/beat-saver.sh/~\/.local\/share\/beat-saver.sh/' ~/.local/share/applications/beat-saver.desktop

echo "Done"
