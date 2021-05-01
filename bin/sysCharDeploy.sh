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

# PRE parameters

typeset -t bxoId=""
typeset -t privA=""
typeset -t registrar=""
typeset -t id=""
typeset -t password=""

typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

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

    local selectedContainerBxoId=$( vis_selectedContainerBxoId 2> /dev/null )

    if [ -z "${selectedContainerBxoId}" ] ; then

	local containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
	EH_assert [ ! -z "${containerAssignBase}" ]
   
	local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName ${containerAssignBase} )

	effectiveContainerBxoId="${sysCharContainerBxoId}"
    else
	effectiveContainerBxoId="${selectedContainerBxoId}"
    fi

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )

    local registrar=$( vis_registrarHostName )
    local id=$( vis_registrarUserName )
    local password=$( vis_registrarUserPassword )        

    # local oneTargetName="192.168.0.38"
    local oneTargetName="192.168.0.34"
    # local oneTargetName="localhost"
    
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
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_intraToSudoersAddition
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_aptSourcesPrep
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_sysBasePlatform
$( examplesSeperatorChapter "bisosBasePlatform Actions -- On Manager -- Ssh In Other" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_fullUpdate
${G_myName} ${extraInfo} -i bisosBasePlatform_fullUpdate  # Without targetName means Here
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i bisosBasePlatform_siteSetup
$( examplesSeperatorChapter "siteBasePlatform Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_fullUpdate
${G_myName} ${extraInfo} -i siteBasePlatform_fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_newBoxAssign
${G_myName} ${extraInfo} -i siteBasePlatform_newBoxAssign
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -p model=Host -p abode=Shield -p function=Server -i siteBasePlatform_containerBoxAssignAndRepo
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i siteBasePlatform_containerBoxAssignAndRepo
$( examplesSeperatorChapter "Container Box Realize -- One Time Activity --  On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharContainerBoxRealize
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharContainerBoxRealize
$( examplesSeperatorChapter "siteBasePlatform Actions -- On Manager Or On Target Box" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharBoxIdentitySet
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharBoxIdentitySet
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_sysCharBoxIdentitySet
${G_myName} ${extraInfo} -i siteBasePlatform_sysCharBoxIdentitySet
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_deployBox
${G_myName} ${extraInfo} -i siteBasePlatform_deployBox
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i siteBasePlatform_deployWithSysChar
${G_myName} ${extraInfo} -i siteBasePlatform_deployWithSysChar
$( examplesSeperatorChapter "sysCharedPlatform Service Actions -- Ssh In Other" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -i sysCharedPlatform_fullUpdate
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -i sysCharedPlatform_actuateServices
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_sealActuatedServices
${G_myName} ${extraInfo} -i sysCharedPlatform_sealActuatedServices
$( examplesSeperatorChapter "sysCharedPlatform Report -- Ssh In Other" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i sysCharedPlatform_containerBoxReport
${G_myName} ${extraInfo} -i sysCharedPlatform_containerBoxReport
$( examplesSeperatorChapter "VAGRANT Model -- FULL SYSTEM Deployment" )
${G_myName} ${extraInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -i bisosSiteSetup
${G_myName} ${extraInfo} -i bisosSiteSetup
${G_myName} ${extraInfo} -i activate_siteBxoPlusAndSelect "${effectiveContainerBxoId}"
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i activate_sysBxo
# ${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i capture_siteBxo ${siteBxoId}
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -p privA=192.168.0.121 -i capture_identity
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -p privGit=anon -p pubGit=anon -p devMode=someTag -i capture_accessMode
$( examplesSeperatorChapter "VAGRANT Model -- FULL SYSTEM Deployment" )
${G_myName} ${extraInfo} -p bxoId="${effectiveContainerBxoId}" -i deployWithSysCharDeployInfo
$( examplesSeperatorSection "Update" )
${G_myName} ${extraInfo} -i activate_siteBxoPlus ${siteBxoId}
${G_myName} ${extraInfo} -i identityUpdate
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} -p bxoId="${effectiveContainerBxoId}" -i sysCharReport
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
*** in the command below intra is used 4 times. acctName is used twice.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    # redirection of stderr gets rid of the Password: prompt, which can throw emacs off
    local intraLine=$( sshpass -p intra ${sshCmnd} intra@"${targetName}" "echo intra | su - root -c 'egrep ^intra /etc/sudoers'" 2> /dev/null )

    if [ -z "${intraLine}" ] ; then
	lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	     "echo intra | su - root -c 'echo intra ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers'"
    else
	ANT_raw "intra is already in /etc/sudoers -- skipped"
    fi
}


function vis_distro_aptSourcesPrep {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Setup apt/sources.list for initial use. Different for debian and ubuntu
*** In a debian box, the deb cdrom: line needs to be removed.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    local lsOrig=$( sshpass -p intra ${sshCmnd} intra@"${targetName}" sudo ls /etc/apt/sources.list.orig 2> /dev/null )

    if [ -z "${lsOrig}" ] ; then
	lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	     sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.orig
    else
	ANT_raw "/etc/apt/sources.list.orig exists -- copying skipped"
    fi

    # In "''" "" is consumed by lpDo
    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 grep -v "'^deb cdrom:'" /etc/apt/sources.list \> /tmp/sources.list

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 sudo mv /tmp/sources.list /etc/apt/sources.list

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 sudo apt-get update
}

function vis_distro_provisionBisos_sysBasePlatform {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies identically to all distros.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 sudo apt-get install -y python3-pip
    
    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 sudo pip3 install --upgrade bisos.provision
    
    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
	 sudo provisionBisos.sh ${G_commandPrefs} -i sysBasePlatform
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

    local registrar=$( vis_registrarHostName )
    local id=$( vis_registrarUserName )
    local password=$( vis_registrarUserPassword )

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )

    if [ -z "${targetName}" ] ; then
	EH_problem "Can Not Be Run Locally. Run it remotely and specify targetName"
    else
	# Preps Currents and Preps the site (configs for gitlab server, etc)
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which bisosSiteSetup.sh) ${G_commandPrefs} \
	     -p registrar="${registrar}" -p id="${id}" -p password="${password}" \
	     -i fullUpdate
    
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which bisosSiteSetup.sh) ${G_commandPrefs} \
	     -i activate_siteBxoPlusAndSelect "${siteBxoId}"
    fi
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


function vis_siteBasePlatform_newBoxAssign {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Add thisBox to site info base.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local boxNu=""

    if [ -z "${targetName}" ] ; then
	boxNu=$( siteBoxAssign.sh -i thisBoxFindNu )

	if [ -z "${boxNu}" ] ; then
	    lpDo siteBoxAssign.sh ${G_commandPrefs} -i thisBoxAddAndPush
	else
	    ANT_raw "This box (${boxNu}) has already been registered -- addition skipped"
	fi
    else
	boxNu=$( sshpass -p intra ${sshCmnd} intra@"${targetName}" $(which siteBoxAssign.sh) -i thisBoxFindNu )

	if [ -z "${boxNu}" ] ; then
	    lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" $(which siteBoxAssign.sh) ${G_commandPrefs} -i thisBoxAddAndPush
	    lpDo siteBoxAssign.sh ${G_commandPrefs} -i boxesGitPull
	else
	    ANT_raw "This box (${boxNu}) has already been registered -- addition skipped"
	fi
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

function vis_siteBasePlatform_sysCharBoxIdentitySet {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
	lpDo sysCharIdentity.sh ${G_commandPrefs} \
	     -i identityUpdate
    else
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which sysCharIdentity.sh) ${G_commandPrefs} \
	     -i identityUpdate
    fi
}


function vis_siteBasePlatform_deployBox {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${targetName}" ] ; then
	lpDo echo bisosSiteSetup.sh NOTYET
    else
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" echo bisosSiteSetup.sh NOTYET
    fi
}

function vis_siteBasePlatform_deployWithSysChar {    
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

    if [ -z "${targetName}" ] ; then
	lpDo sysCharRealize.sh ${G_commandPrefs} \
	     -i containerBoxSysCharReport
    else
	lpDo sshpass -p intra ${sshCmnd} bystar@"${targetName}" \
	     $(which sysCharRealize.sh) ${G_commandPrefs} \
	     -i containerBoxSysCharReport
    fi
}


function vis_capture_siteBxo%% {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local siteBxoId=$1

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} siteBxoId "${siteBxoId}"
}


function vis_capture_identity {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

    lpDo FN_dirCreatePathIfNotThere ${sysCharDeployInfoBase}
    
    if [ ! -z "${privA}" ] ; then
	lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} ipAddr_privA "${privA}"
    elif [ ! -z "${pubA}" ] ; then
	lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} ipAddr_pubA "${pubA}"
    else
	doNothing
    fi
}



