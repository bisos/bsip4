#!/bin/bash

IimBriefDescription="sysCharRealize replaces noroSysCharRealize. Gets rid of siteContainerRepo.sh. See Panel."

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

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh


# PRE parameters

typeset -t bpoId=""

typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

function G_postParamHook {
    # bpoIdPrepValidate

    if [ ! -z "${bpoId}" ] ; then
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
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

    local bpoId=$( vis_bpoIdPrep "sysChar" )

    local bpoHome="UNKNWON-sysChar-HOME"
    local containerId=${UNKNWON-sysChar-CONTAINER}

    if [ -z "${bpoId}" ] ; then
        bpoId="UNKNWON-sysChar"
    else
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
        containerId=${bpoId##pmp_}
    fi

    oneBxoId="${bpoId}"

    oneBxoRepoScope="full"

    containersBase="/bisos/admin/sysChar/generics/"

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
$( examplesSeperatorChapter "Container Assignment  -- Registrar Facilities" )
svcInvSiteRegContainer.cs   # Prerequisite for sysCharRealize.sh
containerRepoSelf.sh     # Prerequisite for sysCharRealize.sh
svcInvSiteRegContainer.cs --model="Host" --abode="Shield" --purpose="Server"  -i thisSys_findContainer
sysCharGenericsRealize.sh  # Realizes Generic BPOs, needed in Genesis and for new releases
$( examplesSeperatorChapter "SysChar Container Realization -- With Base and With Id" )
${G_myName} ${extraInfo} -i sysCharContainerIdRealize ${oneBxoRepoScope} HSS-1006  # INTERNAL Interface
${G_myName} ${extraInfo} -i sysCharContainerBaseRealize ${oneBxoRepoScope} ${containersBase}/Virt/Auto/Generic/deb12  # MAIN Interface For FPs
$( examplesSeperatorChapter "Box -- Site Assign SysChar And Container Realization" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i thisSys_containerAssign  # Uses Remote Registrar
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerVirtAssignAndRepo
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i sysCharContainerBoxRealize  # Does not bpoIdManage
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
${G_myName} ${extraInfo} -p model=Host -p abode=Internet -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
${G_myName} ${extraInfo} -p model=Pure -p abode=Mobile -p function=LinuxU -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
$( examplesSeperatorChapter "Virt -- Site Assign SysChar And Container Realization" )
${G_myName} ${extraInfo} -p model=Virt -p abode=Shield -p function=Server -i containerAssignAndRepo
${G_myName} ${extraInfo} -p model=Virt -p abode=Shield -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
${G_myName} ${extraInfo} -p model=Virt -p abode=Internet -p function=Server -i containerAssignAndRepo
${G_myName} ${extraInfo} -p model=Virt -p abode=Internet -p function=Server -i containerAssignAndRepoAndSysCharRealize  # FULL ACTION -- PRIMARY COMMAND
_EOF_

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "Provisioning: Initial BxE Realize -- Full Actions" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i fullCreateAndPush # NOTYET, perhaps kindTypeRealizeRepoBases
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesCreate
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesPush
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i basesFullCreate
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
${G_myName} ${extraInfo} -i repoBasesList
$( repoBaseCreateAndPushExamples sysChar "sysChar Repo (System Character)" )
$( repoBaseCreateAndPushExamples svcsSpec "svcsSpec Repo (Services Specifications)" )
$( repoBaseCreateAndPushExamples deploymentRecords "Deployment Records Repo" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i sysCharWrite   # Temporary -- This is not the right place
$( examplesSeperatorChapter "Bases Create" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i baseCreate_var
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i sysCharReport
${G_myName} ${extraInfo} -i containerBoxSysCharReport
${G_myName} ${extraInfo} -i sysCharNetInterfaceSet privA eth0   # NOTYET, placeholder
_EOF_

 }

function vis_containerAssignAndRepoAndSysCharRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Dispatches to BoxRealize or to VirtRealize.
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]   
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local siteContainerRepoBase=""
   
   case "${model}" in

       Host|host|HOST|Pure|pure|PURE)
           
           lpDo vis_sysCharContainerBoxRealize

           # MB 20240216 below lines have not been tested

           # containerNusStr is something like "( 1009 )"
           local containerNusStr=$( lpDo eval svcInvSiteRegContainer.cs --model="${model}" --abode="${abode}" --purpose="${function}"  -i thisSys_findContainer \| pyLiteralToBash.cs -i stdinToBash  )
           local containerNus
           lpDo eval containerNus=${containerNusStr}
           local containerNu=${containerNus[0]}
           EH_assert [ ! -z "${containerNu}" ]
           local containerId=$(vis_containerId ${containerNu})

           local sysCharContainerBpoId="pmp_${containerId}"

           # We do this so that bpoId=sysChar would work.
           lpDo bpoIdManage.sh -h -v -n showRun -i bpoIdFpsWrite sysChar ${sysCharContainerBpoId}

           ;;
       Virt|virt|VIRT)

           lpDo vis_sysCharContainerVirtRealize # ${siteContainerAssignBase}"
           ;;
       *)
           EH_problem "Bad Usage -- model=${model}"
   esac
}       


