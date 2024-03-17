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


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash".
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
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    bisosCurrentsGet

    local effectiveContainerBxoId="sysChar"

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )

    local registrar=$( vis_registrarHostName )
    local id=$( vis_registrarUserName )
    local password=$( vis_registrarUserPassword )

    # local oneTargetName="192.168.0.52"
    local oneTargetName=${curTargetBox:-}
    # local oneTargetName="localhost"

    # bisosCurrentsManage.sh -i setParam curTargetBox 192.168.0.257 &> /dev/null

    visLibExamplesOutput ${G_myName}
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${effectiveContainerBxoId}"
${curTargetBox:-}
$( examplesSeperatorChapter "LAYER-0:: Generic FreshDebian VM (vagrant up FreshDebian-Basebox)" )
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_deb12-freshVagBb" -i vagrantFile_run       # on host - ends with image
NOTYET, point to buildBaseBox build and pmp_deb12 BPO
$( examplesSeperatorChapter "LAYER-1:: Generic unsitedBisosDeploy.sh  -- (vagrant up UnsitedBisos-basebox)" )
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_deb12-unsitedBisosVagBb" -i vagrantFile_run       # on host - ends with image
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_deb12-unsitedBisosFab" -i vagrantFile_run       # Fabricate on host - ends with image
NOTYET, point to buildBaseBox build and pmp_deb12 BPO
$( examplesSeperatorChapter "LAYER-2:: Generic Sited-Container -- UnsitedBisos to SitedContainer" )
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_pmp_VAG-deb12_" -i vagrantFile_run       # on host - ends with image
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_pmp_VSG-deb12_" -i vagrantFile_run       # on host - ends with image
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_deb12-sitedBisosFabL0-VAG" -i vagrantFile_run       # Fabricate on host - ends with image
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="pmp_deb12-sitedBisosFabL1-VSG" -i vagrantFile_run       # Fabricate on host - ends with image
NOTYET, dev vs stable
NOTYET, start up VMs in addition to run vagrant
sysCharGenericsRealize.sh
$( examplesSeperatorChapter "LAYER-3:: Chared-Container -- [Reify: Realize or Activate] SysChar Setup [with sysCharBpo] -- siteBasePlatform Actions" )
sysCharRealize.sh
$( examplesSeperatorSection "L3:: Full New Guest Actions -- Realize " )
sysCharRealize.sh -h -v -n showRun -p model=Virt -p abode=Shield -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
sysCharRealize.sh -h -v -n showRun -p model=Virt -p abode=Internet -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
$( examplesSeperatorSection "L3:: Full Existing Guest Actions -- Activate" )
${G_myName} ${extraInfo} -p bxoId="pmp_VAG-deb11_" -i siteBasePlatform_sysBxoActivate
$( examplesSeperatorChapter "LAYER-4:: BPO Contaioner Composition" )
bpoCntnrComposeGuest.sh
$( examplesSeperatorChapter "LAYER-5:: Materialized-Container " )
sysCharMaterializeBox.sh    # Under lying ICM for Layer
sysCharMaterializeGuest.sh -h -v -n showRun -p bpoId="notyet" -i vagrantFile_run       # on host - ends with image
$( examplesSeperatorChapter "LAYER-1 to Layer 5:: Combined -- Full Existing Box Actions -- on Manager" )
${G_myName} ${extraInfo} -p bpoId="notyet" -i l1l5_materializedContainer  # on Manager  -- PRIMARY (Existing BOX)
${G_myName} ${extraInfo} -p bpoId="notyet" -i l1l5_materializedDevContainer  # on Manager  -- PRIMARY (Existing BOX)
${G_myName} ${extraInfo} -i devExamples
_EOF_
}


function someExample {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if [ -d /tmp/netNameInfo ] ; then
        lpDo rm -r /tmp/netNameInfo
    fi
    lpDo mkdir -p /tmp/netNameInfo
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
