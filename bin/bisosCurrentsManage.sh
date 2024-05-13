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
*  /This File/ :: /bisos/bsip/bin/bisosCurrentsAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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

    if [ "${currentBxoUname}" == "" ] ; then
        currentBxoUname="ea-59043"
    fi

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Python Overlap -- Needs To Be Merged" )
bx-currentsManage.py
$( examplesSeperatorChapter "Full Operations" )
${G_myName} ${extraInfo} -i fullUpdate
$( examplesSeperatorChapter "Show" )
cat ${bisosCurrentsFileName}
${G_myName} ${extraInfo} -i currentsGetThenShow
$( examplesSeperatorChapter "Set" )
${G_myName} ${extraInfo} -i currentsSetRecent
${G_myName} ${extraInfo} -i currentsFileCreate
${G_myName} ${extraInfo} -i setParam currentBxoUname ${currentBxoUname}
${G_myName} ${extraInfo} -i validateParam currentBxoUname ${currentBxoUname}
${G_myName} ${extraInfo} -i setParam currentBxoId ${currentBxoId}
${G_myName} ${extraInfo} -i setParam currentBxoAutonomousUname ${currentBxoAutonomousUname}
${G_myName} ${extraInfo} -i setParam currentBxoUeUname ${currentBxoUeUname}
${G_myName} ${extraInfo} -i setParam currentBxoSiteUname ${currentBxoSiteUname}
${G_myName} ${extraInfo} -i setParam currentUsgUname ${currentUsgUname}
${G_myName} ${extraInfo} -i setParam cur_bpoId_parent pis_defaultSite
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Functions
_CommentEnd_


function vis_fullUpdate {
  vis_currentsFileCreate
}


function vis_currentsGetThenShow {
  lpCurrentsGet
  lpCurrentsShow


  return
  
  # lpEach.sh -i prepend "bystarUname=" ${currentBxoUname} ${currentBxoAutonomousUname} 2> /dev/null | lpXparamsApply.sh -i xparamsProg bystarAcctInfo.sh -p bystarUname='${bystarUname}' -i bystarHereAnalyzeAcct_summary  1>&2

  #echo bystarUname=${currentBxoUname} | lpXparamsApply.sh -i xparamsProg bystarAcctInfo.sh -p bystarUname='${bystarUname}' -i bystarHereAnalyzeAcct_summary 1>&2

  # bystarAcctInfo.sh -i hereBxoUnameList 2> /dev/null 
  #opDo ls -l /etc/lsip/currents
}

function vis_currentsSetRecent {
#set -x
  EH_assert [[ $# -eq 0 ]]
    
  currentBynameUname=$( egrep '^ua|^sa' /etc/passwd | tail -1 | cut -d: -f1 )
  
  if [ "${currentBynameUname}_" != "_" ] ; then
    opDo vis_setParam currentBynameUname ${currentBynameUname}
    opDo vis_setParam currentBxoUname ${currentBynameUname}
  fi

  currentBysmbUname=$( egrep '^ea' /etc/passwd | tail -1 | cut -d: -f1 )
  
  if [ "${currentBysmbUname}_" != "_" ] ; then
    opDo vis_setParam currentBysmbUname ${currentBysmbUname}
    opDo vis_setParam currentBxoUname ${currentBysmbUname}
    opDo vis_setParam currentBxoAutonomousUname ${currentBysmbUname}
  fi

  currentBcaUname=$( egrep '^ca' /etc/passwd | tail -1 | cut -d: -f1 )
  
  if [ "${currentBcaUname}_" != "_" ] ; then
    opDo vis_setParam currentBcaUname ${currentBcaUname}
  fi

  currentDeveloper=$( lpSysDevelopers.sh -i showCurrentDeveloper )
  
  if [ "${currentDeveloper}_" != "_" ] ; then
    opDo vis_setParam currentDeveloper ${currentDeveloper}
  fi


  opDo ls -l /etc/lsip/currents
}

function vis_currentsFileCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    if vis_reRunAsRoot -v -n showRun ${G_thisFunc} $@ ; then lpReturn 1; fi;

    # opDo FN_dirCreatePathIfNotThere /etc/lsip
    opDo FN_FileCreateIfNotThere ${bisosCurrentsFileName}
    opDo vis_currentsGetThenShow > ${bisosCurrentsFileName}
    opDo chown bisos:bisos ${bisosCurrentsFileName}
    opDo chmod g+w ${bisosCurrentsFileName}    
    opDo ls -l ${bisosCurrentsFileName}
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== /de/bx/current/district
_CommentEnd_

function vis_deBxCurrentEffectiveDistrict {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    #if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    FN_fileSymlinkUpdate $1  /de/bx/current/district/effective

    lpReturn
}

function vis_deBxCurrentAvailableDistrict {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    #if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    FN_fileSymlinkUpdate $2  /de/bx/current/district/$1

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
