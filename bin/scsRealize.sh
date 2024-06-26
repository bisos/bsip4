#!/bin/bash

IimBriefDescription="Self Contained Internet Service. Realizes/Creates pmz_ BPOs"

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
*  /This File/ :: /bisos/bsip/bin/scsRealize.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

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

. ${opBinBase}/scsRealize_lib.sh

# PRE parameters

typeset -t bpoId=""

typeset -t correspondingBxo=""


function G_postParamHook {
    if [ ! -z  "${bpoId}" ] ; then  bpoIdPrepValidate; fi;

    if [ ! -z "${bpoId}" ] ; then
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi
    
    bisosCurrentsGet
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

    oneBxoId="${currentBxoId}"

    oneBxoRepoScope="basePrep"

    function repoBaseCreateAndPushExamples {
        EH_assert [[ $# -eq 2 ]]
        local repoName=$1
        local description=$2
        cat  << _EOF_
$( examplesSeperatorSubSection "${description}" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i scs_repoBaseCreate_${repoName}
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoRealize_repoBasesPush ${repoName}
_EOF_
    }   

    function nonRepoBaseCreateAndPushExamples {
        EH_assert [[ $# -eq 2 ]]
        local repoName=$1
        local description=$2
        cat  << _EOF_
$( examplesSeperatorSubSection "${description}" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i scs_nonRepoBaseCreate_${repoName}
_EOF_
    }   

    
    visLibExamplesOutput ${G_myName}
    
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
_EOF_
    
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site Container Bases" )
${G_myName} ${extraInfo} -i scs_basicBxoRealize geneweb-xx  # FULL ACTION -- PRIMARY COMMAND (pmz_geneweb-xx BPO )
${G_myName} ${extraInfo} -i scs_basicBxoRealize dhcpStatic-xx  # FULL ACTION -- PRIMARY COMMAND (pmz_dhcpStatic-xx BPO )
${G_myName} ${extraInfo} -i scs_basicBxoRealize dns-xx  # FULL ACTION -- PRIMARY COMMAND (pmz_dns-xx BPO )
${G_myName} ${extraInfo} -i scs_fullBxoRealize
_EOF_

    cat  << _EOF_
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
$( examplesSeperatorSection "Repo Bases List And Create -- Realizition" )
${G_myName} ${extraInfo} -i scs_repoBasesList
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i scs_repoBasesAllCreate
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i scs_repoBasesAllPush
${G_myName} -i scs_repoBasesList | ${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoRealize_repoBasesCreate scs
$( repoBaseCreateAndPushExamples panel "Panel Repo (Basic Panel)" )
$( repoBaseCreateAndPushExamples BAGP "Repo" )
$( repoBaseCreateAndPushExamples NSP "Repo" )
$( repoBaseCreateAndPushExamples par_live "Repo" )
$( examplesSeperatorSection "Non Repo Bases List And Create -- Realizition" )
${G_myName} ${extraInfo} -i scs_nonRepoBasesList
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i scs_nonRepoBasesAllCreate
${G_myName} -i scs_nonRepoBasesList | ${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoRealize_nonRepoBasesCreate scs
$( nonRepoBaseCreateAndPushExamples var "Var BaseDir Link" )
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
