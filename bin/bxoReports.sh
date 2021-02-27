#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
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


. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bxoId=""
typeset -t privacy=""
# usg=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi

    lpCurrentsGet

    lpReturn 0
}

function vis_bxoConstructBaseDir_obtain  {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local privacy="$1"

    echo /bisos/var/bxo/construct/${privacy}

    lpReturn
}	

function noArgsHook {
    if [ $# -eq 0 ] ; then
	vis_examples
    else
	if [ "$1" == "list" ] ; then
	    vis_bxoIdsList
	elif [ "$1" == "there" ] ; then
	    vis_bxoIdsListExamples
	else
	    # No other feature supported yet.
	    vis_bxoIdsListExamples
	fi
    fi
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"
    
    #local privacy="priv"
    local priv="priv"    
    #local oneBxoId="prs_bisos"
    local oneBxoId=${currentBxoId}    
    #oneBxoId="as-test1_5"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    

    visLibExamplesOutput ${G_myName}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Currents And BxO Management Information" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId ${oneBxoId}
${G_myName} ${extraInfo} -i bxoConstructBaseDir_obtain "${priv}"
$( examplesSeperatorChapter "Delete A BxO At privGitServer" )
bxoGitlab.py
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i reposList
$( examplesSeperatorChapter "bxoIds List" )
bxoAcctManage.sh
${G_myName} ${extraInfo} -i usgAcctsList         # from /etc/passwd
${G_myName} ${extraInfo} -i bxoAcctsList         # from /etc/passwd
${G_myName} ${extraInfo} -i bxoIdsList           # bxoAcctsList | cut -d ":" -f 1
( examplesSeperatorChapter "OId Tree Info" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i ancestorsList  # NOTYET
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i childrenList  # NOTYET
( examplesSeperatorChapter "File Parameters List" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fileParamsShow
_EOF_
}

# find . -print | grep -i value | xargs grep ^.

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fileParamsShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given a bxoId, 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    if ! vis_userAcctExists "${bxoId}" ; then
	EH_problem "Missing ${bxoId}."
	lpReturn 101
    fi

    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local rbxeBase="${bxoHome}/rbxe"

    if [ ! -d "${rbxeBase}" ] ; then
	EH_problem "Missing ${rbxeBase}"
	lpReturn 101
    fi

    ANT_raw "RBXE File Params:"
    find ${rbxeBase} -print | grep -i value | xargs grep ^.

    local bxeTreeBase="${bxoHome}/bxeTree"

    if [ ! -d "${bxeTreeBase}" ] ; then
	EH_problem "Missing ${bxeTreeBase}"
	lpReturn 101
    fi

    ANT_raw "bxeTree File Params:"
    find ${bxeTreeBase} -print | grep -i value | xargs grep ^.
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
