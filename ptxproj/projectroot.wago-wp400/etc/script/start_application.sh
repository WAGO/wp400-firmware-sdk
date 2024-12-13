#!/bin/bash
#-----------------------------------------------------------------------------#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2019-2022 WAGO GmbH & Co. KG
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
# Script:   start_application.sh
#
# Brief:    starting up applications
#
# Author:   Wolfgang Rückl: elrest Automationssysteme GmbH
#
#-----------------------------------------------------------------------------#

. /etc/profile > /dev/null 2>&1

HOME=/root
eeprom_device="/sys/bus/i2c/devices/1-0054/eeprom"
ORDER="$(/etc/config-tools/get_typelabel_value ORDER)"

#SET FEATURES
if [ "${ORDER:0:3}" == "762" ]; then
  #TP600
  echo "hardware-available=true" >"/etc/specific/features/display"
  echo "hardware-available=true" >"/etc/specific/features/touch"
  echo "hardware-available=false" >"/etc/specific/features/hdmi"
elif [ "${ORDER:0:5}" == "752-8" ]; then
  #EC752-8303
  echo "hardware-available=false" >"/etc/specific/features/display"
  echo "hardware-available=false" >"/etc/specific/features/touch"
  echo "hardware-available=true" >"/etc/specific/features/hdmi"
fi

if [ ! -d "/tmp/font_uploads" ]; then
  mkdir /tmp/font_uploads
  chown www:www /tmp/font_uploads
fi

if [ ! -d "/tmp/png_uploads" ]; then
  mkdir /tmp/png_uploads
  chown www:www /tmp/png_uploads
fi

if [ ! -d "/dev/shm" ]; then
  echo "NOT FOUND /dev/shm"
  mkdir /dev/shm
  chmod 1777 /dev/shm
fi

#create QT5 XDG_RUNTIME_DIR
if [ ! -d "/tmp/runtime-root" ]; then
  mkdir /tmp/runtime-root
  chmod 0700 /tmp/runtime-root
fi

function StartVirtualKeyboardHelper
{
  #ONLY WP400
  #START QTVIRTUALKEYBOARD helper application ( enable / disable option )
  PIDVIRTUALKEYBOARD=`pidof qtvirtualkeyboard`
  if [ -z $PIDVIRTUALKEYBOARD ]; then
    /usr/bin/qtvirtualkeyboard 2>&1 > /dev/null &
  fi
}

function StartAudioserver
{
  #START AUDIOSERVER
  PIDAUDIOSERVER=`pidof audioserver`
  if [ -z $PIDAUDIOSERVER ]; then
    echo "START AUDIOSERVER"
    /usr/bin/audioserver 2>&1 > /dev/null
  fi
}

function StartTP
{
  echo "STARTTP, RUNNING_VERSION: $RUNNING_VERSION"
  if [ -e "/var/run/framebuffer.mode" ]; then
    #start WBM coming from framebuffer mode and microbrowser is closed
    /etc/script/start_wbm.sh 2>&1 > /dev/null &
  else
    /etc/script/start_webbrowser.sh 2>&1 > /dev/null &
  fi
}

function InitTouchbeeper
{
if [ "${ORDER:0:3}" == "762" ]; then
  #initialize touchbeeper 
  /etc/config-tools/config_touchbeeper init
  #echo "initialize touchbeeper: $?"
fi
}

function InitMotionsensor
{
if [ "${ORDER:0:3}" == "762" ]; then
  if [ ! -e /etc/specific/motionsensor.conf ]; then
  /etc/config-tools/config_motionsensor resettofactory
  fi

  # initialize motion sensor
  MOTIONSENSOR=`getconfvalue /etc/specific/motionsensor.conf state -l`
  #echo "$? MOTIONSENSOR=$MOTIONSENSOR"

  if [ "$MOTIONSENSOR" == "enabled" ]; then  
    mount -t configfs none /sys/kernel/config
    modprobe si1145
    daemonize "/usr/bin/si1142"
    usleep 100000
    /etc/config-tools/config_motionsensor init
    #echo "initialize motionsensor: $?"
  fi
fi
}

function InitTestability
{
  #START SCREENSHOTQT
  TESTABILITY_SCREENSHOT=`getconfvalue /etc/specific/testability.conf screenshot -l`
  if [ "$TESTABILITY_SCREENSHOT" == "enabled" ]; then
  PIDSCREENSHOTQT=`pidof screenshotqt`
  if [ -z $PIDSCREENSHOTQT ]; then
    #echo "start screenshotqt"
    screenshotqt &
  fi
  fi
}

function StartBrightnessControl
{
if [ "${ORDER:0:3}" == "762" ]; then
  #start brightness control at the end of this script
  PIDBRIGHT=`pidof brightness_control`
  if [ -z $PIDBRIGHT ]; then
    #echo "start brightness control"
    brightness_control &
  fi
fi
}

function StartGestureControl
{
if [ "${ORDER:0:3}" == "762" ]; then
  #START MENUQT and GESTURECONTROL
  GESTURE_STATE=`getconfvalue /etc/specific/gesture.conf state -l`
  GESTURE_MENU=`getconfvalue /etc/specific/gesture.conf menu -l`
  if [ "$GESTURE_STATE" == "enabled" ]; then
  if [ "$GESTURE_MENU" == "yes" ]; then
    PIDMENUQT=`pidof menuqtslide`
    if [ -z $PIDMENUQT ]; then
      #echo "start menuqt"    
      /usr/bin/menuqtslide -nodetection &
      #sleep 1
    fi
    PIDGESTURE=`pidof gesture_control_wp`
    if [ -z $PIDGESTURE ]; then
        echo "start gesture_control_wp"
        /usr/bin/gesture_control_wp &
    fi
  fi
  fi
fi
}

#Startsequence
StartVirtualKeyboardHelper

##  InitTouchbeeper
##  InitMotionsensor

StartTP
StartBrightnessControl
StartGestureControl

#Xorg and fluxbox are running so /etc/init.d/runtime is able to start codesys3
touch /var/run/xorg.start.done
