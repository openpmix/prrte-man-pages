# -*- makefile -*-
# Copyright (c) 2008-2020 Cisco Systems, Inc.  All rights reserved.
# Copyright (c) 2008      Sun Microsystems, Inc.  All rights reserved.
# Copyright (c) 2019      Intel, Inc.  All rights reserved.
# Copyright (c) 2021      Nanook Consulting.  All rights reserved.
# $COPYRIGHT$
#
# Additional copyrights may follow
#
# $HEADER$
#

MD2NROFF = $(PRTE_TOP_SRCDIR)/config/md2nroff.pl

docfiles = \
    src/pcc.1           \
    src/prte_info.1     \
    src/prte-map.1      \
    src/prte.1          \
    src/prted.1         \
    src/prterun.1       \
    src/prun.1          \
    src/pterm.1

man_MANS = $(docfiles)

%.1: %.1.md
	$(PRTE_V_GEN) $(MD2NROFF) --source=$< --dest=$@ --pandoc=$(PANDOC)

# A little verbosity magic; "make" will show the terse output.  "make
# V=1" will show the actual commands used (just like the other
# Automake-generated compilation/linker rules).
V=0

PRTE_V_LN_S = $(prte__v_LN_S_$V)
prte__v_LN_S_ = $(prte__v_LN_S_$AM_DEFAULT_VERBOSITY)
prte__v_LN_S_0 = @echo "  LN_S    " `basename $@`;

PRTE_V_MKDIR = $(prte__v_MKDIR_$V)
prte__v_MKDIR_ = $(prte__v_MKDIR_$AM_DEFAULT_VERBOSITY)
prte__v_MKDIR_0 = @echo "  MKDIR   " $@;

PRTE_V_GEN = $(prte__v_GEN_$V)
prte__v_GEN_ = $(prte__v_GEN_$AM_DEFAULT_VERBOSITY)
prte__v_GEN_0 = @echo "  GENERATE" $@;
