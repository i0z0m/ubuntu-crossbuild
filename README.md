## What is this ?
This is a cross compiler (`binutils`, `gcc`, `glibc`, `gdb`) for arm-linux-gnueabihf.   
In addition, the package `qemu-user-static` are installed.

## Results
$ sudo arm-linux-gnueabihf-gcc test.c  
/usr/local/bin  

$ file a.out  
a.out: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, for GNU/Linux 3.2.0, not stripped

## コメント
[各種アーキテクチャのクロスコンパイラ環境を構築する](http://inaz2.hatenablog.com/entry/2015/12/01/204201)を再現し，  
[inaz2/debian-crossbuild](https://hub.docker.com/r/inaz2/debian-crossbuild/)のARMのみ縮小版を作成した．

autotoolsやdockerを使う構築の過程を練習しただけ．  
実用向けのARM用クロスコンパイラは  
$ `sudo apt install gcc-arm-linux-gnueabihf`
