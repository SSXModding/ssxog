.PHONY: all clean

TOP=$(shell pwd)

# Set a default configuration.
ifeq ($(CONFIG),)
CONFIG=release
endif

# TODO: No recursive make!

all:
	make -C libs/real TOP=$(TOP) CONFIG=$(CONFIG)
	make -C bx TOP=$(TOP) CONFIG=$(CONFIG)

clean:
	make -C libs/real TOP=$(TOP) CONFIG=$(CONFIG) clean
	make -C bx TOP=$(TOP) CONFIG=$(CONFIG) clean