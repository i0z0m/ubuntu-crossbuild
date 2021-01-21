#!/bin/bash
set -e
source config.sh

cd $HOME
mkdir build
cd build

build() {
    local TARGET="$1"
    local LINUX_ARCH="$2"

    mkdir build-$TARGET
    cd build-$TARGET

    # Step 1. Binutils
    mkdir -p build-binutils-$TARGET
    cd build-binutils-$TARGET
    $HOME/archives/$BINUTILS_VERSION/configure --prefix=$PREFIX --target=$TARGET $CONFIGURATION_OPTIONS
    make $PARALLEL_MAKE
    make install
    cd ..

    # Step 2. Linux Kernel Headers
    cd $HOME/archives/$LINUX_KERNEL_VERSION
    make ARCH=$LINUX_ARCH INSTALL_HDR_PATH=$PREFIX/$TARGET headers_install
    cd $HOME/build/build-$TARGET

    # Step 3. C/C++ Compilers
    mkdir -p build-gcc-$TARGET
    cd build-gcc-$TARGET
    $HOME/archives/$GCC_VERSION/configure --prefix=$PREFIX --target=$TARGET --enable-languages=c,c++ $CONFIGURATION_OPTIONS
    make $PARALLEL_MAKE all-gcc
    make install-gcc
    cd ..

    # Step 4. Standard C Library Headers and Startup Files
    mkdir -p build-glibc-$TARGET
    cd build-glibc-$TARGET
    $HOME/archives/$GLIBC_VERSION/configure --prefix=$PREFIX/$TARGET --build=$MACHTYPE --host=$TARGET --target=$TARGET --with-headers=$PREFIX/$TARGET/include $CONFIGURATION_OPTIONS libc_cv_forced_unwind=yes
    make install-bootstrap-headers=yes install-headers
    make $PARALLEL_MAKE csu/subdir_lib
    install csu/crt1.o csu/crti.o csu/crtn.o $PREFIX/$TARGET/lib
    $TARGET-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $PREFIX/$TARGET/lib/libc.so
    touch $PREFIX/$TARGET/include/gnu/stubs.h
    cd ..

    # Step 5. Compiler Support Library
    cd build-gcc-$TARGET
    make $PARALLEL_MAKE all-target-libgcc
    make install-target-libgcc
    cd ..

    # Step 6. Standard C Library & the rest of Glibc
    cd build-glibc-$TARGET
    make $PARALLEL_MAKE
    make install
    cd ..

    # Step 7. Standard C++ Library & the rest of GCC
    cd build-gcc-$TARGET
    make $PARALLEL_MAKE
    make install
    cd ..

    # Step 8. GDB
    mkdir -p build-termcap-$TARGET
    cd build-termcap-$TARGET
    $HOME/archives/$TERMCAP_VERSION/configure --prefix=$PREFIX --target=$TARGET
    make $PARALLEL_MAKE
    make install
    cd ..

    mkdir -p build-gdb-$TARGET
    cd build-gdb-$TARGET
    $HOME/archives/$GDB_VERSION/configure --prefix=$PREFIX --target=$TARGET
    make $PARALLEL_MAKE
    make install
    cd ..

    cd ..
}

#build aarch64-linux-gnu arm64
build arm-linux-gnueabihf arm
