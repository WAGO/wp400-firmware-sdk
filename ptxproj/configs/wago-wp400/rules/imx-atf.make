# -*-makefile-*-
#
# Copyright (C) 2024 by <elrest GmbH>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_IMX_ATF) += imx-atf

#
# Paths and names
#

IMX_ATF_VERSION	:= $(call remove_quotes,$(PTXCONF_IMX_ATF_VERSION))
IMX_ATF_MD5		:= $(call remove_quotes,$(PTXCONF_IMX_ATF_MD5))
IMX_ATF			:= imx-atf-$(IMX_ATF_VERSION)
IMX_ATF_SUFFIX	:= tar.xz
IMX_ATF_URL		:= https://github.com/nxp-imx/imx-atf/blob/lf_v$(IMX_ATF_VERSION)
IMX_ATF_SOURCE	:= $(SRCDIR)/$(IMX_ATF).$(IMX_ATF_SUFFIX)
IMX_ATF_DIR		:= $(BUILDDIR)/$(IMX_ATF)
IMX_ATF_LICENSE	:= BSD-3-Clause

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-atf.compile:
	@$(call targetinfo)
	cd $(IMX_ATF_DIR) && \
	make CROSS_COMPILE=$(COMPILER_PREFIX) PLAT=imx8mp bl31
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-atf.install:
	@$(call targetinfo)
	@cp $(IMX_ATF_DIR)/build/imx8mp/release/bl31.bin $(U_BOOT_DIR)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-atf.targetinstall:
	@$(call targetinfo)

	@$(call install_init, imx-atf)
	@$(call install_fixup, imx-atf,PRIORITY,optional)
	@$(call install_fixup, imx-atf,SECTION,base)
	@$(call install_fixup, imx-atf,AUTHOR,"<elrest GmbH>")
	@$(call install_fixup, imx-atf,DESCRIPTION,missing)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-atf.clean:
	@$(call targetinfo)
	@-cd $(IMX_ATF_DIR) && \
		$(IMX_ATF_ENV) $(IMX_ATF_PATH) $(MAKE) distclean
	@$(call clean_pkg, IMX_ATF)

# vim: syntax=make
