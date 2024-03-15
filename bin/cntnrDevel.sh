#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

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
*  /This File/ :: /bisos/bsip/bin/sysCharGuestPreps.sh 
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

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/usgBpos_lib.sh


# PRE parameters

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    if [ ! -z "${bpoId}" ] ; then
        bpoIdPrepValidate
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

    #oneBxoId="prs-bisos"
    oneBxoId="${currentBxoId}"
    #oneBxoId="pic_dnsServer"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VAG-deb11_
$( examplesSeperatorChapter "Identify or Locate bisosDevBxo" )
usgBpos.sh
usgBpos.sh -i usgBposUsageEnvs_bisosDevBxoId_read
$( examplesSeperatorChapter "Specialized Actions" )
${G_myName} ${extraInfo} -i fullUpdate
${G_myName} ${extraInfo} -i vagrantBaseBoxesBuild
${G_myName} ${extraInfo} -i siteContainersAssignGenerics
$( examplesSeperatorChapter "Developer Git Credentials Activate" )
sysCharDeploy.sh -h -v -n showRun -p bisosDevBxoId=piu_mbBisosDev -i usgConvey_bisosDeveloper
${G_myName} ${extraInfo} -i bisosDevBxo_fullSetup  # activate bisosDevBxoId and actuate it
${G_myName} ${extraInfo} -i bisosDevBxo_activate   # activate bisosDevBxoId
${G_myName} ${extraInfo} -i bisosDevBxo_actuate    # clone  auth based bxRepos with bisosDev credentials
$( examplesSeperatorChapter "Repeatable Actions And Updates" )
bx-gitReposBases -v 20 --baseDir="/bisos/git/auth/bxRepos" --pbdName="bxReposRoot" --vcMode="auth" --gitLabel="mb1_github"  -i pbdUpdate all
bisosPyVenvSetup.sh -h -v -n showRun -i pyVenv_DevSetup # Create Virtual Environment and dev pipInstalls
$( examplesSeperatorChapter "Temporary Work Around" )
bpoActivate.sh -h -v -n showRun -p privacy="priv" -p bpoId="piu_mbFullUsage" -i bpoActivate
usgBpos.sh -h -v -n showRun -i usgBpos_usageEnvs_fullUse_update piu_mbFullUsage # Main Entry -- Sets
$( examplesSeperatorChapter "Developer Git Credentials Deactivate" )
${G_myName} ${extraInfo} -i bisosDevBxo_delete
$( examplesSeperatorChapter "Mode Selection" )
sysCharDeploy.sh -p bpoId="sysChar" -i conveyInfoShow
${G_myName} ${extraInfo} -p bpoId="sysChar" -i sysCharConveyInfoWrite securityMode developer
${G_myName} ${extraInfo} -p bpoId="sysChar" -i sysCharConveyInfoWrite securityMode stable
${G_myName} ${extraInfo} -i securityMode developer
${G_myName} ${extraInfo} -i securityMode stable
${G_myName} ${extraInfo} -i securityMode sealed
_EOF_
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_vagrantBaseBoxesBuild

    lpDo vis_siteContainersAssignGenerics
    
    lpReturn
}       

function vis_vagrantBaseBoxesBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo echo run lcaVagrantBoxRun.sh
    
    lpReturn
}       

function vis_siteContainersAssignGenerics {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo siteContainerAssign.sh -h -v -n showRun -i assignGenerics doIt

    lpDo siteContainerRepo.sh -h -v -n showRun -i containerRepoGenericsUpdate full    
    
    lpReturn
}       

function vis_bisosDevBxo_fullSetup {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate the bisosDev usage env bpo. authClone using credentials of bisosDev.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bisosDevBxo_activate

    lpDo vis_bisosDevBxo_actuate

    lpDo bisosPyVenvSetup.sh -h -v -n showRun -i pyVenv_DevSetup

    lpDo bisosSiteSetup.sh  ${G_commandPrefs} \
        -p registrar=192.168.0.90 -i siteRegistrarSelect

}

function vis_bisosDevBxo_activate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate the bisosDev usage env bpo. authClone using credentials of bisosDev.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosDevBxoId=$( vis_usgBposUsageEnvs_bisosDevBxoId_read )
    EH_assert [ ! -z "${bisosDevBxoId}" ]

    # Activate bisosDev usage env bpo
    lpDo bpoManage.sh ${G_commandPrefs} \
         -p privacy=priv -p bpoId=${bisosDevBxoId} \
         -i fullConstruct

    local bisosDevBxoHome=$( FN_absolutePathGet ~${bisosDevBxoId} )
    
    # record the activated bpo as bisosDev
    lpDo usgBpos.sh ${G_commandPrefs} \
         -i usgBposUsageEnvs_bisosDev_update ${bisosDevBxoHome}
}


function vis_bisosDevBxo_actuate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** actuate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    bisosDevBxoHome=$( vis_usgBposUsageEnvs_bisosDev_bxoPath )
    EH_assert [ ! -z "${bisosDevBxoHome}" ]
    
    # Install bisosDev dev crentials in ~/.ssh and
    # auth clone using bisosDev credentials
    # switch to auth based bxRepos 
    lpDo ${bisosDevBxoHome}/sys/bin/bpoSysSetup.sh ${G_commandPrefs} \
         -i developerMode
}


function vis_securityMode {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local secMode="$1"

    case ${secMode} in
        developer)
            lpDo bisosBaseDirs.sh ${G_commandPrefs} -i bxReposAuthSet
            lpDo vis_sysCharConveyInfoWrite securityMode developer
            ;;
        stable)
            lpDo bisosBaseDirs.sh ${G_commandPrefs} -i bxReposAnonSet
            lpDo vis_sysCharConveyInfoWrite securityMode stable    
            ;;
        sealed)
            EH_problem "NOTYET"
            ;;
        *)
            EH_problem "Bad Usage -- ${secMode}"
            ;;
    esac
        
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
