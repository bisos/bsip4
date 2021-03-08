#!/bin/bash 

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeDesc_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeDesc_lib :: Loading Library -- /bisos/bsip/bin/bxeDesc_lib.sh"
else
    TM_trace 7 "bxeDesc_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeDesc_lib.sh" ; return
fi
####+END:


function vis_bxePrefix_obtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    local bxePrivacy=$1
    local bxeKind=$2
    local bxeType=$3

    local privacyTag=$( vis_privacyTag_obtain "priv" )
    local kindTypeTag=$( vis_kindTypeTag_obtain ${bxeKind} ${bxeType} "alpha" )

    echo ${privacyTag}${kindTypeTag}
}	


function vis_bxeDescBase_obtain { echo "/bisos/var/bxe/bxeDesc"; }

function vis_bxceBxeDescBaseGet {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxeDesc}" ]]

    local parentBxoId=$1
    local bxoHome=""
    local bxeTreeDir=""

    if [ -z "${parentBxoId}" ] ; then
	local cp_bxePrivacy=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrivacy )
	local cp_bxeKind=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxeKind )    
	local cp_bxeType=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxeType )

	echo "$(vis_bxeDescBase_obtain)/${cp_bxePrivacy}/${cp_bxeKind}/${cp_bxeType}"
    else
	if ! unisosAccts.sh -i userAcctExists "${parentBxoId}" ; then
	    EH_problem "Missing bxoId -- parentBxoId=${parentBxoId}"
	    lpReturn 101
	fi
	bxoHome=$( FN_absolutePathGet ~${parentBxoId} )
	if [ -z "${bxoHome}" ] ; then
	    EH_problem "Missing bxoHome -- parentBxoId=${parentBxoId}"
	    lpReturn 101
	fi
	bxeTreeDir="${bxoHome}/bxeTree"
	if [ ! -d "${bxeTreeDir}" ] ; then
	    lpDo mkdir -p ${bxeTreeDir}
	fi
	bxeTreeDescDir="${bxoHome}/bxeTree/bxeDesc"
	if [ ! -d "${bxeTreeDescDir}" ] ; then
	    lpDo mkdir -p ${bxeTreeDescDir}
	fi
	echo "${bxeTreeDescDir}"
    fi	
}	


function vis_privacyTag_obtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local privacy="$1"

    case ${privacy} in
	"priv"|"private")
	    echo "p"
	    ;;
	"group")
	    echo "g"
	    ;;
	"all"|"public")
	    echo "a"
	    ;;
	*)
	    EH_problem "privacy=${privacy} -- Unexpected"
	    return
	    ;;
      esac
}

