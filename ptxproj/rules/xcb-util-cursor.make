# -*-makefile-*-
#
# Copyright (C) 2023 by Ralf Gliese <gliese@pelrest.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_XCB_UTIL_CURSOR) += xcb-util-cursor

#
# Paths and names
#
XCB_UTIL_CURSOR_VERSION	:= 0.1.4
XCB_UTIL_CURSOR_MD5		:= 0d244518ad54b886413fe782235d6210
XCB_UTIL_CURSOR			:= xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION)
XCB_UTIL_CURSOR_SUFFIX	:= tar.xz
XCB_UTIL_CURSOR_URL		:= https://xcb.freedesktop.org/dist/$(XCB_UTIL_CURSOR).$(XCB_UTIL_CURSOR_SUFFIX)
XCB_UTIL_CURSOR_SOURCE	:= $(SRCDIR)/$(XCB_UTIL_CURSOR).$(XCB_UTIL_CURSOR_SUFFIX)
XCB_UTIL_CURSOR_DIR		:= $(BUILDDIR)/$(XCB_UTIL_CURSOR)
XCB_UTIL_CURSOR_LICENSE	:= X11

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
XCB_UTIL_CURSOR_CONF_TOOL	:= autoconf
XCB_UTIL_CURSOR_CONF_OPT	:= \
	$(CROSS_AUTOCONF_USR) \
	--disable-selective-werror \
	--disable-strict-compilation \
	--disable-devel-docs \
	--without-doxygen

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/xcb-util-cursor.targetinstall:
	@$(call targetinfo)

	@$(call install_init, xcb-util-cursor)
	@$(call install_fixup, xcb-util-cursor,PRIORITY,optional)
	@$(call install_fixup, xcb-util-cursor,SECTION,base)
	@$(call install_fixup, xcb-util-cursor,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, xcb-util-cursor,DESCRIPTION,missing)

	@$(call install_lib, xcb-util-cursor, 0, 0, 0644, libxcb-cursor)

	@$(call install_finish, xcb-util-cursor)

	@$(call touch)

# vim: syntax=make