function vis_sysCharContainerBoxRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Assigns a site container to box (if needed), invokes sysCharContainerIdRealize full
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]   
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]
   
   local containerId=$( vis_thisSys_containerAssign )
   EH_assert [ ! -z "${containerId}" ]
                              
   lpDo vis_sysCharContainerIdRealize full ${containerId}
}       

function vis_sysCharContainerVirtRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local containerId=$( vis_virt_containerAssign )
   EH_assert [ ! -z "${containerId}" ]

   lpDo vis_sysCharContainerIdRealize full ${containerId}


}       

function vis_thisSys_containerAssign {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Registrar Service invokes and obtains a containerId
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local containerId=$( lpDo svcInvSiteRegContainer.cs --model="${model}" --abode="${abode}" --purpose="${function}" -i thisSys_assignContainer )

   echo ${containerId}
}

function vis_virt_containerAssign {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Registrar Service invokes and obtains a containerId
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local containerId=$( lpDo svcInvSiteRegContainer.cs --model="${model}" --abode="${abode}" --purpose="${function}" --boxNu=virt -i reg_container_add )

   echo ${containerId}
}

function vis_sysCharContainerIdRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bpoRepoScope -- \$2 is containerId
** containerId is expected to have been registered.
_EOF_
                      }
   EH_assert [[ $# -eq 2 ]]

   local bxoRealizationScope=$1
   local containerId=$2

   EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
   EH_assert [ ! -z ${containerId} ]

   # sysCharContainerBxoId is just a bpoId derived from containerId assignment. It may or may not exist
   local sysCharContainerBpoId=$( vis_sysCharContainerBpoIdName "${containerId}" )
   EH_assert [ ! -z "${sysCharContainerBpoId}" ]

   bpoId="${sysCharContainerBpoId}"
     
   if vis_bxoNameExists ${sysCharContainerBpoId} ; then
       ANT_raw "bpoId=${sysCharContainerBpoId}  already realized -- provisioning skipped"
       if vis_bxoAcctVerify "${sysCharContainerBpoId}" ; then
           ANT_raw "And bpoId=${sysCharContainerBpoId} account exists, -- provisioning skipped"
       else
           ANT_raw "But bpoId=${sysCharContainerBpoId} account Does Not exists, -- provisioning skipped"
       fi
       ANT_cooked "You Can run basesFullCreate and kindTypeRealizeRepoBases if needed"
       # return
   fi

   local selectedSiteBxoId=$( vis_selectedSiteBxoId )   # used as parent for provisioning of sysCharContainerBxoId

   if vis_bxoAcctVerify "${sysCharContainerBpoId}" ; then
       ANT_raw "bpoId=${sysCharContainerBpoId} account exists, already realized -- provisioning skipped"
       ANT_raw "Not Running: bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${containerId}" -i startToPrivRealize ${bxoRealizationScope}"
       ANT_raw "You Can run basesFullCreate and kindTypeRealizeRepoBases if needed"
       # return
   else
       ANT_raw "${sysCharContainerBpoId} will be realized"
       #lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${containerId}" -i startToPrivRealize
       lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${containerId}" -i startToPrivRealize ${bxoRealizationScope}
   fi

   EH_assert vis_bxoAcctVerify "${bpoId}"
   bpoHome=$( FN_absolutePathGet ~${bpoId} )

   # Capture box and container.fps of registrar in sysChar
   lpDo containerRepoSelf.sh -h -v -n showRun -i selfUpdateFull ${bpoId}

   # vis_basesFullCreate needs to run before vis_kindTypeRealizeRepoBases
   vis_basesFullCreate # Creates symlinks in ~bxo

   vis_kindTypeRealizeRepoBases ${bxoRealizationScope}
}


function vis_sysCharContainerBaseRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRepoScope -- \$2 is path to siteContainerAssignBase
** With $1=siteContainerAssignBase, realize the sysCharContainerBxoId.
*** Typical usage is for when containerNu is pre-assigned. For example for generics (VAG-deb12_)
_EOF_
                      }
   EH_assert [[ $# -eq 2 ]]

   local bxoRealizationScope=$1
   local containerAssignBase=$2

   EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
   EH_assert [ -d ${containerAssignBase} ]

   # sysCharContainerBxoId is just a bpoId derived from containerId assignment. It may or may not exist
   local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName "${containerAssignBase}" )
   EH_assert [ ! -z "${sysCharContainerBxoId}" ]

   local containerNu=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" containerNu )  # used as name for provisioning
   EH_assert [ ! -z "${containerNu}" ]

   # Perhaps containerNu == _next_ is useful for batch numbered  assignments

   local model=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" "model" )
   EH_assert [ ! -z "${model}" ]
   local abode=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" "abode" )
   EH_assert [ ! -z "${abode}" ]
   local function=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" "function" )
   EH_assert [ ! -z "${function}" ]

   local containerId=$(  lpDo svcInvSiteRegContainer.cs --model="${model}" --abode="${abode}" --purpose="${function}" --containerNu=${containerNu} --boxNu=virt -i reg_container_add )

   local fps_containerId=$( fileParamManage.py -i fileParamRead  "${containerAssignBase}" containerId )  # used as name for provisioning
   EH_assert [ ! -z "${fps_containerId}" ]

   if [ "${containerId}" != "${fps_containerId}"  ] ; then
       EH_problem "containerId: ${containerId} is not same as ${fps_containerId} -- ${fps_containerId} will be used"
       containerId=${fps_containerId}
   fi

   lpDo vis_sysCharContainerIdRealize "${bxoRealizationScope}" ${containerId}
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
    # siteContainersRepo NOTYET, Needs to be redone as containerRepoSelf
    cat  << _EOF_
var
_EOF_
}


