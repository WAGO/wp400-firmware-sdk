# -*-makefile-*-
#
# Copyright (C) 2017 by <elrest>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_GESTURE_CONTROL_WP) += gesture_control_wp

#
# Paths and names
#
GESTURE_CONTROL_WP_VERSION	:= 1
GESTURE_CONTROL_WP_MD5		:=
GESTURE_CONTROL_WP		:= gesture_control_wp
GESTURE_CONTROL_WP_URL		:= file://local_src/$(GESTURE_CONTROL_WP)
GESTURE_CONTROL_WP_DIR		:= $(BUILDDIR)/$(GESTURE_CONTROL_WP)
GESTURE_CONTROL_WP_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/gesture_control_wp.extract:
#	@$(call targetinfo)
#	@$(call clean, $(GESTURE_CONTROL_WP_DIR))
#	@$(call extract, GESTURE_CONTROL_WP)
#	@$(call patchin, GESTURE_CONTROL_WP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#GESTURE_CONTROL_WP_PATH	:= PATH=$(CROSS_PATH)
GESTURE_CONTROL_WP_CONF_TOOL	:= NO
GESTURE_CONTROL_WP_MAKE_ENV	:= $(CROSS_ENV)

#$(STATEDIR)/gesture_control_wp.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, GESTURE_CONTROL_WP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/gesture_control_wp.compile:
#	@$(call targetinfo)
#	@$(call world/compile, GESTURE_CONTROL_WP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/gesture_control_wp.install:
#	@$(call targetinfo)
#	@$(call world/install, GESTURE_CONTROL_WP)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gesture_control_wp.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gesture_control_wp)
	@$(call install_fixup, gesture_control_wp,PRIORITY,optional)
	@$(call install_fixup, gesture_control_wp,SECTION,base)
	@$(call install_fixup, gesture_control_wp,AUTHOR,"<elrest>")
	@$(call install_fixup, gesture_control_wp,DESCRIPTION,missing)

#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
	@$(call install_copy, gesture_control_wp, 0, 0, 0755, $(GESTURE_CONTROL_WP_DIR)/gesture_control_wp, /usr/bin/gesture_control_wp)

	@$(call install_finish, gesture_control_wp)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/gesture_control_wp.clean:
	@$(call targetinfo)
	@-cd $(GESTURE_CONTROL_WP_DIR) && \
		$(GESTURE_CONTROL_WP_ENV) $(GESTURE_CONTROL_WP_PATH) $(MAKE) clean
	@$(call clean_pkg, GESTURE_CONTROL_WP)

# vim: syntax=make
