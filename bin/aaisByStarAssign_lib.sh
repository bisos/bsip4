#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${usgBpos_lib:-}" ] ; then
    usgBpos_lib="LOADED" ; TM_trace 7 "usgBpos_lib :: Loading Library -- /bisos/bsip/bin/usgBpos_lib.sh"
else
    TM_trace 7 "usgBpos_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/usgBpos_lib.sh" ; return
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
** 
** Creates a BARC (Bystar Account Request Container) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_aabis_registrarBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Obtains registrar bxoId's path
*** Status: functional
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local registrarBxoId="pir_bystarRegistrar"
    
    local registrarBxoPath=$( FN_absolutePathGet ~pir_bystarRegistrar )

    EH_assert [ ! -z "${registrarBxoPath}" ]

    echo "${registrarBxoPath}"

    lpReturn
}	

function vis_aabis_registrarAssignBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Obtains registrar bxoId's path + "/assign"
*** Status: functional
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local registrarBxoPath=$(vis_aabis_registrarBaseObtain)
    EH_assert [ ! -z "${registrarBxoPath}" ]

    echo "${registrarBxoPath}/assign"

    lpReturn
}	


function vis_aabis_withServiceTypeGetServiceLetter {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** With \$1 as N B F etc return ServiceType
*** Status: functional
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local thisServiceType=$1
   local result=""   

   case "${thisServiceType}" in
       "ByName")
	   result="N"
	   ;;
       "BySmb")
	   result="B"
	   ;;
       "ByFamily")
	   result="F"
	   ;;
       *)
	   EH_problem "Bad Usage -- serviceType=${thisServiceType}"
   esac
   echo ${result}
}


function vis_aabis_withServiceLetterGetServiceType {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** With \$1 as N B F etc return ServiceType
*** Status: functional
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local letter=$1
   local result=""   

   case "${letter}" in
       "N")
	   result="ByName"
	   ;;
       "B")
	   result="BySmb"
	   ;;
       "F")
	   result="ByFamily"
	   ;;
       *)
	   EH_problem "Bad Usage -- serviceLetter=${letter}"
   esac
   echo ${result}
}


function vis_aabis_withNuGetId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local aabisNu="$1"

   EH_assert [ ! -z "${serviceType}" ]      

   if ! isnum ${aabisNu} ; then
       EH_problem "Bad input -- Expected a number -- aabisNu=${aabisNu}"
       lpReturn
   fi

   local serviceLetter=$(lpDo vis_aabis_withServiceTypeGetServiceLetter ${serviceType})
   
   echo "By${serviceLetter}-${aabisNu}"
}


function vis_aabis_withIdGetAssignedBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** aabisId is something like BN-1001
*** Status: untested
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local aabisId=$1

   local byStarInitial=${aabisId:0:1}
   local serviceTypeInitial=${aabisId:1:1}
   local aabisNu=$( echo ${aabisId} |  sed -e 's:..-::' ) 

   local thisServiceName=$(vis_aabis_withServiceInitialGetServiceType ${serviceTypeInitial} )
   
   local registrarBase=$(vis_aabis_registrarBaseObtain)
   EH_assert [ ! -z "${registrarBase}" ]

   local aabisIdBase="${registrarBase}/assign/${thisServiceName}/${aabisNu}"

   if [ ! -d "${aabisIdBase}" ] ; then
       EH_problem "Missing aabisIdBase=${aabisIdBase}"
       lpReturn 101
   fi

   echo ${aabisIdBase}
}


function vis_aabis_withNuGetAssignedBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** With aabisNu, get assigned base.
*** Status: untested
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local aabisNu=$1

   local assignsBase=$(vis_aabis_registrarAssignBaseObtain)
   EH_assert [ ! -z "${assignsBase}" ]
   
   EH_assert [ ! -z "${serviceType}" ]
   
   echo "${assignsBase}/${serviceType}/${aabisNu}"
}


function vis_aabis_serviceTypeAssignToCorrespondingBxoAndPush {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${serviceType}" ]   
   EH_assert [ ! -z "${correspondingBxo}" ]

   lpDo vis_aabis_serviceTypeAssignToCorrespondingBxoAndPush

   lpDo vis_aabis_assignedServiceIdPush
}	

function vis_aabis_assignedServiceIdPush {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   echo NOTYET

   lpReturn

   local thisContainerBase=$( vis_forThisSysFindContainerBase )
   EH_assert [ ! -z "${thisContainerBase}" ]

   lpDo eval echo ${thisContainerBase} \| bx-gitRepos -i addCommitPush all
}	


function vis_aabis_assignBasePull {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
   
   local registrarAssignPath=$(vis_aabis_registrAssignBaseObtain)
   EH_assert [ ! -z "${registrarAssignPath}" ]
  
   lpDo eval echo ${registrarAssignBase} \| bx-gitRepos -i gitRemPull
}


