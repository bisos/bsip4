#!/bin/bash

IimBriefDescription="Self-Contained Service Materialization -- Configure a Bridged Wireless Access Point."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxeRealize.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos-core/bootstrap/Generic-Guests/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
* See Panel for description and documentation.
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh


# PRE parameters

typeset -t ssid=""        #
typeset -t passwd=""      # Which goes with ssid
typeset -t channelNu=""     # Explicitly specified
typeset -t ApNu=""        # Access Point Number -- Used for assigning channels


function G_postParamHook {
    return
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName}

 cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "NEW Wifi Access Point Creation" )
${G_myName} ${extraInfo} -p ssid=lws-1000111 -p passwd=lePassword -p ApNu=1 -i wifiApFullUpdate
${G_myName} ${extraInfo} -p ssid=lws-1000111 -p passwd=lePassword -p channelNu=155 -i wifiApFullUpdate
${G_myName} ${extraInfo} -p ssid=lws-1000111 -p passwd=lePassword -p ApNu=1 -i wifiApBridgeCreate
${G_myName} ${extraInfo} -i wifiApAndBridgeStatus
s$( examplesSeperatorChapter "br-hotspot-wifi -- Wifi Connection Configuration" )
${G_myName} ${extraInfo} -i assertUsbWifiDevice
${G_myName} ${extraInfo} -i wifiDeviceName
${G_myName} ${extraInfo} -i getChannelNumber 1
${G_myName} ${extraInfo} -i wifiApStandAlone_down
${G_myName} ${extraInfo} -p ssid=lws-1000111 -p passwd=lePassword -p channelNu=36 -i wifiApStandAlone
${G_myName} ${extraInfo} -p ssid=lws-1000111 -p passwd=lePassword -p channelNu=36 -i wifiApStandAlone_up
nmcli device show $(vis_wifiDeviceName)
nmcli connection show br-hotspot-wifi
$( examplesSeperatorChapter "br-hotspot-wired -- Wired Connection Configuration" )
${G_myName} ${extraInfo} -i wiredDeviceName  # Using l3Admin.sh -i defaultInterface
nmcli connection show br-hotspot-wired
$( examplesSeperatorChapter "br-hotspot-bridge br-hotspot-dev -- Bridge Configuration Configuration" )
nmcli connection show br-hotspot-bridge
nmcli device show br-hotspot-dev
$( examplesSeperatorChapter "Individual Function Examples" )
${G_myName} ${extraInfo} -i wifiApConsDel
$( examplesSeperatorChapter "Network Manage Interfaces -- Monitoring and Diagnostics" )
sudo ls -ldt /etc/NetworkManager/system-connections/*
nmcli     # Used in this script
nmtui     # Terminal interface -- curses based
nm-connection-editor    # GUI GTK Based
gnome-nettool    # GTK Based, limited
systemctl status NetworkManager
journalctl -xe | grep -i network
$( examplesSeperatorChapter "Diagnostics" )
netstat -rn         # Routes
nmcli device        # List Devices
nmcli connection    # List Bridge Names
nmcli device wifi   # SSIDs, Chans, Bars,
nmcli device show virbr1
nmcli connection show virbr1
echo Connections/Devices:: br-hotspot-bridge, br-hotspot-dev, br-hotspot-wired, br-hotspot-wifi
_EOF_
}

function vis_wifiApFullUpdate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ ! -z "${ssid}" ]]
   EH_assert [[ ! -z "${passwd}" ]]

   local channelOrApNu="true"
   if [[ -z ${ApNu} && -z ${channelNu} ]] ; then
       channelOrApNu="false"
   fi
   EH_assert [ ${channelOrApNu} == "true" ]

   lpDo vis_wifiApBridgeCreate

   # lpDo vis_wifiApAndBridgeStatus

   lpReturn
}

function vis_assertUsbWifiDevice {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    local result=$(lsusb | grep -i 802.11)

    if [ -z "${result}" ] ; then
        EH_problem "Missing USB Wifi Device"
        return 1
    else
        echo "Found USB Wifi Device: ${result}"
        return 0
    fi
}

function vis_wifiDeviceName {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    local result=$(nmcli device | grep ^wlx | cut -d ' ' -f 1)
    echo "${result}"
}


function vis_wiredDeviceName {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_

   # Detect wired interface (UP, not virtual, not wifi, not docker/bridge related, not loopback)
   # local wiredIf=$(ip link show | grep -E "^[0-9]+:" | grep "UP" | grep -v "lo\|virbr\|docker\|br-\|wl" | head -1 | awk '{print $2}' | sed 's/:$//')
   # EH_assert [[ ! -z "${wiredIf}" ]]
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    local wiredIf=$(l3Admin.sh -i defaultInterface)
    echo "${wiredIf}"
}


function vis_getChannelNumber {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
Based on apNu, assign the appropriate channel number.
_EOF_
                      }
    EH_assert [[ $# -eq 1 ]]
    local apNu="$1"

    # Map Access Point Number to 5GHz WiFi channel
    case ${apNu} in
        1)
            echo 36
            ;;
        2)
            echo 40
            ;;
        3)
            echo 44
            ;;
        4)
            echo 48
            ;;
        5)
            echo 149
            ;;
        6)
            echo 153
            ;;
        7)
            echo 157
            ;;
        8)
            echo 161
            ;;
        *)
            EH_problem "Unknown Access Point Number: ${apNu}"
            return 1
            ;;
    esac
    
    return 0
}

function vis_wifiApConnectionsDelete {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo nmcli connection down br-hotspot-wired
    lpDo sudo nmcli connection delete br-hotspot-wired

    lpDo sudo nmcli connection down br-hotspot-wifi
    lpDo sudo nmcli connection delete br-hotspot-wifi

    lpDo sudo nmcli connection delete br-hotspot-bridge  # This also delets the br-hotspot-dev
    # NOT NEEDED -- lpDo sudo ip link del br-hotspot-dev

    lpReturn
}

function vis_wifiApStandAlone_down {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]
    lpDo eval sudo nmcli connection delete br0-wifi
}

function vis_wifiApStandAlone_up {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]
    lpDo vis_wifiApStandAlone_down
    lpDo vis_wifiApStandAlone
    lpDo  sudo nmcli connection up br0-wifi
}


function vis_wifiApStandAlone {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${ssid}" ]]
    EH_assert [[ ! -z "${passwd}" ]]
    EH_assert [[ ! -z "${channelNu}" ]]

    local wifiDeviceName=$(vis_wifiDeviceName)
    if [ -z "${wifiDeviceName}" ]; then
        EH_problem "Missing Wifi Device Name"
        return 1
    fi

    if [ -z "${channelNu}" ] ; then
        channelNu=$(vis_getChannelNumber ${ApNu})
    fi



    # Add br0-wifi as slave to WifiBridge0
    # lpDo sudo nmcli connection add con-name br0-wifi ifname ${wifiDeviceName} type wifi slave-type bridge master WifiBridge0 connection.autoconnect yes wifi.ssid "${ssid}"
    # lpDo sudo nmcli connection add con-name wap010   ifname wlx00c0cab3f740   type wifi autoconnect no ssid lws-1000010
    lpDo sudo nmcli connection add con-name br-hotspot-wifi ifname ${wifiDeviceName} type wifi autoconnect no ssid "${ssid}"


    # Configure WiFi as standalone Access Point (not bridged at kernel level)
    # lpDo sudo nmcli connection add con-name br0-wifi ifname ${wifiDeviceName} type wifi ipv4.method manual ipv4.addresses "192.168.0.2/24" ipv6.method disabled wifi.ssid "${ssid}"

    # Configure WiFi security and AP mode
    # lpDo sudo nmcli connection modify br0-wifi 802-11-wireless.mode ap 802-11-wireless.band a
    lpDo sudo nmcli connection modify br-hotspot-wifi 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared

    # lpDo sudo nmcli connection modify br0-wifi wifi.channel ${channelNu}

    lpDo sudo nmcli connection modify br-hotspot-wifi wifi-sec.key-mgmt wpa-psk
    lpDo sudo nmcli connection modify br-hotspot-wifi wifi-sec.psk "${passwd}"

    lpReturn
}


function vis_wifiApBridgeCreate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [[ ! -z "${ssid}" ]]
    EH_assert [[ ! -z "${passwd}" ]]

    local channelOrApNu="true"
    if [[ -z ${ApNu} && -z ${channelNu} ]] ; then
        channelOrApNu="false"
    fi
    EH_assert [[ ${channelOrApNu} == "true" ]]

    if ! lpDo vis_assertUsbWifiDevice ; then
       EH_problem "Missing USB Wifi Device"
       return 1
    fi

    local wifiDeviceName=$(vis_wifiDeviceName)
    if [ -z "${wifiDeviceName}" ]; then
        EH_problem "Missing Wifi Device Name"
        return 1
    fi

    if [ -z "${channelNu}" ] ; then
        channelNu=$(vis_getChannelNumber ${ApNu})
    fi

    local wiredIf=$(vis_wiredDeviceName)
    EH_assert [[ ! -z "${wiredIf}" ]]

    # Delete previous configurations
    lpDo vis_wifiApConnectionsDelete


    # Create bridge using ip commands
    # lpDo sudo ip link add name br0 type bridge
    # lpDo sudo ip link set br0 up

    # Add wired interface to bridge (WiFi adapter may not support bridge enslaving)
    # lpDo sudo ip link set ${wiredIf} master br0

    # Create Bridge -- connection=br-hotspot-bridge  device=br-hotspot-device  stp=no(no spanning tree)
    lpDo sudo nmcli connection add con-name br-hotspot-bridge ifname br-hotspot-device type bridge ipv4.method auto ipv6.method disabled connection.autoconnect yes stp no

    # Add br-hotspot-wired connection as slave to br-hotspot-bridge (master) on wired interface
    lpDo sudo nmcli connection add con-name br-hotspot-wired  ifname ${wiredIf} type bridge-slave master br-hotspot-bridge connection.autoconnect yes


    lpDo sudo nmcli connection add con-name br-hotspot-wifi ifname ${wifiDeviceName} type wifi slave-type bridge master WifiBridge0 connection.autoconnect yes

    # Configure WiFi and bring up connections
    lpDo vis_wifiApStandAlone



   # Configure wired interface with NetworkManager
   lpDo sudo nmcli connection add con-name br0-wired ifname ${wiredIf} type ethernet ipv4.method manual ipv4.addresses "192.168.0.1/24" ipv6.method disabled master br0 slave-type bridge


    # Bring up the wired connection to the bridge
    lpDo sudo nmcli connection up br0-wired

    # Bring up WiFi AP
    lpDo sudo nmcli connection up br0-wifi

    # Configure bridge IP
    lpDo sudo ip addr add 192.168.0.1/24 dev br0 2>/dev/null || true

   lpReturn
}

function vis_wifiApAndBridgeStatus {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   lpDo nmcli device

   lpDo nmcli device wifi list

   lpDo eval iw list \| grep AP

   lpDo nmcli connection

   lpDo ip link show master br0

   lpDo bridge link show

   lpDo ip a

   lpReturn
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
