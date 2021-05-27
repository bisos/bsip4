#!/bin/bash

IimBriefDescription="svcXxSysdAdmin.sh SysD (systemd) Daemon Admin -- nichable"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedAdminDaemonSysD.sh,v 1.1 2016-11-25 05:31:42 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/seedAdminDaemonSysD.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Subject      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/niche_lib.sh

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}



#
#  daemonName
#
#  daemonControlScript   -- /etc/init.d/courier-imap 
#  daemonConfigDir
#  daemonConfigFile
#
#  daemonLogDir
#  daemonLogFiles        --
#


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Example Segments [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examplesDefaultConfig {
 cat  << _EOF_
$( examplesSeperatorSection "DEFAULT CONFIG FILES" )
${G_myName} ${extraInfo} -i defaultConfigUpdate         # SafeKeep configFile and replace with ConfigStdout
${G_myName} ${extraInfo} -i defaultConfigVerify         # diff configFile vs ConfigStdout
${G_myName} ${extraInfo} -i defaultConfigShow           # ls -l configFile
${G_myName} ${extraInfo} -i defaultConfigStdout         # Likely provided in -niche.sh
_EOF_
}

function vis_examplesServerConfig {
 cat  << _EOF_
$( examplesSeperatorSection "SERVER CONFIG FILES" )
${G_myName} ${extraInfo} -i serverConfigUpdate         # SafeKeep configFile and replace with ConfigStdout
${G_myName} ${extraInfo} -i serverConfigVerify         # diff configFile vs ConfigStdout
${G_myName} ${extraInfo} -i serverConfigShow           # ls -l configFile
${G_myName} ${extraInfo} -i serverConfigStdout         # Likely provided in -niche.sh	
_EOF_
}

function vis_examplesFullService {
 cat  << _EOF_
$( examplesSeperatorSection "SERVER FULL ACTIONS" )
${G_myName} ${extraInfo} -i fullInfo
${G_myName} ${extraInfo} -i fullVerify
${G_myName} ${extraInfo} -i fullUpdate                 # serverConfigUpdate + daemonRestart
${G_myName} ${extraInfo} -i fullDelete
_EOF_
}

function vis_examplesSystemDaemonsStatus {
 cat  << _EOF_
$( examplesSeperatorSection "All Daemons Status (And Greps)" )
systemctl --type=service --all                        # All sysD services
systemctl --type=service --all | grep "${daemonName}" # All Relevant sysD services
systemctl list-unit-files                             # All Svc Names
systemctl list-unit-files | grep "${daemonName}"      # All Relevant Svc Names
sudo service --status-all                             # Checks on each and reports +/-
sudo ufw status                                       #  [UFW Firewall]
netstat -ltup | grep "${daemonName}"                  # What port daemon is listening on
ss -ltup | grep "${daemonName}"                       # What port daemon is listening on
_EOF_
}

function vis_examplesDaemonControl {
 cat  << _EOF_
$( examplesSeperatorSection "SystemD Daemons Status And Control" )
${G_myName} -i examplesSystemDaemonsStatus  # List All and/or relevant systemd svcs
${G_myName} ${extraInfo} -i daemonDisable
${G_myName} ${extraInfo} -i daemonEnable
${G_myName} ${extraInfo} -i daemonEnabledStatus
${G_myName} ${extraInfo} -i daemonRestart
${G_myName} ${extraInfo} -i daemonStart
${G_myName} ${extraInfo} -i daemonStop
${G_myName} ${extraInfo} -i daemonForceStop
${G_myName} ${extraInfo} -i daemonReload
${G_myName} ${extraInfo} -i daemonStatus
_EOF_
}

function vis_examplesLogInfo {
 cat  << _EOF_
$( examplesSeperatorSection "Log And Info Files" )
${G_myName} ${extraInfo} -i logFilesList
${G_myName} ${extraInfo} -i logTail
${G_myName} ${extraInfo} -i logGrep
${G_myName} ${extraInfo} -i logErrTail
${G_myName} ${extraInfo} -i logErrGrep
_EOF_
}

vis_help () {
  cat  << _EOF_
    Generic SysV Init Daemon Start/Stop/Restart.
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Daemon Enable/Disable [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_daemonDisable {

    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager disable ${thisSvc}
    done
}

function vis_daemonEnable {

    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager enable ${thisSvc}
    done
}

function vis_daemonEnabledStatus {
    EH_assert daemonPrep

  opDo  grep 'ENABLED=' ${serviceDefaultFile}
}


function daemonPrep {
    if [ "${daemonControlScript}_" == "_" ] ; then
	EH_problem "Missing Parameter: daemonControlScript"
	return 1
    fi
    if [ "${serviceDefaultFile}_" == "_" ] ; then
	EH_problem "Missing Parameter: serviceDefaultFile"
	return 1
    fi
}


function serverConfigPrep {
    if [ "${daemonConfigFile}_" == "_" ] ; then
	EH_problem "Missing Parameter: daemonControlScript"
	return 1
    fi
}

function vis_fullInfo {
  cat  << _EOF_
daemonControlScript="${daemonControlScript}"
daemonName="${daemonName}"
daemonConfigDir="${daemonConfigDir}"
daemonConfigFile="${daemonConfigFile}"
daemonLogDir="${daemonLogDir}"
daemonLogFile="${daemonLogFile}"
daemonLogErrFile="${daemonLogErrFile}"
_EOF_
}



function vis_fullVerify {
    EH_assert daemonPrep

    vis_serverConfigVerify

    vis_daemonStatus
}


function vis_fullUpdate {
    EH_assert daemonPrep

    vis_serverConfigUpdate

    vis_daemonRestart
}

function vis_fullDelete {
    EH_assert daemonPrep

    opDo vis_daemonDisable
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Daemon Start/Stop [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_daemonStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager start ${thisSvc}
    done

    lpReturn
}


function vis_daemonStop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager stop ${thisSvc}
    done

    lpReturn
}


function vis_daemonRestart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager restart ${thisSvc}
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: daemonStatus  [[elisp:(org-cycle)][| ]]
_CommentEnd_


vis_daemonStatus () {
    EH_assert daemonPrep

    #opDoComplain ${daemonControlScript} status

    local thisSvc=""
    
    for thisSvc in ${daemonsServiceName[@]} ; do
	lpDo systemctl --no-pager status ${thisSvc}
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: serverConfigUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_keepAsOrig {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local keepFile=$1

    EH_assert [ -e "${keepFile}" ]

    local origFile="${keepFile}.orig"

    if [ -e "${origFile}" ] ; then
	lpDo doNothing
    else
	lpDo cp -p "${keepFile}" "${origFile}"
    fi
}

function vis_serverConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    if [ -z "${daemonConfigFile}" ] ; then
	ANT_raw "Blank daemonConfigFile -- No Configuration Performed"
	return
    fi

    EH_assert daemonPrep

    lpDo vis_keepAsOrig "${daemonConfigFile}"
    
    FN_fileSafeKeep ${daemonConfigFile}

    opDo eval vis_serverConfigStdout \> ${daemonConfigFile}

    opDo ls -l ${daemonConfigFile}
}



function vis_serverConfigVerify {
  EH_assert daemonPrep

  typeset tmpFile=$( FN_tempFile )

  vis_serverConfigStdout > ${tmpFile} 

  FN_fileCmpAndDiff ${daemonConfigFile} ${tmpFile}
 
  FN_fileRmIfThere ${tmpFile} 
}

function vis_serverConfigShow {
  EH_assert daemonPrep

  opDo ls -l ${daemonConfigFile} 

}




function vis_defaultConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    if [ -z "${serviceDefaultFile}" ] ; then
	ANT_raw "Blank daemonConfigFile -- No Configuration Performed"
	return
    fi

    EH_assert daemonPrep

    lpDo vis_keepAsOrig "${serviceDefaultFile}"
    
    FN_fileSafeKeep ${serviceDefaultFile}

    opDo eval vis_defaultConfigStdout \> ${serviceDefaultFile}

    opDo ls -l ${serviceDefaultFile}
}



function vis_defaultConfigVerify {
  EH_assert daemonPrep

  typeset tmpFile=$( FN_tempFile )

  vis_defaultConfigStdout > ${tmpFile} 

  FN_fileCmpAndDiff ${serviceDefaultFile} ${tmpFile}
 
  FN_fileRmIfThere ${tmpFile} 
}

function vis_defaultConfigShow {
  EH_assert daemonPrep

  opDo ls -l ${serviceDefaultFile} 

}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: logFilesList [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_logFilesList {
  EH_assert daemonPrep
  cat  << _EOF_
daemonLogDir="${daemonLogDir}"
daemonLogFile="${daemonLogFile}"
daemonLogErrFile="${daemonLogErrFile}"
_EOF_

  if [ ! -z "${daemonLogDir}" ] ; then
      if [ "${daemonLogDir}" != "/var/log" ] ; then
	  opDo ls -l ${daemonLogDir}
      fi
  fi

  if [ ! -z "${daemonLogFile}" ] ; then 
      opDo ls -l ${daemonLogFile} 
  fi

  if [ ! -z "${daemonLogErrFile}" ] ; then 
      opDo ls -l ${daemonLogErrFile} 
  fi
}

function vis_logTail {
  EH_assert daemonPrep

  if [ ! -z "${daemonLogFile}" ] ; then 
      opDo tail -50 ${daemonLogFile} 
  fi
}

function vis_logGrep {
  EH_assert daemonPrep

  if [ -z "${daemonLogTag}" ] ; then
      if [ "${daemonLogFile}_" != "_" -a ! -z ${daemonName} ] ; then 
	  opDo grep -i ${daemonName} ${daemonLogFile} 
      fi
  else
      if [ ! -z "${daemonLogFile}"  ] ; then 
	  opDo grep -i ${daemonLogTag} ${daemonLogFile} 
      fi
  fi
}


function vis_logErrTail {
  EH_assert daemonPrep

  if [ "${daemonLogErrFile}_" != "_" ] ; then 
      opDo tail -50 ${daemonLogErrFile} 
  fi
}

function vis_logErrGrep {
  EH_assert daemonPrep

  if [ -z "${daemonLogTag}" ] ; then
      if [ "${daemonLogErrFile}_" != "_" -a ! -z ${daemonName} ] ; then 
	  opDo grep -i ${daemonName} ${daemonLogErrFile} 
      fi
  else
      if [ ! -z "${daemonLogErrFile}"  ] ; then 
	  opDo grep -i ${daemonLogTag} ${daemonLogErrFile} 
      fi
  fi
}


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
