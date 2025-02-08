#!/bin/bash

IcmBriefDescription="containerRepoSelf.sh replaced siteContainerRepo.sh after svc conversion."

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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
Creates ~bpoId/containerId/{self,steady}
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
}


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    local bpoId=$( vis_bpoIdPrep "sysChar" )

    local bpoHome="UNKNWON-sysChar-HOME"
    local containerId=${UNKNWON-sysChar-CONTAINER}

    if [ -z "${bpoId}" ] ; then
        bpoId="UNKNWON-sysChar"
    else
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
        containerId=${bpoId##pmp_}
    fi

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Self Update -- Create/Update ${bpoHome/${containerId}/{self,steady}" )
${G_myName} ${extraInfo} -i selfUpdateFull "${bpoId}"  # selfUpdateBoxFPs
${G_myName} ${extraInfo} -i selfUpdateFull pmp_VAG-deb12_  # selfUpdateBoxFPs
${G_myName} ${extraInfo} -i selfUpdateBoxFPs "${bpoId}"  # Creates/Updates ${bpoHome}/${containerId}/self/box.fps
${G_myName} ${extraInfo} -i selfUpdateContainerFPsAndSteady "${bpoId}" # Creates/Updates ${bpoHome}/${containerId}/steady and container.fps
$( examplesSeperatorChapter "Repos Clonining" )
${G_myName} ${extraInfo} -i containerRepoClone  # Incomplete NOTYET
$( examplesSeperatorChapter "Bases After Creation Clonining" )
find ${bpoHome}/${containerId}/self/box.fps -print
find ${bpoHome}/${containerId}/self/box.fps -print | grep value | xargs grep ^
find ${bpoHome}/${containerId}/self/container.fps -print
find ${bpoHome}/${containerId}/self/container.fps -print | grep value | xargs grep ^
find ${bpoHome}/${containerId}/steady -print
find ${bpoHome}/${containerId}/steady -print | grep value | xargs grep ^
find ${bpoHome}/${containerId} -print | grep value | xargs grep ^
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

   echo OBSOLTED  vis_containerRepoClone
   return

   local containerAssignBase=$1

   local containerId=$( fileParamManage.cs -i fileParamRead  ${containerAssignBase} containerId )
   EH_assert [ ! -z ${containerId} ]

   lpDo vis_containerRepoNamedClone "${containerId}"
   
   lpReturn
}       


function vis_selfUpdateFull {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
Rename to containerSelfRepo.sh
in PSS-1006/self/box.fps and container.fps
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local bpoId=$1

   lpDo vis_selfUpdateBoxFPs ${bpoId}
   lpDo vis_selfUpdateContainerFPsAndSteady full ${bpoId}
}


function vis_selfUpdateBoxFPs {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
Rename to containerSelfRepo.sh
in PSS-1006/self/box.fps and container.fps
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local bpoId=$1

   EH_assert [ ! -z "${bpoId}" ]
   EH_assert vis_bxoAcctVerify "${bpoId}"

   bpoHome=$( FN_absolutePathGet ~${bpoId} )

   local containerId=${bpoId##pmp_}
   local repoBase="${bpoHome}/${containerId}"

   local modelInitial=${containerId:0:1}
   local thisModel=$( vis_withInitialGetModel ${modelInitial} )

   local boxFpsBase=${repoBase}/self/box.fps

   lpDo mkdir -p ${boxFpsBase}

   case "${thisModel}" in
       Host|host|HOST|Pure|pure|PURE)

           declare -A containerRegDict=$( svcInvSiteRegContainer.cs -i thisBox_read | pyLiteralToBash.cs -i stdinToBash )

           local uniqueBoxId=${containerRegDict['uniqueBoxId']}
           local boxId=${containerRegDict['boxId']}
           local boxNu=${containerRegDict['boxNu']}

           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} uniqueBoxId ${uniqueBoxId}
           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} boxId ${boxId}
           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} boxNu ${boxNu}

           ;;
       Virt|virt|VIRT)
           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} uniqueBoxId "virt"
           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} boxId "virt"
           lpDo fileParamManage.cs -i fileParamWrite ${boxFpsBase} boxNu "virt"

           ;;
       *)
           EH_problem "Bad Usage -- model=${thisModel}"

           ;;
   esac
}

