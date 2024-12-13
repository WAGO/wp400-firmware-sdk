# -*-makefile-*-
#
# Copyright (C) 2024 by <elrest>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_CWM) += cwm

#
# Paths and names
#
CWM_VERSION	:= 7.4
CWM_MD5		:= 339bd7f4de8d8327834fde5897fef833
CWM			:= cwm-$(CWM_VERSION)
CWM_SUFFIX	:= tar.gz
CWM_URL		:= https://github.com/leahneukirchen/cwm/tags/cwm/$(CWM).$(CWM_SUFFIX)
CWM_SOURCE	:= $(SRCDIR)/$(CWM).$(CWM_SUFFIX)
CWM_DIR		:= $(BUILDDIR)/$(CWM)
CWM_LICENSE	:= OPENBSD

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/cwm.extract:
#	@$(call targetinfo)
#	@$(call clean, $(CWM_DIR))
#	@$(call extract, CWM)
#	@$(call patchin, CWM)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#CWM_PATH	:= PATH=$(CROSS_PATH)
CWM_CONF_TOOL	:= NO
CWM_MAKE_ENV	:= $(CROSS_ENV)

#$(STATEDIR)/cwm.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, CWM)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/cwm.compile:
	@$(call targetinfo)
	@$(call world/compile, CWM)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/cwm.install:
#	@$(call targetinfo)
#	@$(call world/install, CWM)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/cwm.targetinstall:
	@$(call targetinfo)
	@$(call install_init, cwm)
	@$(call install_fixup, cwm,PRIORITY,optional)
	@$(call install_fixup, cwm,SECTION,base)
	@$(call install_fixup, cwm,AUTHOR,"<elrest GmbH>")
	@$(call install_fixup, cwm,DESCRIPTION,missing)
	@$(call install_copy, cwm, 0, 0, 0755, $(CWM_DIR)/cwm, /usr/bin/cwm)
	@$(call install_finish, cwm)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/cwm.clean:
	@$(call targetinfo)
	@-cd $(CWM_DIR) && \
		$(CWM_ENV) $(CWM_PATH) $(MAKE) clean
	@$(call clean_pkg, CWM)

# vim: syntax=make
