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

# PRE parameters

typeset -t bxeDesc=""
typeset -t bpoId=""
# usg=""

function G_postParamHook {
    if [ ! -z  "${bpoId}" ] ; then  bpoIdPrepValidate; fi;

    if [ ! -z "${bxeDesc}" ] ; then
        bxeDesc=$( FN_absolutePathGet ${bxeDesc} )
    fi
    if [ ! -z "${bpoId}" ] ; then
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi

    local siteGitServerInfoBaseDir=$( bisosSiteGitServer.sh -i gitServerInfoBaseDir )
    
    site_gitServerName=$( fileParamManage.cs -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName )
    
    bisosCurrentsGet

    lpReturn 0
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

    local bxeDescBase="$(vis_bxeDescBase_obtain)"
    
    local oneBxeDesc="${bxeDescBase}/priv/real/system/prs_bisos"    

    #oneBxoId="prs-bisos"
    oneBxoId="${currentBxoId}"
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "Realize A BxE -- Create BxoAcct and Push Initial Repos" )
$( examplesSeperatorSection "BxO Local Acct Creation" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxoAcctCreate
$( examplesSeperatorChapter "Assemble Initial Bxo Repo Bases" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p bxeDesc="${oneBxeDesc}" -i assembleInitialBxoRepoBases
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i assembleInitial_bxeTree leaf
$( examplesSeperatorSection "BxO/rbxe Setup" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i rbxeSetup
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxoBxeDescCopy
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoCredentialsUpdate      # calls bxoSshKeyUpdate & invokes lcaSshAdmin.sh
${G_myName} ${extraInfo} -f -p bpoId="${oneBxoId}" -i bxoCredentialsUpdate   # G_forceMode 
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i bxoGitServerDescUpdate
${G_myName} ${extraInfo} -i bpoIdFromBxeDesc "${oneBxeDesc}"
$( examplesSeperatorSection "BxO GitServer Provision -- Git Acct Creation" )
bxoGitlab.py
bxoGitlab.py -v 20 --bpoId="${oneBxoId}" -i acctCreate 
bxoGitlab.py -v 20 --bpoId="${oneBxoId}" -i reposList 
bxoGitlab.py -v 20 --bpoId="${oneBxoId}" -i reposCreate 
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i gitServerBxoAcctCreate
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i gitServerBxoPubkeyUpload
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i gitServerBxoPubkeyVerify
$( examplesSeperatorSection "BxO Ssh Config Update" )
usgBpoSshManage.sh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p usg=current -i sshConfigUpdate   # Sets up ~usg/.ssh/config
$( examplesSeperatorSection "Initial rbxe Repo Push" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i rbxeRepoCreateAndPush  # 
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoCreateAndPush "rbxe" "${oneBxoHome}/rbxe" "priv"
$( examplesSeperatorSection "Account And rbxe Repo Realization" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i acctRbxeRealize   # invokes all of the above
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i acctRbxePrepare   # Creates local account, needs acctRbxeRealizeAfterPrepare later
{G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i acctRbxeRealizeAfterPrepare # + acctRbxePrepare = acctRbxeRealize
$( examplesSeperatorSection "Initial Repos Create And Push" )
bxioCommon.sh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i initialReposCreateAndPush  # aggregator for repoCreateAndPush
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i initialCommonReposCreateAndPush
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i initialSpecificReposCreateAndPush
$( examplesSeperatorSection "Full Realization" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i fullRealize   # invokes all of the above
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullRealize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -lt 2 ]]
    
    EH_assert [ ! -z "${bxeDesc}" ]

    local bxoRealizationScope=""  
    
    if [ $# -eq 0 ] ; then
        bxoRealizationScope="full"
    else
        bxoRealizationScope=$1
    fi

    lpDo vis_acctRbxeRealize ${bxoRealizationScope}
    
    lpDo vis_initialReposCreateAndPush ${bxoRealizationScope}
    
    lpReturn
}

function vis_acctRbxeRealize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -lt 2 ]]

    EH_assert [ ! -z "${bxeDesc}" ]

    local bxoRealizationScope=""  
    
    if [ $# -eq 0 ] ; then
        bxoRealizationScope="full"
    else
        bxoRealizationScope=$1
    fi
    
    case ${bxoRealizationScope} in
        basePrep|full)
            lpDo vis_bxoAcctCreate    # creates ~bpoId

            lpDo vis_rbxeSetup        # bxoBxeDescCopy + bxoCredentialsUpdate + bxoGitServerDescUpdate

            # local cp_bxePrefix=$( fileParamManage.cs  -i fileParamRead  ${bxeDesc} bxePrefix )
            # local cp_rdn=$( fileParamManage.cs  -i fileParamRead  ${bxeDesc} rdn )
            # bpoId="${cp_bxePrefix}-${cp_rdn}"
            ;;
        realize)
            doNothing
            ;;
        *)
            EH_problem "Bad Usage -- ${bxoRealizationScope}"
            ;;
    esac

    bpoId="$( vis_bpoIdFromBxeDesc ${bxeDesc} )"
    
    case ${bxoRealizationScope} in
        realize|full)
            lpDo vis_gitServerBxoAcctCreate

            lpDo vis_gitServerBxoPubkeyUpload
    
            lpDo vis_sshConfigUpdate

            lpDo vis_rbxeRepoCreateAndPush
            ;;
        basePrep)
            doNothing
            ;;
        *)
            EH_problem "Bad Usage -- ${bxoRealizationScope}"
            ;;
    esac
    
    lpReturn
}


