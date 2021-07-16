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

    local oneServerBpo=$(vis_siteSynergyServersAvailable | head -1)
    local oneClientBpo=$(vis_siteSynergyClientsAvailable | head -1)    

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site Synergy Servers And Clients Information" )
${G_myName} ${extraInfo} -i moduleDescription | emlVisit
${G_myName} ${extraInfo} -i sysInit
${G_myName} ${extraInfo} -i siteConfigInfo
${G_myName} ${extraInfo} -i siteSynergyBase    # $(vis_siteSynergyBase)
${G_myName} ${extraInfo} -i siteSynergyServersBase
${G_myName} ${extraInfo} -i siteSynergyClientsBase
${G_myName} -i siteSynergyServersAvailable   # Laptop/Keyboard Side -- Needs Display Locations
${G_myName} -i siteSynergyClientsAvailable    # Display Side -- Needs Keyboards List
$( examplesSeperatorChapter "Activate Synergy Servers And Clients BPOs" )
${G_myName} -i siteSynergyServersAvailable | bxoActivate.sh -i bpoActivate
${G_myName} -i siteSynergyClientsAvailable | bxoActivate.sh -i bpoActivate
$( examplesSeperatorChapter "Synergy GUI" )
synergy  # Only use it for creation/edition of config file
$( examplesSeperatorChapter "BxContainer Synergy Features" )
${G_myName} ${extraInfo} -p bxoId=${oneServerBpo} -i bxCntnr_synergy_featureBase
${G_myName} ${extraInfo} -p bxoId=${oneServerBpo} -i bxCntnr_synergy_server_screensTopologyFile
${G_myName} ${extraInfo} -p bxoId=${oneClientBpo} -i bxCntnr_synergy_client_screenName
${G_myName} ${extraInfo} -p bxoId=${oneClientBpo} -i bxCntnr_synergy_client_serversBpos
${G_myName} ${extraInfo} -p bxoId=${oneClientBpo} -i bpoCntnr_ipAddr_get privA wifi
${G_myName} ${extraInfo} -i listBposAtBaseSansAvailable ~pip_clusterNeda-configs/synergy/clients/available
${G_myName} -p bxoId=${oneClientBpo} -i bxCntnr_synergy_client_serversBpos
$( examplesSeperatorChapter "Container On Display Side -- Run Synergy Server And Clients" )
${G_myName} -p bxoId=sysChar -i containerStartUpRun  # Main/Primary Entry Point
${G_myName} ${extraInfo} -p bxoId=${oneServerBpo} -i containerStartUpRun  # Server
${G_myName} ${extraInfo} -p bxoId=${oneClientBpo} -i containerStartUpRun  # Client
$( examplesSeperatorSection "PROCESSS" )
ps -wwef | grep -i synergyc
ps -wwfp \$( echo \$( pgrep synergyc) )
ps -wwfp $( echo $( pgrep synergyc) ) | cat  # running clients processes details
ps -wwfp \$( pgrep synergys) | cat   # running server process details
$( examplesSeperatorSection "DISPLAY CLIENT CONNECTS: (Each)" )
synergyc --debug INFO --log /tmp/synergyc.log --name dinningroom --no-daemon 192.168.0.81
$( examplesSeperatorSection "DISPLAY CLIENT CONNECTS: (All Clients)" )
${G_myName} ${extraInfo} -p bxoId=sysChar -i clientsStartUpStdout
${G_myName} ${extraInfo} -p bxoId=sysChar -i clientsStartUpRun   # Main Entry Point
${G_myName} ${extraInfo} -i synergycStop
${G_myName} ${extraInfo} -i synergycStatus
${G_myName} ${extraInfo}  -p bxoId=sysChar -i synergycLogs
$( examplesSeperatorChapter "On Laptop/Keyboard Side -- Run Synergy Server" )
synergys --config ~pip_clusterNeda-configs/synergy/servers/default/synergyScreensTopology.config --name center --debug INFO --log /tmp/synergys.log --no-daemon
${G_myName} ${extraInfo} -p bxoId=sysChar -i serverStartUpRun   # Main Entry Point
${G_myName} ${extraInfo} -i synergysStop
${G_myName} ${extraInfo} -i synergysStatus
${G_myName} ${extraInfo}  -p bxoId=sysChar -i synergysLogs
$( examplesSeperatorChapter "Setup Systemd User Environment" )
https://www.unixsysadmin.com/systemd-user-services/
https://www.brendanlong.com/systemd-user-services-are-amazing.html
mkdir -p ~/.config/systemd/user/
ls -l ~/.config/systemd/user/synergy.service
${G_myName} ${extraInfo} -p bxoId=sysChar -i synergySystemdSvcUpdate  # Main Entry Point
${G_myName} ${extraInfo} -p bxoId=${oneServerBpo} -i synergySystemdSvcStdout  # For Server testing
${G_myName} ${extraInfo} -p bxoId=${oneClientBpo} -i synergySystemdSvcStdout  # For Client testing
# initializations
sudo loginctl enable-linger bystar
systemd-analyze --user security synergy.service
# ongoing
systemctl --user daemon-reload
systemctl --user status synergy.service
systemctl --user start synergy.service
systemctl --user stop synergy.service
systemctl --user enable synergy.service
journalctl --user
journalctl --user-unit synergy.service
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Synergyc Start/Stop/Status/Logs
_CommentEnd_


