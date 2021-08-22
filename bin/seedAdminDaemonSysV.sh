#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedAdminDaemonSysV.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/seedAdminDaemonSysV.sh 
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
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


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
*      ======[[elisp:(org-cycle)][Fold]]====== Example Segments
_CommentEnd_


function vis_examplesFullService {
 cat  << _EOF_
--- SERVER FULL ACTION  ---
${G_myName} ${extraInfo} -i fullInfo
${G_myName} ${extraInfo} -i fullVerify
${G_myName} ${extraInfo} -i fullUpdate                 # serverConfigUpdate + daemonRestart
${G_myName} ${extraInfo} -i fullDelete
_EOF_
}

function vis_examplesServerConfig {
 cat  << _EOF_
--- SERVER CONFIG  ---
${G_myName} ${extraInfo} -i serverConfigUpdate         # SafeKeep configFile and replace with ConfigStdout
${G_myName} ${extraInfo} -i serverConfigVerify         # diff configFile vs ConfigStdout
${G_myName} ${extraInfo} -i serverConfigShow           # ls -l configFile
${G_myName} ${extraInfo} -i serverConfigStdout         
_EOF_
}


function vis_examplesDaemonControl {
 cat  << _EOF_
--- /etc/init.d/Daemon Control/Status ---
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
--- /var/log Info ---
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
*      ======[[elisp:(org-cycle)][Fold]]====== Daemon Enable/Disable
_CommentEnd_


function vis_daemonDisable {

    EH_assert daemonPrep

  if grep -q 'ENABLED=yes' ${serviceDefaultFile} ; then
      grep -v 'ENABLED=yes' ${serviceDefaultFile} > ${serviceDefaultFile}.new
      echo 'ENABLED=no' >> ${serviceDefaultFile}.new
      opDo mv ${serviceDefaultFile}.new ${serviceDefaultFile}
  else
      ANT_raw "No Action (yes)-- Daemon was not enabled"
  fi
  opDo  grep 'ENABLED=no' ${serviceDefaultFile}

  if grep -q 'ENABLED=1' ${serviceDefaultFile} ; then
      grep -v 'ENABLED=1' ${serviceDefaultFile} > ${serviceDefaultFile}.new
      echo 'ENABLED=0' >> ${serviceDefaultFile}.new
      opDo mv ${serviceDefaultFile}.new ${serviceDefaultFile}
  else
      ANT_raw "No Action (1) -- Daemon was not enabled"
  fi
  opDo  grep 'ENABLED=0' ${serviceDefaultFile}

}

function vis_daemonEnable {

    EH_assert daemonPrep

  if grep -q 'ENABLED=no' ${serviceDefaultFile} ; then
      grep -v 'ENABLED=no' ${serviceDefaultFile} > ${serviceDefaultFile}.new
      echo 'ENABLED=yes' >> ${serviceDefaultFile}.new
      opDo mv ${serviceDefaultFile}.new ${serviceDefaultFile}
  else
      ANT_raw "No Action (no)-- Daemon was already enabled"
  fi
  opDo  grep 'ENABLED=yes' ${serviceDefaultFile}

  if grep -q 'ENABLED=0' ${serviceDefaultFile} ; then
      grep -v 'ENABLED=0' ${serviceDefaultFile} > ${serviceDefaultFile}.new
      echo 'ENABLED=1' >> ${serviceDefaultFile}.new
      opDo mv ${serviceDefaultFile}.new ${serviceDefaultFile}
  else
      ANT_raw "No Action (0) -- Daemon was already enabled"
  fi
  opDo  grep 'ENABLED=1' ${serviceDefaultFile}


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
*      ======[[elisp:(org-cycle)][Fold]]====== Daemon Start/Stop
_CommentEnd_


function vis_daemonStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert daemonPrep

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDoComplain ${daemonControlScript} start

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

    opDoComplain ${daemonControlScript} stop

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

    opDoComplain ${daemonControlScript} restart

    lpReturn
}


vis_daemonStatus () {
    EH_assert daemonPrep

    opDoComplain ${daemonControlScript} status
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

function vis_logFilesList {
  EH_assert daemonPrep
  cat  << _EOF_
daemonLogDir="${daemonLogDir}"
daemonLogFile="${daemonLogFile}"
daemonLogErrFile="${daemonLogErrFile}"
_EOF_

  if [ "${daemonLogDir}_" != "_" ] ; then 
      opDo ls -l ${daemonLogDir} 
  fi

  if [ "${daemonLogFile}_" != "_" ] ; then 
      opDo ls -l ${daemonLogFile} 
  fi

  if [ "${daemonLogErrFile}_" != "_" ] ; then 
      opDo ls -l ${daemonLogErrFile} 
  fi
}

function vis_logTail {
  EH_assert daemonPrep

  if [ "${daemonLogFile}_" != "_" ] ; then 
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





####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
