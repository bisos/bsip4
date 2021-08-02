#!/bin/bash

currentBxoId=""
currentBxoUname=""
currentBxoAutonomousUname=""
currentBxoUeUname=""
currentBxoSiteUname=""

currentUsgUname=""

#
# NOTYET to be replaced by a directory of files and dir read model
#

bisosCurrentsFileName="/bisos/var/currents"
bisosCurrentsIcm="bisosCurrentsManage.sh"

typeset lpXauthorityFile=/tmp/lp.Xauthority

function curSetParam {
    vis_setParam $@
}


function vis_curSetParam {
    vis_setParam $@
}

function vis_setParam {
    EH_assert [[ $# -eq 2 ]]

    paramName=$1
    paramValue=$2

    if [ ! -f /bisos/var/currents ] ; then
	EH_problem "Missing ${bisosCurrentsFileName} -- First Run:"
	ANT_raw "${bisosCurrentsIcm} -i currentsFileCreate"
	return 101
    fi

    typeset thisDateTag=`date +%y%m%d%H%M%S`
    FN_fileSafeCopy ${bisosCurrentsFileName} ${bisosCurrentsFileName}.${thisDateTag}
    
    FN_textReplaceOrAdd "^${paramName}=.*" "${paramName}=${paramValue}" ${bisosCurrentsFileName}

    opDo ls -l ${bisosCurrentsFileName}
}

function vis_validateParam {
  #EH_assert [[ $# -eq 2 ]]
  EH_assert [[ $# -gt 0 ]] 

  paramName=$1
  paramValue=$2

  acctsList=$( bystarBacsAcctsList )

	case ${paramName} in
	    "currentBxoUname"|"currentBxoAutonomousUname"|"currentBynameUname")
	        if [ "${paramValue}_" == "_" ] ; then
		   doNothing
		fi

		if LIST_isIn "${paramValue}" "${acctsList}" ; then	
		   doNothing
  	        else
		   EH_problem "${paramValue} not in: ${acctsList}"
		   ANT_raw "Consider running:"
                   ANT_raw "lpCurrentsAdmin.sh -i currentsSetRecent"
		   return 101
  	        fi
		   
		;;
	    "currentDeveloper")
		doNothing
		;;
	    *)
		doNothing
		;;
	esac
}

function bxoAcctsList {
    vis_bxoAcctsList
}

function bisosCurrentsGet {
    lpCurrentsGet $@
}

function lpCurrentsGet {
    EH_assert [[ $# -eq 0 ]]

    if [ -f "${bisosCurrentsFileName}" ] ; then
	. "${bisosCurrentsFileName}"
    else
	EH_problem "Missing bisosCurrentsFileName=${bisosCurrentsFileName}"
	lpReturn 101
    fi

    typeset acctsList=$( bxoAcctsList )

    if [ -z "${acctsList}" ] ; then
	#EH_problem "Missing bxoAcctsList"
	currentBxoId=""
	#lpReturn 101
	lpReturn
    fi

    if [ "${currentBxoId}" == "" ] ; then
	currentBxoId=$( LIST_getFirst ${acctsList} | cut -d ':' -f 1 )
    fi
    if [ "${currentBxoUname}" == "" ] ; then
	currentBxoUname=$( LIST_getFirst ${acctsList} | cut -d ':' -f 1 )
	#currentBxoUname=$( echo ${acctsList} | head -1 )
    fi
    if [ "${currentBxoAutonomousUname}" == "" ] ; then
	currentBxoAutonomousUname=$( LIST_getFirst ${acctsList} | cut -d ':' -f 1 )
    fi
    if [ "${currentBxoUeUname}" == "" ] ; then
	currentBxoUeUname="ca-16001"
    fi
    if [ "${currentBxoSiteUname}" == "" ] ; then
	currentBxoSiteUname="NOTYET"
    fi
    if [ "${currentUsgUname}" == "" ] ; then
	currentUsgUname=$( id -u -n )
    fi

}

function lpCurrentsDefaults {
    EH_assert [[ $# -eq 0 ]]

    typeset acctsList=$( bystarBacsAcctsList )

	currentDefaultBystarUname=$( LIST_getFirst ${acctsList} )
	currentDefaultMasterUname=$( LIST_getFirst ${acctsList} )
	currentDefaultBcaUname="ca-16001"
	currentDefaultDeveloper=lsipusr
}

function lpCurrentsShow {
    EH_assert [[ $# -eq 0 ]]

 cat  << _EOF_
currentBxoId=${currentBxoId}
currentBxoUname=${currentBxoUname}
currentBxoAutonomousUname=${currentBxoAutonomousUname}
currentBxoUeUname=${currentBxoUeUname}
currentBxoSite=${currentBxoSiteUname}
currentUsgUname=${currentUsgUname}
_EOF_
}

function vis_bisosCurrentsList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat /bisos/var/currents | sed -e 's/=.*$//'

    lpReturn
}	

function vis_bisosCurrentsObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    bisosCurrentsGet

    local inVal="$1"
    local cursList=$(lpDo vis_bisosCurrentsList)
    
    if LIST_isIn "${inVal}" "${cursList}" ; then	
	eval "echo \${${inVal}}"
    else
	echo ${inVal}
    fi

    lpReturn
}	


