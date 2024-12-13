#!/bin/sh
#-----------------------------------------------------------------------------#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2019-2022 WAGO GmbH & Co. KG
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
# Script:   start_panel.sh
#
# Brief:    starting up panel / Xorg
#
# Author:   Ralf Gliese: elrest Automationssysteme GmbH
#
#-----------------------------------------------------------------------------#

eeprom_device="/sys/bus/i2c/devices/1-0054/eeprom"

# allow user www to read brightness
brightness_file=/sys/class/backlight/backlight/brightness
if [ -e "$brightness_file" ]; then
chmod 666 "$brightness_file"
fi

# allow user www to set / read display orientation
chmod 666 $eeprom_device

# decide start mode Xorg or framebuffer
MICROBROWSER="0"
URL=""
PLCSELECTED=`/etc/config-tools/get_plcselect plc_selected`
URL=`/etc/config-tools/get_plcselect $PLCSELECTED url`
MICROBROWSER=`/etc/config-tools/get_plcselect $PLCSELECTED mic`

if [ "$MICROBROWSER" == "1" ]; then
	# without Xorg except EDGE-BOX
	/etc/script/start_framebuffer.sh "$URL" &
else
	# start X
	export DISPLAY=:0
	echo "STARTING Xorg"
	# look for usb mouse pugged in
	grep -w "EV=17" /proc/bus/input/devices
	if [ "$?" == "0" ]; then
		/usr/bin/startx &
	else
		/usr/bin/startx -- -nocursor &
	fi
fi
