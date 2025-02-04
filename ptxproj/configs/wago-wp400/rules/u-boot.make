# -*-makefile-*-
#
# Copyright (C) 2007 by Sascha Hauer
#               2009, 2010 by Marc Kleine-Budde <mkl@pengutronix.de>
#               2018 by Ahmad Fatoum <a.fatoum@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_U_BOOT) += u-boot

#ifdef PTXCONF_WAGO_TOOLS_BUILD_VERSION_BINARIES
#	BOOTLOADER_COMPAT_FW_LIST := "27"
#else
BOOTLOADER_COMPAT_FW_LIST := "99"
#endif

#
# Paths and names
#
U_BOOT_MD5		:= $(call remove_quotes,$(PTXCONF_U_BOOT_MD5))
ifdef PTXCONF_U_BOOT_ARTIFACTORY
U_BOOT_VERSION		:= $(call remove_quotes, $(PTXCONF_U_BOOT_VERSION)-$(PTXCONF_U_BOOT_LOCALVERSION))
U_BOOT			:= u-boot-$(U_BOOT_VERSION)
U_BOOT_DIR		:= $(BUILDDIR)/$(U_BOOT)
U_BOOT_BUILD_DIR	:= $(U_BOOT_DIR)-build
U_BOOT_SOURCE		:= $(SRCDIR)/u-boot-$(U_BOOT_VERSION).tar.gz
U_BOOT_MD5_FILE	:= $(U_BOOT_SOURCE).md5
U_BOOT_SRC_URL		:= $(call jfrog_template_to_url, U_BOOT_SRC)
else
U_BOOT_VERSION		:= $(call remove_quotes,$(PTXCONF_U_BOOT_VERSION))
U_BOOT			:= u-boot-$(U_BOOT_VERSION)
U_BOOT_DIR		:= $(BUILDDIR)/$(U_BOOT)
U_BOOT_BUILD_DIR	:= $(U_BOOT_DIR)-build
U_BOOT_SUFFIX		:= tar.xz
U_BOOT_SOURCE		:= $(SRCDIR)/$(U_BOOT).$(U_BOOT_SUFFIX)
U_BOOT_MD5		:= $(call remove_quotes,$(PTXCONF_U_BOOT_MD5))
U_BOOT_URL		:= https://ftp.denx.de/pub/u-boot/$(U_BOOT).$(U_BOOT_SUFFIX)
endif
U_BOOT_DEVPKG		:= NO

ifdef PTXCONF_U_BOOT_CONFIGSYSTEM_KCONFIG
U_BOOT_CONFIG	:= $(call ptx/in-platformconfigdir, \
		$(call remove_quotes, $(PTXCONF_U_BOOT_CONFIGFILE_KCONFIG)))
endif

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------
#
ifdef PTXCONF_U_BOOT_ARTIFACTORY
$(U_BOOT_SOURCE):
	@$(call targetinfo)
	$(call ptx/in-path, PTXDIST_PATH, scripts/wago/artifactory.sh) fetch \
		'$(U_BOOT_SRC_URL)' '$(U_BOOT_SOURCE)' '$(U_BOOT_MD5_FILE)'
	@$(call touch)
endif

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

ifdef PTXCONF_U_BOOT_BOOT_SCRIPT
U_BOOT_BOOT_SCRIPT_TXT := $(call ptx/in-platformconfigdir, uboot.scr)
U_BOOT_BOOT_SCRIPT_BIN := $(call remove_quotes, \
	$(PTXCONF_U_BOOT_BOOT_SCRIPT_ROOTFS_PATH))
$(call ptx/cfghash-file, U_BOOT, $(U_BOOT_BOOT_SCRIPT_TXT))
endif

ifdef PTXCONF_U_BOOT_ENV_IMAGE_CUSTOM
U_BOOT_ENV_IMAGE_CUSTOM_SRC := $(call ptx/in-platformconfigdir, \
	$(call remove_quotes, $(PTXCONF_U_BOOT_ENV_IMAGE_CUSTOM_SOURCE)))
$(call ptx/cfghash-file, U_BOOT, $(U_BOOT_ENV_IMAGE_CUSTOM_SRC))
endif

U_BOOT_WRAPPER_BLACKLIST := \
	$(PTXDIST_LOWLEVEL_WRAPPER_BLACKLIST)

