FINALNAME=$(NAME)_$(CONFIG)

OBJECTS := $(patsubst %.c,obj/$(CONFIG)/%.o,$(filter %.c,$(SRCS)))
OBJECTS += $(patsubst %.cpp,obj/$(CONFIG)/%.o,$(filter %.cpp,$(SRCS)))
OBJECTS += $(patsubst %.s,obj/$(CONFIG)/%.o,$(filter %.s,$(SRCS)))

$(OBJDIR)/%.o: %.c
	$(CC) -c $(CCFLAGS) $(INCS) $< -o $@

$(OBJDIR)/%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $(INCS) $< -o $@

$(OBJDIR)/%.o: %.s
	$(AS) -c $(ASFLAGS) $(INCS) $< -o $@

.PHONY: all-pre

all: all-pre $(BINDIR)/$(FINALNAME).elf

clean:
	-rm $(BINDIR)/$(FINALNAME).elf
	-rm -rf obj

$(BINDIR)/:
	mkdir -p $@

$(OBJDIR)/:
	mkdir -p $@

$(BINDIR)/$(FINALNAME).elf: $(OBJDIR)/ $(BINDIR)/ $(OBJECTS)
	$(LD)  $(LDFLAGS) $(LIBS) $(OBJECTS)   -o $@
