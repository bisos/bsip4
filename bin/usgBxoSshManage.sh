#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: usgSshAccess.sh,v 1.2 2017-04-09 23:21:06 lsipusr Exp $"
# *CopyLeft*
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
*  /This File/ :: /bisos/core/bsip/bin/usgBxoSshManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# . ${opBinBase}/bystarCentralAcct.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t bxoId=""
typeset -t usg=""
typeset -t bxosBase=""

function G_postParamHook {

    bxoIdPrepValidate
    
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    if [ -z "${usg}" ] ; then
	usg=$( id -u -n )
    fi
    usgHome=$( FN_absolutePathGet ~${usg} )

    usgSshConfigSeg_baseDir=${usgHome}/.ssh/configSeg   # NOTYET still needed. Needs to be cleaned up.
    #vis_usgSshConfigSegBasePrep

    vis_usgSshConfigBasePrep
    
    local siteGitServerInfoBaseDir=$( bisosSiteGitServer.sh -i gitServerInfoBaseDir )
    
    site_gitServerName=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName )
    
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo="
    typeset runInfo="-p ri=lsipusr:passive"

    lpCurrentsGet
    
    #typeset examplesInfo="${extraInfo} ${runInfo}"
    typeset examplesInfo="${extraInfo}"

    local oneBxoId=${currentBxoId}
    #local oneGitBxSeLn="git.bysource.org"
    local oneGitBxSeLn="${site_gitServerName}"

    local oneUsg=${currentUsgUname}

    local oneBxosBase="/bisos/var/bxo/construct"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorSection "BxO Ssh Keys Full Actions" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgBxoFullRebuild
