SCRIPT_DIR=`dirname $0`
CFLAGS="-O2 -g -Wno-error=implicit-function-declaration" $SCRIPT_DIR/configure --target=aarch64-elf-linux --disable-werror
