#!/bin/bash

IimBriefDescription="svcXxSysdAdmin.sh SysD (systemd) Daemon Admin -- nichable"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaSambaSysdAdmin.sh,v 1.1 2016-11-25 05:31:42 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedAdminDaemonSysD.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedAdminDaemonSysD.sh]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/svcDhcpSysdAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedAdminDaemonSysD.sh -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- BxPanels  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  BxPanel      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/servicesManage/bxSupervision/systemd/fullUsagePanel-en.org::Xref-][Systemd Panel]] [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  BxPanel      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/samba/fullUsagePanel-en.org::Xref-][Samba Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  SysD         :: BISOS Customizations [[elisp:(org-cycle)][| ]]
    Based on the generic SysD (systemd) init daemon Start/Stop/Restart.
    This facility only manages the start/stop of daemon.

_EOF_
}

function vis_describe { vis_moduleDescription; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Parameters    :: SysD (systemd) Daemon Parameter Settings [[elisp:(org-cycle)][| ]]
_CommentEnd_


daemonName="dhcp"  # common name, used as a tag
daemonsServiceName=(
    "isc-dhcp-server"
    # "isc_dhcp_server6"
)
daemonControlScript="/etc/init.d/isc-dhcp-server"

daemonDefaultFile="/etc/default/isc-dhcp-server"

# Daemon Config Vars
daemonConfigDir="/etc/dhcp"
daemonConfigFile="${daemonConfigDir}/dhcpd.conf"

# Daemon Log Vars
daemonLogDir="/var/log"
daemonLogFile="${daemonLogDir}/syslog"
daemonLogErrFile="${daemonLogDir}/syslog"
daemonLogTag=${daemonName}

dhcpV4PidFile="/var/run/dhcpd.pid"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Customized Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples_general {
    EH_assert [[ $# -eq 1 ]]

    local context="$1"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""

    if [ "${context}" == "general" ] ; then
	doNothing
    elif [ "${context}" == "niche" ] ; then
	doNothing
	#G_myName=$( G_myUnNicheNameGet )      
    else
	EH_problem "Bad context=${context}"
	lpReturn 101
    fi
  

    visLibExamplesOutput ${G_myName} 
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_

    vis_examplesFullService
    vis_examplesDaemonControl


    cat  << _EOF_
$( examplesSeperatorChapter "Server Config" )
_EOF_
  
    vis_examplesDefaultConfig

    vis_examplesServerConfig  
  
    vis_examplesLogInfo

    cat  << _EOF_
$( examplesSeperatorChapter "CLIENT VERIFICATIONS" )
${G_myName} -e "WARNING: may CHANGE IP Addr" -i runFunc dhclient3 -d -w -n eth0
sudo nmap --script broadcast-dhcp-discover
${G_myName} -i getPrivA_SNPA
_EOF_
  
  
    vis_examplesNicheRun
}

noArgsHook() {
    vis_examples_general "general"
}


function vis_getPrivA_SNPA {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** This should really be gotten from sysCharDeploy, what we have here is temporary.
*** seed and general overwrite.
Could also have been done with something like:
opDo FN_textReplace "^ENABLED=\"false\"" "ENABLED=true" ${thisConfigFile}
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ip -4 route ls | grep default | grep -v 192.168.121 | grep -v 192.168.0.122 | grep -Po '(?<=dev )(\S+)'
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  serverConfig  :: serverConfigUpdate Overwrites [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

