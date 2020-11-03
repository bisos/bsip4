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


. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bxoId=""
# usg=""

function G_postParamHook {
    # lpCurrentsGet

    if [ "${bxeDesc}" != "MANDATORY" ] ; then
     	bxeDesc=$( FN_absolutePathGet ${bxeDesc} )
    fi
    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi

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
    oneBxoId="as-test1_5"    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Construct A BxO From Its Realized BxE" )
$( examplesSeperatorSection "BxO-ISO Retrieval" )
bxoGitlab.py -v 20 --bxoId="as-bisos" --outFile="/tmp/git-as-bisos-iso.tar"  -i reposList iso
mkdir /tmp/as-bisos-iso.git; tar xf /tmp/git-as-bisos-iso.tar
git clone /tmp/as-bisos-iso.git  ~bxoId/var/iso
$( examplesSeperatorSection "BxO Creation Based On ISO Info" )
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxoAcctCreate
$( examplesSeperatorSection "BxO Repos Clone Map" )
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

    lpDo vis_isoSetup

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )
    local bxoId="${cp_bxePrefix}-${cp_rdn}"

    # The rest will be based on bxoId

    lpDo vis_isoSetup

    lpDo vis_bxoGitServerProvision

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


function vis_isoSetup {
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
    
    lpDo sudo -u ${bxeLocalName} mkdir ${bxoHome}/iso

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

    if [ ! -d ${bxoHome}/iso ] ; then
	lpDo sudo -u ${bxeLocalName} mkdir ${bxoHome}/iso
    fi
    
    lpDo sudo -u ${bxeLocalName} cp -r ${bxeDesc} ${bxoHome}/iso/bxeDesc

    lpReturn
}

function vis_bxoCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    


    lpDo lcaSshAdmin.sh -p localUser=${bxoId} -p sshDir=iso/credentials/ssh -i userKeyUpdate    
    
    lpReturn
}

function vis_bxoGitServerDescUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo sudo -u ${bxoId} mkdir ${bxoHome}/iso/gitServerInfo

    fileParamManage.py  -i fileParamWrite  ${bxoHome}/iso/gitServerInfo gitServer 192.168.0.56

    lpReturn
}

function vis_bxoGitServerProvision {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i acctCreate

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i pubkeyUpload        

    lpReturn
}

function vis_sshConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    echo NOTYET

    lpReturn
}


function vis_initialReposPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i reposCreate iso       
    

    lpDo sudo chown -R "${bxoId}":bisos ${bxoHome}/iso

    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git init
    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git add .
    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git commit -m "bxeRealize.sh commit"

    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git remote add origin git@bxogit.${bxoId}:${bxoId}/iso.git
    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git remote -v
    inBaseDirDo ${bxoHome}/iso sudo -u ${bxoId} git push origin main

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
