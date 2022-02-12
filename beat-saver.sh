#!/bin/sh
INPUT=$1
ID=`basename $INPUT`
URL="https://api.beatsaver.com/download/key/${ID}"

cd /tmp
mkdir "beatsaver_${ID}" -v
cd "beatsaver_${ID}"
rm -rf *
wget ${URL} -O map.zip
unzip map.zip -d map 
cd map
ls
INFO=`cat Info.dat info.dat | jq -r ._songName`
echo $INFO
DIR_NAME="${ID} (${INFO})"
cd ..
mv -v map "${DIR_NAME}"
cp -r "${DIR_NAME}" "${BEATSABER_DIR}/Beat Saber_Data/CustomLevels" -v

echo "----------------------------------------------------------------"
echo "Installed: ${DIR_NAME}"
echo "----------------------------------------------------------------"
