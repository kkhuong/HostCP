# A simple makefile

CC=g++
CXXFLAGS=-std=c++11
LDFLAGS=
CPPFLAGS += -O3
LDFLAGS += -O3

all: zerocp-cli

zerocp-cli: zerocp-cli.o functions.o
functions.o: functions.h

clean:
	rm -f *.o *.lo zerocp-cli

