#!/bin/bash
set -e
source config.sh

# Download packages
cd $HOME
mkdir archives
cd archives

wget -nc http://ftpmirror.gnu.org/binutils/$BINUTILS_VERSION.tar.gz
wget -nc https://www.kernel.org/pub/linux/kernel/v4.x/$LINUX_KERNEL_VERSION.tar.xz
wget -nc http://ftpmirror.gnu.org/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz
wget -nc http://ftpmirror.gnu.org/glibc/$GLIBC_VERSION.tar.xz
wget -nc http://ftp.jaist.ac.jp/pub/GNU/mpfr/$MPFR_VERSION.tar.gz
wget -nc http://ftp.jaist.ac.jp/pub/GNU/gmp/$GMP_VERSION.tar.xz
wget -nc http://ftp.jaist.ac.jp/pub/GNU/mpc/$MPC_VERSION.tar.gz
wget -nc ftp://gcc.gnu.org/pub/gcc/infrastructure/$ISL_VERSION.tar.bz2
wget -nc ftp://gcc.gnu.org/pub/gcc/infrastructure/$CLOOG_VERSION.tar.gz

wget -nc ftp://ftp.gnu.org/gnu/termcap/$TERMCAP_VERSION.tar.gz
wget -nc http://ftp.gnu.org/gnu/gdb/$GDB_VERSION.tar.gz

# Extract everything
for f in *.tar*; do
    tar xfk $f
done

# Set symbolic links of requirements for gcc
cd $GCC_VERSION
ln -s ../$MPFR_VERSION mpfr
ln -s ../$GMP_VERSION gmp
ln -s ../$MPC_VERSION mpc
ln -s ../$ISL_VERSION isl
ln -s ../$CLOOG_VERSION cloog
cd ..

cd ..
