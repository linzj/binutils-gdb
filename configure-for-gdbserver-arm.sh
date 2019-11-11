SCRIPT_DIR=`dirname $0`
HOST=`uname -s | tr '[:upper:]' '[:lower:]'`-`uname -m` \
TARGET=armv7-linux-androideabi21 \
ARCH=armv7-a \
bash $SCRIPT_DIR/configure-worker.sh
