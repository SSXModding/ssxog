# Common GNU Make rules (core entry file)

# NAME=name
# TARGET=ee|iop
# KIND=bin|lib|irx

debug_Valid := y
release_Valid := y

ifneq ($($(CONFIG)_Valid),y)
$(error Invalid configuration $(CONFIG) specified)
endif

BINDIR = $(TOP)/bin
OBJDIR = obj/$(CONFIG)

include $(TOP)/build/$(TARGET)-common.mk
include $(TOP)/build/$(TARGET)-$(KIND).mk
