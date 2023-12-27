# common EE toolchain stuff

# EE toolchain root.
SCE_EE=$(SCE)/ee
EE_TC=$(SCE_EE)/gcc/bin

CC=$(EE_TC)/ee-gcc
AS=$(CC) -xassembler-with-cpp
CXX=$(EE_TC)/ee-g++
# for now...
LD=$(CC)
AR=$(EE_TC)/ee-ar

CRT0_S=$(SCE_EE)/lib/crt0.s

# Scary Make Incantations: Volume 1
OBJS := $(patsubst %.cpp,$(OBJDIR)/%.o,$(filter %.cpp,$(notdir $(SRCS))))
OBJS += $(patsubst %.c,$(OBJDIR)/%.o,$(filter %.c,$(notdir $(SRCS))))
OBJS += $(patsubst %.s,$(OBJDIR)/%.o,$(filter %.s,$(notdir $(SRCS))))

# shared for both c/c++ compilation
BASEFLAGS := -G0 -fno-common

ifeq ($(CONFIG),debug)
BASEFLAGS += -O2 -g
endif

ifeq ($(CONFIG),release)
BASEFLAGS += -O2
endif


ifeq ($(CONFIG),release)
CFLAGS := $(CFLAGS) $(BASEFLAGS) -G0 -O3 -Wall -Wextra -fno-common -fno-strict-aliasing
CXXFLAGS := $(CXXFLAGS) $(BASEFLAGS) -G0 -O3 -Wall -Wextra -fno-common -fno-strict-aliasing -fno-exceptions
ASFLAGS :=
endif

ifeq ($(CONFIG),debug)
CFLAGS := $(CFLAGS) $(BASEFLAGS) -G0 -O0 -g3 -Wall -Wextra -fno-common -fno-strict-aliasing
CXXFLAGS := $(CXXFLAGS) $(BASEFLAGS) -G0 -O3 -g3 -Wall -Wextra -fno-common -fno-strict-aliasing -fno-exceptions
ASFLAGS := -g3
endif

# Add base include directories
CFLAGS := $(CFLAGS) -I$(SCE)/common/include -I$(SCE)/ee/include $(INCS)
CXXFLAGS := $(CXXFLAGS) -I$(SCE)/common/include -I$(SCE)/ee/include $(INCS)

$(OBJDIR)/%.o: %.c
	$(CC) -c $(CCFLAGS)  $< -o $@

$(OBJDIR)/%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

$(OBJDIR)/%.o: %.s
	$(AS) -c $(ASFLAGS) $< -o $@