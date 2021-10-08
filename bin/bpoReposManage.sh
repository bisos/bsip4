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

. ${opBinBase}/bpo_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bpoId=""
typeset -t privacy=""
# usg=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${bpoId}" ] ; then
        # NOTYET -- This is unreliable as bpoId may not exist
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi

    return 0
}



noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    if ! lpCurrentsGet ; then
        EH_problem "lpCurrentsGet Failure"
        lpReturn 101
    fi
    
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
$( examplesSeperatorSection "BxO Repos Clone Map -- Optional Repos -- Based On MapFiles -- NOTYET" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i initialReposClone $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i initialReposClone  # Clone All Repos Of That BxO
$( examplesSeperatorChapter "BxO Repos Create And Push And Pull" )
$( examplesSeperatorSection "BxO Repo Create And Push" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoCreateAndPush "rbxe" "${oneBxoHome}/rbxe" "priv"
$( examplesSeperatorChapter "BxO Path Based Actvities" )
${G_myName} ${extraInfo} -i bpoIdObtainForPath . 
${G_myName} ${extraInfo} -i repoCreateAndPushBasedOnPath .
${G_myName} ${extraInfo} -i repoDeleteBasedOnPath .  # use -f to also remove dir
$( examplesSeperatorChapter "BxO Pull Git Repos" )
echo $(pwd) | bx-gitRepos -i gitRemPull
${G_myName} -i basedOnPath_reposPathList . | bx-gitRepos -i gitRemPull
echo "${oneBxoId}" | ${G_myName} -i bxoReposPathList | bx-gitRepos -i gitRemPull
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -i bxoReposPathList | bx-gitRepos -i gitRemPull # ALL BxOs on This Container
$( examplesSeperatorSection "Clone When Missing" )
${G_myName} -i basedOnPath_reposPathList . | bx-gitRepos -i cloneWhenMissing
echo "${oneBxoId}" | ${G_myName} -i bxoReposPathList | bx-gitRepos -i cloneWhenMissing
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -i bxoReposPathList | bx-gitRepos -i cloneWhenMissing # ALL BxOs on This Container
echo "${oneBxoId}" | ${G_myName} -i bxoReposPathList | bx-gitRepos -i gitRemPullAndCloneWhenMissing
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -i bxoReposPathList | bx-gitRepos -i gitRemPullAndCloneWhenMissing # ALL BxOs on This Container
$( examplesSeperatorChapter "BxO Push Git Repos" )
echo $(pwd) | bx-gitRepos -i addCommitPush all
${G_myName} -i basedOnPath_reposPathList . | bx-gitRepos -i addCommitPush modifieds
${G_myName} -i basedOnPath_reposPathList . | bx-gitRepos -i addCommitPush all
echo "${oneBxoId}" | ${G_myName} -i bxoReposPathList | bx-gitRepos -i addCommitPush all
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -i bxoReposPathList | bx-gitRepos -i addCommitPush all # ALL BxOs on This Container
$( examplesSeperatorChapter "BxO Repos Status" )
${G_myName} -i basedOnPath_reposNameList .
${G_myName} -i basedOnPath_reposPathList . | bx-gitRepos -i status loc rem
${G_myName} -i bxoReposNameList "${oneBxoId}"
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -v -i bxoReposNameList
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -v -i bxoReposPathList
bpoAcctManage.sh -i bpoIdsList | ${G_myName} -i bxoReposPathList | bx-gitRepos -i status loc rem
_EOF_
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