synergyLogsBaseDir="/var/log/synergy"

function vis_logFilePath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    local logFilePath=""
    
    if IS_inList ${bxoId} "${availableServersList}" ; then
	logFilePath=${synergyLogsBaseDir}/server-${bxoId}.log
    elif IS_inList ${bxoId} "${availableClientsList}" ; then
	logFilePath=${synergyLogsBaseDir}/client-${bxoId}.log
    else
	EH_problem "Not a client or a server ${bxoId}"
	lpReturn 101
    fi

    echo ${logFilePath}
    
    lpReturn
}



function vis_sysInit {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo mkdir -p ${synergyLogsBaseDir}
    lpDo sudo chown bisos:bisos ${synergyLogsBaseDir}
    lpDo sudo chmod g+rw ${synergyLogsBaseDir}

    lpDo ls -ld ${synergyLogsBaseDir}

    sudo loginctl enable-linger bystar
}

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

    # ~pip_clusterNeda-configs/synergy/servers/defaults/synergyScreensTopology.config
    local synergyDefaultServersConfigFile=${synergyBase}/servers/defaults/synergyScreensTopology.config

    EH_assert [ -f "${synergyDefaultServersConfigFile}" ]

    ANT_raw "synergyDefaultServersConfigFile=${synergyDefaultServersConfigFile}"

    local synergyClientsAvailableServers=${synergyBase}/clients/availableServers
    
}

function vis_siteSynergyBase {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local siteConfigs_bxoPath=$(lpDo vis_usgBpos_siteConfigs_bxoPath)
    local siteConfigs_bxoId=$(lpDo vis_usgBpos_siteConfigs_bxoId)

    EH_assert [ -n "${siteConfigs_bxoId}" ]
    
    local synergyBase="${siteConfigs_bxoPath}/synergy"

    EH_assert [ -d "${synergyBase}" ]

    echo "${synergyBase}"
}


function vis_siteSynergyServersBase {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local synergyBase="$(vis_siteSynergyBase)"
    EH_assert [ -d "${synergyBase}" ]

    local synergyServersBase="${synergyBase}/servers"
    EH_assert [ -d "${synergyServersBase}" ]    

    echo "${synergyServersBase}"
}

function vis_siteSynergyClientsBase {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local synergyBase="$(vis_siteSynergyBase)"
    EH_assert [ -d "${synergyBase}" ]

    local synergyClientsBase="${synergyBase}/clients"
    EH_assert [ -d "${synergyClientsBase}" ]    

    echo "${synergyClientsBase}"
}

function vis_siteSynergyServersAvailable {
    G_funcEntry
    function describeF {  cat  << _EOF_
** For example ~pip_clusterNeda-configs/synergy/servers/available
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local synergyServersBase="$(vis_siteSynergyServersBase)"
    EH_assert [ -d "${synergyServersBase}" ]

    local synergyServersAvailable="${synergyServersBase}/available"
    EH_assert [ -d "${synergyServersAvailable}" ]    

    inBaseDirDo ${synergyServersAvailable} ls -1
}


function vis_siteSynergyClientsAvailable {
    G_funcEntry
    function describeF {  cat  << _EOF_
** For example ~pip_clusterNeda-configs/synergy/clients/available
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local synergyClientsBase="$(vis_siteSynergyClientsBase)"
    EH_assert [ -d "${synergyClientsBase}" ]

    local synergyClientsAvailable="${synergyClientsBase}/available"
    EH_assert [ -d "${synergyClientsAvailable}" ]    

    inBaseDirDo ${synergyClientsAvailable} ls -1
}


function vis_synergycStart%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo /usr/bin/killall synergyc
    #typeset pgrepResults=$(pgrep -x synergyc)
    while [ "$(pgrep -x synergyc)" ]; do sleep 0.1; done

    # Old example
    #/usr/bin/synergyc -f --no-tray --debug NOTE --name bisp0014 192.168.0.149:24800

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

    local synergyPrcesses=$(echo $( pgrep -x synergyc))

    if [ -z "${synergyPrcesses}" ] ; then
	ANT_raw "No Synergy Client Processes"
    else
	opDo ps -wwfp "${synergyPrcesses}"
    fi

    lpReturn
}


function vis_synergycLogs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep
    
    local logFilePath=$(vis_logFilePath)

    if [ -n "${logFilePath}" ] ; then
	ANT_raw "tail -10 ${logFilePath}"
    else
	ANT_cooked "Missing logFilePath"
    fi

    lpReturn
}


