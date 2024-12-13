# -*-makefile-*-
#
# Copyright (C) 2016 by <elrest>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_QTVIRTUALKEYBOARD) += qtvirtualkeyboard

#
# Paths and names
#
ifdef PTXCONF_QTVIRTUALKEYBOARD_TRUNK
QTVIRTUALKEYBOARD_VERSION	:= trunk
else
QTVIRTUALKEYBOARD_VERSION	:= 1
QTVIRTUALKEYBOARD_MD5		:=
endif
QTVIRTUALKEYBOARD		:= qtvirtualkeyboard
QTVIRTUALKEYBOARD_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(QTVIRTUALKEYBOARD)
QTVIRTUALKEYBOARD_DIR		:= $(BUILDDIR)/$(QTVIRTUALKEYBOARD)
QTVIRTUALKEYBOARD_BUILD_OOT	:= YES
QTVIRTUALKEYBOARD_LICENSE	:= GPL3

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(QTVIRTUALKEYBOARD_SOURCE):
#	@$(call targetinfo)
#	@$(call get, QTVIRTUALKEYBOARD)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#QTVIRTUALKEYBOARD_CONF_ENV	:= $(CROSS_ENV)

#
# qmake
#
QTVIRTUALKEYBOARD_PATH      := PATH=$(PTXDIST_SYSROOT_CROSS)/bin/qt5:$(CROSS_PATH)
QTVIRTUALKEYBOARD_CONF_TOOL	:= qmake
QTVIRTUALKEYBOARD_CONF_OPT	:= $(CROSS_QMAKE_OPT) PREFIX=/usr

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qtvirtualkeyboard.targetinstall:
	@$(call targetinfo)

	@$(call install_init, qtvirtualkeyboard)
	@$(call install_fixup, qtvirtualkeyboard, PRIORITY, optional)
	@$(call install_fixup, qtvirtualkeyboard, SECTION, base)
	@$(call install_fixup, qtvirtualkeyboard, AUTHOR, "<elrest>")
	@$(call install_fixup, qtvirtualkeyboard, DESCRIPTION, missing)

#	#
#	# example code:; copy all binaries
#	#

	@for i in $(shell cd $(QTVIRTUALKEYBOARD_PKGDIR) && find bin sbin usr/bin usr/sbin -type f); do \
		$(call install_copy, qtvirtualkeyboard, 0, 0, 0755, -, /$$i); \
	done

#	#
#	# FIXME: add all necessary things here
#	#

	@$(call install_finish, qtvirtualkeyboard)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/qtvirtualkeyboard.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, QTVIRTUALKEYBOARD)

# vim: syntax=make
