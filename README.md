## what is this ?
This is a cross compiler (binutils, gcc, glibc, gdb) for arm-linux-gnueabihf. In addition, qemu-user-static package are installed.

## comments
[各種アーキテクチャのクロスコンパイラ環境を構築する](http://inaz2.hatenablog.com/entry/2015/12/01/204201)を再現し，  
[inaz2/debian-crossbuild](https://hub.docker.com/r/inaz2/debian-crossbuild/)のARMのみ縮小版を作成した．

autotoolsやdockerを使う構築の過程を練習しただけ．  
実用向けのARM用クロスコンパイラは  
$ `sudo apt install gcc-arm-linux-gnueabihf`  