function vis_synergysStop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo /usr/bin/killall synergys
    #while [ $(pgrep -x synergys) ]; do sleep 0.1; done

    lpReturn
}

function vis_synergysStatus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local synergyPrcesses=$(echo $( pgrep -x synergys))

    if [ -z "${synergyPrcesses}" ] ; then
	ANT_raw "No Synergy Server Processes"
    else
	opDo ps -wwfp "${synergyPrcesses}"
    fi

    lpReturn
}


function vis_synergysLogs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep
    
    local logFilePath=$(vis_logFilePath)

    if [ -n "${logFilePath}" ] ; then
	ANT_raw "tail -10 ${logFilePath}"
    else
	ANT_cooked "Missing logFilePath"
    fi

    lpReturn
}


function vis_containerStartUpRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    if IS_inList ${bxoId} "${availableServersList}" ; then
	lpDo vis_serverStartUpRun
    elif IS_inList ${bxoId} "${availableClientsList}" ; then
	lpDo vis_clientsStartUpRun
    else
	EH_problem "Not a client or a server ${bxoId}"
	lpReturn 101
    fi

    lpReturn
}


function vis_clientsStartUpRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    if ! IS_inList ${bxoId} "${availableClientsList}" ; then
	EH_problem "not an available client -- ${bxoId}"
	lpReturn 101
    fi

    opDo /usr/bin/killall synergyc
    while [ "$(pgrep -x synergyc)" ]; do sleep 0.1; done

    local screenName=$(lpDo vis_bxCntnr_synergy_client_screenName)

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local serverIpAddr=""
    local logFilePath=""
    
    for each in ${availableServersList} ; do
	bxoId=${each}
	serverIpAddr=$(lpDo vis_bpoCntnr_ipAddr_get privA wifi)

	if [ -z "${serverIpAddr}" ] ; then
	    EH_problem "Missing serverIpAddr for ${each}"
	    continue
	fi

	logFilePath=$(vis_logFilePath)
	
	lpDo synergyc --debug DEBUG --log ${logFilePath} --name ${screenName} ${serverIpAddr}
    done

    lpDo pgrep synergyc
    
    lpReturn
}

function vis_serverStartUpRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)

    if ! IS_inList ${bxoId} "${availableServersList}" ; then
	EH_problem "not an available server -- ${bxoId}"
	lpReturn 101
    fi

    ANT_raw "Killing existing synergys processes"
    opDo /usr/bin/killall synergys
    
    local synergyProcesses="$(pgrep -x synergys 2> /dev/null)"
    if [ -n "${synergyProcesses}" ] ; then
	while [ "$(pgrep -x synergys)" ] ; do sleep 0.1; done
    fi

    ANT_raw "Starting Synergy Server Processes"

    local screensTopologyFile=$(lpDo vis_bxCntnr_synergy_server_screensTopologyFile)
    
    local logFilePath=$(vis_logFilePath)

    
    lpDo synergys --no-daemon --config ${screensTopologyFile} --name center --debug DEBUG --log ${logFilePath}
    
    # vis_synergysStatus
    
    lpReturn
}


function vis_bxCntnr_synergy_featureBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    # echo ${bxoId} ${bxoHome}
    local bxCntnrBase=${bxoHome}
    EH_assert [ -d "${bxCntnrBase}" ]

    local bxCntnrSvcsSpecBase=${bxoHome}/svcsSpec
    EH_assert [ -d "${bxCntnrSvcsSpecBase}" ]

    if [ -d "${bxCntnrSvcsSpecBase}/synergyServer" ] ; then
	echo "${bxCntnrSvcsSpecBase}/synergyServer"
    elif [ -d "${bxCntnrSvcsSpecBase}/synergyClient" ] ; then
       	echo "${bxCntnrSvcsSpecBase}/synergyClient"
    else
	echo "synergyNone"
    fi

    lpReturn
}

function vis_bxCntnr_synergy_server_screensTopologyFile {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local synergyServerBase=$(lpDo vis_bxCntnr_synergy_featureBase)
    EH_assert [ -d "${synergyServerBase}" ]

    local screensTopologyFile=$(lpDo fileParamManage.py -v 30 -i fileParamRead  "${synergyServerBase}/screensTopology" siteDefault )
    EH_assert [ -e "${screensTopologyFile}" ]

    echo "${screensTopologyFile}"

    lpReturn
}

