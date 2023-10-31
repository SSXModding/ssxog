# Common GNU Make rules (core entry file)

# This makefile is expected to be included after the variables given
# have been defined:
#
# NAME=name
#
# TARGET=ee|iop
#
# KIND=bin|lib|irx
# `irx` is only valid if TARGET == `iop`
#
# SRCS=[... source-file-list]
#

debug_Valid := y
release_Valid := y

ifneq ($($(CONFIG)_Valid),y)
$(error Invalid configuration $(CONFIG) specified)
endif

BINDIR = $(TOP)/bin
OBJDIR = obj/$(CONFIG)

# include target-specific recipies specifying how to 
# build for the target.
include $(TOP)/build/$(TARGET)-common.mk
include $(TOP)/build/$(TARGET)-$(KIND).mk
