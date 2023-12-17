!# bin/zsh

echo "Change QQ emoji folder permission to 500..."

sudo chmod -R 500 ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource

echo "Done!"