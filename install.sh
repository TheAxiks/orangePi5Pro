#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git build-essential

# Emulationstation
cd ~
sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-date-time-dev libboost-locale-dev libfreeimage-dev libfreetype6-dev libeigen3-dev libcurl4-openssl-dev libasound2-dev cmake libsdl2-dev
git clone https://github.com/Aloshi/EmulationStation
cd EmulationStation
mkdir build
cd build
cmake ..
# make -j8
sed -i '1s/^/#include <stack>\n/' ../es-app/src/views/gamelist/ISimpleGameListView.h
make -j8
sudo make install

mkdir ~/roms
sudo ln -sf ~/roms /roms

# Fist theme
cd ~
curl -O https://emulationstation.org/downloads/themes/simple_latest.zip
mkdir .emulationstation
mkdir .emulationstation/themes
unzip ~/simple_latest.zip -d ~/.emulationstation/themes
rm ~/simple_latest.zip

# Thememaster
# cd ~
# curl -O https://codeload.github.com/JohnIrvine1433/ThemeMaster/legacy.zip/refs/heads/master
# unzip -j ~/master JohnIrvine1433-ThemeMaster-179786d/ThemeMaster.sh -d ~/roms/tools/
# unzip -j ~/master JohnIrvine1433-ThemeMaster-179786d/ThemeMaster/* -d ~/roms/tools/ThemeMaste
# rm ~/master

# Retroarch
cd ~
# download cores: https://raw.githubusercontent.com/christianhaitian/retroarch-cores/master/aarch64/
# sudo apt-get install retroarch -y
# sudo apt-get install -y libretro-beetle-pce-fast libretro-bsnes-mercury-balanced libretro-genesisplusgx libretro-beetle-psx libretro-bsnes-mercury-performance libretro-mgba libretro-beetle-vb libretro-core-info libretro-nestopia libretro-beetle-wswan libretro-desmume libretro-snes9x libretro-bsnes-mercury-accuracy libretro-gambatte
# git clone https://github.com/libretro/RetroArch.git retroarch
sudo apt-get install libx11-xcb-dev
# cd retroarch
# git pull
# ./configure
# make clean
# make -j8
# sudo make install

# Cores
cd ~
git clone https://github.com/libretro/libretro-super.git
cd libretro-super
./libretro-fetch.sh
./libretro-build.sh
# sudo ln -sf /usr/lib/aarch64-linux-gnu/libretro ~/cores

# Dolphin Emulator
cd ~
sudo apt install -y build-essential git cmake ffmpeg libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libevdev-dev libusb-1.0-0-dev libxrandr-dev libxi-dev libpangocairo-1.0-0 qt6-base-private-dev libqt6svg6-dev libbluetooth-dev libasound2-dev libpulse-dev libgl1-mesa-dev libcurl4-openssl-dev
sudo apt install -y libudev-dev libsystemd-dev || sudo apt install libeudev-dev 
git clone https://github.com/dolphin-emu/dolphin
cd dolphin
git -c submodule."Externals/Qt".update=none -c submodule."Externals/FFmpeg-bin".update=none -c submodule."Externals/libadrenotools".update=none submodule update --init --recursive && git pull --recurse-submodules
mkdir build
cd build
cmake ..
make -j8
sudo make install

# PortMaster
# cd ~
# git clone https://github.com/PortsMaster/PortMaster-Releases.git
# mv ~/PortMaster-Releases/PortMaster ~/roms/tools/
# mkdir ~/roms/tools/PortMaster/autoinstall
# mv ~/PortMaster-Releases/*.zip ~/roms/tools/PortMaster/autoinstall