function vis_kindTypeTag_obtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Alpha is used for bxePrefix and Numeric is used for ROid.
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    local bxeKind="$1"
    local bxeType="$2"
    local resultType="$3"

    local alpha=""
    local numeric=0

    case ${bxeKind} in
	"real")
	    case ${bxeType} in
		"individual")
		    alpha="ri"
		    numeric=1
		    ;;
		"corp")
		    alpha="rc"
		    numeric=2
		    ;;
		"system")
		    alpha="rs"
		    numeric=3
		    ;;
		*)
		    EH_problem "bxeType=${bxeType} -- Unexpected"
		    return
		    ;;
	    esac
	    ;;
	"info")
	    case ${bxeType} in
		"registrar")
		    alpha="ir"
		    numeric=31
		    ;;
		"site")
		    alpha="is"
		    numeric=32
		    ;;
		"sysChar")
		    alpha="ic"
		    numeric=33
		    ;;
		"usage")
		    alpha="iu"
		    numeric=34
		    ;;
		"project")
		    alpha="ip"
		    numeric=35
		    ;;
		"virtGuest")
		    alpha="ig"
		    numeric=36
		    ;;
		*)
		    EH_problem "bxeType=${bxeType} -- Unexpected"		    
		    return
		    ;;
	    esac
	    ;;
	"svc")
	    case ${bxeType} in
		"byname")
		    alpha="sn"
		    numeric=61
		    ;;
		"bysmb")
		    alpha="sb"
		    numeric=62
		    ;;
		*)
		    EH_problem "bxeType=${bxeType} -- Unexpected"
		    return
		    ;;
	    esac
	    ;;
	"materialization")
	    case ${bxeType} in
		"site")
		    alpha="ms"
		    numeric=91
		    ;;
		"nets")
		    alpha="mn"
		    numeric=92
		    ;;
		"domains")
		    alpha="md"
		    numeric=93
		    ;;
		"boxes")
		    alpha="mb"
		    numeric=94
		    ;;
		"containers")
		    alpha="mc"
		    numeric=95
		    ;;
		"sysChar")
		    # c is taken by containers, p for personality instead of character
		    alpha="mp"
		    numeric=96
		    ;;
		*)
		    EH_problem "bxeType=${bxeType} -- Unexpected"
		    return
		    ;;
	    esac
	    ;;
	"container")
	    # To be obsoleted
	    case ${bxeType} in
		"exposed")
		    alpha="ce"
		    numeric=121
		    ;;
		"intra")
		    alpha="ci"
		    numeric=122
		    ;;
		"usage")
		    alpha="cu"
		    numeric=123
		    ;;
		"dev")
		    alpha="cd"
		    numeric=124
		    ;;
		"android")
		    alpha="ca"
		    numeric=125
		    ;;
		"vmHost")
		    alpha="cv"
		    numeric=126
		    ;;
		"perimeter")
		    alpha="cp"
		    numeric=127
		    ;;
		*)
		    EH_problem "bxeType=${bxeType} -- Unexpected"
		    return
		    ;;
	    esac
	    ;;
	*)
	    EH_problem "bxeKind=${bxeKind} -- Unexpected"
	    return
	    ;;
    esac

    if [ "${resultType}" == "alpha" ] ; then
	echo ${alpha}
    elif [ "${resultType}" == "numeric" ] ; then
	echo ${numeric}
    else
	EH_problem "Bad resultType=${resultType} -- Unexpected"
	lpReturn 101
    fi
}

function vis_parentBxoIdFromBxeDesc  {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local bxeDesc="$1"
    local parentBxoId=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} parentBxoId )

    echo ${parentBxoId}
}


function vis_bxoIdFromBxeDesc  {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local bxeDesc="$1"
    
    #local cp_bxePrivacy=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrivacy )
    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )    
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )        

    #local bxeLocalName="$(vis_privacyTag_obtain ${cp_bxePrivacy})${cp_bxePrefix}_${cp_rdn}"
    local bxeLocalName="${cp_bxePrefix}_${cp_rdn}"
    
    echo ${bxeLocalName}
}


function vis_bxeDescStash {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Stash destination is parentBxoId/bxeDesc/bxoId
When no parentBxoId stash destination is /bisos/var/bxe/bxeDesc/priv/kind/type/bxoId
Stash src (${bxeDesc}) is either /bisos/var/init/privRegistrar/ or ~pir_privRegistrar
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxeDesc}" ]

    local parentBxoId="$(vis_parentBxoIdFromBxeDesc ${bxeDesc})"   
    local bxeLocalName="$(vis_bxoIdFromBxeDesc ${bxeDesc})"
    
    local stashedBxeDescBase="$( vis_bxceBxeDescBaseGet "${parentBxoId}" )/${bxeLocalName}"

    if [ ! -d ${stashedBxeDescBase} ] ; then
	lpDo mkdir -p "${stashedBxeDescBase}"
    fi
    
    lpDo cp -r "${bxeDesc}"/* "${stashedBxeDescBase}"

    echo "${stashedBxeDescBase}"

    lpReturn
}	


function vis_bxeDescInfo {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]

    #ANT_raw "Running: lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${bxeDesc} -i fileParamsShow"
    # opDo lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${bxeDesc} -i fileParamsShow 2> /dev/null
    lpDo fileParamManage.py  -i fileParamDictReadDeep  "${bxeDesc}"
}

