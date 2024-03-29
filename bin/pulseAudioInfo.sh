#!/bin/bash

# From: https://forums.linuxmint.com/viewtopic.php?t=344639
# url https://gitlab.freedesktop.org/pulseaudio/pulseaudio/raw/master/src/utils/pa-info?inline=false | bash | nc termbin.com 9999
#
# The first thing you should always try when working audio stops performing
# properly is to delete the files in /home/YourUserName/.config/pulse then run
# pulseaudio -k in the terminal to restart the sound daemon.


# This file is part of PulseAudio.
#
# Copyright 2019 Russell Treleaven <rtreleaven@bunnykick.ca>
#
# PulseAudio is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# PulseAudio is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.

export LC_ALL=C
header='________________'
function cards_get {
	local line
	local re='/proc/asound/card([0-9])'
	local cards=()
	while read -r line; do
		[[ $line =~ $re ]] && cards+="${BASH_REMATCH[1]} "
	done <<< "$(ls --directory /proc/asound/card[0-9])"
	echo $cards
}
function jacks_do {
	local cards=($(cards_get))
	for card in "${cards[@]}" ; do
		echo "card=$card"
		while read -r line; do
			[[ $line != "" ]] && amixer -c$card cget "$line";
		done <<< "$(amixer -c$card controls | grep Jack)"
	done
}
function alsa_info_do {
	alsa_info=$(which alsa-info.sh)
	[ $alsa_info ] || alsa_info=$(which alsa-info)
	[ $alsa_info ] || alsa_info='/usr/sbin/alsa-info.sh'
	[ $alsa_info ] || alsa_info='/usr/share/alsa-base/alsa-info.sh'
	[ -f $alsa_info ] && {
		$alsa_info --stdout
		return
	}
	echo "neither alsa-info.sh or alsa-info were found"
}
function pulseaudio_ps_do {
	ps aux | grep pulseaudio
}
function cmd_do {
	echo "$header"
	echo "> $1"
	$1
}
cmds=(
	'pulseaudio_ps_do'
	'which pulseaudio'
	'pidof pulseaudio'
	'pulseaudio --version'
	'pactl info'
	'pactl list'
	'cat /etc/pulse/daemon.conf'
	'cat /etc/pulse/client.conf'
	'cat /etc/pulse/default.pa'
	'cat /etc/pulse/system.pa'
	'ls -alt /dev/snd/*'
	'lsof /dev/snd/*'
	'jacks_do'
	'aplay -L'
	'arecord -L'
	'alsa_info_do'
)
for cmd in "${cmds[@]}" ; do
	cmd_do "$cmd"
done