function vis_capture_accessMode {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

    if [ ! -z "${privGit}" ] ; then
	lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} privGit "${privGit}"
    fi
    if [ ! -z "${pubGit}" ] ; then
	lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} pubGit "${pubGit}"
    fi
    if [ ! -z "${devMode}" ] ; then
	lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharDeployInfoBase} devMode "${devMode}"
    fi
}


function vis_deployWithSysCharDeployInfo {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Activate essential site BxOs. Activate bxoId.
Set identity. Set Mode (dev vs prod). deploy svcs.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local sysCharDeployInfoBase="${bxoHome}/var/sysCharDeployInfo"

    # local siteBoxId=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} siteBxoId )
    
    local ipAddr_privA=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} ipAddr_privA )
    local ipAddr_pubA=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} ipAddr_pubA )
    local privGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} privGit )
    local pubGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} pubGitMode )
    local devMode=$( fileParamManage.py -i fileParamRead  ${sysCharDeployInfoBase} devMode )

    local extraInfo="-h -v -n showRun"
    
    # ---- IDENTITY
    lpDo sysCharIdentity.sh ${extraInfo} -p bxoId="${bxoId}" -i motdSet
    lpDo sysCharIdentity.sh ${extraInfo} -p bxoId="${bxoId}" -i nodename
  
    #NETWORK
    lpDo sysCharIdentity.sh ${extraInfo} -p bxoId="${bxoId}" -i netL3Interface
    lpDo sysCharIdentity.sh ${extraInfo} -p bxoId="${bxoId}" -i netEtcHosts

    lpReturn
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
