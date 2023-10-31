# common EE toolchain stuff

# EE toolchain root.
EE_ROOT=$(SCE)/ee
TC_ROOT=$(EE_ROOT)/gcc/bin

CC=$(TC_ROOT)/ee-gcc
AS=$(CC)
CXX=$(TC_ROOT)/ee-g++
# for now...
LD=$(CC)
AR=$(TC_ROOT)/ee-ar

# Add base include directories
CFLAGS := $(CFLAGS) -I$(SCE)/common/include -I$(SCE)/ee/include

ifeq ($(CONFIG),release)
CFLAGS := $(CFLAGS) -G0 -O3 -Wall -Wextra -fno-common -fno-strict-aliasing
ASFLAGS := -xassembler-with-cpp
endif

ifeq ($(CONFIG),debug)
CFLAGS := $(CFLAGS) -G0 -O0 -g3 -Wall -Wextra -fno-common -fno-strict-aliasing
ASFLAGS := -xassembler-with-cpp -g3
endif

CXXFLAGS := $(CXXFLAGS) $(CFLAGS) -fno-exceptions

#LDFLAGS :=-nostartfiles -T$(EE_ROOT)/lib/app.cmd -L$(EE_ROOT)/lib  $(LIBS)  $(LDFLAGS) 

