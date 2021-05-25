#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lpCurrentsAdmin.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
# *CopyLeft*
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
*  /This File/ :: /bxo/iso/piu_mbFullUsage/sys/bin/bxoSetup.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/niche_lib.sh

# PRE parameters
typeset -t registrar=""
typeset -t id=""
typeset -t passwdFile=""


function G_postParamHook {
	
    return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Full Operations" )
${G_myName} ${extraInfo} -i fullUpdate    # Applies to both physical and virtual systems
( examplesSeperatorChapter "Step By Step Preps" )
--- Server Enable/Disable ---
${G_myName} -e "STOP" -i runFunc /etc/init.d/dhcp-server stop
${G_myName} -e "START" -i runFunc /etc/init.d/dhcp-server start
--- Server Config File ---
${G_myName} -n showRun -e "Config File Gen" -i dhcpServerConfigOutput
${G_myName} -n showRun -e "Config File Install" -i dhcpServerConfigUpdate
( examplesSeperatorChapter "Name Or Visit Service Files" )
cat ${dhcpV4ServerConfigFile}  # dhcpV4ServerConfigFile
cat ${dhcpV4ServerDefaultFile} # dhcpV4ServerDefaultFile
cat ${dhcpV4PidFile} # dhcpV4PidFile
${G_myName} -n showRun -e "Config File Show Current" -i dhcpServerConfigShow
${G_myName} -n showRun -e "Defaults File Show Current" -i dhcpServerDefaultsShow
--- Client Examples ---
${G_myName} -e "WARNING: may CHANGE IP Addr" -i runFunc dhclient3 -d -w -n eth0
--- Log Files ---
${G_myName} -e "Server Logs" -i runFunc grep dhcpd /var/log/syslog
${G_myName} -e "Client Logs" -i runFunc grep dhclient /var/log/syslog
_EOF_
}

noArgsHook() {
  vis_examples
}


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_sysChar_binsPrep
    
    lpReturn
}


dhcpV4ServerConfigFile="/etc/dhcp/dhcpd.conf"
dhcpV4ServerDefaultFile="/etc/default/isc-dhcp-server"
dhcpV4PidFile="/var/run/dhcpd.pid"

DEVICE=eth0

function vis_dhcpServerConfigShow {
 opDoComplain cat  ${dhcpServerConfigFile}
}

function vis_dhcpServerDefaultsShow {
 opDoComplain cat  ${dhcpServerDefaultsFile}
}


function vis_dhcpServerConfigUpdate {

  if [ "${opRunHostName}_" == "_zanjan" ] ; then
      EH_problem "$0 not supported on ${opRunHostName}"
      exit 1
  fi

  opDoComplain FN_fileDefunctMake ${dhcpServerConfigFile} ${dhcpServerConfigFile}.notUsed.${dateTag}

  opDoComplain vis_dhcpServerConfigOutput > ${dhcpServerConfigFile}
  opDoComplain chown root:root ${dhcpServerConfigFile}
  opDoComplain chmod 644  ${dhcpServerConfigFile}


  opDoComplain FN_fileDefunctMake ${dhcpServerDefaultsFile} ${dhcpServerDefaultsFile}.notUsed.${dateTag}

  echo "INTERFACES=\"$DEVICE\"" > ${dhcpServerDefaultsFile}
  opDoComplain chown root:root ${dhcpServerDefaultsFile}
  opDoComplain chmod 644  ${dhcpServerDefaultsFile}

}

validip(){
echo "$1" | egrep -q -e '[0-9]+\.[0-9]+\.[0-9]+.[0-9]+'
return $?
}

vis_dhcpServerConfigOutput(){

# Taken liberally from knoppix-terminalserver 

NETWORK=192.168.0
NETMASK=255.255.255.0

IPRANGE_FROM="192.168.0.161"
IPRANGE_TO="192.168.0.169"

EH_assert validip "$IPRANGE_FROM"
EH_assert validip "$IPRANGE_TO"

#ALLNAMESERVERS="64.8.192.9, 192.168.0.126"
#ALLNAMESERVERS="66.93.87.2, 216.231.41.2, 192.168.0.126"
ALLNAMESERVERS="66.93.87.2, 192.168.0.126"

ALLGATEWAYS="192.168.0.220"
#ALLGATEWAYS="192.168.0.22"

IP=`mmaLayer3Admin.sh -i runFunc givenInterfaceGetIPAddr eth0`

# Generate dhcpd.conf from template
# Borrowed  lots of code from knoppix

cat <<EOT
# dhcpd.conf Auto Generated by OSMT

# global settings
allow booting;
allow bootp;
default-lease-time 600;
max-lease-time 7200;

subnet ${NETWORK}.0 netmask ${NETMASK} {
  next-server $IP;
  if substring (option vendor-class-identifier, 0, 9) = "Etherboot" { filename "etherboot.nbi"; }
  else { filename "pxelinux.0"; }
  option subnet-mask ${NETMASK};
  range ${IPRANGE_FROM} ${IPRANGE_TO};
  ${ALLNAMESERVERS:+option domain-name-servers $ALLNAMESERVERS;}
  ${ALLGATEWAYS:+option routers $ALLGATEWAYS;}

  host aladdin {
    hardware ethernet 00:0F:B5:8F:67:C5; # boxname=kerman
    #fixed-address 192.168.0.107;
    fixed-address 192.168.0.108;
  }

}
EOT
}




_CommentBegin_
*      ################      *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
