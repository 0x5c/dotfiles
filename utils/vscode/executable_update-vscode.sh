#!/bin/sh

TAR_FILE='/tmp/code-stable-x64.tar.gz'
DEST="/opt/vscode"

[ "$(id -u)" -ne 0 ] && { echo '\033[91mMust be run as root!\033[0m' && exit 1 ;}

echo '\033[94m==> Downloading latest vscode version...\033[0m'
wget -nv --show-progress -cO $TAR_FILE 'https://code.visualstudio.com/sha/download?build=stable&os=linux-x64'

echo '\033[94m==> Unpacking...\033[0m'
mkdir -pv $DEST || { echo '\033[91m==> Error: failed to create destination directory\033[0m'; exit 1; }

tar --checkpoint=.1000 -xf $TAR_FILE -C $DEST --strip-components=1 || { echo '\033[91m==> Error: failed to extract\033[0m'; exit 1; }
echo

echo '\033[94m==> Cleaning up...\033[0m'
rm $TAR_FILE

echo '\033[92m==> Done!\033[0m'
