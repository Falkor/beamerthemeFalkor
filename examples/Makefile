################################################################################
# Makefile - Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Mon 2015-06-15 12:35 svarrette>
#
# Copyright (c) 2015 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#
# Available Commands
# ------------------
# make           : Compile files, binaries are generated in the current directory
# make force     : Force the complete re-compilation, even if not needed
# make clean     : Remove backup files (*~) and other generated files
#
############################## Variables Declarations ############################

SRCDIR = $(dir $(wildcard */))
TARGET = $(join $(SRCDIR), $(SRCDIR:/=.pdf))

all:

release: all
	@for f in $(TARGET); do \
		echo "==> releasing '$$f' in the current directory"; \
		cp $$f .; \
	done

release_clean:
	rm -i $(notdir $(TARGET))

test:
	@echo "SRCDIR = $(SRCDIR)"
	@echo "TARGET = $(TARGET)"

%:
	@for d in $(SRCDIR); do \
		echo "==> running 'make $@' in $$d"; \
		$(MAKE) -C $$d $@; \
	done
