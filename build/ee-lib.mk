include $(TOP)/build/ee-common.mk

OUTDIR := $(TOP)/bin/$(CONFIG)

$(OUTDIR)/lib$(NAME).a: $(OBJDIR)/ $(OUTDIR)/ $(OBJS)
	$(AR) rv $@ $(OBJS)

$(OUTDIR)/:
	mkdir -p $@

$(OBJDIR)/:
	mkdir -p $@

# Phony target to clean products of this build type
clean-products:
	-rm $(OUTDIR)/lib$(NAME).a
	-rm -rf obj

