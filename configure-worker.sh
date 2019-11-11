NDK_PATH=/Users/zuojianlin/Library/Android/sdk/ndk-bundle/
NDK_TOOLCHAINS=$NDK_PATH/toolchains/$TARGET-4.9/prebuilt/$HOST

export PATH=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/bin:$PATH
export CC=clang
export CXX=clang++
export AR=$TARGET-ar
export RANLIB=$TARGET-ranlib
export CFLAGS="-target $TARGET -O2 --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include --gcc-toolchain=$NDK_TOOLCHAINS -D__ANDROID_API__=21"
export CPPFLAGS="-target $TARGET --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include/ -idirafter $NDK_PATH/sources/cxx-stl/llvm-libc++/include -D__ANDROID_API__=21"
export CXXFLAGS="-target $TARGET --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot -idirafter $NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/include/ -idirafter $NDK_PATH/sources/cxx-stl/llvm-libc++/include -D__ANDROID_API__=21"
export LDFLAGS="-pie -static-libstdc++ --sysroot=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot --gcc-toolchain=$NDK_TOOLCHAINS -L$NDK_PATH/sources/cxx-stl/llvm-libc++/libs/$ARCH -L$NDK_PATH/toolchains/llvm/prebuilt/$HOST/sysroot/usr/lib/$TARGET/21/ -B/Users/zuojianlin/Library/Android/sdk/ndk-bundle/toolchains/$TARGET-4.9/prebuilt/$HOST/$TARGET/bin"
export LIBS="-lc -latomic"

../configure --host=$TARGET --target=$TARGET \
   --with-tmpdir=/data/local/tmp --prefix=/data/local \
   --disable-intl --disable-nls --disable-source-highlight

if [ $? == 0 ]
then
    make -j`nproc`
fi