function vis_selfUpdateContainerFPsAndSteady {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRealizationScope -- \$2 is containerId
*** Based on containerId, a repoBase is created.
*** repoBase/assign sym links to containerAssignBase
*** Based on model+abode+function repoBase/steady is populated.
--------------
Rename to containerSelfRepo.sh
in PSS-1006/self/box.fps and container.fps
_EOF_
                      }
   EH_assert [[ $# -eq 2 ]]

   local bxoRealizationScope=$1
   local bpoId=$2

   local retVal=0

   EH_assert [ ! -z "${bpoId}" ]
   EH_assert vis_bxoAcctVerify "${bpoId}"

   bpoHome=$( FN_absolutePathGet ~${bpoId} )

   local containerId=${bpoId##pmp_}
   local repoBase="${bpoHome}/${containerId}"

   declare -A containerRegDict=$( svcInvSiteRegContainer.cs -i withContainerIdRead ${containerId} | pyLiteralToBash.cs -i stdinToBash )

   EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
   EH_assert [ ! -z ${containerId} ]

   local containerRegDictId=${containerRegDict['containerId']}
   EH_assert [ ${containerRegDictId} == ${containerId} ]

   #local containerId=$( fileParamManage.cs -i fileParamRead  ${containerAssignBase} containerId )
   local containerNu=${containerRegDict['containerNu']}

   local model=${containerRegDict['model']}
   local abode=${containerRegDict['abode']}
   local function=${containerRegDict['function']}

   local boxNu=${containerRegDict['boxId']}

   function selfUpdateContainerFPs {
      local containerFpsBase=${repoBase}/self/container.fps

      lpDo mkdir -p ${containerFpsBase}

      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} containerId ${containerId}
      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} boxId ${boxNu}
      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} containerNu ${containerNu}
      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} model ${model}
      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} abode ${abode}
      lpDo fileParamManage.cs -i fileParamWrite ${containerFpsBase} function ${function}
   }
   selfUpdateContainerFPs

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
               Shield)
                   containerSteady_networkMode="static"
                   case ${model} in
                       Host|Pure)
                           # Host or Pure = containerBox
                           containerSteady_privA_addr=$( lpDo siteNetworks.sh -i assignBoxAddr privA ${boxNu} )
                           ;;
                       Virt)
                           containerSteady_privA_addr=$( lpDo siteNetworks.sh -i assignVirtAddr privA ${containerNu} )
                           ;;
                       *)
                           EH_problem "Bad Usage -- invalid model=${model}"
                           ;;
                   esac
                   ;;
               
               Internet)
                   containerSteady_networkMode="static"
                   local applicableNets=$( lpDo vis_withAbodeGetApplicableNetsList "${abode}" )
                   for eachNetName in ${applicableNets} ; do
                       case ${model} in
                           Host|Pure)
                               # Host or Pure = containerBox
                               containerSteady_${eachNetName}_addr=$( lpDo siteNetworks.sh -i assignBoxAddr ${eachNetName} ${boxNu} )
                               ANT_cooked "containerSteady_${eachNetName}_addr set to: ${containerSteady_${eachNetName}_addr}"
                               ;;
                           Virt)
                               # Note Indirection ${! below
                               local eachContainerSteadyNetName=$( echo "containerSteady_${eachNetName}_addr" )
                               eval "${eachContainerSteadyNetName}=$( lpDo siteNetworks.sh -i assignVirtAddr ${eachNetName} ${containerNu} )"
                               ANT_cooked "${eachContainerSteadyNetName}" set to: "${!eachContainerSteadyNetName}"
                               ;;
                           *)
                               EH_problem "Bad Usage -- invalid model=${model}"
                               ;;
                       esac
                   done
                   ;;

               
               perim)
                   EH_problem "NOTYET"
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
