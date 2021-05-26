#!/bin/bash

IimBriefDescription="svcXxSysdAdmin.sh SysD (systemd) Daemon Admin -- nichable"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedAdminDaemonSvc.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
* /[dblock]/--Seed/: /opt/public/osmt/bin/seedActions.bash
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
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
    Generic Init Daemon Start/Stop/Restart With SVC.
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/mmaLib.sh
. ${opBinBase}/mmaDaemontoolsLib.sh

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examplesLogInfo {
 cat  << _EOF_
$( examplesSeperatorChapter "Logs" )
${G_myName} ${extraInfo} -i logFile
${G_myName} ${extraInfo} -i logTail
${G_myName} ${extraInfo} -i logGrep
_EOF_
}


function vis_examplesSvcScan {
    typeset extraInfo="-h -v -n showRun"

 cat  << _EOF_
$( examplesSeperatorChapter "SvcScan" )
${G_myName} ${extraInfo} -i svcscanVerify
_EOF_
}


function vis_examplesDaemonListFull {
    typeset extraInfo="-h -v -n showRun"

 cat  << _EOF_
$( examplesSeperatorChapter "All Daemons -- Daemons List" )
${G_myName} ${extraInfo} -i svcDaemonList 2> /dev/null
${G_myName} ${extraInfo} -i daemonListFullReport 2> /dev/null
${G_myName} ${extraInfo} -i daemonListFullDelete   # Must be Sure (-f)
${G_myName} ${extraInfo} -i daemonListFullStop
${G_myName} ${extraInfo} -i daemonListFullStart
${G_myName} ${extraInfo} -i daemonListFullRestart
_EOF_
}


function vis_examplesDaemonUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset oneService=$1
    typeset oneServiceLocation=$2

    typeset extraInfo="-h -v -n showRun"

 cat  << _EOF_
$( examplesSeperatorChapter "Specific Svc Daemon Updates" )
${G_myName} ${extraInfo} -i svcDaemonShow ${oneService}
${G_myName} ${extraInfo} -i svcDaemonRunningVerify ${oneService}
${G_myName} ${extraInfo} -i svcDaemonVerify ${oneService} ${oneServiceLocation}
${G_myName} ${extraInfo} -i svcDaemonUpdate ${oneService} ${oneServiceLocation}   # serviceEnable
${G_myName} ${extraInfo} -i svcDaemonDelete ${oneService}  # serviceDisable
_EOF_
}


function vis_examplesDaemonOperate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset oneService=$1
    typeset oneServiceLocation=$2

    typeset extraInfo="-h -v -n showRun"

 cat  << _EOF_
$( examplesSeperatorChapter "Specific Svc Daemon Control Operations" )
${G_myName} ${extraInfo} -i svcDaemonHUP ${oneService}
${G_myName} ${extraInfo} -i svcDaemonRestart ${oneService}
${G_myName} ${extraInfo} -i svcDaemonStop ${oneService}
${G_myName} ${extraInfo} -i svcDaemonStart ${oneService}
${G_myName} ${extraInfo} -i svcDaemonOnce ${oneService}
_EOF_
}


noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Functions
_CommentEnd_


function vis_svcscanVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;


    typeset -i procsNum=`pgrep  '^svscan$' | wc -l`
    if [[ "${G_forceMode}_" != "force_" ]] ; then
	if [ "${procsNum}_" = "1_" ] ; then
	    ANT_raw "svscan Running -- No Action Taken"
	    return 0
	fi
    fi

    opDo pgrep -l '^svscan$'

    lpReturn
}


function vis_daemonListFullDelete {
  if [[ "${G_forceMode}_" != "force_" ]] ; then
    ANT_raw "If you really want to $0, specify G_forceMode (-f)"
    return 0
  fi

  typeset daemonList=`mmaDaemonList`
  typeset thisOne
  for thisOne  in ${daemonList}; do
    mmaDaemonDelete ${thisOne}
  done
  vis_stop
  vis_fullReport
}

function vis_daemonListFullStop {
  typeset daemonList=`mmaDaemonList`
  typeset thisOne
  for thisOne  in ${daemonList}; do
    mmaDaemonStop ${thisOne}
  done
}

function vis_daemonListFullStart {
  typeset daemonList=`mmaDaemonList`
  typeset thisOne
  for thisOne  in ${daemonList}; do
    mmaDaemonStart ${thisOne}
  done
}

function vis_daemonListFullRestart {
  typeset daemonList=`mmaDaemonList`
  typeset thisOne
  for thisOne  in ${daemonList}; do
    mmaDaemonRestart ${thisOne}
  done
}

function vis_daemonListFullReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn 1; fi;

    #vis_showProcs
    typeset daemonList=`mmaDaemonList`
    typeset thisOne
    for thisOne  in ${daemonList}; do
	mmaDaemonShow ${thisOne}
    done

    lpReturn
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

