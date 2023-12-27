include $(TOP)/build/ee-common.mk

FINALNAME=$(NAME).elf

# Default linker.
ifeq ($(LD),)
LD := $(CC)
endif

OBJS := $(OBJDIR)/crt0.o $(OBJS)
OUTDIR := $(TOP)/bin/$(CONFIG)

# This incantation is done to avoid modifying the SCE linker scripts.
$(OUTDIR)/$(FINALNAME): $(OBJDIR)/ $(OUTDIR)/ $(OBJS)
	cd $(OBJDIR)/ && $(LD) $(CXXFLAGS) -o $@ $(notdir $(OBJS)) $(LDFLAGS)

# :( have to duplicate the rule
$(OBJDIR)/crt0.o: $(CRT0_S)
	$(CC) -c -xassembler-with-cpp $(CCFLAGS) $< -o $@

$(OBJDIR)/:
	mkdir -p $@

$(OUTDIR)/:
	mkdir -p $@

# Phony target to clean products of this build type
clean-products:
	$(RM) $(OBJS) $(OUTDIR)/$(FINALNAME)