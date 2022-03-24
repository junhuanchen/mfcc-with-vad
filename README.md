Simple speech recognition using MFCC
====================================

The program contains per se no database. Users create their personal word list by dictating words using a microphone. All words from this word list can later be recognised by the program.

The program is licensed under the GPL version 3 or (at your opinion) any later version, see the file COPYING for details.

To build simply run make. The [ALSA](http://www.alsa-project.org/main/index.php/Main_Page) development files are required.

For more information on MFCC click [here](https://en.wikipedia.org/wiki/Mel-frequency_cepstrum).

## v83x need edit CMakeLists.txt

```
# source /opt/v83x_linux_x86_python3.8_toolchain/envsetup.sh
set(CMAKE_C_COMPILER "/opt/v83x_linux_x86_python3.8_toolchain/toolchain-sunxi-musl/toolchain/bin/arm-openwrt-linux-gcc")
set(CMAKE_CXX_COMPILER "/opt/v83x_linux_x86_python3.8_toolchain/toolchain-sunxi-musl/toolchain/bin/arm-openwrt-linux-g++")
set(CMAKE_VERBOSE_MAKEFILE on)
```

## make

```
mkdir build
cd build
cmake ..
make
./mfcc
```

## prog helper

- (l)ist words
- (n)ew words
- (d)ictate words
- (e)xit

```
root@sipeed:~# ./prog
(n)ew words, (l)ist words, (d)ictate words, (e)xit: l
1  2  3  4  5  6  7  8
(n)ew words, (l)ist words, (d)ictate words, (e)xit: n
Please speak now (end with return)
split size 164160 n = 2
Enter identifier (x to skip): 9
Playing WAVE '9.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
Enter identifier (x to skip): 9
Playing WAVE '9.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
(n)ew words, (l)ist words, (d)ictate words, (e)xit: l
1  2  3  4  5  6  7  8  9
(n)ew words, (l)ist words, (d)ictate words, (e)xit: d
Please speak now (end with return)
split size 105120 n = 1
2.699133 9

(n)ew words, (l)ist words, (d)ictate words, (e)xit: e
root@sipeed:~#
```
