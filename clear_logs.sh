#!/bin/bash

echo -e "clearing logs...\n"
HISTORY_MSG="HISTORY: data cleared"
MPV_MSG="MPV: data cleared"

# clear history
WORDS=(
    "mpv" "history" "sudo" "clogs" "rm" "mv" "cls" "csl" "eog" "cd" "tper"
    "rmdir" "mkdir" "ll" "l" "chmod" "chown" "vv" "export" "cp" "z" "e" "curl" "wget"
)
HISTORY_PATH="$HOME/.cache/zsh/history"
ZLUA_PATH="$HOME/.zlua"
for word in "${WORDS[@]}"; do
    sed -i "/\<${word,,}\>/Id" $HISTORY_PATH
    sed -i "/\<${word,,}\>/Id" $ZLUA_PATH
done
echo $HISTORY_MSG

# clear mpv data
MPV_DIR="$HOME/.config/mpv/watch_later"
if [ -d "$MPV_DIR" ]; then
    rm -r $HOME/.config/mpv/watch_later/ && echo $MPV_MSG
fi


