
CC := /opt/v83x_linux_x86_python3.8_toolchain/toolchain-sunxi-musl/toolchain/bin/arm-openwrt-linux-gcc

prog: _fft.o main.o frame.o split.o compare.o list.o wave.o audio.o
	$(CC) -g -Wall -Wextra -o prog _fft.o frame.o list.o main.o compare.o split.o wave.o audio.o -lm -lasound -lpthread -L./ -lfvad
list.o: list.c list.h frame.h _fft.h
	$(CC) -g -Wall -Wextra -c -o list.o list.c
_fft.o: _fft.c _fft.h
	$(CC) -g -Wall -Wextra -c -o _fft.o _fft.c
main.o: main.c _fft.h split.h frame.h list.h audio.h wave.h compare.h
	$(CC) -g -Wall -Wextra -c -o main.o main.c
split.o: split.c split.h _fft.h wave.h audio.h frame.h
	$(CC) -g -Wall -Wextra -c -o split.o split.c
frame.o: frame.c frame.h _fft.h
	$(CC) -g -Wall -Wextra -c -o frame.o frame.c
compare.o: compare.c compare.h split.h _fft.h wave.h
	$(CC) -g -Wall -Wextra -c -o compare.o compare.c
wave.o: wave.c wave.h
	$(CC) -g -Wall -Wextra -c -o wave.o wave.c
audio.o: audio.c audio.h
	$(CC) -g -Wall -Wextra -c -o audio.o audio.c
clean:
	rm -f prog *.o
