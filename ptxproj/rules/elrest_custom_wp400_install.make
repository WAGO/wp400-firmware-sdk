# -*-makefile-*-
#
# Copyright (C) 2024 by <elrest>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_ELREST_CUSTOM_WP400_INSTALL) += elrest-custom-wp400-install
 
# dummy to make ipkg happy
ELREST_CUSTOM_WP400_INSTALL_VERSION	:= 1.0.0
ELREST_CUSTOM_WP400_INSTALL	:= elrest-custom-wp400-install

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/elrest-custom-wp400-install.install:
	@$(call targetinfo)
	@$(call world/install, ELREST_CUSTOM_WP400_INSTALL)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/elrest-custom-wp400-install.targetinstall:
	@$(call targetinfo)
	@$(call install_init,  elrest-custom-wp400-install)
	@$(call install_fixup, elrest-custom-wp400-install,PRIORITY,optional)
	@$(call install_fixup, elrest-custom-wp400-install,SECTION,base)
	@$(call install_fixup, elrest-custom-wp400-install,AUTHOR,"Ralf Gliese <gliese@elrest.de>")
	@$(call install_fixup, elrest-custom-wp400-install,DESCRIPTION,missing)

ifdef PTXCONF_ELREST_CUSTOM_WP400_INIT_FILES_INSTALL
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/init.d/start_panel)
	@$(call install_link, elrest-custom-wp400-install, ../init.d/start_panel, /etc/rc.d/S97_start_panel)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_PROFILE_FILES_INSTALL
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/profile_cap_0)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/profile_cap_cw)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/profile_cap_ud)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/profile_cap_ccw)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_XORG_CONFIG_INSTALL
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/X11/emptyCursor.xbm)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/X11/xorg.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /usr/bin/startx)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_USER_FILES_INSTALL
	@$(call install_copy, elrest-custom-wp400-install, ${PTXCONF_ROOTFS_PASSWD_USER_UID}, ${PTXCONF_ROOTFS_PASSWD_USER_GID}, 0755, /home/user)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /home/user/logo.png)
	@$(call install_alternative_tree, elrest-custom-wp400-install, 0, 0,  /usr/lib/qt5/qml/QtQuick/VirtualKeyboard/Styles/mystyle)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_CONFIG_FILES_INSTALL
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_panel.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_framebuffer.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_x_wbm.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_application.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0750, /etc/config-tools/brightnesscontrol)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0750, /etc/config-tools/start_displaycleaning)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0750, /etc/config-tools/start_screensaver)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0750, /etc/config-tools/testbacklight)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0750, /etc/config-tools/get_run_stop_switch_value)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_wbm.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_webbrowser.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0754, /etc/script/start_plclist.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/backlight.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/bootsettings.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/display.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/motionsensor.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/plcselect.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/screen.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/touchbeeper.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/gesture.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/qtstyle.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/menuqt.xml)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/fonts.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/isconfigured.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/eruntime.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/virtualkeyboard.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/virtualkeyboard.xml)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/virtualkeyboard_272x480.xml)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/browsersecurity.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/enter.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/bksp.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/ico-up.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/ico-down.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/ico-right.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/ico-left.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/dipvalue-on-reset)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/webengine/getscrollbarpos_h.js)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/webengine/getscrollbarpos_v.js)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/webengine/userstylesheet.conf)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/webengine/webengine.conf)
	@$(call install_copy, elrest-custom-wp400-install, 0, 0, 0700, /root)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /root/.cwmrc)
	@$(call install_link, elrest-custom-wp400-install, /usr/share, /share)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/network-interfaces-with-modem.xml)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/network-interfaces-default.xml)

	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_800.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_1280.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_1920.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_800.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_1280.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_1920.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_800.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_1280.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_1920.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_800.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_1280.png)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_1920.png)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_PLCLIST
	@$(call install_alternative_tree, elrest-custom-wp400-install, 0, 0,  /var/www/plclist)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/init.d/filewatcher)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/script/init_filewatch.sh)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/script/generate_plclist.php)
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0755, /etc/rc.once.d/initial_plclist_generation)
	@$(call install_link, elrest-custom-wp400-install, ../init.d/filewatcher, /etc/rc.d/S71_filewatcher)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_TTF_INSTALL
	@$(call install_alternative_tree, elrest-custom-wp400-install, 0, 0,  /usr/share/fonts/X11/truetype/liberation)
	@$(call install_alternative_tree, elrest-custom-wp400-install, 0, 0,  /usr/share/fonts/X11/truetype/freefont)
	@$(call install_alternative_tree, elrest-custom-wp400-install, 0, 0,  /usr/share/fonts/X11/truetype/other)
endif

ifdef PTXCONF_ELREST_CUSTOM_WP400_PTE_INSTALL
	@$(call install_alternative, elrest-custom-wp400-install, 0, 0, 0644, /etc/specific/typelabel)
endif

	@$(call install_finish, elrest-custom-wp400-install)
	@$(call touch)

# vim: syntax=make
