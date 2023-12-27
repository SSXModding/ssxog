NAME=real
TARGET=ee
TARGETTYPE=lib

INCS = -I$(TOP)/libs/real/include

VPATH := ps2

# sources
SRCS = timer.cpp \
       mem.cpp \
       thread.cpp \
       filesys.cpp \
	filedev.cpp

include $(TOP)/build/core.mk

.PHONY: all clean clean-products

all: $(BINDIR)/lib$(FINALNAME).a

clean: clean-products