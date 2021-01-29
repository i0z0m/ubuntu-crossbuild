## What is this ?

This is a Dockerfile to build cross compiler (`binutils`, `gcc`, `glibc`, `gdb`) for arm-linux-gnueabihf.  
In addition, the package `qemu-user-static` are installed.

## Results

```console
$ cd /usr/local/bin/

$ sudo arm-linux-gnueabihf-gcc test.c

$ file a.out
a.out: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, for GNU/Linux 3.2.0, not stripped
```

## コメント

[各種アーキテクチャのクロスコンパイラ環境を構築する](http://inaz2.hatenablog.com/entry/2015/12/01/204201)を再現し，  
[inaz2/debian-crossbuild](https://hub.docker.com/r/inaz2/debian-crossbuild/)の ARM のみ縮小版を作成した．

autotools と docker を使う構築構築を練習しただけ．  
実用向けの ARM 用クロスコンパイラは  
$ `sudo apt install gcc-arm-linux-gnueabihf`
