SCRIPT_DIR=`dirname $0`
HOST=`uname -s | tr '[:upper:]' '[:lower:]'`-`uname -m` \
TARGET=aarch64-linux-android21 \
ARCH=arm64-v8a \
bash $SCRIPT_DIR/configure-worker.sh