${G_myName} ${examplesInfo} -p usg=${oneUsg} -p bxoId=${oneBxoId} -i usgBxoFullUpdate
${G_myName} ${examplesInfo} -p usg=${oneUsg} -p bxoId=${oneBxoId} -i usgBxoFullDelete
$( examplesSeperatorSection "Custom Ssh Keys Full Actions" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgCustomFullUpdate gitLabel keysBasePath gitServer
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgCustomFullDelete gitLabel
$( examplesSeperatorChapter "Bxo Ssh Private Keys" )
$( examplesSeperatorSection "lcaSshAdmin.sh" )
lcaSshAdmin.sh
lcaSshAdmin.sh -p localUser=lsipusr -p remoteHost=cvs.bysource.org -i hostIsInKnownHostsFile
lcaSshAdmin.sh -p localUser=${oneBxoId} -p sshDir=rbxe/credentials/ssh -i userKeyVerify
lcaSshAdmin.sh -p localUser=${oneBxoId} -p sshDir=rbxe/credentials/ssh -i userKeyUpdate
${G_myName} ${examplesInfo} -p bxoId=${oneBxoId} -i bxoSshKeyVerify
${G_myName} ${examplesInfo} -p bxoId=${oneBxoId} -i bxoSshKeyUpdate
$( examplesSeperatorSection "USG BxO Ssh Invoker Keys Install" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -p bxoId=${oneBxoId} -i usgAcctBxoCredentialsUpdate bxoPriv
${G_myName} ${examplesInfo} -p usg=${oneUsg} -p bxoId=${oneBxoId} -p bxosBase=${oneBxosBase} -i usgAcctBxoCredentialsUpdate bxoPriv
${G_myName} ${examplesInfo} -p usg=${oneUsg} -p bxoId=${oneBxoId} -i usgAcctBxoCredentialsDelete bxoPriv
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCredentialsList bxoPriv
$( examplesSeperatorSection "USG Custom Ssh Invoker Keys Install" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomCredentialsUpdate gitLabel keysBasePath 
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomCredentialsDelete gitLabel
$( examplesSeperatorSection "USG Custom Git Info" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoUpdate gitLabel "firstNameAndLast" "email@example.com" 
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoRead gitLabel  userName userEmail
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoDelete gitLabel
$( examplesSeperatorChapter "USG Ssh Config File Manipulation" )
$( examplesSeperatorSection "USG Ssh Config Segments Base" )
${G_myName} ${extraInfo} -i usgSshConfigSegBasePrep
${G_myName} -i usgSshConfigSegBaseList
$( examplesSeperatorSection "USG Ssh Bxo Config Segment File Update" )
${G_myName} -p bxoId=${oneBxoId} -i bxoConfigSegStdout bxoPriv ${site_gitServerName}
${G_myName} ${extraInfo} -p bxoId=${oneBxoId} -i bxoConfigSegStdout bxoPriv ${site_gitServerName}  # Verbose
${G_myName} ${extraInfo} -p bxoId=${oneBxoId} -i bxoConfigSegFileName bxoPriv ${site_gitServerName}
${G_myName} ${extraInfo} -p bxoId=${oneBxoId} -i bxoConfigSegUpdate bxoPriv ${site_gitServerName}
${G_myName} ${extraInfo} -p bxoId=${oneBxoId} -i bxoConfigSegDelete bxoPriv
${G_myName} ${extraInfo} -p bxoId=${oneBxoId} -i bxoConfigSegExists bxoPriv
$( examplesSeperatorSection "USG Ssh Custom Config Segment File Update" )
${G_myName} -i customConfigSegStdout gitLabel gitServerName
${G_myName} ${extraInfo} -i customConfigSegStdout gitLabel gitServerName  # Verbose
${G_myName} ${extraInfo} -i customConfigSegFileName gitLabel gitServerName
${G_myName} ${extraInfo} -i customConfigSegUpdate gitLabel gitServerName
${G_myName} ${extraInfo} -i customConfigSegDelete gitLabel
${G_myName} ${extraInfo} -i customConfigSegExists gitLabel
$( examplesSeperatorSection "USG Ssh Config File Update" )
${G_myName} ${extraInfo} -i configFileNameGet
${G_myName} ${extraInfo} -i configSegsCollectStdout
${G_myName} ${extraInfo} -i configFileUpdate
${G_myName} ${extraInfo} -i configFileVerify
${G_myName} ${extraInfo} -i configFileShow
${G_myName} ${extraInfo} -i configFileDelete
$( examplesSeperatorSection "Tests And Verifications" )
$( examplesSeperatorChapter "Access, Verification And Test" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i  sshAccessGitolite
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i  sshAccessGitlab
${G_myName%%.sh}-niche.sh
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Full Actions
_CommentEnd_

function bxosBasePrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]    

    if [ ! -z "${bxosBase}" ] ; then
	bxoHome=$( FN_absolutePathGet ${bxosBase}/${bxoId} )
    fi

    lpReturn
}


function vis_usgBxoFullRebuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${usg}" ]

    local bxoIdsList=$( bxoAcctManage.sh -i bxoIdsList )
    local eachBxoId=""

    for eachBxoId in ${bxoIdsList} ; do
	bxoId=${eachBxoId}
	lpDo bxosBasePrep

	opDo vis_usgAcctBxoCredentialsUpdate bxoPriv

	opDo vis_bxoConfigSegUpdate bxoPriv ${site_gitServerName}
    done

    if [ ! -z ${eachBxoId} ] ; then
	opDo vis_configFileUpdate
    fi

    lpReturn
}




function vis_usgBxoFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]
    EH_assert [ ! -z "${usg}" ]

    lpDo bxosBasePrep

    opDo vis_usgAcctBxoCredentialsUpdate bxoPriv

    opDo vis_bxoConfigSegUpdate bxoPriv ${site_gitServerName}
    
    opDo vis_configFileUpdate

    lpReturn
}


function vis_usgBxoFullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]
    EH_assert [ ! -z "${usg}" ]    
    
    opDo vis_usgAcctBxoCredentialsDelete  bxoPriv

    opDo vis_bxoConfigSegDelete bxoPriv
    
    opDo vis_configFileUpdate

    lpReturn
}



function vis_usgCustomFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    EH_assert [ ! -z "${usg}" ]

    local sshGitLabel="$1"
    local sshKeysBase="$2"
    local gitServer="$3"

    opDo vis_usgAcctCustomCredentialsUpdate ${sshGitLabel} ${sshKeysBase}

    opDo vis_customConfigSegUpdate ${sshGitLabel} ${gitServer}
    
    opDo vis_configFileUpdate

    lpReturn
}


function vis_usgCustomFullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${usg}" ]    
    
    opDo vis_usgAcctBxoCredentialsDelete  bxoPriv

    opDo vis_bxoConfigSegDelete bxoPriv
    
    opDo vis_configFileUpdate

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Bxo Ssh Config Seg
_CommentEnd_


