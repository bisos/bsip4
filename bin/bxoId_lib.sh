#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxoId_lib:-}" ] ; then
    bxoId_lib="LOADED" ; TM_trace 7 "bxoId_lib :: Loading Library -- /bisos/bsip/bin/bxoId_lib.sh"
else
    TM_trace 7 "bxoId_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxoId_lib.sh" ; return
fi
####+END:


# a bxoNameExists when a bxo has been realized. It is the account in gitLab.

function vis_bxoNameExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]

    local bxoName="$1"
    local bxoNamesList=$( bxoGitlab.py -v 30 -i acctList )
    
    if LIST_isIn "${bxoName}" "${bxoNamesList}"  ; then
	lpReturn 0
    else
	lpReturn 1
    fi
}	




function vis_bxoIdFpsBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    echo /bisos/var/bxoId
    lpReturn
}	


function vis_bxoIdFpsReadDeep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    lpDo fileParamManage.py -i fileParamDictReadDeep $(vis_bxoIdFpsBase)
    
    lpReturn
}	

function vis_bxoIdFpsWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local canonName="$1"
    local bxoId="$2"

    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bxoIdFpsBase) "${canonName}.fp" "${bxoId}"
    
    lpReturn
}	

function vis_bxoIdFpsRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]

    local canonName="$1"

    lpDo fileParamManage.py -i fileParamRead $(vis_bxoIdFpsBase) "${canonName}.fp"
    
    lpReturn
}	

function vis_bxoIdFpsInit_all {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]

    lpDo vis_bxoIdFpsInit_sysChar
    lpDo vis_bxoIdFpsInit_site
    
    lpReturn
}	

function vis_bxoIdFpsInit_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    local canonName="sysChar"
    
    local bxoId=$( lpDo fileParamManage.py -i fileParamRead $(vis_bxoIdFpsBase) "${canonName}.fp" )

    if [ ! -z "${bxoId}" ] ; then
	if [[ "${G_forceMode}" == "force" ]] ; then
	    ANT_raw "Already set ${canonName}=${bxoId} -- forceMode specified -- will overwrite."
	else
	    ANT_raw "Already set ${canonName}=${bxoId} -- use -f to force it."
	    lpReturn
	fi
    fi

    local effectiveContainerBxoId=""
    local selectedContainerBxoId=$( vis_selectedContainerBxoId 2> /dev/null )

    if [ -z "${selectedContainerBxoId}" ] ; then

	local containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
	if [ -z "${containerAssignBase}" ] ; then
	    effectiveContainerBxoId="${selectedContainerBxoId}"
	else
   	    local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName ${containerAssignBase} )

	    effectiveContainerBxoId="${sysCharContainerBxoId}"
	fi
    else
	effectiveContainerBxoId="${selectedContainerBxoId}"
    fi

    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bxoIdFpsBase) "${canonName}.fp" "${effectiveContainerBxoId}"
    
    lpReturn
}	


function vis_bxoIdFpsInit_site {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    local canonName="site"
    
    local bxoId=$( lpDo fileParamManage.py -i fileParamRead $(vis_bxoIdFpsBase) "${canonName}.fp" )

    if [ ! -z "${bxoId}" ] ; then
	if [[ "${G_forceMode}" == "force" ]] ; then
	    ANT_raw "Already set ${canonName}=${bxoId} -- forceMode specified -- will overwrite."
	else
	    ANT_raw "Already set ${canonName}=${bxoId} -- use -f to force it."
	    lpReturn
	fi
    fi

    local determinedBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )
    
    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bxoIdFpsBase) "${canonName}.fp" "${determinedBxoId}"
    
    lpReturn
}	


function vis_bxoIdShow {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update Everything.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    lpDo echo ${bxoId}
    lpDo echo ${bxoHome}    
}

function vis_bxoIdPrep {
    bxoIdPrep $@
}
    

function bxoIdPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Looks at the global bxoId and replaces it accordingly. Returns none-zero for assertion.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    local inBxoId=""
    local inAsArg=""
    local interactiveBxoId=""
    local gotBxoId=""    
    
    if [ $# -eq 1 ] ; then
	inBxoId="$1"
	inAsArg="$1"
    else
	inBxoId=${bxoId}
    fi

    function setOutBxoId {
	EH_assert [[ $# -eq 1 ]]
	local outBxoId="$1"

	if [ -z "${inAsArg}" ] ; then
	    bxoId=${outBxoId}
	    bxoHome=$( FN_absolutePathGet ~${bxoId} )
	else
	    echo ${outBxoId}
	fi
    }
	
    case ${inBxoId} in 
      "")
	  EH_problem "bxoId=\"\" -- empty/blank -- invalid bxoId"
	  lpReturn 101
	  ;;
      "INVALID"|"MANDATORY")
	  EH_problem "bxoId=${bxoId} -- needs to be specified -- invalid bxoId"
	  lpReturn 101
	  ;;
      "current")
	  lpCurrentsGet
	  if [ "${currentBxoId}" != "" ] ; then
	      lpDo setOutBxoId "${currentBxoId}"
	  else
	      EH_problem "bxoId=current But current is unset -- invalid bxoId"
	      lpReturn 101
	  fi	
	  ;;
      "prompt")
	  echo -n "Specify bxoId: "
	  read interactiveBxoId
	  interactiveBxoId=$( bxoIdPrep "${interactiveBxoId}" )
	  lpDo setOutBxoId "${interactiveBxoId}"
	  ;;
      "sysChar")
	  gotBxoId=$( vis_bxoIdFpsRead "sysChar" )
	  lpDo setOutBxoId "${gotBxoId}"
	  ;;	
      "site")
	  gotBxoId=$( vis_bxoIdFpsRead "site" )
	  lpDo setOutBxoId "${gotBxoId}"
	  ;;	
      "siteBoxes")
	  lpDo setOutBxoId pmp_HSS-1003
	  ;;	
      "default")   # e.g., first applicable entry in /etc/passwd
          doNothing
	  ;;	
      "all")
          doNothing
	  ;;	
      *)
	  # See if it is a path, and locate bxoId based on path
	  # bxoId=$( vis_bxoIdObtainForPath "${bxoPath}" )
	  doNothing
	  ;;
    esac

    #lpDo bxoIdCentralIsValid 
    bxoCentralIsValid 
    EH_retOnFail

    lpReturn 0
}