function vis_bxCntnr_synergy_client_screenName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local synergyClientBase=$(lpDo vis_bxCntnr_synergy_featureBase)
    EH_assert [ -d "${synergyClientBase}" ]

    local screenName=$(lpDo fileParamManage.py -v 30 -i fileParamRead  "${synergyClientBase}" screenName )

    echo "${screenName}"

    lpReturn
}

function vis_listBposAtBaseSansAvailable {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local baseDir=$1

    local bposList=$(inBaseDirDo "${baseDir}" ls | grep -v available)

    echo ${bposList}
    
    lpReturn
}


function vis_bxCntnr_synergy_client_serversBpos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local synergyClientBase=$(lpDo vis_bxCntnr_synergy_featureBase)
    EH_assert [ -d "${synergyClientBase}" ]

    local synergyClientServersBase=${synergyClientBase}/servers
    EH_assert [ -d "${synergyClientServersBase}" ]
    
    if [ -d "${synergyClientServersBase}/availableServers" ] ; then
	local availableServers=$(lpDo fileParamManage.py -v 30 -i fileParamRead  "${synergyClientServersBase}" availableServers)
	EH_assert [ -n "${availableServers}" ]
	lpDo vis_listBposAtBaseSansAvailable "${availableServers}"
    fi

    lpDo vis_listBposAtBaseSansAvailable "${synergyClientServersBase}"

    lpReturn
}

function vis_bpoCntnr_ipAddr_get {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    EH_assert bxoIdPrep

    local siteSynergyServersBase=$(lpDo vis_siteSynergyServersBase)

    local siteIpAddr=$(lpDo fileParamManage.py -v 30 -i fileParamRead  "${siteSynergyServersBase}/available/${bxoId}/ipv4" wifi )

    EH_assert [ -n "${siteIpAddr}" ]

    echo "${siteIpAddr}"

    lpReturn
}

function vis_synergySystemdSvcUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    if IS_inList ${bxoId} "${availableServersList}" ; then
	lpDo doNothing
    elif IS_inList ${bxoId} "${availableClientsList}" ; then
	lpDo doNothing
    else
	EH_problem "Not a client or a server ${bxoId}"
	lpReturn 101
    fi

    local serviceBaseDir=$(echo ~/.config/systemd/user)

    if [ ! -d "${serviceBaseDir}" ] ; then
	lpDo mkdir -p "${serviceBaseDir}"
    fi

    local serviceFilePath="${serviceBaseDir}/synergy.service"

    lpDo FN_fileSafeKeep "${serviceFilePath}"

    lpDo eval vis_synergySystemdSvcStdout \> "${serviceFilePath}"
    
    lpReturn
}



function vis_synergySystemdSvcStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    function synergySystemdSvcSegment {
	cat  << _EOF_
[Service]
ExecStart=/bisos/bsip/bin/siteSynergyManage.sh -p bxoId=${bxoId} -i containerStartUpRun
Restart=always

[Install]
WantedBy=default.target
_EOF_
    }

    if IS_inList ${bxoId} "${availableServersList}" ; then
	lpDo vis_serverSystemdSvcStdout
	lpDo synergySystemdSvcSegment
    elif IS_inList ${bxoId} "${availableClientsList}" ; then
	lpDo vis_clientsSystemdSvcStdout
	lpDo synergySystemdSvcSegment	
    else
	EH_problem "Not a client or a server ${bxoId}"
	lpReturn 101
    fi

    lpReturn
}

function vis_clientsSystemdSvcStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableClientsList=$(lpDo vis_siteSynergyClientsAvailable)

    if ! IS_inList ${bxoId} "${availableClientsList}" ; then
	EH_problem "not an available client -- ${bxoId}"
	lpReturn 101
    fi

    local screenName=$(lpDo vis_bxCntnr_synergy_client_screenName)

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)
    local serverIpAddr=""
    
	
    cat  << _EOF_
[Unit]
Description=Synergy Client For  ${screenName}

_EOF_

    lpReturn
}


function vis_serverSystemdSvcStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    local availableServersList=$(lpDo vis_siteSynergyServersAvailable)

    if ! IS_inList ${bxoId} "${availableServersList}" ; then
	EH_problem "not an available server -- ${bxoId}"
	lpReturn 101
    fi

    local screensTopologyFile=$(lpDo vis_bxCntnr_synergy_server_screensTopologyFile)

    cat  << _EOF_
[Unit]
Description=Synergy Server

_EOF_
    
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
