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
PACKAGES-$(PTXCONF_FIRMWARE_IMX) += firmware-imx

#
# Paths and names
#
FIRMWARE_IMX_VERSION	:= 8.22
FIRMWARE_IMX			:= firmware-imx-$(FIRMWARE_IMX_VERSION)
FIRMWARE_IMX_SUFFIX		:= bin
FIRMWARE_IMX_URL		:= https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX)
FIRMWARE_IMX_SOURCE		:= $(SRCDIR)/$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX)
FIRMWARE_IMX_DIR		:= $(BUILDDIR)/$(FIRMWARE_IMX)
FIRMWARE_IMX_LICENSE	:= "LA_OPT_NXP_Software_License"

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.get:
	@$(call targetinfo)
	if test ! -f $(FIRMWARE_IMX_SOURCE) ; then \
		wget https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX) -P $(SRCDIR); \
	fi;
	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.extract:
	@$(call targetinfo)
	mkdir -p $(FIRMWARE_IMX_DIR) && \
	rm -Rf $(FIRMWARE_IMX_DIR)/* && \
	cp $(FIRMWARE_IMX_SOURCE) $(FIRMWARE_IMX_DIR) && \
	chmod +x $(FIRMWARE_IMX_DIR)/$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX) && \
	cd $(FIRMWARE_IMX_DIR) && ./$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX) --auto-accept --force
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.targetinstall:
	@$(call targetinfo)

	@$(call install_init, firmware-imx)
	@$(call install_fixup, firmware-imx, PRIORITY, optional)
	@$(call install_fixup, firmware-imx, SECTION, base)
	@$(call install_fixup, firmware-imx, AUTHOR, "<elrest GmbH>")
	@$(call install_fixup, firmware-imx, DESCRIPTION, "TODO firmware-imx")

	cd $(PTX_ROOT) && mkdir -p usr && mkdir -p usr/lib && ln -sf usr/lib lib
	@mkdir -p $(PTX_ROOT)/lib/firmware
	@mkdir -p $(PTX_ROOT)/lib/firmware/imx
	@rm -Rf $(FIRMWARE_IMX_DIR)/$(IMX8M_FIRMWARE)/sdma
	@cp -Rf $(FIRMWARE_IMX_DIR)/$(FIRMWARE_IMX)/firmware/sdma $(PTX_ROOT)/lib/firmware/imx

	@$(call install_finish, firmware-imx)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/firmware-imx.clean:
	@$(call targetinfo)
	@rm -rf $(PTX_ROOT)/lib/firmware/imx
	@rm -rf $(FIRMWARE_IMX_DIR)
	@rm -rf $(SRCDIR)/$(FIRMWARE_IMX).$(FIRMWARE_IMX_SUFFIX)*
	@$(call clean_pkg, FIRMWARE_IMX)

# vim: syntax=make
