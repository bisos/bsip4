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

. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

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

typeset -t bxoId=""
typeset -t privA=""
typeset -t registrar=""
typeset -t id=""
typeset -t password=""
typeset -t siteBxoId=""
typeset -t bisosDevBxoId=""

typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

typeset -t cfpPrivA=""
typeset -t cfpPubA=""
typeset -t cfpSecurityMode=""

typeset -t targetName=""

sshCmnd="ssh -o StrictHostKeyChecking=no"


function G_postParamHook {
    bxoIdPrepValidate    

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi
    
    # bisosCurrentsGet
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

    #bisosCurrentsGet

    local effectiveContainerBxoId="sysChar"

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )

    local registrar=$( vis_registrarHostName )
    local id=$( vis_registrarUserName )
    local password=$( vis_registrarUserPassword )        

    # local oneTargetName="192.168.0.38"
    # local oneTargetName="192.168.0.37"
    local oneTargetName="localhost"
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${effectiveContainerBxoId}"
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "Full Update" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i fullUpdate
$( examplesSeperatorChapter "Distro Actions -- On Manager -- Ssh In Target" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_fullUpdate # intra user
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_intraToSudoersAddition # ManagerOnly -- intra user
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_aptSourcesPrep # ManagerOnly -- intra user
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_sysBasePlatform # ManagerOnly -- intra user
$( examplesSeperatorChapter "Site Setup -- bisosBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_fullUpdate # onManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_siteSetup # onManager
${G_myName} ${extraInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -p siteBxoId=${siteBxoId}" -i bisosBasePlatform_siteSetup # onTarget
$( examplesSeperatorChapter "SysChar Setup -- siteBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_fullUpdate  # onManager
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysBxoActivate  # onManager
${G_myName} ${extraInfo} -p bxoId="${bxoId}" -i siteBasePlatform_sysBxoActivate  # onTarget
$( examplesSeperatorChapter "Specify ConveyInfo -- sysCharBasePlatform Actions" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bxoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -p cfpPrivA=192.168.0.121 -i conveyInfoStore # For Generic Guests
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -p cfpSecurityMode=bisosDev -i conveyInfoStore
$( examplesSeperatorChapter "Deploy With Convey Info -- FULL SYSTEM Deployment" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bxoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onManager
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i deployWithSysCharConveyInfo # onTarget
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p bxoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup # NOTYET, placeHolder
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i deploySysChar_sysBin_setup  # NOTYET, placeHolder
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
$( examplesSeperatorChapter "Target Box Developmenet Preps -- On Target Box" )
ssh -X bystar@${oneTargetName}    # Then run emacs
bleeVisit /bisos/panels/bisos-dev/howToBecomeDeveloper/fullUsagePanel-en.org
$( examplesSeperatorChapter "siteBasePlatform Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_newBoxAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_newBoxAscertain
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_newBoxAssign
${G_myName} ${extraInfo} -i siteBasePlatform_newBoxAssign
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p model=Host -p abode=Shield -p function=Server -i siteBasePlatform_containerBoxAssignAndRepo
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i siteBasePlatform_containerBoxAssignAndRepo
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_containerBoxSiteAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_containerBoxSiteAscertain
$( examplesSeperatorChapter "SysBxo Realize -- Container Box Realize -- One Time Activity --  On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharContainerBoxRealize
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharContainerBoxRealize
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i siteBasePlatform_containerBoxAssignAndRepo
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_containerBoxBpoAscertain
${G_myName} ${extraInfo} -i siteBasePlatform_containerBoxBpoAscertain
$( examplesSeperatorChapter "siteBasePlatform Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharBoxIdentitySet # NOTYET, likely not necessary
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharBoxIdentitySet # NOTYET, likely not necessary
_EOF_
}



function vis_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update Everything.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_distro_fullUpdate
}

function vis_distro_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update distro, and bring it to bisosBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_distro_intraToSudoersAddition
    lpDo vis_distro_aptSourcesPrep
    lpDo vis_distro_provisionBisos_sysBasePlatform
}


function vis_distro_intraToSudoersAddition {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Specific to debian. Allow for sudo-ing as intra.
*** By policy, at distro installation, intra is used as acctName, acctNamePasswd and rootPasswd
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	# redirection of stderr gets rid of the Password: prompt, which can throw emacs off
	local intraLine=$( echo intra | su - root -c 'egrep ^intra /etc/sudoers' 2> /dev/null )

	if [ -z "${intraLine}" ] ; then
	    lpDo eval "echo intra | su - root -c 'echo intra ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers'"
	else
	    ANT_raw "intra is already in /etc/sudoers -- skipped"
	fi
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "intra" :managerOrTarget "manager" 
    if [ -z "${targetName}" ] ; then
       ANT_raw "Can Only Be Run On Manager -- Can Not Be Run On Target."
       lpReturn
    fi
    if [ "${targetName}" == "onTargetRun" ] ; then
	lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
	lpDo onTargetRun
    else
	local commandName=${FUNCNAME##vis_}		
	lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	     $(which ${G_myName}) ${G_commandPrefs} \
	     -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}


function vis_distro_aptSourcesPrep {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Setup apt/sources.list for initial use. Different for debian and ubuntu
*** In a debian box, the deb cdrom: line needs to be removed.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	if [ -e /etc/apt/sources.list.orig ] ; then
	    ANT_raw "/etc/apt/sources.list.orig exists -- copying skipped"
	else
	    sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.orig
	fi

	# In "''" "" is consumed by lpDo
	lpDo eval \
	     grep -v "'^deb cdrom:'" /etc/apt/sources.list \> /tmp/sources.list

	lpDo eval \
	     sudo mv /tmp/sources.list /etc/apt/sources.list

	lpDo eval \
	     sudo apt-get update
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "intra" :managerOrTarget "manager" 
    if [ -z "${targetName}" ] ; then
       ANT_raw "Can Only Be Run On Manager -- Can Not Be Run On Target."
       lpReturn
    fi
    if [ "${targetName}" == "onTargetRun" ] ; then
	lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
	lpDo onTargetRun
    else
	local commandName=${FUNCNAME##vis_}		
	lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	     $(which ${G_myName}) ${G_commandPrefs} \
	     -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_distro_provisionBisos_sysBasePlatform {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies identically to all distros.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	lpDo sudo apt-get install -y python3-pip
    
	lpDo sudo pip3 install --upgrade bisos.provision
    
	lpDo sudo provisionBisos.sh ${G_commandPrefs} -i sysBasePlatform
    }

####+BEGIN: bx:bsip:bash/onTargetRun :sshAcct "intra" :managerOrTarget "manager" 
    if [ -z "${targetName}" ] ; then
       ANT_raw "Can Only Be Run On Manager -- Can Not Be Run On Target."
       lpReturn
    fi
    if [ "${targetName}" == "onTargetRun" ] ; then
	lpDo onTargetRun
    elif [ -z "${targetName}" ] ; then
	lpDo onTargetRun
    else
	local commandName=${FUNCNAME##vis_}		
	lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	     $(which ${G_myName}) ${G_commandPrefs} \
	     -p targetName=onTargetRun -i ${commandName}
    fi
####+END:
}

function vis_bisosBasePlatform_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Takes a bisosBasePlatform and transforms it to siteBasePlatform.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo vis_bisosBasePlatform_siteSetup
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
	lpDo bisosSiteSetup.sh ${G_commandPrefs} \
	     -p registrar="${registrar}" -p id="${id}" -p password="${password}" \
	     -i fullUpdate

	lpDo bisosSiteSetup.sh ${G_commandPrefs} \
	     -p bxoId="${siteBxoId}" \
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
** Preps the site (configs for gitlab server, etc) and activates the siteBxo.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun {
	if [ -z "${bxoId}" ] ; then
	    # if physical from box, otherwise prompt for spec
	    # NOTYET
	    bxoId="sysChar"
	fi
    }

    function onTargetRun {
	lpDo sysCharActivate.sh ${G_commandPrefs} \
	     -p bxoId="${bxoId}" \
	     -i activate_sysContainerBxo
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
	lpDo onManagerRun
    fi

    EH_assert [ ! -z "${bxoId}" ]

    G_paramCmndOption="-p bxoId=${bxoId}"
    
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




function vis_siteBasePlatform_newBoxAscertain {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Add thisBox to site info base.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	local boxNu=$( siteBoxAssign.sh -i thisBoxFindNu )

	if [ -z "${boxNu}" ] ; then
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

function vis_siteBasePlatform_newBoxAssign {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Add thisBox to site info base.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	local boxNu=$( siteBoxAssign.sh -i thisBoxFindNu )

	if [ -z "${boxNu}" ] ; then
	    lpDo siteBoxAssign.sh ${G_commandPrefs} -i thisBoxAddAndPush
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
    
    # Manager Run
    if [ "${targetName}" != "onTargetRun" ] ; then
	lpDo siteBoxAssign.sh ${G_commandPrefs} -i boxesGitPull
    fi
}


function vis_siteBasePlatform_containerBoxAssignAndRepo {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${model}" ]   
    EH_assert [ ! -z "${abode}" ]
    EH_assert [ ! -z "${function}" ]

    if [ -z "${targetName}" ] ; then
	lpDo sysCharRealize.sh ${G_commandPrefs} \
	     -p model=${model} -p abode=${abode} -p function=${function} -i containerBoxAssignAndRepo
    else
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which sysCharRealize.sh) ${G_commandPrefs} \
	     -p model=${model} -p abode=${abode} -p function=${function} -i containerBoxAssignAndRepo
    fi
}

function vis_siteBasePlatform_containerBoxSiteAscertain {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local containerAssignBase=""
    local containerRepoBase=""

    if [ -z "${targetName}" ] ; then
	containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
	EH_assert [ ! -z "${containerAssignBase}" ]

	echo "containerAssignBase=${containerAssignBase}"	

	containerRepoBase=$( siteContainerRepo.sh -i containerRepoBase "${containerAssignBase}" )
	EH_assert [ -d "${containerRepoBase}" ]

	echo "containerRepoBase=${containerRepoBase}"
    else
	containerAssignBase=$( sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
				     $(which siteContainerAssign.sh) \
				     -i forThisSysFindContainerBase )
	EH_assert [ ! -z "${containerAssignBase}" ]

	echo "containerAssignBase=${containerAssignBase}"
	
	containerRepoBase=$( sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
				     $(which siteContainerRepo.sh) \
				     -i containerRepoBase "${containerAssignBase}" )
	EH_assert [ ! -z "${containerRepoBase}" ]

	echo "containerRepoBase=${containerRepoBase}"
    fi
}


function vis_siteBasePlatform_sysCharContainerBoxRealize {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
	lpDo sysCharRealize.sh ${G_commandPrefs} \
	     -i sysCharContainerBoxRealize
    else    
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which sysCharRealize.sh) ${G_commandPrefs} \
	     -i sysCharContainerBoxRealize
    fi
}

function vis_siteBasePlatform_containerBoxBpoAscertain {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Ascertain that containerAssignBase= and containerRepoBase= are in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # sysCharRealize.sh -h -v -n showRun -i sysCharContainerBxoIdName

    function onTargetRun {
	local containerAssignBase=""
	local containerRepoBase=""

	containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
	EH_assert [ ! -z "${containerAssignBase}" ]

	echo "containerAssignBase=${containerAssignBase}"	

	containerRepoBase=$( siteContainerRepo.sh -i containerRepoBase "${containerAssignBase}" )
	EH_assert [ -d "${containerRepoBase}" ]

	echo "containerRepoBase=${containerRepoBase}"
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
Activate essential site BxOs. Activate bxoId.
Set identity. Set Mode (dev vs prod). deploy svcs.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
	EH_assert bxoIdPrep

	local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

	# local siteBoxId=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} siteBxoId )
    
	local ipAddr_privA=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} ipAddr_privA )
	local ipAddr_pubA=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} ipAddr_pubA )
	local privGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} privGit )
	local pubGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} pubGitMode )
	local devMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} devMode )

	lpDo vis_deploySysChar_identitySet
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bxoId=${bxoId}"
    
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
** Set container's identity based on sysChar. -p targetName -p bxoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
	EH_assert bxoIdPrep

	lpDo sysCharIdentity.sh ${G_commandPrefs} \
	     -p bxoId="${bxoId}" -i identityUpdate
	# sysCharIdentity.sh: Sets up motdSet, nodename, netL3Interface, netEtcHosts
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bxoId=${bxoId}"
    
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
** Set container's identity based on sysChar. -p targetName -p bxoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	# determin bxoId for box

	local containerBase=$( vis_forThisSysFindContainerBase )
	EH_assert [ ! -z "${containerBase}" ]

	vis_containerAssignRead "${containerBase}"
	EH_assert [ ! -z "${containerAssign_containerId}" ]

	local hostContainerId="${containerAssign_containerId}"
    
	bxoId=$( withContainerIdGetBxoId ${hostContainerId} )
	EH_assert vis_bxoAcctVerify "${bxoId}"

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
** Set container's identity based on sysChar. -p targetName -p bxoId.
*** onTargetRun :sshAcct "bystar" :managerOrTarget "both"
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onTargetRun {
	EH_assert bxoIdPrep

	${bxoHome}/sys/bin/bxoSysSetup.sh ${G_commandPrefs} \
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
	EH_assert bxoIdPrep

	local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

	lpDo FN_dirCreatePathIfNotThere ${sysCharDeployInfoBase}

	if [ ! -z "${cfpPrivA}" ] ; then
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} ipAddr_privA "${cfpPrivA}"
	fi
	if [ ! -z "${cfpPubA}" ] ; then
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} ipAddr_pubA "${cfpPubA}"
	fi
	# if [ ! -z "${cfpPrivGit}" ] ; then
	#     lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} privGit "${privGit}"
	# fi
	# if [ ! -z "${cfpPubGit}" ] ; then
	#     lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} pubGit "${pubGit}"
	# fi
	if [ ! -z "${cfpSecurityMode}" ] ; then
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} devMode "${cfpSecurityMode}"
	fi
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then
	lpDo onManagerRun
    fi

    # Empty values are passed along

    G_paramCmndOption="-p bxoId=\"${bxoId}\" -p cfpPrivA=\"${cfpPrivA}\" -p cfpPubA=\"${cfpPubA}\" -p cfpSecurityMode=\"${cfpSecurityMode}\""
    
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


function vis_conveyInfoShow {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    function onManagerRun { doNothing; }

    function onTargetRun {
	EH_assert bxoIdPrep

	local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

	lpDo  fileParamManage.py -i fileParamDictReadDeep ${sysCharDeployInfoBase}
    }

    if [ "${targetName}" != "onTargetRun" ] && [ ! -z "${targetName}" ] ; then lpDo onManagerRun; fi

    G_paramCmndOption="-p bxoId=${bxoId}"
    
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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

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
