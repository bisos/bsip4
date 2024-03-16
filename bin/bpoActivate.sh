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

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/bpoManage_lib.sh

. ${opBinBase}/niche_lib.sh


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

    oneRealIndivBxoId=$(usgBpos.sh -i usgBpos_real_indivBxoId_read)
    if [ -z "${oneRealIndivBxoId}" ] ; then
        oneRealIndivBxoId=$(bxoGitlab.py -v 30  -i acctList  | grep pri_ | head -1)
    fi
    visLibExamplesOutput ${G_myName}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Currents And BxO Management Information" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId ${oneBxoId}
${G_myName} ${extraInfo} -i bxoConstructBaseDir_obtain "${priv}"
$( examplesSeperatorChapter "Delete A BxO Local Acct" )
bpoAcctManage.sh
bpoAcctManage.sh ${extraInfo} -i bxoAcctDelete ${oneBxoId}
usgBpoSshManage.sh
usgBpoSshManage.sh ${extraInfo}  -p bpoId="${oneBxoId}"  -i usgBxoFullDelete
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i fullRemove $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home # noAcct
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i fullRemove # Delete Acct and remove ${oneBxoHome}
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i fullDelete # _ALERT_ FullRemove + bxoGitServerFullDelete
$( examplesSeperatorChapter "Construct A BxO From Its Realized BxE" )
$( examplesSeperatorSection "Obtain A Snapshot Of RBxE At $(vis_bxoConstructBaseDir_obtain priv)" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i obtainRepoSnapshot rbxe
$( examplesSeperatorSection "BxO Ssh Config Update" )
usgBpoSshManage.sh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p usg=current -i usgSshConfigUpdate   # Sets up ~usg/.ssh/config
$( examplesSeperatorSection "BxO Creation Based On ISO Info" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoAcctCreate
$( examplesSeperatorSection "BxO Repos Clone Map" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i initialReposClone $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i initialReposClone
$( examplesSeperatorSection "BxO Construct Full Update -- All Of The Above" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i fullConstruct $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home # noAcct
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneBxoId}" -i fullConstruct # Creats Acct & clones in ${oneBxoHome}
$( examplesSeperatorChapter "Activate Selected Real Individual" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bpoId="${oneRealIndivBxoId}" -i bpoActivate  # Real Individual
usgBpos.sh ${extraInfo} -i usgBpos_real_indivBxoId_read
usgBpos.sh ${extraInfo} -i usgBpos_real_indivBxoId_write "${oneRealIndivBxoId}"
${G_myName} ${extraInfo} -p privacy="${priv}" -i bpoActivate ${oneRealIndivBxoId} 
echo ${oneRealIndivBxoId} | ${G_myName} ${extraInfo} -p privacy="${priv}" -i bpoActivate
${G_myName} ${extraInfo} -p bpoId=${oneRealIndivBxoId} -i bxoTreeDescendantsList
${G_myName} ${extraInfo} -p bpoId=${oneRealIndivBxoId} -i bxoTreeDescendantsList | ${G_myName} ${extraInfo} -p privacy="${priv}" -i bpoActivate
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} -i containerReposList  # listAvaiableSysChars
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i sysCharContainerReport
$( examplesSeperatorChapter "Related -- See Also" )
bpoAcctManage.sh # Bxo Accts
bpoManage.sh # usg Keys managements
bpoReposManage.sh # BxO Repos Create And Push And Pull
_EOF_
    
   vis_examplesNicheRun container
   # vis_examplesNicheRun usageEnvs
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
