# -*-makefile-*-
#
# Copyright (C) 2025 by <elrest>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_WEBENGINEBROWSER_QT6) += webenginebrowser-qt6

#
# Paths and names
#
ifdef PTXCONF_WEBENGINEBROWSER_QT6_TRUNK
WEBENGINEBROWSER_QT6_VERSION	:= trunk
else
WEBENGINEBROWSER_QT6_VERSION	:= 1.1.3
WEBENGINEBROWSER_QT6_MD5		:=
endif
#WEBENGINEBROWSER_QT6			:= webenginebrowser-qt6-$(WEBENGINEBROWSER_QT6_VERSION)
WEBENGINEBROWSER_QT6			:= webenginebrowser-qt6
WEBENGINEBROWSER_QT6_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(WEBENGINEBROWSER_QT6)
WEBENGINEBROWSER_QT6_DIR		:= $(BUILDDIR)/$(WEBENGINEBROWSER_QT6)
WEBENGINEBROWSER_QT6_BUILD_OOT	:= YES
WEBENGINEBROWSER_QT6_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#WEBENGINEBROWSER_QT6_CONF_ENV	:= $(CROSS_ENV)

#
# qmake
#
WEBENGINEBROWSER_QT6_PATH		:= PATH=$(PTXDIST_SYSROOT_CROSS)/bin/qt6:$(CROSS_PATH)
WEBENGINEBROWSER_QT6_CONF_TOOL	:= qmake
WEBENGINEBROWSER_QT6_CONF_OPT	:= $(CROSS_QMAKE_OPT) PREFIX=/usr

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/webenginebrowser-qt6.targetinstall:
	@$(call targetinfo)

	@$(call install_init, webenginebrowser-qt6)
	@$(call install_fixup, webenginebrowser-qt6, PRIORITY, optional)
	@$(call install_fixup, webenginebrowser-qt6, SECTION, base)
	@$(call install_fixup, webenginebrowser-qt6, AUTHOR, "<elrest>")
	@$(call install_fixup, webenginebrowser-qt6, DESCRIPTION, missing)

#	#
#	# example code:; copy all binaries
#	#

	@for i in $(shell cd $(WEBENGINEBROWSER_QT6_PKGDIR) && find bin sbin usr/bin usr/sbin -type f); do \
		$(call install_copy, webenginebrowser-qt6, 0, 0, 0755, -, /$$i); \
	done

#	#
#	# FIXME: add all necessary things here
#	#

	@$(call install_finish, webenginebrowser-qt6)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/webenginebrowser-qt6.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, WEBENGINEBROWSER_QT6)

# vim: syntax=make
