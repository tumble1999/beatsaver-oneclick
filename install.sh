#!/bin/bash

cp beat-saver.desktop ~/.local/share/applications -v
cp beat-saver.sh ~/.local/share/ -v


sed -i 's/beat-saver.sh/~\/.local\/share\/beat-saver.sh/' ~/.local/share/applications/beat-saver.desktop
