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

. ${opBinBase}/siteRegistrar_lib.sh

. ${opBinBase}/container_lib.sh

. ${opBinBase}/usgBpos_lib.sh

# PRE parameters

typeset -t bpoId=""
typeset -t privA=""
typeset -t registrar=""
typeset -t id=""
typeset -t password=""
typeset -t siteBxoId=""
typeset -t bisosDevBxoId=""

typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

# vis_conveyInfoStore
typeset -t cfpVmNameQualifier=""
typeset -t cfpHostCntnr=""
typeset -t cfpSecurityMode=""

# vis_conveyNetInfoStore
typeset -t cfpNetIf=""
typeset -t cfpNetIfControl=""
typeset -t cfpHostNetIf=""
typeset -t cfpNetAddr=""

# obsoletred
typeset -t cfpPrivA=""
typeset -t cfpPubA=""

typeset -t targetName=""

typeset -t debInstAcct="intra"
typeset -t debInstAcctPasswd="intra"
typeset -t debInstRootPasswd="intra"

sshCmnd="ssh -o StrictHostKeyChecking=no"

function G_postParamHook {
    if [ ! -z "${bpoId}" ] ; then
        bpoIdPrepValidate
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi
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
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox 192.168.0.257
${curTargetBox:-}
$( examplesSeperatorChapter "LAYER-1:: unsitedBisosDeploy.sh  -- Distro Actions -- On Manager -- Ssh Into Target" )
unsitedBisosDeploy.sh
unsitedBisosDeploy.sh -h -v -n showRun -p targetName="${oneTargetName}" -p debInstAcct="intra" -p debInstAcctPasswd="intra" -p debInstRootPasswd=intra -i l1_raw_bisos   # PRIMARY Action (all of above distro_ actions)
unsitedBisosDeploy.sh ${extraInfo} -p targetName="${oneTargetName}" -i l1_fullUpdate
unsitedBisosDeploy.sh ${extraInfo} -p targetName="${oneTargetName}" -i l1_boxUUID  # Box's unique-id
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_boxUUIDToBoxNu
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_ascertain # Has it been provisioned?
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_unsitedBisos #  -- PRIMARY (uses unsitedBisosDeploy.sh -i l1_fullUpdate)
$( examplesSeperatorSection "L1:: Access to Layer-1 -- On Target Box" )
ssh -X bystar@${oneTargetName}    # Then run emacs
bleeVisit /bisos/panels/development/bisos-dev/howToBecomeDeveloper/fullUsagePanel-en.org # NOTYET, bad path
$( examplesSeperatorChapter "LAYER-2:: Sited-Container -- UnsitedBisos to SitedContainer" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2_sitedDevContainer  # onManager  -- PRIMARY (New BOX)
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2_sitedContainer  # onManager  -- PRIMARY (New BOX)
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_siteSetup # onManager or below onTarget
${G_myName} ${extraInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -p siteBxoId=${siteBxoId}" -i bisosBasePlatform_siteSetup # onTarget
$( examplesSeperatorSection "L2:: BISOS Development Preps -- bisosBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2Plus_devContainer # onManager+onTarget UsedBy: l2_sitedDevContainer
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i usgConvey_bisosDeveloper # onManager+onTarget UsedBy: l2_sitedDevContainer
${G_myName} ${extraInfo} -p bisosDevBxoId=prompt -i usgConvey_bisosDeveloper # onTarget UsedBy: l2_sitedDevContainer
cntnrDevel.sh -h -v -n showRun -i bisosDevBxo_fullSetup  # activate bisosDevBxoId and Materialize it
$( examplesSeperatorChapter "Layer-1 + Layer 2:: Combined" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l2_sitedDevContainer # OnManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l2_sitedContainer  # OnManager
sshpass -p intra ssh -X bystar@${oneTargetName} -f xterm -font 10x20
$( examplesSeperatorChapter "LAYER-3:: Chared-Container -- [Reify: Realize or Activate] SysChar Setup [with sysCharBpo] -- siteBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2Plus_regBoxAscertain  # Has this box been registered
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2Plus_regContainerBoxAscertain  # Is a container registered for this box
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2Plus_boxNameUpdate  "Like-R710-2"  # OnManager -- PRIMARY (New BOX)
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l2Plus_cntnrThis_regBpoId
$( examplesSeperatorSection "L3:: Full New Box Actions -- Realize on Target Box Only" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i l3_charedContainerBoxRealize  # OnTarget Only -- PRIMARY (New BOX)
${G_myName} ${extraInfo} -p model=Pure -p abode=Shield -p function=Server -i l3_charedContainerBoxRealize  # OnTarget Only -- PRIMARY (New BOX)
$( examplesSeperatorSection "L3:: Full Existing Box Actions -- Activate on Manager Or On Target Box" )
${G_myName} ${extraInfo} -i l3_cntnrThis_activate # On Target
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l3_cntnrThis_activate # On Manager
${G_myName} ${extraInfo} -p bxoId="pmp_VAG-deb11_" -i siteBasePlatform_sysBxoActivate
$( examplesSeperatorChapter "LAYER-1 + Layer 2 + Layer 3:: Combined -- Full Existing Box Actions -- On Manager" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l3_charedContainer_activate  # onManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l3_charedContainer_realizeNOT  # onManager
$( examplesSeperatorChapter "LAYER-4:: BPO Contaioner Composition" )
bpoCntnrComposeBox.sh     # Under lying ICM for Layer 4
bpoCntnrComposeGuest.sh
$( examplesSeperatorChapter "LAYER-5:: Materialized-Container " )
sysCharBoxMaterialize.sh    # Under lying ICM for Layer
sysCharMaterializeGuest.sh
${G_myName} ${extraInfo} -i l5_materializedContainer  # on Target  -- PRIMARY (New BOX)
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l5_materializedContainer  # on Manager
$( examplesSeperatorChapter "LAYER-1 to Layer 5:: Combined -- Full Existing Box Actions -- on Manager" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l5_materializedContainer  # on Manager  -- PRIMARY (Existing BOX)
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1l5_materializedDevContainer  # on Manager  -- PRIMARY (Existing BOX)
$( examplesSeperatorChapter "VIRTUALIZATION :: sysCharGuestMaterialize.sh Use of sysChaBoxrDeploy.sh" )
$( examplesSeperatorSection "Used in Vagrantfile --- Phase 2.1, 2.2, 2.3" )
${G_myName} ${extraInfo} -p registrar="192.168.0.257" -p id="bystar" -p password="somePasswd" -p siteBxoId="pms_someSite" -i bisosBasePlatform_siteSetup
${G_myName} ${extraInfo} -p bisosDevBxoId=piu_mbBisosDev -i usgConvey_bisosDeveloper
${G_myName} ${extraInfo} -p bxoId="pmp_VAG-deb11_" -i siteBasePlatform_sysBxoActivate
${G_myName} ${extraInfo} -p bxoId="pmp_VAG-deb11_" -p cfpVmNameQualifier=\"12\" -i conveyInfoStore
${G_myName} ${extraInfo} -p bxoId="pmp_VAG-deb11_" -p cfpHostCntnr=\"pmp_PML-1111\" -i conveyInfoStore
$( examplesSeperatorSection "Specify ConveyInfo [to Guest] -- sysCharBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpPrivA=192.168.0.257 -i conveyInfoStore # For Generic Guests
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpNetIf=eth2 -i conveyNetInfoStore pubA
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpHostNetIf=eno1 -i conveyNetInfoStore pubA
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i conveyInfoShow
$( examplesSeperatorSection "Deploy With Convey Info -- FULL SYSTEM Deployment" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onManager
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onTarget and in Vagrant
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup # NOTYET, placeHolder
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup  # NOTYET, placeHolder
$( examplesSeperatorChapter "SERVICES sysCharedPlatform Service Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_sealActuatedServices
${G_myName} ${extraInfo} -i sysCharedPlatform_sealActuatedServices
$( examplesSeperatorChapter "sysCharedPlatform Report -- Ssh In Other -- Dev Examples" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_containerBoxReport
${G_myName} ${extraInfo} -i sysCharedPlatform_containerBoxReport
${G_myName} ${extraInfo} -i devExamples
_EOF_
}

function vis_l1_boxUUIDToBoxNu {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Needs to become consistent with bxGenesis/start/raw-bisos.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    local boxUUID=$(unsitedBisosDeploy.sh -h -v -n showRun -p targetName="${targetName}" -i l1_boxUUID)
    # echo "ZZ K-${boxUUID}"

    lpDo svcInvSiteRegBox.cs  -i reg_box_find uniqueBoxId ${boxUUID}
}


function vis_l1_unsitedBisos {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update distro, and bring it to bisosBasePlatform.
*** TargetOnly -- intra user -- no bisos
*** One of two models. unsitedModel and rawBisosModel Defaults to rawBisosModel
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    EH_assert [ ! -z "${targetName}" ]
    EH_assert [ "${targetName}" != "localhost" ] # Must be invoked OnManger

    local model="rawBisosModel"
    if [ $# -eq 1 ] ; then
        model="$1"
    fi

    if [ "${model}" == "rawBisosModel" ] ; then
        lpDo unsitedBisosDeploy.sh -p targetName="${targetName}" -p debInstAcct="${debInstAcct}" -p debInstAcctPasswd="${debInstAcctPasswd}" -p debInstRootPasswd=${debInstRootPasswd} -i l1_raw_bisos
    elif [ "${model}" == "unsitedModel" ] ; then
        lpDo unsitedBisosDeploy.sh -p targetName="${targetName}" -i l1_fullUpdate
    else
        EH_problem "Unknown Model -- model=${model}"
    fi

}

function vis_l1l2_sitedDevContainer {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Takes a bisosBasePlatform and transforms it to siteBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_l1_unsitedBisos
    lpDo vis_l2_sitedDevContainer
}

function vis_l1l2_sitedContainer {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Takes a bisosBasePlatform and transforms it to siteBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_l1_unsitedBisos
    lpDo vis_l2_sitedContainer
}


function vis_l2_sitedDevContainer {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Takes a bisosBasePlatform and transforms it to siteBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_l2_sitedContainer
    
    lpDo vis_usgConvey_bisosDeveloper

    lpDo vis_l2Plus_devContainer
}

function vis_l2_sitedContainer {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Takes a bisosBasePlatform and transforms it to siteBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_bisosBasePlatform_siteSetup

}

function vis_l3_cntnrThis_activate  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Run sysCharActivate.sh -i cntnrThis_activate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        lpDo sysCharActivate.sh -v -n showRun -i cntnrThis_activate
    }

    function onTargetRun {
        lpDo sysCharActivate.sh -v -n showRun -i cntnrThis_activate
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}


function vis_bisosBasePlatform_siteSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Preps the site (configs for gitlab server, etc) and activates the siteBxo.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        if [ -z "${registrar}" ] ; then
            registrar=$( vis_registrarHostName )
        fi
        if [ -z "${id}" ] ; then
            id=$( vis_registrarUserName )
        fi
        if [ -z "${password}" ] ; then  
            password=$( vis_registrarUserPassword )
        fi
        if [ -z "${siteBxoId}" ] ; then 
            siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )
        fi
    }

    function onTargetRun {
        
        # NOTYET, perhaps this should be done even sooner
        lpDo bisosCurrentsManage.sh ${G_commandPrefs} -i currentsFileCreate
        
        lpDo bisosSiteSetup.sh ${G_commandPrefs} \
             -p registrar="${registrar}" -p id="${id}" -p password="${password}" \
             -i fullUpdate

        lpDo bisosSiteSetup.sh ${G_commandPrefs} \
             -p bpoId="${siteBxoId}" \
             -i activate_siteBxoPlusAndSelect 
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    EH_assert [ ! -z "${registrar}" ]
    EH_assert [ ! -z "${id}" ]
    EH_assert [ ! -z "${password}" ]
    EH_assert [ ! -z "${siteBxoId}" ]

    G_paramCmndOption="-p registrar=${registrar} -p id=${id} -p password=${password} -p siteBxoId=${siteBxoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}


function vis_l2Plus_devContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Materializes DevBpo
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        lpReturn
    }

    function onTargetRun {

        lpDo cntnrDevel.sh ${G_commandPrefs} \
             -i bisosDevBxo_fullSetup
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    # EH_assert [ ! -z "${devBpoId}" ]

    G_paramCmndOption=""

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}




function vis_siteBasePlatform_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # EH_assert [ ! -z "${targetName}" ]

    lpDo vis_siteBasePlatform_newBoxAssign
    lpDo vis_siteBasePlatform_containerBoxAssignAndRepo
    lpDo vis_siteBasePlatform_sysCharContainerBoxRealize
}


function vis_siteBasePlatform_sysBxoActivate {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activates the specified bpoId. Not intended to be used with a Box.
*** For a box, run vis_boxActivateAtSiteBasePlatform instead.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        if [ -z "${bpoId}" ] ; then
            EH_problem "Missing bpoId"
            lpReturn
        fi
    }

    function onTargetRun {
        lpDo sysCharActivate.sh ${G_commandPrefs} \
             -p bpoId="${bpoId}" \
             -i activate_sysContainerBxo

        lpDo sysCharActivate.sh ${G_commandPrefs} \
             -i bisosContainerSelect "${bpoId}"
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    EH_assert [ ! -z "${bpoId}" ]

    G_paramCmndOption="-p bpoId=${bpoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}

#
#
#  #############  Box Specific Facilities
#
#

function vis_boxSiteBasePlatform {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Runs OnMamaner Only. Start at BISOS-Distro (eg Deb11) and gets to site setup.
*** If Box's Character already exists, box's sysChar is deployed on box. Activated.
*** If Box's Character does not exists, box is registered in site & its sysChar is realized.
*** If Box's Character does not exists, model, abode and function should be specified.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]
    targetName=$(lpDo vis_bisosCurrentsObtain "${targetName}")
    EH_assert [ "${targetName}" != "localhost" ] # Must be invoked OnManger

    # NOTYET, commented part below should be absorbed in distro_fullUpdate after sudo addition.
    
    # local bisosAscertain=$( vis_distro_provisionBisos_ascertain )
    
    # if [ -z "${bisosAscertain}" ] ; then
    #   lpDo vis_distro_fullUpdate
    # else
    #   ANT_cooked "BISOS has already been installed -- ${bisosAscertain}"
    # fi

    lpDo vis_distro_fullUpdate    

    # BISOS has been installed and ByStar Account Is Now In Place

    lpDo vis_bisosBasePlatform_fullUpdate  # siteSetup + usgConvey_bisosDeveloper
}


function vis_boxFullActivate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Must be invoked OnManager as vis_boxSiteBasePlatform needs site info.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]
    targetName=$(lpDo vis_bisosCurrentsObtain "${targetName}")
    EH_assert [ "${targetName}" != "localhost" ] # Must be invoked OnManger

    lpDo vis_boxSiteBasePlatform

    lpDo vis_boxActivateAtSiteBasePlatform
}


function vis_boxActivateAtSiteBasePlatform {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate Bxo associated with the box on target. Can be invoked OnManager or OnTarget.
*** Can be invoked OnManager or OnTarget
*** Runs vis_boxRealizeOrActivateOnTarget, for activation (not materialization).
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        local boxBpoId=$( vis_containerBoxBpoId )

        if [ -z "${boxBpoId}" ] ; then
            EH_problem "Box Must Have Been Realized To Be Activated."
            lpReturn 101
        fi

        lpDo vis_boxRealizeOrActivateOnTarget 
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" 
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_boxRealizeOrActivateOnTargetOBSOLETED {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Depending on whether or not, if this is a new box or not, we register and realize or just activate.
*** Can only be invoked OnTarget as relaization involves self Blee dblock features.
*** For activation only, it can be invoked OnManager throuhg vis_boxActivateAtSiteBasePlatform
*** If Box's Character already exists, box's sysChar is deployed on box. Activated.
*** If Box's Character does not exists, box is registered in site & its sysChar is realized.
*** If Box's Character does not exists, model, abode and function should be specified.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # Assumes that
    # BISOS has been installed and ByStar Account Is Now In Place
    # And that site has been setup.

    local siteBoxNu=$( lpDo vis_siteBasePlatform_newBoxAscertain )

    if [ -z "${siteBoxNu}" ] ; then
        lpDo vis_siteBasePlatform_newBoxAssign
    else
        ANT_cooked "siteBoxNu=${siteBoxNu} has already been assined"
    fi

    local siteBoxContainer=$( lpDo vis_siteBasePlatform_containerBoxRepoAscertain )

    if [ -z "${siteBoxContainer}" ] ; then
        EH_assert [ ! -z "${model}" ]
        EH_assert [ ! -z "${abode}" ]
        EH_assert [ ! -z "${function}" ]

        lpDo vis_siteBasePlatform_containerBoxAssignAndRepo
    else
        ANT_cooked "siteBoxContainer=${siteBoxContainer} has already been assined"
    fi

    local boxBpoId=$( vis_containerBoxBpoId )
    EH_assert [ ! -z "${boxBpoId}" ]

    if vis_bxoNameExists "${boxBpoId}" ; then
        bpoId="${boxBpoId}"
        ANT_cooked "boxBpoId=${boxBpoId} -- bpoId=${bpoId} has already been Realized, it can be Activated."
        
        lpDo sysCharActivate.sh ${G_commandPrefs} \
             -p bpoId="${bpoId}" -i activate_sysContainerBxo
    else        
        EH_assert [ ! -z "${model}" ]
        EH_assert [ ! -z "${abode}" ]
        EH_assert [ ! -z "${function}" ]

        lpDo vis_siteBasePlatform_sysCharContainerBoxRealize
        bpoId=$( vis_containerBoxBpoId )
    fi

    lpDo sysCharActivate.sh ${G_commandPrefs} \
         -i bisosContainerSelect "${bpoId}"

    local identityIsSet=$( sysCharIdentity.sh -i identitySetAscertain )
    if [ -z "${identityIsSet}" ] ; then
        lpDo vis_deployWithSysCharConveyInfo
    else
        ANT_cooked "SysChar Identity Is Already Set -- identityIsSet=${identityIsSet}"
    fi
}

function vis_l2Plus_regBoxAscertain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Add thisBox to site info base.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        local boxNu=$( lpDo eval svcInvSiteRegBox.cs -i thisBox_findNu 2\> /dev/null )

        if [ "${boxNu}" = "[]" ] ; then
            ANT_raw "This box has NOT been registered -- Needs to be added"
        else
            ANT_raw "This box (${boxNu}) has already been registered -- addition skipped"
        fi
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both"
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_l2Plus_regContainerBoxAscertain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Ascertain that containerAssignBase= and containerRepoBase= are in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        local containerCharNames=$( lpDo eval svcInvSiteRegContainer.cs  -i thisSys_locateBoxInAll 2\> /dev/null \| pyLiteralToBash.cs -i stdinToBash )

        if [ -z "${containerCharNames}" ] ; then
            ANT_raw "No containerCharName found for this box"
            lpReturn
        fi

        ANT_raw "${containerCharNames}"
    }

####+BEGIN: bx:bsip:bash/onTargetRun
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_l2Plus_cntnrThis_regBpoId {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** onTarget obtain the bpoId for the box, the bpoId account may or may not exist.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        local regBpoId=$( lpDo eval cntnrCharThis.cs -i cntnrThis_regBpoId 2\> /dev/null )
        echo "${regBpoId}"
        lpReturn
    }

####+BEGIN: bx:bsip:bash/onTargetRun 
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}


function vis_l2Plus_boxNameUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Using svcInvSiteRegBox.cs, we register as new box if needed.
*** Can be invoked OnTarget or OnManager.
*** When OnManager, the registration on target is reflected on manager with a boxesGitPull.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    local boxName="UnNamed"
    
    if [ $# -eq 1 ] ; then
        boxName="$1"
    fi

    function onTargetRun {
        lpDo svcInvSiteRegBox.cs --boxName="${boxName}"  -i thisBox_update
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both"
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_l3_charedContainerBoxRealize {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Can only be invoked OnTarget as relaization involves self Blee dblock features.
*** For activation only, it can be invoked OnManager throuhg vis_boxActivateAtSiteBasePlatform
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
        lpDo sysCharRealize.sh ${G_commandPrefs} \
             -p model=${model} -p abode=${abode} -p function=${function} \
             -i containerAssignAndRepoAndSysCharRealize
    else
        EH_problem "Bad Usage: sysCharRealize.sh can only be invoked on Target"
        lpReturn
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which sysCharRealize.sh) ${G_commandPrefs} \
             -p model=${model} -p abode=${abode} -p function=${function} \
             -i containerAssignAndRepoAndSysCharRealize
    fi
}

function vis_l3_charedContainerBoxActivate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
        lpDo sysCharRealize.sh ${G_commandPrefs} \
             -p model=${model} -p abode=${abode} -p function=${function} \
             -i sysCharContainerBoxRealize
    else
        EH_problem "Bad Usage: sysCharRealize.sh can only be invoked on Target"
        lpReturn
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which sysCharRealize.sh) ${G_commandPrefs} \
             -p model=${model} -p abode=${abode} -p function=${function} \
             -i sysCharContainerBoxRealize
    fi
}


function vis_l5_materializedContainer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
*** Wrapper for sysCharBoxMaterialize.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
        lpDo sysCharBoxMaterialize.sh ${G_commandPrefs} \
             -i materializedContainerThis
    else
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which sysCharBoxMaterialize.sh) ${G_commandPrefs} \
             -i materializedContainerThis
    fi
}


function vis_containerBoxBpoPath {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** onTarget obtain the bpoId for the box, the bpoId account may or may not exist.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # sysCharRealize.sh -h -v -n showRun -i sysCharContainerBxoIdName

    function onTargetRun {
        local containerAssignBase=""

        containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
        if [ -z "${containerAssignBase}" ] ; then
            ANT_raw "Missing containerAssignBase"
            lpReturn
        fi

        local sysCharContainerBpoId=$( vis_sysCharContainerBxoIdName ${containerAssignBase} )
        local bpoHome=""
        
        if vis_userAcctExists ${sysCharContainerBpoId} ; then
            bpoHome=$( FN_absolutePathGet ~${sysCharContainerBpoId} )
        else
            EH_problem "${sysCharContainerBpoId} Account Does Not Exist"
        fi
        echo ${bpoHome}

    }

####+BEGIN: bx:bsip:bash/onTargetRun 
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}



function vis_deployWithSysCharConveyInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Activate essential site BxOs. Activate bpoId.
Set identity. Set Mode (dev vs prod). deploy svcs.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
        EH_assert bpoIdPrep

        lpDo vis_deploySysChar_identitySet
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bpoId=${bpoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}

function vis_deploySysChar_identitySet {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Set container's identity based on sysChar. -p targetName -p bpoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
        EH_assert bpoIdPrep

        lpDo sysCharIdentity.sh ${G_commandPrefs} \
             -p bpoId="${bpoId}" -i identityUpdate
        # sysCharIdentity.sh: Sets up motdSet, hostname, netL3Interface, netEtcHosts
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bpoId=${bpoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}

#
#
#  BOX Based ACTIONS and REALIZATIONS
#
#

function vis_deploySysChar_identitySet_forBox {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Set container's identity based on sysChar. -p targetName -p bpoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        # determin bpoId for box

        local containerBase=$( vis_forThisSysFindContainerBase )
        EH_assert [ ! -z "${containerBase}" ]

        vis_containerAssignRead "${containerBase}"
        EH_assert [ ! -z "${containerAssign_containerId}" ]

        local hostContainerId="${containerAssign_containerId}"
    
        bpoId=$( withContainerIdGetBxoId ${hostContainerId} )
        EH_assert vis_bxoAcctVerify "${bpoId}"

        lpDo vis_deployWithSysCharConveyInfo
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption nil
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun  -i ${commandName}
    fi
####+END:
}

function vis_deploySysChar_sysBin_setup {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Set container's identity based on sysChar. -p targetName -p bpoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        EH_assert bpoIdPrep

        ${bpoHome}/sys/bin/bpoSysSetup.sh ${G_commandPrefs} \
                  -i setup
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun $(sansTargetName "${G_paramCmndOption}") \
             -i ${commandName}
    fi
####+END:
}

function vis_sysCharedPlatform_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_sysCharedPlatform_actuateServices
    lpDo vis_sysCharedPlatform_sealActuatedServices    
}


function vis_sysCharedPlatform_actuateServices {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
        lpDo echo bisosSiteSetup.sh NOTYET
    else
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" echo bisosSiteSetup.sh NOTYET
    fi
}

function vis_sysCharedPlatform_sealActuatedServices {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
        lpDo echo bisosSiteSetup.sh NOTYET
    else
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" echo bisosSiteSetup.sh NOTYET
    fi
}


function vis_sysCharedPlatform_containerBoxReport {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
        lpDo sysCharRealize.sh ${G_commandPrefs} \
             -i containerBoxSysCharReport
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" 
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_conveyInfoStore {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        if [ -z "${cfpPrivA}" ] ; then
            lpDo echo "prompt"
        fi
        if [ -z "${cfpPubA}" ] ; then
            lpDo echo "prompt"
        fi
        # if [ -z "${cfpPrivGit}" ] ; then
        #     lpDo echo "prompt"
        # fi
        # if [ -z "${cfpPubGit}" ] ; then
        #     lpDo echo "prompt"
        # fi
        if [ -z "${cfpSecurityMode}" ] ; then
            lpDo echo "prompt"
        fi
    }

    function onTargetRun {
        EH_assert bpoIdPrep

        local sysCharConveyInfoBase="${bpoHome}/var/sysCharConveyInfo"

        lpDo FN_dirCreatePathIfNotThere ${sysCharConveyInfoBase}

        if [ ! -z "${cfpVmNameQualifier}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} vmNameQualifier "${cfpVmNameQualifier}"
        fi
        if [ ! -z "${cfpHostCntnr}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} hostCntnr "${cfpHostCntnr}"
        fi
        if [ ! -z "${cfpSecurityMode}" ] ; then
            lpDo sysCharConveyInfoWrite securityMode "${cfpSecurityMode}"
        fi

        if [ ! -z "${cfpPrivA}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} ipAddr_privA "${cfpPrivA}"
        fi
        if [ ! -z "${cfpPubA}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} ipAddr_pubA "${cfpPubA}"
        fi
        
        # if [ ! -z "${cfpPrivGit}" ] ; then
        #     lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} privGit "${privGit}"
        # fi
        # if [ ! -z "${cfpPubGit}" ] ; then
        #     lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} pubGit "${pubGit}"
        # fi
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    # Empty values are passed along

    # G_paramCmndOption="-p bpoId=\"${bpoId}\" -p cfpVmNameQualifier=\"${cfpVmNameQualifier}\" -p cfpPrivA=\"${cfpPrivA}\" -p cfpPubA=\"${cfpPubA}\" -p cfpSecurityMode=\"${cfpSecurityMode}\""
    G_paramCmndOption="-p bpoId=\"${bpoId}\" -p cfpVmNameQualifier=\"${cfpVmNameQualifier}\" -p cfpHostCntnr=\"${cfpHostCntnr}\" -p cfpSecurityMode=\"${cfpSecurityMode}\""
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}


function vis_conveyNetInfoStore {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local netName="$1"

    function onManagerRun {
        lpDo doNothing
    }

    function onTargetRun {
        EH_assert bpoIdPrep
        local netName="$1"
        
        local sysCharConveyNetInfoBase="${bpoHome}/var/sysCharConveyInfo/netIfs"

        lpDo FN_dirCreatePathIfNotThere ${sysCharConveyNetInfoBase}

        if [ ! -z "${cfpNetIf}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyNetInfoBase} ${netName} "${cfpNetIf}"
        fi
        if [ ! -z "${cfpNetIfControl}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyNetInfoBase} ${netName}-control "${cfpNetIfControl}"
        fi
        if [ ! -z "${cfpHostNetIf}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyNetInfoBase} ${netName}-host "${cfpHostNetIf}"
        fi
        if [ ! -z "${cfpNetAddr}" ] ; then
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyNetInfoBase} ${netName}-ipv4Addr "${cfpNetAddr}"
        fi
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    # Empty values are passed along

    G_paramCmndOption="-p bpoId=\"${bpoId}\" -p cfpNetIf=\"${cfpNetIf}\" -p cfpHostNetIf=\"${cfpHostNetIf}\""

    g_args=$@
    
####+BEGINNOT: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun ${g_args}
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun ${g_args}
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName} ${g_args}
    fi
####+END:
}


function vis_conveyInfoShow {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
        EH_assert bpoIdPrep

        local sysCharConveyInfoBase="${bpoHome}/var/sysCharConveyInfo"

        lpDo  fileParamManage.py -i fileParamDictReadDeep ${sysCharConveyInfoBase}
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bpoId=${bpoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}


function vis_recordDeployment {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Use the sysChar BxO to record that the VM was deployed.
_EOF_
                       }
    local thisDescribeF=$(describeF)
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo printf ${thisDescribeF}
    
    lpReturn
}       


function vis_usgConvey_bisosDeveloper {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Preps the site (configs for gitlab server, etc) and activates the siteBxo.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
        if [ -z "${bisosDevBxoId}" ] ; then
            bisosDevBxoId=$( vis_usgBposUsageEnvs_bisosDevBxoId_read )
            EH_assert [ ! -z "${bisosDevBxoId}" ]
        fi
    }

    function onTargetRun {
        lpDo usgBpos.sh ${G_commandPrefs} \
         -i usgBposUsageEnvs_bisosDevBxoId_write ${bisosDevBxoId}
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
        lpDo onManagerRun
    fi

    EH_assert [ ! -z "${bisosDevBxoId}" ]

    G_paramCmndOption="-p bisosDevBxoId=${bisosDevBxoId}"
    
####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "bystar" :managerOrTarget "both" :cmndOption t
    if [ "${targetName}" == "onTargetRun" ] ; then
        lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
             $(which ${G_myName}) ${G_commandPrefs} \
             -p targetName=onTargetRun ${G_paramCmndOption} -i ${commandName}
    fi
####+END:
}



function vis_devExamples {
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

    visLibExamplesOutput ${G_myName}
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${effectiveContainerBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox 192.168.0.45
${curTargetBox:-}
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "LAYER-1:: unsitedBisosDeploy.sh  -- Distro Actions -- On Manager -- Ssh Into Target" )
unsitedBisosDeploy.sh
unsitedBisosDeploy.sh ${extraInfo} -p targetName="${oneTargetName}" -i fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_ascertain
$( examplesSeperatorSection "L1:: Target Box Developmenet Preps -- On Target Box" )
ssh -X bystar@${oneTargetName}    # Then run emacs
bleeVisit /bisos/panels/development/bisos-dev/howToBecomeDeveloper/fullUsagePanel-en.org
$( examplesSeperatorChapter "LAYER-2:: Sited-Container (Registrar Not Here, in bisos-pip.siteRegistrar) -- bisosBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_fullUpdate # onManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_siteSetup # onManager or below onTarget
${G_myName} ${extraInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -p siteBxoId=${siteBxoId}" -i bisosBasePlatform_siteSetup # onTarget
cntnrDevel.sh -h -v -n showRun -i bisosDevBxo_fullSetup  # activate bisosDevBxoId and actuate it
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i  sitedDevelContainer  # PRIMARY
$( examplesSeperatorChapter "LAYER-3:: Chared-Container -- (Realize or Activate) SysChar Setup (with sysCharBpo) -- siteBasePlatform Actions" )
$( examplesSeperatorSection "L3:: siteBasePlatform New Box Assign -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_newBoxAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_newBoxAscertain
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_newBoxAssign
${G_myName} ${extraInfo} -i siteBasePlatform_newBoxAssign
$( examplesSeperatorSection "L3:: siteBasePlatform New Container Assign -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_containerBoxRepoAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_containerBoxRepoAscertain
$( examplesSeperatorSection "L3:: SysBxo Realize -- Container Box Realize -- One Time Activity --  On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_containerBoxRepoAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_containerBoxRepoAscertain
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharContainerBoxRealize
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharContainerBoxRealize
$( examplesSeperatorChapter "siteBasePlatform Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharBoxIdentitySet # NOTYET, likely not necessary
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharBoxIdentitySet # NOTYET, likely not necessary
$( examplesSeperatorChapter "L3:: Full New Box Actions -- On Manager And On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i boxSiteBasePlatform  # OnManager
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i boxRealizeOrActivateOnTarget # OnTarget Only
$( examplesSeperatorChapter "L3:: Full Existing Box Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i boxFullActivate # On Manager From Begining-To-End
$( examplesSeperatorChapter "Full Existing Box Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i containerBoxBpoId
${G_myName} ${extraInfo} -i containerBoxBpoId
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i containerBoxBpoPath
${G_myName} ${extraInfo} -i containerBoxBpoPath
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_fullUpdate  # onManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysBxoActivate  # onManager
${G_myName} ${extraInfo} -p bpoId="${bpoId}" -i siteBasePlatform_sysBxoActivate  # onTarget
$( examplesSeperatorChapter "Specify ConveyInfo (to Guest) -- sysCharBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpPrivA=192.168.0.121 -i conveyInfoStore # For Generic Guests
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpNetIf=eth2 -i conveyNetInfoStore pubA
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -p cfpHostNetIf=eno1 -i conveyNetInfoStore pubA
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i conveyInfoShow
$( examplesSeperatorChapter "Deploy With Convey Info -- FULL SYSTEM Deployment" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onManager
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onTarget
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bpoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup # NOTYET, placeHolder
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup  # NOTYET, placeHolder
$( examplesSeperatorChapter "sysCharedPlatform Service Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_sealActuatedServices
${G_myName} ${extraInfo} -i sysCharedPlatform_sealActuatedServices
$( examplesSeperatorChapter "sysCharedPlatform Report -- Ssh In Other" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_containerBoxReport
${G_myName} ${extraInfo} -i sysCharedPlatform_containerBoxReport
$( examplesSeperatorChapter "BISOS Development Preps -- bisosBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i usgConvey_bisosDeveloper # onManager+onTarget
${G_myName} ${extraInfo} -p bisosDevBxoId=prompt -i usgConvey_bisosDeveloper # onTarget
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
