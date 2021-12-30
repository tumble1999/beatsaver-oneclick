#!/bin/bash
INPUT=$1
ID=`basename $INPUT`
URL="https://api.beatsaver.com/download/key/${ID}"

if [ ! -n "${BEATSABER_DIR}" ]; then
 read -p "Press any key to start . . ."
fi

if [ ! -n "${BEATSABER_DIR}" ]; then
env|grep beat
	read -p  'Enter location to BeatSaber: ' BEATSABER_DIR
	echo "export BEATSABER_DIR=\"${BEATSABER_DIR}\"">>~/.bash_profile
fi
mkdir -p "${BEATSABER_DIR}/Beat Saber_Data/CustomLevels"

cd /tmp
mkdir "beatsaver_${ID}"
cd "beatsaver_${ID}"
rm -rf *
wget ${URL} -O map.zip
unzip map.zip -d map
cd map
DIR_NAME="${ID} ($(cat Info.dat | jq -r ._songName))"
cd ..
mv map "${DIR_NAME}"
cp -r "${DIR_NAME}" "${BEATSABER_DIR}/Beat Saber_Data/CustomLevels"

echo "----------------------------------------------------------------"
echo "Installed: ${DIR_NAME}"
echo "----------------------------------------------------------------"