U_BOOT_CONF_OPT		:= \
	-C $(U_BOOT_DIR) \
	O=$(U_BOOT_BUILD_DIR) \
	V=$(PTXDIST_VERBOSE) \
	$(call remove_quotes,$(PTXCONF_U_BOOT_CUSTOM_MAKE_OPTS))

U_BOOT_MAKE_ENV		:= \
	CROSS_COMPILE=$(BOOTLOADER_CROSS_COMPILE) \
	HOSTCC=$(HOSTCC)
U_BOOT_MAKE_OPT		:= $(U_BOOT_CONF_OPT)

U_BOOT_TAGS_OPT		:= ctags cscope etags

ifdef PTXCONF_U_BOOT_CONFIGSYSTEM_KCONFIG
U_BOOT_CONF_TOOL	:= kconfig
U_BOOT_CONF_ENV		:= $(U_BOOT_MAKE_ENV)
endif

ifdef PTXCONF_U_BOOT_CONFIGSYSTEM_LEGACY
U_BOOT_CONF_ENV		:= PATH=$(CROSS_PATH) $(U_BOOT_MAKE_ENV)
U_BOOT_CONF_ENV		+= DTC=$(PTXDIST_SYSROOT_HOST)/bin/dtc
U_BOOT_CONF_OPT		+= $(call remove_quotes, $(PTXCONF_U_BOOT_CONFIG))
U_BOOT_MAKE_PAR		:= NO
endif


ifdef PTXCONF_U_BOOT
$(U_BOOT_CONFIG):
	@echo
	@echo "****************************************************************************"
	@echo "***** Please generate a u-boot config with 'ptxdist menuconfig u-boot' *****"
	@echo "****************************************************************************"
	@echo
	@echo
	@exit 1
endif

ifdef PTXCONF_U_BOOT_CONFIGSYSTEM_LEGACY
$(STATEDIR)/u-boot.prepare:
	@$(call targetinfo)
	$(U_BOOT_CONF_ENV) $(MAKE) $(U_BOOT_CONF_OPT)
	@$(call touch)
endif

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/u-boot.compile:
	@$(call targetinfo)
ifdef PTXCONF_U_BOOT_IMX_ATF
	@cp $(FIRMWARE_IMX_DIR)/$(FIRMWARE_IMX)/firmware/ddr/synopsys/lpddr4_pmu_train*202006.bin $(U_BOOT_DIR)
	@cp $(IMX_ATF_DIR)/build/imx8mp/release/bl31.bin $(U_BOOT_DIR)
endif
	@$(call world/compile, U_BOOT)
ifdef PTXCONF_U_BOOT_BOOT_SCRIPT
	@$(U_BOOT_BUILD_DIR)/tools/mkimage -T script -C none \
		-d $(U_BOOT_BOOT_SCRIPT_TXT) \
		$(U_BOOT_BUILD_DIR)/boot.scr.uimg
endif
ifdef PTXCONF_U_BOOT_ENV_IMAGE_DEFAULT
	$(U_BOOT_MAKE_ENV) $(U_BOOT_DIR)/scripts/get_default_envs.sh $(U_BOOT_BUILD_DIR) | \
		$(U_BOOT_BUILD_DIR)/tools/mkenvimage \
		$(call ptx/ifdef,PTXCONF_U_BOOT_ENV_IMAGE_REDUNDANT,-r,) \
		-s $(PTXCONF_U_BOOT_ENV_IMAGE_SIZE) \
		-o $(U_BOOT_BUILD_DIR)/u-boot-env.img -
endif
ifdef PTXCONF_U_BOOT_ENV_IMAGE_CUSTOM
	$(U_BOOT_BUILD_DIR)/tools/mkenvimage \
		$(call ptx/ifdef,PTXCONF_U_BOOT_ENV_IMAGE_REDUNDANT,-r,) \
		-s $(PTXCONF_U_BOOT_ENV_IMAGE_SIZE) \
		-o $(U_BOOT_BUILD_DIR)/u-boot-env.img \
		$(U_BOOT_ENV_IMAGE_CUSTOM_SRC)
