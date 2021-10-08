#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bpo_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/container_lib.sh

. ${opBinBase}/box_lib.sh

# PRE parameters
typeset -t model=""     # one of {h,p,v}
typeset -t abode=""  # one of {bpec,bpsc,bipc,bluc,bauc,bdc}


function G_postParamHook {

    lpCurrentsGet

    lpReturn 0
}


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    #typeset oneId=`ifconfig eth0 | grep HWaddr | cut -c 39-55`
    # local oneId=$( sudo dmidecode -s system-uuid )
    local oneId=$(vis_thisBoxUUID)

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local containersBase=$( vis_containersBaseObtain )
    local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )

    local containerRepoBase=$( vis_containerRepoBase ${containerBase} )
    local containerId=$( basename ${containerRepoBase} )
    
    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Containers Bases Information" )
${G_myName} ${extraInfo} -i containersBaseObtain
${G_myName} ${extraInfo} -i containersAssignBaseObtain
ls -ld ${containersBase}/*
find ${containersBase} -print
${G_myName} -i containersGenericsAssignList
$( examplesSeperatorChapter "Container Repo Information" )
${G_myName} ${extraInfo} -i containerRepoBase ${containerBase}  # returns path on stdout
${G_myName} ${extraInfo} -i containerRepoBaseExistsP ${containerBase} # exists 0 or 1
$( examplesSeperatorChapter "Container Repo Creation -- Updates steady" )
${G_myName} ${extraInfo} -i containerRepoUpdate basePrep "${containerBase}"
${G_myName} ${extraInfo} -i containerRepoUpdate realize "${containerBase}"
${G_myName} ${extraInfo} -i containerRepoUpdate full ${containerBase}
$( examplesSeperatorChapter "Generic Container Repo Creation -- Applies To All Generics" )
${G_myName} ${extraInfo} -i containerRepoUpdate ${containersBase}/assign/Virt/Auto/Generic/deb10
${G_myName} ${extraInfo} -i containerRepoGenericsUpdate examples basePrep # bxoRealizationScope=basePrep|realize|full
${G_myName} ${extraInfo} -i containerRepoGenericsUpdate examples realize # bxoRealizationScope=basePrep|realize|full
${G_myName} ${extraInfo} -i containerRepoGenericsUpdate examples full # bxoRealizationScope=basePrep|realize|full
${G_myName} ${extraInfo} -i containerRepoGenericsUpdate doIt full  # bxoRealizationScope=basePrep|realize|full
$( examplesSeperatorChapter "Repos Clonining" )
${G_myName} ${extraInfo} -i containerRepoClone ${containerBase}
${G_myName} ${extraInfo} -i containerRepoNamedClone ${containerId}
${G_myName} ${extraInfo} -i containerRepoNamedCloneAll
_EOF_
}


noArgsHook() {
  vis_examples
}


function vis_containerRepoClone {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local containerAssignBase=$1

   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )
   EH_assert [ ! -z ${containerId} ]

   lpDo vis_containerRepoNamedClone "${containerId}"
   
   lpReturn
}       


function vis_containerRepoNamedClone {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local containerId=$1
   EH_assert [ ! -z ${containerId} ]
   
   local containersBase=$( containersBaseObtain )
   EH_assert [ ! -z ${containersBase} ]

   local siteBxoId=$( vis_selectedSiteBxoId )
   EH_assert [ ! -z ${siteBxoId} ]
   
   local containersBxoId=$( vis_fromSiteBxoIdGet_containersBxoId "${siteBxoId}")
   EH_assert [ ! -z ${containersBxoId} ]
   
   local repoBasePath="${containersBase}/${containerId}"

   if [ -d "${repoBasePath}" ] ; then
       ANT_raw "${repoBasePath} exists -- cloning skipped"
   else
       lpDo git clone git@bxoPriv_${containersBxoId}:${containersBxoId}/${containerId}.git
   fi
}       


function vis_containerRepoNamedCloneAll {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Clone all available repos.
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   local containerReposList=$( vis_containerReposList )

   for each in ${containerReposList} ; do
       lpDo vis_containerRepoNamedClone ${each}
   done
}       

   

function vis_containerRepoGenericsUpdate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 2 ]]

   local examplesOrDoIt=$1
   local bxoRealizationScope=$2
   EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"

   local genericBasesList=( $( vis_containersGenericsAssignList ) )

   local extraInfo="-h -v -n showRun"
   
   for each in ${genericBasesList[@]} ;  do
       if [ "${examplesOrDoIt}" == "examples" ] ; then
           cat  << _EOF_
${G_myName} ${extraInfo} -i containerRepoUpdate ${bxoRealizationScope} ${each}
_EOF_
       elif [ "${examplesOrDoIt}" == "doIt" ] ; then
           lpDo vis_containerRepoUpdate ${bxoRealizationScope} ${each}
       else
           EH_problem "Bad Usage -- ${examplesOrDoIt}"
       fi
   done
   
   lpReturn
}       


function vis_containerRepoUpdate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRealizationScope -- \$2 is path to containerAssignBase
*** Based on containerId, a repoBase is created.
*** repoBase/assign sym links to containerAssignBase
*** Based on model+abode+function repoBase/steady is populated.
_EOF_
                      }
   EH_assert [[ $# -eq 2 ]]

   local bxoRealizationScope=$1
   local containerAssignBase=$2
   local retVal=0

   EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
   EH_assert [ -d ${containerAssignBase} ]

   local containersBase=$( containersBaseObtain )
   
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )
   local containerNu=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerNu )

   local repoBase="${containersBase}/${containerId}"

   lpDo vis_with_bxoRealizationScope_createBaseDirOrCreateRepo "${bxoRealizationScope}" "${repoBase}"
   retVal=$?
   if [ ${retVal} == 1 ] ; then lpReturn 0; fi;   # repo was created. We are done.
   EH_assert [ -d "${repoBase}" ]
   
   lpDo FN_fileSymlinkUpdate ${containerAssignBase} ${repoBase}/assign

   local model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )            
   local abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
   local function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )

   local containerSteadyBase=${repoBase}/steady
   lpDo mkdir -p ${containerSteadyBase}

   containerSteady_networkMode=""
   containerSteady_privA_addr=""
   
   case ${function} in
       Generic)
           # Generic applies to privA only
           case ${abode} in
               Auto)
                   containerSteady_networkMode="auto"
                   ;;
               Shield)
                   containerSteady_networkMode="static"
                   containerSteady_privA_addr="generic"
                   ;;
               *)
                   doNothing
                   ;;
           esac
           ;;
       Server)
           case ${abode} in
               Auto|Mobile)
                   containerSteady_networkMode="auto"
                   ;;
               Shield|Internet|perim)
                   containerSteady_networkMode="static"
                   local applicableNets=$( vis_withAbodeGetApplicableNetsList "${containerAssign_abode}" )
                   for eachNetName in ${applicableNets} ; do
                       case ${model} in
                           Host|Pure)
                               # Host or Pure = containerBox
                               lpDo siteNetworks.sh -i assignBoxAddr privA $(siteBoxAssign.sh -i thisBoxFindNu)
                               ;;
                           Virt)
                               lpDo siteNetworks.sh -i assignVirtAddr privA ${containerNu}
                               ;;
                           *)
                               EH_problem "Bad Usage -- invalid model=${model}"
                               ;;
                       esac
                   done
                   ;;
               *)
                   doNothing
                   ;;
           esac
           ;;
       LinuxU)
           case ${abode} in
               Auto|Mobile)
                   containerSteady_networkMode="auto"
                   ;;
               *)
                   doNothing
                   ;;
           esac
           ;;
       *)
           EH_problem "NOTYET -- unimplemented ${function}"
   esac

   lpDo vis_containerSteadyWrite "${containerSteadyBase}"

   lpDo vis_repoCreateAndPushBasedOnPathBasedOn_bxoRealizationScope "${bxoRealizationScope}" ${repoBase}

   lpReturn
}       


function vis_containerRepoBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is path to containerAssignBase
*** Based on containerId FP of \$1=containerAssignBase, the repoBasePath is returned on stdout.
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local containerAssignBase=$1

   local containersBase=$( containersBaseObtain )
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )

   local repoBasePath="${containersBase}/${containerId}"

   echo ${repoBasePath}

   lpReturn
}       

function vis_containerRepoBaseExistsP {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is path to containerAssignBase
*** if \$( vis_containerRepoBase ${containerAssignBase} ) exists, return 0.
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local containerAssignBase=$1
   local retVal=0
   local repoBasePath=$( vis_containerRepoBase ${containerAssignBase} )

   if [ -d "${repoBasePath}" ] ; then
       lpReturn 0
   else
       lpReturn 1
   fi

   lpReturn
}       



function vis_containerRepoUpdate%% {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
With $1=containerId (eg HSS-1001), update the repo at bpoId base.
- record: model, abode, function.
- Based on abode, determine, interfaces/nets and assign ipAddrs
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local containerAssignBase=$1

   local containersBase=$( containersBaseObtain )
   
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )

   local repoBase="${containersBase}/${containerId}"

   opDoRet mkdir -p ${repoBase}
   lpDo FN_fileSymlinkUpdate ${containerAssignBase} ${repoBase}/assign

   local abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
   local function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )
   local model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )         

   local platformInfoBase=${repoBase}/platformInfo.fps
   lpDo mkdir -p ${platformInfoBase}

   local netAttachmentsBase=${repoBase}/netAttachments.fps
   lpDo mkdir -p ${netAttachmentsBase}

   local identityBase=${repoBase}/identity.fps
   lpDo mkdir -p ${identityBase}

   case ${function} in
       Server)
           lpDo fileParamManage.py -i fileParamWrite ${platformInfoBase} vmGuestLeastSize "medium"
           lpDo fileParamManage.py -i fileParamWrite ${platformInfoBase} networkMode "fixed"       
           ;;

       *)
           EH_problem "NOTYET -- unimplemented ${function}"
   esac

   lpDo mkdir -p ${netAttachmentsBase}/if1
   
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4/ipAddrs
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps addr "192.168.0.151"
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps gateway "192.168.0.220"
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps netmask "24"
    
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers/auto.fps
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers/dns1.fps

   lpDo mkdir -p ${netAttachmentsBase}/if1/routes
   lpDo mkdir -p ${netAttachmentsBase}/if1/routes/auto.fps
   lpDo mkdir -p ${netAttachmentsBase}/if1/routes/route1.fps
   
   lpReturn
}       