function vis_aabis_assignId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
		      }
   EH_assert [[ $# -lt 2 ]]

   EH_assert [ ! -z "${serviceType}" ]   
   EH_assert [ ! -z "${correspondingBxo}" ]

   lpDo echo NOTYET

   lpReturn
   
   lpDo vis_containerBoxAssignNumbered	   
}	



function vis_aabis_UnAssign {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   echo NOTYET

   lpReturn
   
   local boxId="$1"

   local containerBasePath=$( vis_withBoxIdFindContainerBase "${boxId}" )
   EH_assert [ ! -z "${containerBasePath}" ]

   local containerBoxIdFpPath="${containerBasePath}/boxId"
   EH_assert [ -d "${containerBoxIdFpPath}" ]

   local dateTag=$( DATE_nowTag )
   lpDo cp -p ${containerBoxIdFpPath}/value ${containerBoxIdFpPath}/value.${dateTag}

   lpDo fileParamManage.py -i fileParamWrite "${containerBasePath}" boxId "unassigned"
}

function vis_aabis_unAssignAndPush {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]


   echo NOTYET

   lpReturn

   
   local boxId="$1"

   local containerBasePath=$( vis_withBoxIdFindContainerBase "${boxId}" )
   EH_assert [ ! -z "${containerBasePath}" ]

   lpDo vis_containerBoxUnAssign "${boxId}"

   lpDo eval echo ${containerBasePath} \| bx-gitRepos -i addCommitPush all
}


function vis_aabis_serviceTypeAssignCorrespondingBxo {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${serviceType}" ]   
   EH_assert [ ! -z "${correspondingBxo}" ]
   
   local aabisNu=$(vis_aabis_assignNuGetNext)
   EH_assert [ ! -z "${aabisNu}" ]   

   local aabisBase=$(lpDo vis_aabis_assignUpdate_atNu "${aabisNu}")
   EH_assert [ ! -z "${aabisBase}" ]      

   echo "${aabisBase}"

   lpReturn
}	


function vis_aabis_assignNuGetNext {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** LastId +1
*** Status: Functional
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${serviceType}" ]

   local assignsBase=$(vis_aabis_registrarAssignBaseObtain)
   EH_assert [ ! -z "${assignsBase}" ]

   local serviceTypeBase="${assignsBase}/${serviceType}"
   EH_assert [ -d "${serviceTypeBase}" ]
   
   opDoExit pushd "${serviceTypeBase}" > /dev/null
   local lastId=$(  ls  | sort -n | tail -1 )
   if [ -z "${lastId}" ] ; then
       lastId=10000
   fi
   opDoExit popd > /dev/null

   local nextId=$( expr ${lastId} +  1 )

   echo ${nextId}   
}

function vis_aabis_forCorrespondingBxodFindAssignBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxId="$1"

   lpDo echo NOTYET

   lpReturn

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



function vis_aabis_assignUpdate_atNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local aabisNu="$1"

   EH_assert [ ! -z "${serviceType}" ]
   EH_assert [ ! -z "${correspondingBxo}" ]

   local assignsBase=$(vis_aabis_registrarAssignBaseObtain)
   EH_assert [ ! -z "${assignsBase}" ]

   local serviceTypeBase="${assignsBase}/${serviceType}"
   EH_assert [ -d "${serviceTypeBase}" ]

   local aabisBase="${serviceTypeBase}/${aabisNu}"

   if [ -d "${aabisBase}" ] ; then
       ANT_raw "aabisBase=${aabisBase} is in place, updating"
   else
       ANT_raw "aabisBase=${aabisBase} missing, creating"
       lpDo mkdir -p ${aabisBase}
   fi
   EH_assert [ -d "${aabisBase}" ]

   local aabisId=$( vis_aabis_withNuGetId ${aabisNu} )
   local stored_aabisId=$( fileParamManage.py -i fileParamRead  ${aabisBase} aabisId )

   if [ -z "${stored_aabisId}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${aabisBase} aabisId "${aabisId}"
   else
       if [ "${aabisId}" != "${stored_aabisId}" ] ; then
	   EH_problem "Expected ${aabisId} -- got ${stored_aabisId} -- Updating it."
	   lpDo fileParamManage.py -i fileParamWrite ${aabisBase} aabisId "${aabisId}"
       else
	   ANT_cooked "aabisId=${aabisId} -- No action taken"
       fi
   fi

   local stored_aabisNu=$( fileParamManage.py -i fileParamRead  ${aabisBase} aabisNu )

   if [ -z "${stored_aabisNu}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${aabisBase} aabisNu "${aabisNu}"
   else
       if [ "${aabisNu}" != "${stored_aabisNu}" ] ; then
	   EH_problem "Expected ${aabisNu} -- got ${stored_aabisNu} -- Updating it."
	   lpDo fileParamManage.py -i fileParamWrite ${aabisBase} aabisNu "${aabisNu}"
       else
	   ANT_cooked "aabisNu=${aabisNu} -- No action taken"
       fi
   fi
   
   lpDo fileParamManage.py -i fileParamWrite ${aabisBase} serviceType "${serviceType}"
   lpDo fileParamManage.py -i fileParamWrite ${aabisBase} correspondingBxo "${correspondingBxo}"

   echo ${aabisBase}

   lpReturn
}	

function vis_aabis_withAssignBaseRealizeGetParam {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 2 ]]
   local assignBase="$1"
   local paramName="$2"

   local result=$(lpDo fileParamManage.py -i fileParamRead ${assignBase} "${paramName}")
   EH_assert [ ! -z "${result}" ]

   lpDo echo "${result}"

}





function vis_aabis_assignReport_atNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local containerNu="$1"

   lpDo echo NOTYET

   lpReturn

   EH_assert [ ! -z "${serviceType}" ]
   EH_assert [ ! -z "${correspondingBxo}" ]

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local modelAbodeFunctionBase=$( container_modelAbodeFunctionBase )   
   EH_assert [ -d "${modelAbodeFunctionBase}" ]

   local containerBase="${modelAbodeFunctionBase}/${containerNu}"   
   EH_assert [ -d "${containerBase}" ]

   lpDo vis_containerReport_atBase "${containerBase}"

   lpReturn
}	

function vis_aabis_assignReport_atBase {
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