function vis_bxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxeDesc}" ]]    

    local cp_bxeOid=$( fileParamManage.cs  -i fileParamRead  ${bxeDesc} bxeOid )    

    local bxeLocalName="$(vis_bpoIdFromBxeDesc ${bxeDesc})"

    local bxeOidComment="oid-${cp_bxeOid}"

    #
    # NOTYET, if kind==info and type=usg, use usgAcctManage.sh instead of bpoAcctManage.sh
    #

    local bxeKind=$( fileParamManage.cs  -i fileParamRead  ${bxeDesc} bxeKind )    
    local bxeType=$( fileParamManage.cs  -i fileParamRead  ${bxeDesc} bxeType )

    if [ "${bxeKind}" == "info" ] && [ "${bxeType}" == "usgAcct" ] ; then
        EH_problem "NOTYET, usgAcct realization has not been implemented yet."
    else
        lpDo bpoAcctManage.sh -h -v -n showRun -p acctComment="${bxeOidComment}" -i bxoAcctCreate ${bxeLocalName}
    fi
    
    lpReturn
}


function vis_assembleInitialBxoRepoBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In addition to bxo, the bxeDesc param is needed for the rbxeSetup.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    if ! vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account is not valid." ; lpReturn 101
    fi

    lpDo vis_rbxeSetup

    lpDo vis_assembleInitialBxoCommonRepoBases
    
    lpReturn
}



function vis_rbxeSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Even though bxo exists at this stage, the bxeDesc param is needed for the cp.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxeDesc}" ]

    bpoId="$(vis_bpoIdFromBxeDesc ${bxeDesc})"

    if ! vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account is not valid." ; lpReturn 101
    fi

    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    function doIt {
        lpDo sudo -u ${bpoId} mkdir ${bpoHome}/rbxe

        lpDo vis_bxoBxeDescCopy

        lpDo vis_bxoCredentialsUpdate

        lpDo vis_bxoGitServerDescUpdate
    }

    if [ -d "${bpoHome}/rbxe" ] ; then
        if [ "${G_forceMode}" == "force" ] ; then
            lpDo doIt
        else
            ANT_raw "${bpoHome}/rbxe exists and forceMode is not specified."
        fi
    else
        lpDo doIt
    fi
    
    lpReturn
}


function vis_bxoBxeDescCopy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Even though bxo exists at this stage, the bxeDesc param is needed for the cp.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxeDesc}" ]]

    local bxeLocalName="$(vis_bpoIdFromBxeDesc ${bxeDesc})"

    bpoHome=$( FN_absolutePathGet ~${bxeLocalName} )

    if [ ! -d ${bpoHome}/rbxe ] ; then
        lpDo mkdir ${bpoHome}/rbxe
    fi
    
    lpDo cp -r ${bxeDesc} ${bpoHome}/rbxe/bxeDesc

    lpReturn
}

function vis_bxoCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This should be subjected to forceMode and should not recreate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]

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
    EH_assert [[ ! -z "${bpoId}" ]]    

    lpDo mkdir -p ${bpoHome}/rbxe/gitServerInfo
    lpDo fileParamManage.cs -i fileParamWrite ${bpoHome}/rbxe/gitServerInfo gitServer ${site_gitServerName}
    
    lpReturn
}

function vis_gitServerBxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]    

    lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i acctCreate

    lpReturn
}

