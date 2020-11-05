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

. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bxeDesc="MANDATORY"
typeset -t bxoId=""
# usg=""

function G_postParamHook {
    bxoIdPrepValidate    

    if [ "${bxeDesc}" != "MANDATORY" ] ; then
     	bxeDesc=$( FN_absolutePathGet ${bxeDesc} )
    fi
    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi

    local siteGitServerInfoBaseDir=$( siteGitServerManage.sh -i gitServerInfoBaseDir )
    
    site_gitServerName=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName )
    
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

    oneBxeDesc="/bisos/var/bxae/bxeDesc/A/system/as-bisos"

    #oneBxoId="as-bisos"
    oneBxoId="${currentBxoId}"
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Realize A BxE -- Create BxoAcct and Push Initial Repos" )
$( examplesSeperatorSection "BxO Local Acct Creation" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxoAcctCreate
$( examplesSeperatorSection "BxO/rbxe Setup" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i rbxeSetup
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxoBxeDescCopy
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i bxoCredentialsUpdate      # calls bxoSshKeyUpdate & invokes lcaSshAdmin.sh
${G_myName} ${extraInfo} -f -p bxoId="${oneBxoId}" -i bxoCredentialsUpdate   # G_forceMode 
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i bxoGitServerDescUpdate
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i getBxoId
$( examplesSeperatorSection "BxO GitServer Provision -- Git Acct Creation" )
bxoGitlab.py
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i acctCreate 
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i reposList 
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i reposCreate 
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i gitServerBxoAcctCreate
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i gitServerBxoPubkeyUpload
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i gitServerBxoPubkeyVerify
$( examplesSeperatorSection "BxO Ssh Config Update" )
usgBxoSshManage.sh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -p usg=current -i sshConfigUpdate   # Sets up ~usg/.ssh/config
$( examplesSeperatorSection "Initial Repos Push" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i initialReposPush  # aggregator for repoCreateAndPush
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "rbxe" "${oneBxoHome}/rbxe" "priv"
$( examplesSeperatorSection "Full Realization" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i realize   # invokes all of the above
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_realize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]    

    lpDo vis_bxoAcctCreate    # creates ~bxoId

    lpDo vis_rbxeSetup        # bxoBxeDescCopy + bxoCredentialsUpdate + bxoGitServerDescUpdate

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )

    bxoId="${cp_bxePrefix}-${cp_rdn}"

    lpDo vis_gitServerBxoAcctCreate

    lpDo vis_gitServerBxoPubkeyUpload
    
    lpDo vis_sshConfigUpdate

    lpDo vis_initialReposPush
    
    lpReturn
}


function vis_bxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]    

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )
    local cp_bxeOid=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxeOid )    

    local bxeLocalName="${cp_bxePrefix}-${cp_rdn}"
    local bxeOidComment="oid-${cp_bxeOid}"

    lpDo bxoAcctManage.sh -h -v -n showRun -p acctComment="${bxeOidComment}" -i bxisoAcctCreate ${bxeLocalName}

    lpReturn
}

function vis_getBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Even though bxo exists at this stage, the bxeDesc param is needed for the cp.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )        

    echo "${cp_bxePrefix}-${cp_rdn}"

    lpReturn
}


function vis_rbxeSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Even though bxo exists at this stage, the bxeDesc param is needed for the cp.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )        

    bxoId="${cp_bxePrefix}-${cp_rdn}"

    bxoHome=$( FN_absolutePathGet ~${bxoId} )
    
    lpDo sudo -u ${bxoId} mkdir ${bxoHome}/rbxe

    lpDo vis_bxoBxeDescCopy

    lpDo vis_bxoCredentialsUpdate

    lpDo vis_bxoGitServerDescUpdate    
    
    lpReturn
}


function vis_bxoBxeDescCopy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Even though bxo exists at this stage, the bxeDesc param is needed for the cp.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )        

    local bxeLocalName="${cp_bxePrefix}-${cp_rdn}"

    bxoHome=$( FN_absolutePathGet ~${bxeLocalName} )

    if [ ! -d ${bxoHome}/rbxe ] ; then
	lpDo mkdir ${bxoHome}/rbxe
    fi
    
    lpDo cp -r ${bxeDesc} ${bxoHome}/rbxe/bxeDesc

    lpReturn
}

