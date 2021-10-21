#!/bin/bash

cp beat-saver.desktop ~/.local/share/applications
cp beat-saver.sh ~/.local/share/


sed -i 's/beat-saver.sh/~\/.local\/share\/beat-saver.sh/' ~/.local/share/applications/beat-saver.desktop