function vis_gitServerBxoPubkeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]

    local retVal=0
    local priv_pubkeyPath="${bpoHome}/rbxe/credentials/ssh/id_rsa.pub"
    local keyName="$(bxoGitServerSshKeyName $(bxoGitServerPrivTag) ${bpoId} rsa)"

    if [ ! -f "${priv_pubkeyPath}" ] ; then
        EH_problem "Missing ${priv_pubkeyPath}"
        lpReturn 1
    fi

    local gotKeyTmpFile=$(mktemp).sshKey
    
    lpDo eval bxoGitlab.py --bpoId="${bpoId}" --keyName="${keyName}" -i pubkeyObtain \> ${gotKeyTmpFile}

    if [ ! -s "${gotKeyTmpFile}" ] ; then
        ANT_raw "No pubkey Found for bpoId=${bpoId} keyName=${keyName}"
        lpDo rm ${gotKeyTmpFile}
        retVal=1
        lpReturn ${retVal}
    fi

    local local_fingerPrint=$( ssh-keygen -l -f ${priv_pubkeyPath} | cut -d ' ' -f 2 )
    local gitlab_fingerPrint=$( ssh-keygen -l -f ${gotKeyTmpFile} | cut -d ' ' -f 2 )

    if [ "${local_fingerPrint}" == "${gitlab_fingerPrint}" ] ; then
        ANT_raw "Key finger prints match -- ${gitlab_fingerPrint}"
        retVal=0
    else
        ANT_raw "Key finger prints do not match -- ${gitlab_fingerPrint} -- ${local_fingerPrint}"
        retVal=1
    fi

    lpDo rm ${gotKeyTmpFile}
    
    lpReturn ${retVal}
}



function vis_gitServerBxoPubkeyUpload {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]

    local priv_pubkeyPath="${bpoHome}/rbxe/credentials/ssh/id_rsa.pub"
    local keyName="$(bxoGitServerSshKeyName $(bxoGitServerPrivTag) ${bpoId} rsa)"

    if vis_gitServerBxoPubkeyVerify ; then
        ANT_raw "Same keys -- Uploading skipped"
        lpReturn
    fi

    if [ -f "${priv_pubkeyPath}" ] ; then
        lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" --keyName="${keyName}" -i pubkeyUpload ${priv_pubkeyPath}
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
    EH_assert [[ ! -z "${bpoId}" ]]    

    local usg=$( id -u -n )

    lpDo usgBpoSshManage.sh ${G_commandOptions} -p usg=${usg} -p bpoId=${bpoId} -i usgBxoFullUpdate

    lpReturn
}


function vis_rbxeRepoCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    lpDo vis_repoCreateAndPush "rbxe" "${bpoHome}/rbxe" "priv"
    
    lpReturn
}



function vis_initialReposCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -lt 2 ]]
    
    EH_assert [[ ! -z "${bpoId}" ]]

    local bxoRealizationScope=""  
    
    if [ $# -eq 0 ] ; then
        bxoRealizationScope="full"
    else
        bxoRealizationScope=$1
    fi

    lpDo vis_initialCommonReposCreateAndPush ${bxoRealizationScope}

    lpDo vis_initialSpecificReposCreateAndPush ${bxoRealizationScope}
    
    lpReturn
}

function vis_initialCommonReposCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -lt 2 ]]

    EH_assert [ ! -z "${bpoId}" ]
    
    local bxoRealizationScope=$1   
    
    if [ $# -eq 0 ] ; then
        bxoRealizationScope="full"
    else
        bxoRealizationScope=$1
    fi
    
    case ${bxoRealizationScope} in
        full)
            lpDo bxioCommon.sh ${G_commandOptions} -p bpoId="${bpoId}" -i assembleInitialBxoCommonRepoBases
            lpDo bxioCommon.sh ${G_commandOptions} -p bpoId="${bpoId}" -i pushInitialBxoCommonRepoBases
            ;;
        basePrep)
            lpDo bxioCommon.sh ${G_commandOptions} -p bpoId="${bpoId}" -i assembleInitialBxoCommonRepoBases         
            ;;
        realize)
            lpDo bxioCommon.sh ${G_commandOptions} -p bpoId="${bpoId}" -i pushInitialBxoCommonRepoBases     
            ;;
        *)
            EH_problem "Bad Usage"
            ;;
    esac
    
    lpReturn
}


function vis_initialSpecificReposCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
At this point we have kind and type available. So we invoke kindType.sh -i initRealize.sh
_EOF_
                       }
    EH_assert [[ $# -lt 2 ]]

    EH_assert [ ! -z "${bpoId}" ]

    local bxoRealizationScope=""  
    
    if [ $# -eq 0 ] ; then
        bxoRealizationScope="full"
    else
        bxoRealizationScope=$1
    fi

    local scriptName=$( vis_bxoKindTypeFacility )

    if ! type "${scriptName}" > /dev/null; then
        EH_problem "Missing scriptName=${scriptName}"
        lpReturn 101
    fi

    lpDo ${scriptName} ${G_commandOptions} -p bpoId="${bpoId}" -i kindTypeRealizeRepoBasesCreate
    
    lpDo ${scriptName} ${G_commandOptions} -p bpoId="${bpoId}" -i kindTypeRealizeRepoBasesPush
    
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