function vis_bxoCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This should be subjected to forceMode and should not recreate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    function bxoCredentialsUpdate {
	lpDo vis_bxoSshKeyUpdate    # in bxo_lib.sh which calls lcaSshAdmin.sh
    }

    if vis_bxoSshAcctKeyVerify ; then
	if [ "${G_forceMode}" == "force" ] ; then
	    ANT_raw "Re-Creating -- $(rbxeSshBase) and forceMode is specified."	    
	    lpDo bxoCredentialsUpdate
	else
	    ANT_raw "$(rbxeSshBase) and forceMode is not specified."
	fi
    else
	lpDo bxoCredentialsUpdate
    fi
    
    lpReturn
}

function vis_bxoGitServerDescUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo mkdir -p ${bxoHome}/rbxe/gitServerInfo
    lpDo fileParamManage.py -i fileParamWrite ${bxoHome}/rbxe/gitServerInfo gitServer ${site_gitServerName}
    
    lpReturn
}

function vis_gitServerBxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i acctCreate

    lpReturn
}

function vis_gitServerBxoPubkeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local retVal=0
    local priv_pubkeyPath="${bxoHome}/rbxe/credentials/ssh/id_rsa.pub"

    if [ ! -f "${priv_pubkeyPath}" ] ; then
	EH_problem "Missing ${priv_pubkeyPath}"
	lpReturn 1
    fi	

    local gotKeyTmpFile=$(mktemp).sshKey
    
    lpDo eval bxoGitlab.py --bxoId="${bxoId}" --keyName="_priv-pubkey" -i pubkeyObtain \> ${gotKeyTmpFile}

    local local_fingerPrint=$( ssh-keygen -l -f ${priv_pubkeyPath} | cut -d ' ' -f 2 )
    local gitlab_fingerPrint=$( ssh-keygen -l -f ${gotKeyTmpFile} | cut -d ' ' -f 2 )

    if [ "${local_fingerPrint}" == "${gitlab_fingerPrint}" ] ; then
	ANT_raw "Key finger prints match -- ${gitlab_fingerPrint}"
	retVal=0
    else
	ANT_raw "Key finger prints do not match -- ${gitlab_fingerPrint} -- ${local_fingerPrint}"
	retVal=1
    fi

    lpReturn ${retVal}
}



function vis_gitServerBxoPubkeyUpload {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local priv_pubkeyPath="${bxoHome}/rbxe/credentials/ssh/id_rsa.pub"

    if vis_gitServerBxoPubkeyVerify ; then
	ANT_raw "Same keys -- Uploading skipped"
	lpReturn
    fi

    if [ -f "${priv_pubkeyPath}" ] ; then
	lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" --keyName="_priv-pubkey" -i pubkeyUpload ${priv_pubkeyPath}
    else
	EH_problem "Missing ${priv_pubkeyPath}"
    fi	

    lpReturn
}


function vis_sshConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local usg=$( id -u -n )

    lpDo usgBxoSshManage.sh ${G_commandOptions} -p usg=${usg} -p bxoId=${bxoId} -i usgBxoFullUpdate

    lpReturn
}


function vis_repoCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local repoName="$1"
    local baseDir="$2"
    local gitServerSelector="$3"

    #local gitServerUrl=git@bxoGit-${gitServerSelector}.${bxoId}:${bxoId}/${repoName}.git
    local gitServerUrl=git@bxoPriv_${bxoId}:${bxoId}/${repoName}.git    

    local curUser=$( id -u -n )

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i reposCreate ${repoName}      

    #lpDo sudo chown -R "${curUser}":bisos ${baseDir}

    # previous example of using bxoId user: 
    # inBaseDirDo ${bxoHome}/rbxe sudo -u ${bxoId} git init
    
    inBaseDirDo ${baseDir} git init    
    inBaseDirDo ${baseDir} git add .
    inBaseDirDo ${baseDir} git commit -m "Initial_bxeRealize.sh_commit_of_${baseDir}"

    inBaseDirDo ${baseDir} git remote add origin ${gitServerUrl}
    inBaseDirDo ${baseDir} git remote -v
    inBaseDirDo ${baseDir} git push origin master

    lpReturn
}


function vis_initialReposPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    lpDo vis_repoCreateAndPush "rbxe" "${bxoHome}/rbxe" "priv"
    
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
