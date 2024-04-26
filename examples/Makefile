################################################################################
# Makefile - Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Fri 2024-04-26 17:16 svarrette>
#
# Copyright (c) 2015-2024 S. Varrette
#
# Available Commands
# ------------------
# make           : Compile files, binaries are generated in the current directory
# make force     : Force the complete re-compilation, even if not needed
# make clean     : Remove backup files (*~) and other generated files
#
############################## Variables Declarations ############################
SHELL = /bin/bash

DIRS = $(sort $(dir $(wildcard */)))
SRC  = $(join $(DIRS), $(DIRS:/=.tex))
PDF  = $(SRC:.tex=.pdf)
RELEASED_PDF  = $(notdir $(SRC:.tex=.pdf))
COVERS = $(addprefix cover_,$(RELEASED_PDF:.pdf=.png))

# pdftoppm to help producing cover images
PDFTOPPM = $(shell which pdftoppm)
# Ghostscript for the help of producing optimized PDF
GS      = $(shell which gs)
GS_OPTS = -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress

TARGETS = $(DIRS)
# $(RELEASED_PDF)

###################### Let's go!!!! ######################
all: $(TARGETS)

# cover: $(COVERS)
# pdf: $(RELEASED_PDF)

info:
	@echo "DIRS  = $(DIRS)"
	@echo "SRC   = $(SRC)"
	@echo "PDF   = $(PDF)"
	@echo "RELEASED_PDF = $(RELEASED_PDF)"
	@echo "COVERS   = $(COVERS)"
	@echo "TARGETS = $(TARGETS)"

.PHONY: minimal advanced markdown
minimal advanced markdown:
	@echo "=> force compilation to generate '$@/$@.pdf'"
	$(MAKE) -C $@ clean
	$(MAKE) -C $@
	@echo "=> produce optimized PDF $@ using ghostcript"
	gs $(GS_OPTS) -sOutputFile=$@.pdf   $@/$@.pdf
	@echo "=> generating cover image (first page, converted to png using pdftoppm) for $@.pdf"
	pdftoppm -png -r 300 -f 1 -l 1 $@.pdf $@
	@echo "=> renaming cover file"
	mv $@-*.png cover_$@.png


clean:
	@for d in $(DIRS); do \
		echo "==> processing '$$d'"; \
		$(MAKE) -C $$d $@; \
	done

distclean: clean
	rm -f $(RELEASED_PDF) $(COVERS)
