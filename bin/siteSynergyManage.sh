#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: siteSynergycManage.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/siteSynergyManage.sh 
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
**      ====[[elisp:(org-cycle)][Fold]]==== SYNERGY MODEL:

Quicksynergy Has been obsoleted. Always Use Synergy.

The Computer with SCREEN runs synergyc (Client).

The Computer with KEYBOARD runs synergys (Server).

With QuickSynergy on KEYBOARD we specify for each of 4 directions a
SCREEN in the "Share" section.

With QuickSynergy on SCREEN for one KEYBOARD we specify in the "Use"
section: (1) the keyboard computer's ip-address; (2) the screen name
that was specified in KEYBOARD.

The KEYBOARD (server) with "Share" tab runs first. 
The SCREEN (client) with "Use" tab runs second.

When you want multiple KEYBOARDs connected to one SCREEN, on that
screen you run multiple QuickSynergy. One client for each KEYBOARD.

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


. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/usgBpos_lib.sh


bxSynergycLogFile="/tmp/bxSynergc.log"

# PRE parameters

baseDir=""

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
$( examplesSeperatorChapter "Site Information" )
${G_myName} ${extraInfo} -i siteConfigInfo
${G_myName} ${extraInfo} -i siteClientConfigInfo      # Display Side -- Keyboards List
${G_myName} ${extraInfo} -i siteDisplayConfigInfo     # Laptop/Keyboard Side -- Display Locations
$( examplesSeperatorChapter "Synergy GUI" )
synergy  # Only use it for creation/edition of config file
$( examplesSeperatorChapter "On Display Side -- Run Synergy Clients" )
$( examplesSeperatorSection "PROCESSS" )
ps -ef | grep -i synergyc
ps -fp \$( echo \$( pgrep synergyc) )
ps -fp $( echo $( pgrep synergyc) )
ps -fp \$( pgrep synergys)
$( examplesSeperatorSection "DISPLAY CLIENT CONNECTS: (Each)" )
/usr/bin/synergyc -f --name bisp0001 192.168.0.139  # Darshi ASUS
/usr/bin/synergyc -f --name bisp0001 192.168.0.143  # Mohsen laptop
/usr/bin/synergyc -f --name bisp0001 192.168.0.183  # Main Desktop
/usr/bin/synergyc -f --name bue0010 192.168.0.183   # Main Desktop
$( examplesSeperatorSection "DISPLAY CLIENT CONNECTS: (All Clients)" )
${G_myName} ${extraInfo} -i synergycStart
${G_myName} ${extraInfo} -i synergycStop
${G_myName} ${extraInfo} -i synergycStatus
${G_myName} ${extraInfo} -i synergycLogs
$( examplesSeperatorChapter "On Laptop/Keyboard Side -- Run Synergy Server" )
$( examplesSeperatorSection "INFORMATION" )
${G_myName} ${extraInfo} -i moduleDescription | emlVisit
ls -l ~/.quicksynergy/quicksynergy.conf 
ls -l ~/.quicksynergy/synergy.conf 
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Synergyc Start/Stop/Status/Logs
_CommentEnd_


function vis_siteConfigInfo {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local siteConfigs_bxoPath=$(lpDo vis_usgBpos_siteConfigs_bxoPath)
    local siteConfigs_bxoId=$(lpDo vis_usgBpos_siteConfigs_bxoId)

    ANT_raw "usgBpos_siteConfigs_bxoPath=${siteConfigs_bxoPath}"
    ANT_raw "usgBpos_siteConfigs_bxoId=${siteConfigs_bxoId}"

    EH_assert [ -n "${siteConfigs_bxoId}" ]
    
    local synergyBase="${siteConfigs_bxoPath}/synergy"

    EH_assert [ -d "${synergyBase}" ]

    local synergyDefaultServersConfigFile=${synergyBase}/servers/default/synergy.conf

    EH_assert [ -f "${synergyServersConfigFile}" ]

    local synergyClientsAvailableServers=${synergyBase}/clients/availableServers
    
}



function vis_synergycStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo /usr/bin/killall synergyc
    #typeset pgrepResults=$(pgrep -x synergyc)
    while [ "$(pgrep -x synergyc)" ]; do sleep 0.1; done

    #/usr/bin/synergyc -f --no-tray --debug NOTE --name bisp0014 192.168.0.149:24800
    #/usr/bin/synergyc -f --no-tray --debug NOTE --name bisp0014 192.168.0.143:24800
    #/usr/bin/synergyc -f --no-tray --debug NOTE --name bisp0014 192.168.0.193:24800

    opDo /usr/bin/synergyc -f --debug NOTE --name bisp0014 192.168.0.149:24800 >> ${bxSynergycLogFile} 2>&1 &
    opDo /usr/bin/synergyc -f --debug NOTE --name bisp0014 192.168.0.143:24800 >> ${bxSynergycLogFile} 2>&1 &
    opDo /usr/bin/synergyc -f --debug NOTE --name bisp0014 192.168.0.193:24800 >> ${bxSynergycLogFile} 2>&1 &

    opDo ls -ldt ${bxSynergycLogFile}

    ANT_raw "tail -10 ${bxSynergycLogFile}"

    lpReturn
}

function vis_synergycStop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo /usr/bin/killall synergyc
    #while [ $(pgrep -x synergyc) ]; do sleep 0.1; done

    lpReturn
}


function vis_synergycStatus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo ps -fp $( echo $( pgrep -x synergyc) )

    lpReturn
}


function vis_synergycLogs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ANT_raw "tail -10 ${bxSynergycLogFile}"
    ANT_raw "grep 192.168.0.193 ${bxSynergycLogFile}"

    lpReturn
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
