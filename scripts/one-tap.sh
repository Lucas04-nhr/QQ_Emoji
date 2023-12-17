!# /bin/zsh

echo "Do you want to restore to the emoji before?(y/n)"
echo "This will backup the current emoji to your desktop."
echo "You may need to enter your password."
read answer
if [ "${answer,,}" = "y" ]; then
    echo "Backing up..."
    # Making directory for backup
    mkdir -p ${HOME}/Desktop/QQ_emoji_backup
    # Backing up emoji icons
    sudo cp -rf ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res ${HOME}/Desktop/QQ_emoji_backup/sysface_res_backup
    # Backing up emoji icons zip file
    sudo cp -rf ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res.zip ${HOME}/Desktop/QQ_emoji_backup/sysface_res_backup.zip
    # Backing up emoji config
    sudo cp -rf ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res/face_config.json ${HOME}/Desktop/QQ_emoji_backup/face_config_backup.json
    # Backing up emoji config zip file
    sudo cp -rf ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res/face_config.json.zip ${HOME}/Desktop/QQ_emoji_backup/face_config_backup.json.zip
    # Copy the restore script to the backup folder
    cp -rf ./restore.sh ${HOME}/Desktop/QQ_emoji_backup/restore.sh
    echo "Done!"
    echo "Restoring..."
    # Restoring emoji icons
    sudo cp -rf ../sysface_res ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res
    # Restoring emoji icons zip file
    sudo cp -rf ../sysface_res.zip ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res.zip
    # Restoring emoji config
    sudo cp -rf ../face_config.json ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res/face_config.json
    # Restoring emoji config zip file
    sudo cp -rf ../face_config.json.zip ${HOME}/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/global/nt_data/Emoji/emoji-resource/sysface_res/face_config.json.zip
    echo "Done!"
    echo "Changing permissions..."
    source ./chmod.sh
    echo "Done!"
else
    echo "Aborted!"
fi