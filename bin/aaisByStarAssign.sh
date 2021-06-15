#!/bin/bash

IcmBriefDescription="Assignment Remote Operation For AAIS-ByStar"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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

* This is a starting point for Merging opMachines.sh and bystarBoxAdmin.sh -- IMPORTANT --
** Use site/assign/BOX/box0059/cpf_box0059.sh
** Get rid of items file -- Get rid of subjectAction
** Scope of this is Physiacl Machines -- Not Virtual Machines -- unique id comes from dmidecode -s system-uuid and being physical
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh


. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/box_lib.sh

. ${opBinBase}/aaisByStarAssign_lib.sh


# PRE parameters
typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

function G_postParamHook {

    lpCurrentsGet

    lpReturn 0
}


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    #typeset oneId=`ifconfig eth0 | grep HWaddr | cut -c 39-55`
    #local oneId=$( sudo dmidecode -s system-uuid )
    local oneId=$(vis_thisBoxUUID)


    typeset examplesInfo="${extraInfo} ${runInfo}"

    local containersBase=$( containersAssignBaseObtain )
    EH_assert [ ! -z "${containersBase}" ]

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )
    #local containerBase=$( vis_withBoxIdFindContainerBase "${boxId}" )
    local containerBase=$( vis_forThisSysFindContainerBase )
    local containerNu=$( vis_fromContainerBaseGetContainerNu "${containerBase}" )    

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Containers Bases Information" )
${G_myName} ${extraInfo} -i containersBaseObtain
${G_myName} ${extraInfo} -i containersAssignBaseObtain
ls -ld ${containersBase}/*
find ${containersBase} -print
${G_myName} -i containersGenericsAssignList
$( examplesSeperatorChapter "Containers Bases Initializations" )
${G_myName} ${extraInfo} -i modelAbodeFunctionBaseDirsCreate    # INITIALIZATION -- create basis for nu assignments
$( examplesSeperatorChapter "BoxId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i withBoxIdFindContainerBase "${boxId}"
${G_myName} ${extraInfo} -i fromContainerBaseGetContainerNu "${containerBase}"
$( examplesSeperatorChapter "machineId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i thisMachineId
${G_myName} ${extraInfo} -i withMachineIdFindContainerBase "$( vis_thisMachineId )"
$( examplesSeperatorChapter "BoxOrMachineId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i withBoxOrMachineIdFindContainerBase "$( vis_thisMachineId )"
${G_myName} ${extraInfo} -i forThisSysFindContainerBase
$( examplesSeperatorChapter "SET -- Container Box Assignment -- Primary Commands" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerBoxAssignAndPush  # PRIMARY COMMAND
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerBoxAssign  # PRIMARY COMMAND
${G_myName} ${extraInfo} -i forThisSysContainerAssignBasePush
${G_myName} ${extraInfo} -i containersAssignBasePull
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerUpdate_atNu "${containerNu}"
$( examplesSeperatorChapter "UNSET -- Container Box Un Assignment" )
${G_myName} ${extraInfo} -i withBoxIdFindContainerBase "${boxId}"
${G_myName} ${extraInfo} -i containerBoxUnAssignAndPush "${boxId}"
${G_myName} ${extraInfo} -i containerBoxUnAssign "${boxId}"
$( examplesSeperatorChapter "SET -- Container Virt Assignment -- Primary Commands" )
${G_myName} ${extraInfo} -p model=Virt -p abode=Shield -p function=Server -i containerAssignAndPush  # PRIMARY COMMAND
${G_myName} ${extraInfo} -p model=Virt -p abode=Shield -p function=Server -i containerAssign  # PRIMARY COMMAND
echo ${containerBase} | bx-gitRepos -i addCommitPush all
${G_myName} ${extraInfo} -i containersAssignBasePull
${G_myName} ${extraInfo} -p model=Virt -p abode=Shield -p function=Server -i containerUpdate_atNu "${containerNu}"
$( examplesSeperatorChapter "GET -- Container Nu" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerNuGetNext
$( examplesSeperatorChapter "Assigned Containers Report" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerReport_atNu "${containerNu}"
${G_myName} -i containerReport_atBase "${containerBase}"
$( examplesSeperatorChapter "GET -- General Assignment Facilities" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerId "${containerNu}"
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i assignedContainerBase "${containerNu}"
${G_myName} ${extraInfo} -i withContainerIdGetBase "HSS-1001"
${G_myName} ${extraInfo} -i withInitialGetModel "H"     # one of: [HPV]
${G_myName} ${extraInfo} -i withInitialGetAbode "S"     # one of: [AMPSI]
${G_myName} ${extraInfo} -i withInitialGetFunction "S"  # one of: [LASD]
$( examplesSeperatorChapter "Container Assignment List Examples" )
${G_myName} ${extraInfo} -i modelAbodeFunction_listExamples containerBoxAssign   # Examples for all container models
${G_myName} ${extraInfo} -p model=Virt -i modelAbodeFunction_listExamples containerBoxAssign
${G_myName} ${extraInfo} -i modelAbodeFunction_listExamples containerNuGetNext  # Examples for all container models
${G_myName} -i assignGenerics_auto examples
${G_myName} ${extraInfo} -i assignGenerics_auto doIt
${G_myName} -i assignGenerics_box examples
${G_myName} ${extraInfo} -i assignGenerics_box doIt
_EOF_
}


noArgsHook() {
  vis_examples
}
