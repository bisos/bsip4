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
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i bxoCredentialsUpdate
${G_myName} ${extraInfo} -f -p bxoId="${oneBxoId}" -i bxoCredentialsUpdate
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i bxoGitServerDescUpdate
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i getBxoId
$( examplesSeperatorSection "BxO GitServer Provision -- Git Acct Creation" )
bxoGitlab.py
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i acctCreate 
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i reposList 
bxoGitlab.py -v 20 --bxoId="${oneBxoId}" -i reposCreate 
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i gitServerAcctCreate
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i gitServerPubkeyUpload
$( examplesSeperatorSection "BxO Ssh Config Update" )
usgBxoSshManage.sh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -p usg=current -i sshConfigUpdate
$( examplesSeperatorSection "Initial Repos Push" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i initialReposPush
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "rbxe" "${oneBxoHome}/rbxe" "priv"
$( examplesSeperatorSection "Full Realization" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i realize
$( examplesSeperatorChapter "bxoGitlab.py -- For Git Server Provisioning" )
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

    lpDo vis_bxoAcctCreate

    lpDo vis_rbxeSetup

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )
    local bxoId="${cp_bxePrefix}-${cp_rdn}"

    # The rest will be based on bxoId

    lpDo vis_rbxeSetup    # create the ~bxo/

    lpDo vis_gitAcct

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

	# Copy the above generated ssh keys to ~usg/.ssh
	lpDo usgBxoSshManage.sh ${G_commandOptions} -p bxoId=${bxoId} -i usgAcctBxoCredentialsUpdate bxoPriv

	# NOTYET -- Where should 192.168.0.56  come from?
	# Create a .configSeg file
	lpDo usgBxoSshManage.sh ${G_commandOptions} -p bxoId=${bxoId} -i bxoConfigSegUpdate bxoPriv 192.168.0.56    

	lpDo usgBxoSshManage.sh ${G_commandOptions} -i configFileUpdate
    }

    if usgBxoSshManage.sh -p bxoId=${bxoId} -i bxoConfigSegExists bxoPriv ; then
	if [ "${G_forceMode}" == "force" ] ; then
	    ANT_raw "Re-Creating -- bxoConfigSegExists and forceMode is specified."	    
	    lpDo bxoCredentialsUpdate
	else
	    ANT_raw "bxoConfigSegExists and forceMode is not specified."
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
    lpDo fileParamManage.py -i fileParamWrite ${bxoHome}/rbxe/gitServerInfo gitServer 192.168.0.56
    
    lpReturn
}

function vis_gitServerAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i acctCreate

    lpReturn
}

function vis_gitServerPubkeyUpload {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local priv_pubkeyPath="${bxoHome}/rbxe/credentials/ssh/id_rsa.pub"

    if [ -f "${priv_pubkeyPath}" ] ; then
	lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" --keyName="priv-pubkey" -i pubkeyUpload ${priv_pubkeyPath}
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

    echo NOTYET usgBxoSshManage.sh

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

    local gitServerUrl=git@bxoGit-${gitServerSelector}.${bxoId}:${bxoId}/${repoName}.git

    local curUser=$( id -u -n )

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i reposCreate ${repoName}      

    #lpDo sudo chown -R "${curUser}":bisos ${baseDir}

    # previous example of using bxoId user: 
    # inBaseDirDo ${bxoHome}/rbxe sudo -u ${bxoId} git init
    
    inBaseDirDo ${baseDir} git init    
    inBaseDirDo ${baseDir} git add .
    inBaseDirDo ${baseDir} git commit -m "Initial bxeRealize.sh commit of ${baseDir}"

    inBaseDirDo ${baseDir} git remote add origin ${gitServerUrl}
    inBaseDirDo ${baseDir} git remote -v
    inBaseDirDo ${baseDir} git push origin main

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