function vis_usgSshConfigBasePrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    local usgSshConfigSeg_baseDir=${usgHome}/.ssh/configSeg
    local usgSshGitConfig_baseDir=${usgHome}/.ssh/gitConfig   

    if [ ! -d "${usgSshConfigSeg_baseDir}" ] ; then
	lpDo mkdir "${usgSshConfigSeg_baseDir}"
	EH_retOnFail
    fi

    if [ ! -d "${usgSshGitConfig_baseDir}" ] ; then
	lpDo mkdir "${usgSshGitConfig_baseDir}"
	EH_retOnFail
    fi
    
    lpReturn
}



function vis_usgSshConfigSegBasePrep%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    

    if [ ! -d "${usgSshConfigSeg_baseDir}" ] ; then
	lpDo mkdir "${usgSshConfigSeg_baseDir}"
    fi

    lpReturn
}

function vis_usgSshConfigSegBaseList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    # lpDo vis_usgSshConfigSegBasePrep  # Happens in G_postProc
    lpDo ls "${usgSshConfigSeg_baseDir}"

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Usg Acct Bxo Credentials
_CommentEnd_


function vis_usgAcctBxoCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]
    EH_assert [ ! -z "${bxoId}" ]

    local bxoGitLabel="$1"

    lpDo bxosBasePrep

    opDo sudo cp ${bxoHome}/$(rbxeSshBase)/id_rsa.pub ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa.pub
    EH_retOnFail

    opDo sudo cp ${bxoHome}/$(rbxeSshBase)/id_rsa ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa
    EH_retOnFail

    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa.pub
    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa

    opDo chmod 644 ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa.pub
    opDo chmod 600 ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa

    lpReturn
}


function vis_usgAcctBxoCredentialsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]
    EH_assert [ ! -z "${bxoId}" ]

    local bxoGitLabel="$1"    

    opDo sudo rm ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa.pub
    EH_retOnFail

    opDo sudo rm ${usgHome}/.ssh/${bxoGitLabel}_${bxoId}_rsa
    EH_retOnFail

    lpReturn
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Usg Acct Custom Credentials
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Usg Acct Custom Credentials
_CommentEnd_


function vis_usgAcctCustomGitInfoUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    EH_assert [ ! -z "${usg}" ]

    local gitLabel="$1"
    local gitUserName="$2"
    local gitUserEmail="$3"

    local gitLabelPath="${usgHome}/.ssh/gitConfig/${gitLabel}.fps"

    opDo FN_dirCreatePathIfNotThere ${gitLabelPath}
    EH_retOnFail

    lpDo fileParamManage.py  -i fileParamWrite  ${gitLabelPath} userName "${gitUserName}"
    EH_retOnFail

    lpDo fileParamManage.py  -i fileParamWrite  ${gitLabelPath} userEmail "${gitUserEmail}"
    EH_retOnFail

    lpDo vis_usgAcct_gitConfigUpdate "${usg}" "${gitUserName}" "${gitUserEmail}"

    lpReturn
}


function vis_usgAcctCustomGitInfoRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -gt 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local gitLabel="$1"

    local gitLabelPath="${usgHome}/.ssh/gitConfig/${gitLabel}.fps"

    shift

    local eachParam

    for eachParam in $@ ; do
	lpDo fileParamManage.py  -i fileParamRead ${gitLabelPath} ${eachParam}
    done

    lpReturn
}


function vis_usgAcctCustomGitInfoDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local gitLabel="$1"

    local gitLabelPath="${usgHome}/.ssh/gitConfig/${gitLabel}.fps"    

    lpDo rm -r -f "${gitLabelPath}"

    lpReturn
}


function vis_usgAcctCustomCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshGitLabel="$1"
    local sshKeysBase="$2"    

    opDo sudo cp ${sshKeysBase}/id_rsa.pub ${usgHome}/.ssh/${sshGitLabel}_rsa.pub
    EH_retOnFail

    opDo sudo cp ${sshKeysBase}/id_rsa ${usgHome}/.ssh/${sshGitLabel}_rsa    
    EH_retOnFail

    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${sshGitLabel}_rsa.pub
    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${sshGitLabel}_rsa

    opDo chmod 644 ${usgHome}/.ssh/${sshGitLabel}_rsa.pub
    opDo chmod 600 ${usgHome}/.ssh/${sshGitLabel}_rsa

    lpReturn
}


function vis_usgAcctCustomCredentialsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the specified BxO's (${bxoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshGitLabel="$1"    

    opDo sudo rm ${usgHome}/.ssh/${sshGitLabel}_rsa.pub
    EH_retOnFail

    opDo sudo rm ${usgHome}/.ssh/${sshGitLabel}_rsa
    EH_retOnFail

    lpReturn
}


function vis_usgAcctCredentialsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List Bxo keys at USG ssh client.

_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local bxoGitLabel="$1"    

    typeset lsResults=$( inBaseDirDo ${usgHome}/.ssh ls ${bxoGitLabel}_*_rsa | grep -v pub 2> /dev/null )

    if [ -z "${lsResults}" ] ; then
	ANT_raw "No credentials found in ${usgHome}/.ssh"
	return 1
    else
	echo ${lsResults}
	return 0
    fi
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== BxO Config File Generate/Update
_CommentEnd_


function vis_bxoConfigSegStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local bxoGitLabel="$1"
    local bxoGitServerName="$2"

    cat  << _EOF_
# at $( DATE_nowTag ) by $(id -u -n) on $(hostname)
# BxoId=${bxoId}  bxoGitLabel=${bxoGitLabel}  bxoGitServerName=${bxoGitServerName}
Host ${bxoGitLabel}_${bxoId}
	Hostname ${bxoGitServerName}
	User git
	IdentityFile ~/.ssh/${bxoGitLabel}_${bxoId}_rsa
_EOF_

    lpReturn
}

function vis_bxoConfigSegFileName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local bxoGitLabel="$1"
    local bxoGitServerName="$2"

    echo "${usgSshConfigSeg_baseDir}/${bxoGitLabel}_${bxoId}.configSeg"
}


function vis_bxoConfigSegUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local bxoGitLabel="$1"
    local bxoGitServerName="$2"

    local outFileName="$( vis_bxoConfigSegFileName ${bxoGitLabel} ${bxoGitServerName} )"

    lpDo eval vis_bxoConfigSegStdout ${bxoGitLabel} ${bxoGitServerName} \> "${outFileName}"

    lpReturn
}

function vis_bxoConfigSegExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local bxoGitLabel="$1"
    local retVal=0

    local outFileName="${usgSshConfigSeg_baseDir}/${bxoGitLabel}_${bxoId}.configSeg"

    if [ -f ${outFileName} ] ; then
	# ANT_cooked "${outFileName} exists"
	retVal=0
    else
	# ANT_cooked "${outFileName} does not exists"
	retVal=1
    fi

    lpReturn ${retVal}
}


function vis_bxoConfigSegDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local bxoGitLabel="$1"

    local outFileName="${usgSshConfigSeg_baseDir}/${bxoGitLabel}_${bxoId}.configSeg"

    lpDo sudo rm "${outFileName}"

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Custom Config File Generate/Update
_CommentEnd_


function vis_customConfigSegStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local customGitLabel="$1"
    local customGitServerName="$2"

    cat  << _EOF_
# at $( DATE_nowTag ) by $(id -u -n) on $(hostname)
# customGitLabel=${customGitLabel}  customGitServerName=${customGitServerName}
Host ${customGitLabel}
	Hostname ${customGitServerName}
	User git
	IdentityFile ~/.ssh/${customGitLabel}_rsa
_EOF_

    lpReturn
}

function vis_customConfigSegFileName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local customGitLabel="$1"
    local customGitServerName="$2"  # Unused, but required

    echo "${usgSshConfigSeg_baseDir}/${customGitLabel}.configSeg"
}


function vis_customConfigSegUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local customGitLabel="$1"
    local customGitServerName="$2"

    local outFileName="$( vis_customConfigSegFileName ${customGitLabel} ${customGitServerName} )"

    lpDo eval vis_customConfigSegStdout ${customGitLabel} ${customGitServerName} \>  "${outFileName}"

    lpReturn
}

