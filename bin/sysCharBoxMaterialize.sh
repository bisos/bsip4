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

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/siteRegistrar_lib.sh

. ${opBinBase}/niche_lib.sh


# PRE parameters

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    #bpoIdPrepValidate    

    # if [ ! -z "${bpoId}" ] ; then
     #   bpoHome=$( FN_absolutePathGet ~${bpoId} )
    # fi
    
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
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )

    oneTargetBox=${curTargetBox:-}

    thisBpoId=$( vis_bpoIdPrep "sysChar" )

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox 192.168.0.45  # Currently curTargetBox=${curTargetBox:-}
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox localhost  # Currently curTargetBox=${curTargetBox:-}
$( examplesSeperatorChapter "Layer 4 -- Materialize This Box" )
sysCharIdentity.sh ${extraInfo} -p bpoId="${thisBpoId}" -i identityUpdate
${G_myName}  ${extraInfo} -p bpoId="${oneBxoId}"  -i materializedContainer
${G_myName}  ${extraInfo} -i materializedContainerThis
${G_myName}  ${extraInfo} -i materializedCommonContainer  # ~bpoId/sys/bin/cntnrAssemble.sh
$( examplesSeperatorChapter "Hosting Container Actions" )
sysCharPreps.sh
sysCharPreps.sh -h -v -n showRun -i fullUpdate
$( examplesSeperatorChapter "Pure Container Actions" )
$( examplesSeperatorChapter "Manual BISOS Installation (Site Niched Below)" )
_EOF_
  
     vis_examplesNicheRun site
}


function vis_materializedContainerThis {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies 
_EOF_
    }
    local thisBpoId=$( vis_bpoIdPrep "sysChar" )

    bpoId=${thisBpoId}
    lpDo vis_materializedContainer
}

function vis_materializedContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies 
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    
    local thisBpoId="${bpoId}"

    lpDo sysCharIdentity.sh -h -v -n showRun -p bpoId="${thisBpoId}" -i identityUpdate

    containerId=${thisBpoId##pmp_}
    containerRegDictStr=$( lpDo eval cntnrCharName.cs  -i withInitialsName_getDict ${containerId} \| pyLiteralToBash.cs -i stdinToBash )
    declare -A containerRegDict
    lpDo eval containerRegDict=${containerRegDictStr}

    local model=${containerRegDict['model']}
    local abode=${containerRegDict['abode']}
    local function=${containerRegDict['purpose']}
    local containerNu=${containerRegDict['containerNu']}
   
    case "${model}" in

        Host)
            lpDo vis_materializedHostContainer
            ;;
        
        Pure)
           lpDo vis_materializedPureContainer
            ;;

        Virt|virt|VIRT)
           lpDo vis_materializedVirtContainer
           ;;
        
       *)
           EH_problem "Bad Usage -- model=${model}"
    esac

}

function vis_materializedHostContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies 
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    
    local thisBpoId="${bpoId}"

    # BinsPrep install kvm, libvirt and Vagrant and packer
    lpDo fgcKvmHostingSw.sh -h -v -n showRun -i  fullUpdate

    # Create Needed Accounts
    lpDo fgcKvmHostingSvc.sh -h -v -n showRun -i fullUpdate

    # User packer to create Fresh Debian Vagrant Base Boxes 
    lpDo lcaVagrantBoxBuild.sh -h -v -n showRun -i bvdbb_deb12_desktopBuild

    # Activate Generic CntnrChar BPOs for Debian 11 and 12 -- pmp_VAG-deb12_  pmp_VSG-deb12_
    lpDo sysCharActivate.sh -h -v -n showRun  -i activate_virtGenerics                

    ANT-cooked "This has happened before and should be un-needed: vagrant plugin install vagrant-libvirt"
    lpDo lcaVagrantManage.sh -h -v -n showRun  -i fullUpdate

    # Create Generic VM Images
    lpDo sysCharGuestMaterialize.sh -h -v -n showRun -p bpoId="pmp_VAG-deb12_" -i vagrantFile_run
    lpDo sysCharGuestMaterialize.sh -h -v -n showRun -p bpoId="pmp_VSG-deb12_" -i vagrantFile_run

    # Run VM Images

    # Run Niche of bpoId
}

function vis_materializedPureContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies 
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    
    local thisBpoId="${bpoId}"

    # Run Niche of bpoId
}

function vis_materializedCommonContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    if [ -z "${bpoId}" ] ; then
        bpoId=$( vis_bpoIdPrep "sysChar" )
    fi

    local cntnrAssemble_runLine=$( vis_cntnrAssemble_runLine )

    # Run Niche of bpoId
    lpDo ${cntnrAssemble_runLine}
}


function vis_materializedVirtContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Applies 
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    
    local thisBpoId="${bpoId}"

    lpDo "Bad Usage: Run sysCharGuestMaterialize.sh instead"
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
