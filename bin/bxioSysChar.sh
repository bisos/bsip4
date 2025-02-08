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

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    if [ ! -z  "${bpoId}" ] ; then  bpoIdPrepValidate; fi;

    if [ ! -z "${bpoId}" ] ; then
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
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    #oneBxoId="prs-bisos"
    #oneBxoId="${currentBxoId}"
    oneBxoId="pic_dnsServer"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )

    function repoBaseCreateAndPushExamples {
        EH_assert [[ $# -eq 2 ]]
        local repoName=$1
        local description=$2
        cat  << _EOF_
$( examplesSeperatorSection "${description}" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBaseCreate_${repoName}
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBasePush ${repoName}
_EOF_
    }   
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "Provisioning: Initial BxE Realize -- Full Actions" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i fullCreateAndPush
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesCreate
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesPush
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i basesFullCreate
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBasesList
$( repoBaseCreateAndPushExamples svcsSpec "svcsSpec Repo (Services Specifications)" )
$( repoBaseCreateAndPushExamples sysSpec "sysSpec Repo (System Specifications)" )
$( repoBaseCreateAndPushExamples sysSpec "sysChar Repo (System Character)" )
$( repoBaseCreateAndPushExamples containerBxO "Container BxO Repo" )
$( repoBaseCreateAndPushExamples deploymentRecords "Deployment Records Repo" )
$( repoBaseCreateAndPushExamples panel "BxO Panel Repo" )
$( examplesSeperatorChapter "Bases Create" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i baseCreate_var
_EOF_
}

function vis_repoBasesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat  << _EOF_
panel
containerBxO
svcsSpec
sysSpec
sysChar
deploymentRecords
_EOF_

    lpReturn
}

function vis_basesList {
    cat  << _EOF_
var
_EOF_
}


function vis_basesFullCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local each

    for each in $(vis_basesList) ; do
        lpDo vis_baseCreate_${each}
    done


    lpReturn
}       

function vis_repoBaseCreate_deploymentRecords {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"
BxO Repo: ${repoBase} 
Placeholder for records/logs of materialization/deployment.
_EOF_

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_repoBaseCreate_containerBxO {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"
BxO Repo: ${repoBase} 
Pointer to bpoId as a filePointer
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/bxoRef.fps
    lpDo fileParamManage.cs -i fileParamWrite ${repoBase}/bxoRef.fps bpoId UnSpecified

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_repoBaseCreate_sysSpec {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
System Specification -- virtualization, resources, etc.
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/virtualization.fps
    lpDo fileParamManage.cs -i fileParamWrite ${repoBase}/virtualization.fps virtType default

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/vmSpec.fps
    lpDo fileParamManage.cs -i fileParamWrite ${repoBase}/vmSpec.fps baseBox medium

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_repoBaseCreate_svcsSpec {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
includes a list of BxSO's which provide the expected services
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/fps
    lpDo fileParamManage.cs -i fileParamWrite ${repoBase}/fps bpoId UnSpecified

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_repoBaseCreate_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
for now just a bin directory
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/bin
    lpDo touch ${repoBase}/bin/materialize.sh

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_baseCreate_var {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    local varBase="${bpoHome}/var"
    local bisosVarBaseDir="/bisos/var/bpoId/${bpoId}"

    lpDo FN_dirCreatePathIfNotThere ${bisosVarBaseDir}
    
    lpDo FN_fileSymlinkUpdate ${bisosVarBaseDir} ${varBase}

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
