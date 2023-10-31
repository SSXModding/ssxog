NAME=ssx
TARGET=ee
KIND=bin

SELF=$(shell pwd)
INCS = -I$(TOP)/libs/real/include

LIBS = -lkernl -lc 
LDFLAGS = -mno-crt0 -Wl,-Map,$(BINDIR)/$(FINALNAME).map -T$(SELF)/app.cmd -L$(EE_ROOT)/lib

# sources
SRCS = crt0.s \
       main.cpp

include $(TOP)/build/core.mk