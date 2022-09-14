#!/bin/bash
# set wallpaper
feh --bg-max /home/illusion/wallpapers/kronii.jpeg &

# set up the composition manager to get transparent terminals to work
xcompmgr &

# change the touchpad preferences on x
# enable tapping
xinput set-prop "DELL083F:00 04F3:3088 Touchpad" "libinput Tapping Enabled" 1
# enable natural scrolling
xinput set-prop "DELL083F:00 04F3:3088 Touchpad" "libinput Natural Scrolling Enabled" 1

# run sataniabuddy (ITODDLERS BTFO!!!)
/home/illusion/Desktop/repos/SataniaBuddy/satania &

# turn off screen blanking/screen-saver
xset -dpms
xset dpms 0 0 0
xset s off
xset s noblank

# start fcitx5
fcitx5 &

# start the bluetooth service
systemctl start bluetooth.service

# start unified remote server (also launches firefox)
/opt/urserver/urserver-start &

VOLUME_HIGH="墳"
VOLUME_MEDIUM="奔"
VOLUME_LOW="奄"
VOLUME_MUTE="婢"

WIFI_ON="直"
WIFI_OFF="睊"
BLUETOOTH_ON=""
BLUETOOTH_OFF=""

BATTERY_FULL=""
BATTERY_75=""
BATTERY_HALF=""
BATTERY_25=""
BATTERY_EMPTY=""
BATTERY_CHARGING=""
PLUG="ﮣ"

# set statusbar
while true
do
	DATETIME=$(date +"%b-%d %R")
	VOLUME=$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $2 }')
	AUDIOSTATE=$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $4 }')
	SPACE=$(df -h | awk '{ if ($6 == "/home") print $3"/"$2 }')
	MEM=$(free -h | awk '(NR==2){ print $3"/"$2 }')

	WIFI_STATE=$(cat /sys/class/net/wlp3s0/operstate)
	BLUETOOTH_STATE=$(cat /sys/class/bluetooth/hci0/rfkill0/state)

	# wifi
	if [[ ${WIFI_STATE} == "up" ]]
	then
		WIFI=${WIFI_ON}
	else
		WIFI=${WIFI_OFF}
	fi

	# bluetooth
	if [[ $BLUETOOTH_STATE -eq 0 ]]
	then
		BLUETOOTH=${BLUETOOTH_OFF}
	else
		BLUETOOTH=${BLUETOOTH_ON}
	fi

	VOLUME_NUM=$(echo $VOLUME | grep -oP '\d+')

	# audio
	if [[ $VOLUME_NUM -lt 30 ]]
	then
		SPEAKER=${VOLUME_LOW}
	elif [[ $VOLUME_NUM -gt 60 ]]
	then
		SPEAKER=${VOLUME_HIGH}
	elif [[ $VOLUME_NUM -gt 30 && $VOLUME_NUM -lt 60 ]]
	then
		SPEAKER=${VOLUME_MEDIUM}
	fi

	if [[ ${AUDIOSTATE} == "off" ]]
	then
		SPEAKER=${VOLUME_MUTE}
	fi

	# battery
	if [[ ! -d '/sys/class/power_supply/BAT0' ]]
	then
		BATTERY=${PLUG}
	else
		CHARGING=$(cat '/sys/class/power_supply/BAT0/status')
		BAT_LVL=$(cat '/sys/class/power_supply/BAT0/capacity')
		if [[ ${CHARGING} == 'Charging' ]]
		then
			BATTERY="${BATTERY_CHARGING} ${BAT_LVL}%"
		else
			if [[ $BAT_LVL -ge 75 ]]
			then
				BATTERY="${BATTERY_FULL} ${BAT_LVL}%"
			elif [[ $BAT_LVL -ge 50 && $BAT_LVL -lt 75 ]]
			then
				BATTERY="${BATTERY_75} ${BAT_LVL}%"
			elif [[ $BAT_LVL -ge 25 && $BAT_LVL -lt 50 ]]
			then
				BATTERY="${BATTERY_HALF} ${BAT_LVL}%"
			elif [[ $BAT_LVL -lt 25 ]]
			then
				BATTERY="${BATTERY_25} ${BAT_LVL}%"
			elif [[ $BAT_LVL -lt 10 ]]
			then
				BATTERY="${BATTERY_EMPTY}! ${BAT_LVL}%"
			fi
		fi
	fi

	xsetroot -name " ${WIFI} | ${BLUETOOTH} | ${BATTERY} | ${SPEAKER} ${VOLUME} |  ${MEM} |  ${SPACE} |  ${DATETIME}"
	sleep 10s
done &

# start lxpolicykit (needed for unprivileged programs to use elevated privileges for a while)
lxpolkit &

# start the network manager applet
nm-applet &

# monitor positioning for PC (disable this for laptop)
xrandr --output DVI-D-1 --primary --left-of HDMI-0

# start dwm after setting everything we need
exec dwm
