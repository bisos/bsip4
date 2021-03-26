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

. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh


# PRE parameters

typeset -t bxoId=""
typeset -t containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )

function G_postParamHook {
    bxoIdPrepValidate    

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

    local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
    local sysCharContainerBxoId=$( vis_sysCharContainerBxoId ${containerBase} )
    local selectedSiteBxoId=$( vis_selectedSiteBxoId )
    local containersBase=$( vis_containersBaseObtain )
    
    #oneBxoId="prs-bisos"
    #oneBxoId="${currentBxoId}"
    #oneBxoId="pic_dnsServer"
    oneBxoId="${sysCharContainerBxoId}"        
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )
    

    function repoBaseCreateAndPushExamples {
	EH_assert [[ $# -eq 2 ]]
	local repoName=$1
	local description=$2
	cat  << _EOF_
$( examplesSeperatorSection "${description}" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBaseCreate_${repoName}
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBasePush ${repoName}
_EOF_
    }	
    
    visLibExamplesOutput ${G_myName}

    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site Container Bases" )
ls -l ~${sysCharContainerBxoId}    # This Container (Host)
${G_myName} ${extraInfo} -i selectedSiteBxoId
${selectedSiteBxoId}               # Selected Site bxoId
${containersBase}                  # Selected Site Containers Base
$( examplesSeperatorChapter "Container Assignment" )
siteContainerAssign.sh   # Prerequisite for sysCharRealize.sh
siteContainerRepo.sh     # Prerequisite for sysCharRealize.sh
$( examplesSeperatorChapter "Container Repo Realization" )
${G_myName} ${extraInfo} -i sysCharContainerBxoId ${containerBase}
${G_myName} ${extraInfo} -i sysCharContainerBxoId ${containersBase}/assign/Virt/Auto/Generic/deb10
${G_myName} ${extraInfo} -i sysCharContainerRealize ${containerBase}
${G_myName} ${extraInfo} -i sysCharContainerRealize ${containersBase}/assign/Virt/Auto/Generic/deb10
_EOF_

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "Provisioning: Initial BxE Realize -- Full Actions" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fullCreateAndPush
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i kindTypeRealizeRepoBasesCreate
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i kindTypeRealizeRepoBasesPush
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i basesFullCreate
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBasesList
$( repoBaseCreateAndPushExamples svcsSpec "svcsSpec Repo (Services Specifications)" )
$( repoBaseCreateAndPushExamples sysSpec "sysSpec Repo (System Specifications)" )
$( repoBaseCreateAndPushExamples sysSpec "sysChar Repo (System Character)" )
$( repoBaseCreateAndPushExamples containerBxO "Container BxO Repo" )
$( repoBaseCreateAndPushExamples deploymentRecords "Deployment Records Repo" )
$( repoBaseCreateAndPushExamples panel "BxO Panel Repo" )
$( examplesSeperatorChapter "Bases Create" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i baseCreate_var
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i sysCharReport
_EOF_
}


function vis_sysCharContainerRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** With $1=containerBase, realize the sysCharContainerBxoId.
*** Typical usage is \$=container base of this system obtained from siteContainerAssign.sh -i forThisSysFindContainerBase
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerAssignBase=$1  # global variable

   local sysCharContainerBxoId=$( vis_sysCharContainerBxoId "${containerAssignBase}" )
   EH_assert [ ! -z "${sysCharContainerBxoId}" ]
   local selectedSiteBxoId=$( vis_selectedSiteBxoId )   # used as parent for provisioning of sysCharContainerBxoId
   local containerId=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" containerId )  # used as name for provisioning

   if vis_bxoAcctVerify "${sysCharContainerBxoId}" ; then
       ANT_raw "${sysCharContainerBxoId} account exists, already realized -- provisioning skipped"
   else
       ANT_raw "${sysCharContainerBxoId} will be realized"       
       lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${containerId}" -i startToPrivRealize       
   fi

   bxoId="${sysCharContainerBxoId}"
   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )

   vis_kindTypeRealizeRepoBasesCreate

   vis_basesFullCreate
}

function vis_repoBasesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat  << _EOF_
panel
deploymentRecords
sysChar
svcsSpec
_EOF_

    lpReturn
}

function vis_basesList {
    cat  << _EOF_
var
siteContainersRepo
_EOF_
}


function vis_baseCreate_var {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_bxoAcctVerify "${bxoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bxoHome}/${baseName}"
    
    local bisosVarBaseDir="/bisos/var/bxoId/${bxoId}"

    lpDo FN_dirCreatePathIfNotThere ${bisosVarBaseDir}
    
    lpDo FN_fileSymlinkUpdate ${bisosVarBaseDir} ${basePath}

    lpReturn
}	



function vis_baseCreate_siteContainersRepo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_bxoAcctVerify "${bxoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bxoHome}/${baseName}"

    local siteContainersBase=$( siteContainerRepo.sh -i containersBaseObtain )
    local containersRepoPath="${siteContainersBase}/${bxoId##pmp_}"
    EH_assert [ -d "${containersRepoPath}" ]

    lpDo FN_fileSymlinkUpdate "${containersRepoPath}" "${basePath}"

    lpReturn
}	

function vis_basesFullCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Creates bases (eg var) based on vis_basesList.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"
BxO Repo: ${repoBase} 
Placeholder for records/logs of materialization/deployment.
_EOF_

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}	


function vis_repoBaseCreate_svcsSpec {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
includes a list of BxSO's which provide the expected services
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/fps
    lpDo fileParamManage.py -i fileParamWrite ${repoBase}/fps bxoId UnSpecified

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}	


function vis_repoBaseCreate_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
for now just a bin directory
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/virtualization.fps
    lpDo fileParamManage.py -i fileParamWrite ${repoBase}/virtualization.fps virtType default

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/vmSpec.fps
    lpDo fileParamManage.py -i fileParamWrite ${repoBase}/vmSpec.fps baseBox medium

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/bin
    lpDo touch ${repoBase}/bin/materialize.sh

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

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