endif
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/u-boot.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/u-boot.targetinstall:
	@$(call targetinfo)

	@$(call install_init, u-boot)
	@$(call install_fixup, u-boot, PRIORITY, optional)
	@$(call install_fixup, u-boot, SECTION, base)
	@$(call install_fixup, u-boot, AUTHOR, "Ahmad Fatoum <afa@pengutronix.de>")
	@$(call install_fixup, u-boot, DESCRIPTION, "U-Boot boot script")

ifdef PTXCONF_U_BOOT_ARTIFACTORY
ifdef PTXCONF_U_BOOT_IMX_ATF
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/flash.bin \
		$(IMAGEDIR)/flash.bin
endif
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.img $(IMAGEDIR)/u-boot.img
else
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.bin $(IMAGEDIR)/u-boot.bin
ifdef PTXCONF_U_BOOT_INSTALL_SREC
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.srec $(IMAGEDIR)/u-boot.srec
endif
ifdef PTXCONF_U_BOOT_INSTALL_ELF
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot $(IMAGEDIR)/u-boot.elf
endif
ifdef PTXCONF_U_BOOT_INSTALL_SPL
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/SPL $(IMAGEDIR)/SPL
endif
ifdef PTXCONF_U_BOOT_INSTALL_MLO
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/MLO $(IMAGEDIR)/MLO
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_IMG
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.img $(IMAGEDIR)/u-boot.img
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_IMX
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.imx $(IMAGEDIR)/u-boot.imx
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_DTB_IMX
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot-dtb.imx $(IMAGEDIR)/u-boot-dtb.imx
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_DTB
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot-dtb.bin \
		$(IMAGEDIR)/u-boot-dtb.bin
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_WITH_SPL_PBL
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot-with-spl-pbl.bin \
		$(IMAGEDIR)/u-boot-with-spl-pbl.bin
endif
ifdef PTXCONF_U_BOOT_INSTALL_U_BOOT_STM32
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot.stm32 $(IMAGEDIR)/u-boot.stm32
endif
ifndef PTXCONF_U_BOOT_ENV_IMAGE_NONE
	@install -v -D -m644 $(U_BOOT_BUILD_DIR)/u-boot-env.img \
		$(IMAGEDIR)/u-boot-env.img
endif

ifdef PTXCONF_U_BOOT_BOOT_SCRIPT
	@$(call install_copy, u-boot, 0, 0, 0644, \
		$(U_BOOT_BUILD_DIR)/boot.scr.uimg, $(U_BOOT_BOOT_SCRIPT_BIN))
endif
endif

	@$(call install_alternative, u-boot, 0, 0, 0400, /etc/barebox-compatible-versions)
	@$(call install_replace, u-boot, /etc/barebox-compatible-versions, @BAREBOX_COMPAT_FW_LIST@, $(strip $(BOOTLOADER_COMPAT_FW_LIST)))
	
	@$(call install_copy, u-boot, 0, 0, 0644, $(U_BOOT_DIR)/Licenses/gpl-2.0.txt, /usr/share/licenses/oss/license.u-boot_$(shell echo $(U_BOOT_VERSION) | tr '_+' '.-').txt)
	
	@$(call install_finish, u-boot)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/u-boot.clean:
	@$(call targetinfo)
	@$(call clean_pkg, U_BOOT)
	@rm -vf $(IMAGEDIR)/u-boot.bin $(IMAGEDIR)/u-boot.srec $(IMAGEDIR)/u-boot.elf
	@rm -vf $(IMAGEDIR)/u-boot.img $(IMAGEDIR)/SPL $(IMAGEDIR)/MLO
	@rm -vf $(IMAGEDIR)/u-boot.imx $(IMAGEDIR)/u-boot-dtb.imx
	@rm -vf $(IMAGEDIR)/u-boot-env.img
	@rm -vf	$(IMAGEDIR)/u-boot-dtb.bin $(IMAGEDIR)/u-boot-with-spl-pbl.bin
	@rm -vf $(IMAGEDIR)/u-boot.stm32

# ----------------------------------------------------------------------------
# oldconfig / menuconfig
# ----------------------------------------------------------------------------

u-boot_oldconfig u-boot_menuconfig u-boot_nconfig: $(STATEDIR)/u-boot.extract
	@$(call world/kconfig, U_BOOT, $(subst u-boot_,,$@))

# vim: syntax=make
