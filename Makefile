#
# This file should not be changed.	If you need to make alterations to the configuration, you really ought to edit config.mk instead.
#

all: configure libs

include config.mk
include nrmf.mk

ALL_CLEAN           :=
ALL_CONFIG          :=
ALL_LIBS            :=
ALL_INSTALLS        :=

CONFIG_H_TARGET     := lib65816/config.h
$(call subdir,config)

$(call subdir,lib65816)
$(call subdir,src)

.c.o:
	$(CC) $(CCFLAGS) -o $@ $<

configure: $(ALL_CONFIG)

libs: lib65816/config.h $(ALL_LIBS)

clean: $(ALL_CLEAN)

install: lib65816/config.h $(ALL_INSTALLS)

lib65816/config.h: $(ALL_CONFIG)
