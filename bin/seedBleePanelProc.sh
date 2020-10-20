#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

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
*  /This File/ :: /bisos/core/bsip/bin/seedBleePanelProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

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


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
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
$( examplesSeperatorChapter "Blee Panel Proc" )
$( examplesSeperatorSection "This Node/Leaf Processors" )
${G_myName} ${extraInfo} -i fullUpdate
${G_myName} ${extraInfo} -i refresh     # reruns startOrgPanel.sh and dblockUpdates fullUsagePanel-en.org
${G_myName} ${extraInfo} -i renew       # dblockUpdates fullUsagePanel-en.org ftpProc.sh bleePanelProc.sh
${G_myName} ${extraInfo} -i dblockBlankPanels   # dblockBlank fullUsagePanel-en.org
${G_myName} ${extraInfo} -i clean
_EOF_

  vis_ftoProcExamples  

  hookRun "examplesHookPost"
}

function vis_ftoProcExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Initial Base Update" )
find . -type f -print | egrep 'ftoProc.sh$' | xargs bx-dblock -h -v -n showRun -i dblockUpdateFiles
ftoProc.sh ${extraInfo} -i ftoWalkRunCmnd startOrgPanel.sh -h -v -n showRun -i bleePanelBaseUpdate .
$( examplesSeperatorChapter "Initial Under Files Update" )
ftoProc.sh -v -n showRun -i updateUnderFilesTo  /libre/ByStar/InitialTemplates/update/fto/start/commonProc/anyFtoItem/ftoProcNode.sh ftoProc.sh
ftoProc.sh -v -n showRun -i updateUnderFilesTo /libre/ByStar/InitialTemplates/software/starts/pypiProc.sh pypiProc.sh 
$( examplesSeperatorChapter "ftoWalks of ${G_myName}" )
ftoProc.sh
ftoProc.sh -v -n showRun -i ftoWalkRunCmnd ${G_myName} ${extraInfo} -i fullUpdate
ftoProc.sh -v -n showRun -i ftoWalkRunCmnd ${G_myName} ${extraInfo} -i refresh
ftoProc.sh -v -n showRun -i ftoWalkRunCmnd ${G_myName} ${extraInfo} -i renew
ftoProc.sh -v -n showRun -i ftoWalkRunCmnd ${G_myName} ${extraInfo} -i clean
_EOF_
}


noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo echo NOTYET bx-dblock -i dblockUpdateFile ${each}

    EH_retOnFail

    lpReturn
}

function vis_refresh {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ ! -f "./_tree_" ] ; then
	EH_problem "Missing ./_tree_"
	lpReturn
    fi
    
    local treeItem=$( cat ./_tree_)

    case ${treeItem} in
	"node")
	    if [ -d "./_nodeBase_" ] ; then
		lpDo startOrgPanel.sh -h -v -n showRun -i bleePanelBase node .
	    else
		lpDo bx-dblock -i dblockUpdateFile ./fullUsagePanel-en.org
	    fi
	    ;;
	"auxNode")
	    EH_problem ""
	    ;;
	"leaf")
	    lpDo startOrgPanel.sh -h -v -n showRun -i bleePanelBase leaf .
	    lpDo bx-dblock -i dblockUpdateFile ./fullUsagePanel-en.org	    
	    ;;
	"auxLeaf")
	    EH_problem ""
	    ;;
	"ignore")
	    doNothing
	    ;;
	*)
	    EH_problem ""
	    ;;		
    esac

    lpReturn
}

function dblockUpdateIfThere {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local thisFile="$1"
    
    if [ -f "${thisFile}" ] ; then
	lpDo bx-dblock -v -n showRun -i dblockUpdateFiles "${thisFile}"
    else
	ANT_raw "Missing ${thisFile} -- Skipped"
    fi
}

function dblockBlankIfThere {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local thisFile="$1"
    
    if [ -f "${thisFile}" ] ; then
	lpDo bx-dblock  -v -n showRun -i dblockBlankFiles "${thisFile}"
    else
	ANT_raw "Missing ${thisFile} -- Skipped"
    fi
}

function vis_renew {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo dblockUpdateIfThere ./fullUsagePanel-en.org
    lpDo dblockUpdateIfThere ./ftoProc.sh
    lpDo dblockUpdateIfThere ./bleePanelProc.sh
    
    lpReturn
}

function vis_dblockBlankPanels {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo dblockBlankIfThere ./fullUsagePanel-en.org
    
    lpReturn
}


function vis_clean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_failExample
    EH_retOnFail

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
