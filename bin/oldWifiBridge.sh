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
${G_myName} ${extraInfo} -p ssid=lws-1000010 -p passwd=lePassword -p ApNu=1 -i wifiApFullUpdate
${G_myName} ${extraInfo} -p ssid=lws-1000010 -p passwd=lePassword -p channelNu=155 -i wifiApFullUpdate
${G_myName} ${extraInfo} -i wifiApBridgeCreate lePasswd
${G_myName} ${extraInfo} -i wifiApAndBridgeStatus
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

    if lpDo vis_assertUsbWifiDevice ; then
       EH_problem "Missing USB Wifi Device"
       return 1
    fi

    local wifiDeviceName=$(vis_wifiDeviceName)
    if [ -z "" ]


    echo HHH
    return 0

   # Cleanup previous configurations -- delete WifiBridge0 br0-wired  br0-wifi
   lpDo sudo nmcli connection delete WifiBridge0

   lpDo sudo nmcli connection down br0-wired
   lpDo sudo nmcli connection delete br0-wired

   lpDo sudo nmcli connection down br0-wifi
   lpDo sudo nmcli connection delete br0-wifi

   # Create WifiBridge0
   lpDo sudo nmcli connection add con-name WifiBridge0 ifname br0 type bridge ipv4.method auto ipv6.method disabled connection.autoconnect yes stp no

   # Add br0-wired as slave to WifiBridge0 on wired interface
   lpDo sudo nmcli connection add con-name br0-wired ifname enp3s0f1 type bridge-slave master WifiBridge0 connection.autoconnect yes

   # Add br0-wifi as slave to WifiBridge0
   lpDo sudo nmcli connection add con-name br0-wifi ifname wlx00c0cab044d5 type wifi slave-type bridge master WifiBridge0 connection.autoconnect yes wifi.ssid lws-1000010

   # Configure br0-wifi
   lpDo sudo nmcli connection modify br0-wifi 802-11-wireless.mode ap 802-11-wireless.band bg
   # lpDo sudo nmcli connection modify br0-wifi wifi.band a wifi.channel 153
   lpDo sudo nmcli connection modify br0-wifi wifi-sec.key-mgmt wpa-psk
   lpDo sudo nmcli connection modify br0-wifi wifi-sec.psk "${lePassword}"

   # Bring Up All the Connections
   lpDo sudo nmcli connection up br0-wired
   lpDo sudo nmcli connection up br0-wifi
   lpDo sudo nmcli connection up WifiBridge0

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
