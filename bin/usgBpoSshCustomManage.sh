#!/bin/bash

IcmBriefDescription="Manage Custom Ssh Config Segements -- Requires usgBpoSshManage.sh"

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
*  /This File/ :: /bisos/core/bsip/bin/usgBpoSshManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
Typically not used directly but through -niche.sh.
** For example to add a github ssh config section keep the priv key in the usgBpo and point to it with keysBasePath.
** -i usgCustomFullUpdate sshConfLabel keysBasePath sshDestServer sshUser sshPort
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

. ${opBinBase}/bpo_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/niche_lib.sh

. ${opBinBase}/usgBpos_lib.sh

# PRE parameters
typeset -t bpoId=""
typeset -t usg=""
typeset -t bxosBase=""

function G_postParamHook {

    if [ ! -z  "${bpoId}" ] ; then
        bpoIdPrepValidate
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi

    if [ -z "${usg}" ] ; then
        usg=$( id -u -n )
    fi
    usgHome=$( FN_absolutePathGet ~${usg} )

    usgSshConfigSeg_baseDir=${usgHome}/.ssh/configSeg   # NOTYET still needed. Needs to be cleaned up.
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

    local oneUsg=${currentUsgUname}

    local oneBxosBase="/bisos/var/bxo/construct"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorSection "BxO Ssh Keys Full Actions" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgBxoFullRebuild
$( examplesSeperatorSection "Custom Ssh Keys Full Actions" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgCustomFullUpdate sshConfLabel sshKeysBaseOrFile sshDestServer sshUser sshPort
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgCustomFullDelete sshConfLabel
$( examplesSeperatorChapter "Bxo Ssh Private Keys" )
$( examplesSeperatorSection "lcaSshAdmin.sh" )
lcaSshAdmin.sh
$( examplesSeperatorSection "USG Custom Ssh Invoker Keys Install" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomCredentialsUpdate sshConfLabel keysBasePath
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomCredentialsDelete sshConfLabel
$( examplesSeperatorSection "USG Custom Git Info" )
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoUpdate sshConfLabel "firstNameAndLast" "email@example.com"
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoRead sshConfLabel  userName userEmail
${G_myName} ${examplesInfo} -p usg=${oneUsg} -i usgAcctCustomGitInfoDelete sshConfLabel
$( examplesSeperatorChapter "USG Ssh Config File Manipulation" )
$( examplesSeperatorSection "USG Ssh Config Segments Base" )
${G_myName} ${extraInfo} -i usgSshConfigSegBasePrep
${G_myName} -i usgSshConfigSegBaseList
$( examplesSeperatorSection "USG Ssh Custom Config Segment File Update" )
${G_myName} -i customConfigSegStdout sshConfLabel sshDestServerName
${G_myName} ${extraInfo} -i customConfigSegStdout sshConfLabel sshKeyFile sshDestServerName sshUser sshPort  # Verbose
${G_myName} ${extraInfo} -i customConfigSegFileName sshConfLabel sshDestServerName
${G_myName} ${extraInfo} -i customConfigSegUpdate sshConfLabel sshKeyFile sshDestServerName sshUser sshPort
${G_myName} ${extraInfo} -i customConfigSegDelete sshConfLabel
${G_myName} ${extraInfo} -i customConfigSegExists sshConfLabel
$( examplesSeperatorSection "Tests And Verifications" )
$( examplesSeperatorChapter "Access, Verification And Test" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i  sshAccessGitolite
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i  sshAccessGitlab
_EOF_

       vis_examplesNicheRun usageEnvs
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Full Actions
_CommentEnd_


function vis_usgCustomFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 5 ]]
    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"
    local sshKeysBaseOrFile="$2"
    local sshDestServer="$3"
    local sshUser="$4"
    local sshPort="$5"

    local privKeyFile=""

    if [ -d "${sshKeysBaseOrFile}" ] ; then
        opDo vis_usgAcctCustomCredentialsUpdate ${sshConfLabel} ${sshKeysBaseOrFile}
        privKeyFile=${usgHome}/.ssh/${sshConfLabel}_rsa
    elif [ -f "${sshKeysBaseOrFile}" ] ; then
        privKeyFile="${sshKeysBaseOrFile}"
    else
        EH_problem "OOPS"
        lpReturn 101
    fi

    opDo vis_customConfigSegUpdate ${sshConfLabel} ${privKeyFile} ${sshDestServer} ${sshUser} ${sshPort}
    
    opDo usgBpoSshManage.sh -h -v -n showRun -i configFileUpdate

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



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Usg Acct Custom Credentials
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Usg Acct Custom Credentials
_CommentEnd_


function vis_usgAcctCustomGitInfoUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bpoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"
    local gitUserName="$2"
    local gitUserEmail="$3"

    local sshConfLabelPath="${usgHome}/.ssh/gitConfig/${sshConfLabel}.fps"

    opDo FN_dirCreatePathIfNotThere ${sshConfLabelPath}
    EH_retOnFail

    lpDo fileParamManage.py  -i fileParamWrite  ${sshConfLabelPath} userName "${gitUserName}"
    EH_retOnFail

    lpDo fileParamManage.py  -i fileParamWrite  ${sshConfLabelPath} userEmail "${gitUserEmail}"
    EH_retOnFail

    lpDo vis_usgAcct_gitConfigUpdate "${usg}" \""${gitUserName}"\" "${gitUserEmail}"

    lpReturn
}


function vis_usgAcctCustomGitInfoRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bpoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -gt 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"

    local sshConfLabelPath="${usgHome}/.ssh/gitConfig/${sshConfLabel}.fps"

    shift

    local eachParam

    for eachParam in $@ ; do
        lpDo fileParamManage.py  -i fileParamRead ${sshConfLabelPath} ${eachParam}
    done

    lpReturn
}


function vis_usgAcctCustomGitInfoDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the specified BxO's (${bpoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"

    local sshConfLabelPath="${usgHome}/.ssh/gitConfig/${sshConfLabel}.fps"

    lpDo rm -r -f "${sshConfLabelPath}"

    lpReturn
}


function vis_usgAcctCustomCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the specified BxO's (${bpoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"
    local sshKeysBase="$2"    

    opDo sudo cp ${sshKeysBase}/id_rsa.pub ${usgHome}/.ssh/${sshConfLabel}_rsa.pub
    EH_retOnFail

    opDo sudo cp ${sshKeysBase}/id_rsa ${usgHome}/.ssh/${sshConfLabel}_rsa
    EH_retOnFail

    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${sshConfLabel}_rsa.pub
    opDo sudo chown ${usg}:bisos ${usgHome}/.ssh/${sshConfLabel}_rsa

    opDo chmod 644 ${usgHome}/.ssh/${sshConfLabel}_rsa.pub
    opDo chmod 600 ${usgHome}/.ssh/${sshConfLabel}_rsa

    lpReturn
}


function vis_usgAcctCustomCredentialsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the specified BxO's (${bpoId}) public and private keys and copy them to specified usg (${usg}).
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${usg}" ]

    local sshConfLabel="$1"

    opDo sudo rm ${usgHome}/.ssh/${sshConfLabel}_rsa.pub
    EH_retOnFail

    opDo sudo rm ${usgHome}/.ssh/${sshConfLabel}_rsa
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
*      ======[[elisp:(org-cycle)][Fold]]====== Custom Config File Generate/Update
_CommentEnd_


function vis_customConfigSegStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 5 ]]

    local customGitLabel="$1"
    local sshKeyFile="$2"
    local customGitServerName="$3"
    local sshUser="$4"
    local sshPort="$5"

    cat  << _EOF_
# at $( DATE_nowTag ) by $(id -u -n) on $(hostname)
# customGitLabel=${customGitLabel}  customGitServerName=${customGitServerName}
Host ${customGitLabel}
        Hostname ${customGitServerName}
        User ${sshUser}
        Port ${sshPort}
        IdentityFile ${sshKeyFile}
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
    EH_assert [[ $# -eq 5 ]]

    local customGitLabel="$1"
    local sshKeyFile="$2"
    local customGitServerName="$3"
    local sshUser="$4"
    local sshPort="$5"

    local outFileName="$(vis_customConfigSegFileName ${customGitLabel} ${customGitServerName})"

    lpDo eval vis_customConfigSegStdout ${customGitLabel} ${sshKeyFile} ${customGitServerName}  ${sshUser} ${sshPort} \>  "${outFileName}"

    lpReturn
}

function vis_customConfigSegExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bpoId}" ]]    

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


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Access, Verfications and Tests
_CommentEnd_


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
