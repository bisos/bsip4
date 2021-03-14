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

* This is a starting point for Merging opMachines.sh and bystarBoxAdmin.sh -- IMPORTANT --
** Use site/assign/BOX/box0059/cpf_box0059.sh
** Get rid of items file -- Get rid of subjectAction
** Scope of this is Physiacl Machines -- Not Virtual Machines -- unique id comes from dmidecode -s system-uuid and being physical
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


. ${opBinBase}/bxo_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t model=""     # one of [HPV]
typeset -t abode=""     # one of [MAPIS]
typeset -t function=""  # one of [LASD]

function G_postParamHook {

    lpCurrentsGet

    lpReturn 0
}


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    #typeset oneId=`ifconfig eth0 | grep HWaddr | cut -c 39-55`
    local oneId=$( sudo dmidecode -s system-uuid )

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local containersBase=$( containersAssignBaseObtain )
    EH_assert [ ! -z "${containersBase}" ]

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )
    #local containerBase=$( vis_withBoxIdFindContainerBase "${boxId}" )
    local containerBase=$( vis_forThisSysFindContainerBase )
    local containerNu=$( vis_fromContainerBaseGetContainerNu "${containerBase}" )    

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Containers Bases Information" )
${G_myName} ${extraInfo} -i containersAssignBaseObtain
ls -ld ${containersBase}/*
find ${containersBase} -print
$( examplesSeperatorChapter "Containers Bases Initializations" )
${G_myName} ${extraInfo} -i modelAbodeFunctionBaseDirsCreate    # INITIALIZATION -- create basis for nu assignments
$( examplesSeperatorChapter "BoxId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i withBoxIdFindContainerBase "${boxId}"
${G_myName} ${extraInfo} -i fromContainerBaseGetContainerNu "${containerBase}"
$( examplesSeperatorChapter "machineId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i thisMachineId
${G_myName} ${extraInfo} -i withMachineIdFindContainerBase "$( vis_thisMachineId )"
$( examplesSeperatorChapter "BoxOrMachineId To ContainerId Mapping" )
${G_myName} ${extraInfo} -i withBoxOrMachineIdFindContainerBase "$( vis_thisMachineId )"
${G_myName} ${extraInfo} -i forThisSysFindContainerBase
$( examplesSeperatorChapter "Container Box Assignment -- Primary Commans" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerBoxAssign  # PRIMARY COMMAND
$( examplesSeperatorChapter "Container Assignments" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerNuGetNext
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerUpdate_atNu "${containerNu}"
$( examplesSeperatorChapter "Assigned Containers Report" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerReport_atNu "${containerNu}"
${G_myName} -i containerReport_atBase "${containerBase}"
$( examplesSeperatorChapter "General Assignment Facilities" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerId "${containerNu}"
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i assignedContainerBase "${containerNu}"
${G_myName} ${extraInfo} -i withContainerIdGetBase "HSS-1001"
${G_myName} ${extraInfo} -i withInitialGetModel "H"     # one of: [HPV]
${G_myName} ${extraInfo} -i withInitialGetAbode "S"     # one of: [AMPSI]
${G_myName} ${extraInfo} -i withInitialGetFunction "S"  # one of: [LASD]
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_containersAssignBaseObtain {
    containersAssignBaseObtain
}

function containersAssignBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId
    local selectedContainersPath="${usgHome}/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId"
    
    local containersBxoId=""

    if [ -d "${selectedContainersPath}" ] ; then
	containersBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedContainersPath} )
	if [ -z "${containersBxoId}" ] ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${containersBxoId}" ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedContainersPath}"
	lpReturn 101
    fi

    local containersBase=$( FN_absolutePathGet ~${containersBxoId} )/assign
    EH_assert [ -d "${containersBase}" ]

    echo "${containersBase}"

    lpReturn
}	


function vis_modelAbodeFunctionBaseDirsCreate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local models=("Host" "Pure" "Virt")
   local abodes=("Mobile" "Auto" "Perim" "Internet" "Shield")
   local functions=("LinuxU" "AndroidU" "Server" "Devel")   

   for eachModel in ${models[@]} ;  do
       for eachAbode in ${abodes[@]} ; do
	   for eachFunction in ${functions[@]} ; do
	       lpDo mkdir -p  ${containersBase}/${eachModel}/${eachAbode}/${eachFunction}
	   done
       done
   done

   lpReturn
}

function vis_withInitialGetModel {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local modelInitial=$1
   local result=""   

   case "${modelInitial}" in
       "H")
	   result="Host"
	   ;;
       "P")
	   result="Pure"
	   ;;
       "V")
	   result="Virt"
	   ;;
       *)
	   EH_problem "Bad Usage -- modelInitial=${modelInitial}"
   esac
   echo ${result}
}

function vis_withInitialGetAbode {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local abodeInitial=$1
   local result=""

   case "${abodeInitial}" in
       "A")
	   result="Auto"
	   ;;
       "M")
	   result="Mobile"
	   ;;
       "P")
	   result="Perim"
	   ;;
       "S")
	   result="Shield"
	   ;;
       "I")
	   result="Internet"
	   ;;
       *)
	   EH_problem "Bad Usage -- abodeInitial=${abodeInitial}"
   esac
   echo ${result}
}


function vis_withInitialGetFunction {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local functionInitial=$1
   local result=""

   case "${functionInitial}" in
       "L")
	   result="LinuxU"
	   ;;
       "A")
	   result="AndroidU"
	   ;;
       "S")
	   result="Server"
	   ;;
       "D")
	   result="Devel"
	   ;;
       *)
	   EH_problem "Bad Usage -- functionInitial=${functionInitial}"
   esac
   echo ${result}
}

function vis_withContainerIdGetBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerId=$1

   local modelInitial=${containerId:0:1}
   local abodeInitial=${containerId:1:1}
   local functionInitial=${containerId:2:1}
   local containerNu=$( echo ${containerId} |  sed -e 's:...-::' ) 

   local thisModel=$( vis_withInitialGetModel ${modelInitial} )
   local thisAbode=$( vis_withInitialGetAbode ${abodeInitial} )
   local thisFunction=$( vis_withInitialGetFunction ${functionInitial} )
   
   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local containerIdBase="${containersBase}/${thisModel}/${thisAbode}/${thisFunction}/${containerNu}"

   if [ ! -d "${containerIdBase}" ] ; then
       EH_problem "Missing containerIdBase=${containerIdBase}"
   fi

   echo ${containerIdBase}
}


function vis_assignedContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerNu=$1

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]
   
   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]
   
   echo "${containersBase}/${model}/${abode}/${function}/${containerNu}"
}


function container_modelAbodeFunctionBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]
   
   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]
   
   echo "${containersBase}/${model}/${abode}/${function}"
}

function vis_containerBoxAssign {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys (thisBoxNu) identified by system-uuid, assign a container.
Return on stdout, a containerId  such as HSS-1001.
- Determine box or machine
- When there are no exisiting entities matching system-uuid, assign a box (thisBoxAdd)
- If an assigned container exists which coresponds to thisBox, then use that
- If one does not exist, assign one (with vis_containerNuGetNext)
- Then after vis_containerUpdate_atNu, return containerId
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]   
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local thisBoxNu=$( siteBoxAssign.sh -h -v -n showRun -i thisBoxFindNu )

   if [ -z "${thisBoxNu}" ] ; then
       thisBoxNu=$( siteBoxAssign.sh -i thisBoxAdd )
   fi
   EH_assert [ ! -z "${thisBoxNu}" ]

   local thisBoxId=$( siteBoxAssign.sh -i boxNuToBoxId ${thisBoxNu})

   local containerNu=""

   local containerBase=$( vis_withBoxIdFindContainerBase "${thisBoxId}" )   
   local existingContainerNu=$( vis_fromContainerBaseGetContainerNu "${containerBase}" )
   if [ -z "${existingContainerNu}" ] ; then
       ANT_raw "Container for boxId=${thisBoxId} not found -- will be created"
       containerNu=$( vis_containerNuGetNext )
   else
       ANT_raw "Container of boxId=${thisBoxId} existed and will be used."
       containerNu=${existingContainerNu}
   fi

   lpDo vis_containerUpdate_atNu "${containerNu}"

   local containerBase=$( vis_assignedContainerBase "${containerNu}" )

   lpDo  fileParamManage.py -i fileParamRead  ${containerBase} containerId

   lpReturn
}	

function vis_containerNuGetNext {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]      

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local modelAbodeFunctionBase=$( container_modelAbodeFunctionBase )
   EH_assert [ -d "${modelAbodeFunctionBase}" ]
   
   opDoExit pushd "${modelAbodeFunctionBase}" > /dev/null
   local lastContainer=$(  ls  | sort -n | tail -1 )
   if [ -z "${lastContainer}" ] ; then
       lastContainer=1000
   fi
   opDoExit popd > /dev/null

   local nextContainer=$( expr ${lastContainer} +  1 )

   echo ${nextContainer}   
}


function vis_thisMachineId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   cat /etc/machine-id
}


function vis_withMachineIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxId="$1"

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local boxIdFps=$( find ${containersBase} -type d -print | grep boxId )

   local eachBoxIdFp=""
   local stored_boxId=""
   local found=""

   for eachBoxIdFp in ${boxIdFps} ; do   
       stored_boxId=$( fileParamManage.py -i fileParamReadPath ${eachBoxIdFp} )

       if [ -z "${stored_boxId}" ] ; then
	   EH_problem "Missing boxId in ${eachBoxIdFp} -- continuing"
	   continue
       else
	   if [ "${boxId}" == "${stored_boxId}" ] ; then
	       if [ -z "${found}" ] ; then
		   found=${eachBoxIdFp}
	       else
   		   ANT_raw "Also Found: ${eachBoxIdFp}"
	       fi
	       #break
	   fi
       fi
   done

   if [ -z "${found}" ] ; then
       echo ${found}
   else
       echo $( FN_dirsPart "${found}" )
   fi

   lpReturn
}	


function vis_withBoxIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxId="$1"

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local boxIdFps=$( find ${containersBase} -type d -print | grep boxId )

   local eachBoxIdFp=""
   local stored_boxId=""
   local found=""

   for eachBoxIdFp in ${boxIdFps} ; do   
       stored_boxId=$( fileParamManage.py -i fileParamReadPath ${eachBoxIdFp} )

       if [ -z "${stored_boxId}" ] ; then
	   EH_problem "Missing boxId in ${eachBoxIdFp} -- continuing"
	   continue
       else
	   if [ "${boxId}" == "${stored_boxId}" ] ; then
	       if [ -z "${found}" ] ; then
		   found=${eachBoxIdFp}
	       else
   		   ANT_raw "Also Found: ${eachBoxIdFp}"
	       fi
	       #break
	   fi
       fi
   done

   if [ -z "${found}" ] ; then
       echo ${found}
   else
       echo $( FN_dirsPart "${found}" )
   fi

   lpReturn
}	

function vis_forThisSysFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
Incomplete -- interim work -- does not support machineId yet
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   
   local boxId=$( siteBoxAssign.sh -i thisBoxFindId )
   lpDo vis_withBoxIdFindContainerBase "${boxId}"
}


function vis_withBoxOrMachineIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxId="$1"

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local boxIdFps=$( find ${containersBase} -type d -print | grep boxId )

   local eachBoxIdFp=""
   local stored_boxId=""
   local found=""

   for eachBoxIdFp in ${boxIdFps} ; do   
       stored_boxId=$( fileParamManage.py -i fileParamReadPath ${eachBoxIdFp} )

       if [ -z "${stored_boxId}" ] ; then
	   EH_problem "Missing boxId in ${eachBoxIdFp} -- continuing"
	   continue
       else
	   if [ "${boxId}" == "${stored_boxId}" ] ; then
	       if [ -z "${found}" ] ; then
		   found=${eachBoxIdFp}
	       else
   		   ANT_raw "Also Found: ${eachBoxIdFp}"
	       fi
	       #break
	   fi
       fi
   done

   if [ -z "${found}" ] ; then
       echo ${found}
   else
       echo $( FN_dirsPart "${found}" )
   fi

   lpReturn
}	


function vis_fromContainerBaseGetContainerNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local containerBase="$1"
   
   local containerNu=""

   if [ ! -z "${containerBase}" ] ; then
       containerNu=$( FN_nonDirsPart "${containerBase}" )
   fi

   echo "${containerNu}"

   lpReturn
}	


function vis_containerId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
containerId is sequence of 3 initial letters of model, abode and function.
word="Host"; firstLetter=${word:0:1} -- "H"
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerNu="$1"

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]    

   echo "${model:0:1}${abode:0:1}${function:0:1}-${containerNu}"
}


function vis_containerUpdate_atNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerNu="$1"

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]      

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local modelAbodeFunctionBase=$( container_modelAbodeFunctionBase )
   EH_assert [ -d "${modelAbodeFunctionBase}" ]

   local containerBase="${modelAbodeFunctionBase}/${containerNu}"

   if [ -d "${containerBase}" ] ; then
       ANT_raw "containerBase=${containerBase} is in place, updating"
   else
       ANT_raw "containerBase=${containerBase} missing, creating"
       lpDo mkdir -p ${containerBase}
   fi
   EH_assert [ -d "${containerBase}" ]

   local boxId=$( siteBoxAssign.sh -i thisBoxFindId )
   local stored_boxId=$( fileParamManage.py -i fileParamRead  ${containerBase} boxId )

   if [ -z "${stored_boxId}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerBase} boxId "${boxId}"
   else
       if [ "${boxId}" != "${stored_boxId}" ] ; then
	   EH_problem "Expected ${boxId} -- got ${stored_boxId}"
	   lpReturn 101
       fi
   fi

   local containerId=$( vis_containerId ${containerNu} )
   local stored_containerId=$( fileParamManage.py -i fileParamRead  ${containerBase} containerId )

   if [ -z "${stored_containerId}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerBase} containerId "${containerId}"
   else
       if [ "${containerId}" != "${stored_containerId}" ] ; then
	   EH_problem "Expected ${containerId} -- got ${stored_containerId} -- Updating it."
	   lpDo fileParamManage.py -i fileParamWrite ${containerBase} containerId "${containerId}"
       fi
   fi

   lpDo fileParamManage.py -i fileParamWrite ${containerBase} model "${model}"
   lpDo fileParamManage.py -i fileParamWrite ${containerBase} abode "${abode}"
   lpDo fileParamManage.py -i fileParamWrite ${containerBase} function "${function}"         

   lpReturn
}	


function vis_containerReport_atNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local containerNu="$1"

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]      

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local modelAbodeFunctionBase=$( container_modelAbodeFunctionBase )   
   EH_assert [ -d "${modelAbodeFunctionBase}" ]

   local containerBase="${modelAbodeFunctionBase}/${containerNu}"   
   EH_assert [ -d "${containerBase}" ]

   lpDo vis_containerReport_atBase "${containerBase}"

   lpReturn
}	

function vis_containerReport_atBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local containerBase="$1"

   local stored_boxId=$( fileParamManage.py -i fileParamRead  ${containerBase} boxId )
   local stored_containerId=$( fileParamManage.py -i fileParamRead  ${containerBase} containerId )

   ANT_raw "boxId=${stored_boxId}"
   ANT_raw "containerId=${stored_containerId}"

   opDoExit pushd "${containerBase}" > /dev/null
   find . -type f -print | grep -v _tree_ | xargs egrep '^.' 
   opDoExit popd > /dev/null
    
   lpReturn
}	
