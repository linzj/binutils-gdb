NDK_PATH=/home/linzj/Android/Sdk/ndk/25.2.9519653
NDK_TOOLCHAINS=$NDK_PATH/toolchains/llvm/prebuilt/$HOST

export PATH=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/bin:$PATH
export CC=clang
export CXX=clang++
export AR=llvm-ar
export RANLIB=llvm-ranlib
export CFLAGS="-target $TARGET -O2 -g3 --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include"
export CPPFLAGS="-target $TARGET -O2 -g3 --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include/ -idirafter $NDK_PATH/sources/cxx-stl/llvm-libc++/include"
export CXXFLAGS="-target $TARGET --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include/ -idirafter $NDK_PATH/sources/cxx-stl/llvm-libc++/include"
export LDFLAGS="-pie -static-libstdc++ -fuse-ld=lld --rtlib=compiler-rt --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -L$NDK_PATH/sources/cxx-stl/llvm-libc++/libs/$ARCH -L$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/lib/$TARGET/21/ -B/Users/zuojianlin/Library/Android/sdk/ndk-bundle/toolchains/$TARGET-4.9/prebuilt/$HOST/$TARGET/bin"
export LIBS="-lc"

../configure --host=$TARGET --target=$TARGET \
   --with-tmpdir=/data/local/tmp --prefix=/data/local \
   --disable-intl --disable-nls --disable-source-highlight

if [ $? == 0 ]
then
    make -j`nproc` all-gdbserver V=1
    llvm-strip gdbserver/gdbserver -o gdbserver_stripped
fi