function vis_customConfigSegExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local customGitLabel="$1"
    local retVal=0

    local outFileName="${usgSshConfigSeg_baseDir}/${customGitLabel}.configSeg"

    if [ -f ${outFileName} ] ; then
	# ANT_cooked "${outFileName} exists"
	retVal=0
    else
	# ANT_cooked "${outFileName} does not exists"
	retVal=1
    fi

    lpReturn ${retVal}
}


function vis_customConfigSegDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local customGitLabel="$1"

    local outFileName="${usgSshConfigSeg_baseDir}/${customGitLabel}.configSeg"

    lpDo sudo rm "${outFileName}"

    lpReturn
}




function vis_configFileNameGet {
    echo $( FN_absolutePathGet ${usgHome}/.ssh/config )
}


function vis_configSegsCollectStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset segFilesList=$( vis_usgSshConfigSegBaseList )
    EH_retOnFail

    cat  << _EOF_
# Machine Generated by ${G_myName}:${G_thisFunc} on $( date ) -- Do Not Hand Edit

Host * 
       	IdentitiesOnly=yes

_EOF_
    
    for thisSegFile in ${segFilesList}; do
	inBaseDirDo "${usgSshConfigSeg_baseDir}" cat ${thisSegFile}
	echo ""
    done
}


function vis_configFileUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    FN_fileSafeKeep ${thisConfigFile}

    eval vis_configSegsCollectStdout  \> ${thisConfigFile}

    opDo chmod 600 ${thisConfigFile}

    opDo ls -l ${thisConfigFile}
}


function vis_configFileVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    typeset tmpFile=$( FN_tempFile )

    vis_sshFullConfigStdout > ${tmpFile} 

    FN_fileCmpAndDiff ${thisConfigFile} ${tmpFile}
 
    FN_fileRmIfThere ${tmpFile} 
}

function vis_configFileShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    opDo ls -l "${thisConfigFile}"
}

function vis_configFileDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    opDo /bin/rm "${thisConfigFile}"
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Access, Verfications and Tests
_CommentEnd_

function vis_sshAccessGitolite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoCentralPrep
    bxoAcctAnalyze ${bxoId}

    #bxurl="git.${cp_acctMainBaseDomain}"
    bxurl="${site_gitServerName}"

    if [ -f  ${usgHome}/.ssh/${bxoId}.dest ] ; then

	cat ${usgHome}/.ssh/${bxoId}.dest |
	while read  thisLine  ; do
	    destAddr=$( echo  ${thisLine} | cut -d ':' -f 1 )
	    destUser=$( echo  ${thisLine} | cut -d ':' -f 2 )

	    cat  << _EOF_
ssh -vT git@${bxoId}%${destAddr}
ssh ${bxoId}%${destAddr}
ssh git@${bxoId}%${destAddr} info
_EOF_
	done
    fi

    cat  << _EOF_
ssh -vT git@${bxurl} 
ssh ${bxurl}
ssh git@${bxurl} info
_EOF_

    bxurl=sa-20000.git.bysource.org

    cat  << _EOF_
ssh -vT git@${bxurl}
ssh ${bxurl}
ssh git@${bxurl} info
_EOF_


    lpReturn
}

function vis_sshAccessGitlab {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoCentralPrep
    bxoAcctAnalyze ${bxoId}

    #bxurl="git.${cp_acctMainBaseDomain}"
    bxurl="${site_gitServerName}"

    if [ -f  ${usgHome}/.ssh/${bxoId}.dest ] ; then

	cat ${usgHome}/.ssh/${bxoId}.dest |
	while read  thisLine  ; do
	    destAddr=$( echo  ${thisLine} | cut -d ':' -f 1 )
	    destUser=$( echo  ${thisLine} | cut -d ':' -f 2 )

	    cat  << _EOF_
ssh -vT git@${bxoId}%${destAddr}
ssh ${bxoId}%${destAddr}
ssh git@${bxoId}%${destAddr} info
_EOF_
	done
    fi

    cat  << _EOF_
ssh -vT ${bxoId}@${bxurl}
ssh ${bxurl}
ssh git@${bxurl} info
_EOF_

    bxurl=${bxoId}.git.bysource.org

    cat  << _EOF_
ssh -vT ${bxoId}@${bxurl} LLL
ssh ${bxurl}
ssh ${bxoId}@${bxurl} info
_EOF_


    lpReturn
}




####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
