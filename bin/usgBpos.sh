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
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/usgBpos_lib.sh

. ${opBinBase}/niche_lib.sh
. ${opBinBase}/bpoManage_lib.sh

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

    local thisBisosDevBxoId=$( vis_usgBposUsageEnvs_bisosDevBxoId_read )
    if [ -z "${thisBisosDevBxoId}" ] ; then
        thisBisosDevBxoId="piu_XXBisosDev"
    fi

    local oneRealIndiv=$(bxoGitlab.py -v 30  -i acctList  | grep pri_ | head -1)    

    local oneAaipByname=$(bxoGitlab.py -v 30  -i acctList  | grep pmi_ByN | head -1)
    local oneAaipBydomain=$(bxoGitlab.py -v 30  -i acctList  | grep pmi_ByD | head -1)

    local oneFullUse=$(bxoGitlab.py -v 30  -i acctList  | grep piu_ | grep -i full | head -1)    
    
    visLibExamplesOutput ${G_myName}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Currents And BxO Management Information" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId XXoneBxoId
$( examplesSeperatorChapter "Preps" )
${G_myName} ${extraInfo} -i usgBposInit # Should be invoked after bisosDevBxoId Has Been Conveyed
${G_myName} ${extraInfo} -i usgBposFpsPrep
$( examplesSeperatorChapter "UsageEnvs" )
$( examplesSeperatorSection "UsageEnvs -- Bisos Development BPO" )
${G_myName} ${extraInfo} -i usgBposUsageEnvs_bisosDevBxoId_write ${thisBisosDevBxoId}
${G_myName} ${extraInfo} -i usgBposUsageEnvs_bisosDevBxoId_read
${G_myName} ${extraInfo} -i usgBposUsageEnvs_bisosDev_update ${thisBisosDevBxoId} # Main Sets up 
${G_myName} ${extraInfo} -i usgBposUsageEnvs_bisosDev_bxoPath
${G_myName} ${extraInfo} -i usgBposUsageEnvs_bisosDev_bpoId
$( examplesSeperatorSection "Real BPOs -- Real Individual BPO" )
${G_myName} ${extraInfo} -i usgBpos_real_indivBxoId_write ${oneRealIndiv} # Low Level Function
${G_myName} ${extraInfo} -i usgBpos_real_indivBxoId_read 
${G_myName} ${extraInfo} -i usgBpos_real_indiv_update ${oneRealIndiv} # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_real_indiv_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_real_indiv_bpoId
$( examplesSeperatorSection "UsageEnv -- Full Use BPO" )
${G_myName} ${extraInfo} -i usgBpos_usageEnvs_fullUse_update ${oneFullUse} # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_usageEnvs_fullUse_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_usageEnvs_fullUse_bpoId
$( examplesSeperatorSection "AAIS BPOs -- Asserted Autonomy Internet Services  BPO" )
${G_myName} ${extraInfo} -i usgBpos_pals_byname_bpoId_fpWrite ${oneAaipByname} # Low Level Function
${G_myName} ${extraInfo} -i usgBpos_pals_byname_bpoId_fpRead 
${G_myName} ${extraInfo} -i usgBpos_pals_byname_update ${oneAaipByname} # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_pals_byname_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_pals_byname_bpoId
${G_myName} ${extraInfo} -i usgBpos_pals_bydomain_bpoId_fpWrite ${oneAaipBydomain} # Low Level Function
${G_myName} ${extraInfo} -i usgBpos_pals_bydomain_bpoId_fpRead
${G_myName} ${extraInfo} -i usgBpos_pals_bydomain_update ${oneAaipBydomain} # Main Entry -- Sets
${G_myName} ${extraInfo} -i usgBpos_pals_bydomain_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_pals_bydomain_bpoId
$( examplesSeperatorSection "LCNT Bases BPOs -- LCNT (Libre-Halaal Content)  BPO" )
${G_myName} ${extraInfo} -i usgBpos_lcntBases_update pip_credsSpecify # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_lcntBases_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_lcntBases_bpoId
$( examplesSeperatorSection "Site Configs BPOs -- Site Confihurations BPO" )
${G_myName} ${extraInfo} -i usgBpos_siteConfigs_update pip_TBD # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_siteConfigs_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_siteConfigs_bpoId
$( examplesSeperatorSection "Credentials BPOs -- Credentials (External Accounts)  BPO" )
${G_myName} ${extraInfo} -i usgBpos_credentials_update pip_credsSpecify # Main Entry -- Sets 
${G_myName} ${extraInfo} -i usgBpos_credentials_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_credentials_bpoId
$( examplesSeperatorSection "Controller BPO -- Used To Set Other usgBpos" )
${G_myName} ${extraInfo} -i usgBpos_controller_bpoId_fpWrite ${oneRealIndiv} # Low Level Function
${G_myName} ${extraInfo} -i usgBpos_controller_bpoId_fpRead 
${G_myName} ${extraInfo} -i usgBpos_controller_update ${oneRealIndiv} # Main Entry Controller -- Sets
${G_myName} ${extraInfo} -i usgBpos_controller_bxoPath # Main Entry -- Gets
${G_myName} ${extraInfo} -i usgBpos_controller_bpoId
$( examplesSeperatorChapter "Associate usgBpo With usgAcct" )
${G_myName} ${extraInfo} -i usgAcctWithUsgBpoAssociate
_EOF_

  cat  << _EOF_
$( examplesSeperatorChapter "Related -- See Also" )
bpoActivate.sh -h -v -n showRun -p privacy="priv" -p bpoId="${oneRealIndiv}" -i bpoActivate
_EOF_

  vis_examplesNicheRun controller
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


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
