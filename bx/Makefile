NAME := ssx
TARGET := ee
TARGETTYPE := bin

INCS = -I$(TOP)/libs/real/include
LIBS = -lkernl -lc 

LDFLAGS = -mno-crt0 -Wl,-Map,$(OUTDIR)/$(NAME).map -T$(SCE_EE)/lib/app.cmd -L$(SCE_EE)/lib

# sources
SRCS := main.cpp

include $(TOP)/build/core.mk

PHONY: all clean clean-products

all: $(OUTDIR)/$(NAME)

clean: clean-products
	$(RM) -f $(OUTDIR)/$(NAME).map