function vis_baseCreate_var {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Create /bisos/var/bpoId/${bpoId} and symlink to it as ~bpoId/var.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert vis_bxoAcctVerify "${bpoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bpoHome}/${baseName}"
    
    local bisosVarBaseDir="/bisos/var/bpoId/${bpoId}"

    lpDo FN_dirCreatePathIfNotThere ${bisosVarBaseDir}
    
    lpDo FN_fileSymlinkUpdate ${bisosVarBaseDir} ${basePath}

    lpReturn
}       


function vis_baseCreate_siteContainersRepoNotNeeded {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Symlink to site containers.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert vis_bxoAcctVerify "${bpoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bpoHome}/${baseName}"

    # siteContainerRepo.sh -i containerRepoBasePrep basePrep Happens Here
    local siteContainersBase=$( siteContainerRepo.sh -i containersBaseObtain )
    local containersRepoPath="${siteContainersBase}/${bpoId##pmp_}"
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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert vis_bxoAcctVerify "${bpoId}"

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


function vis_repoBaseCreate_svcsSpec {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
includes a list of BxSO's which provide the expected services
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/fps
    lpDo fileParamManage.py -i fileParamWrite ${repoBase}/fps bpoId UnSpecified

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}       


function vis_repoBaseCreate_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bpoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
for now just a bin directory
_EOF_

    # vis_sysCharWrite is in ./sysChar_lib.sh 
    lpDo vis_sysCharWrite

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
