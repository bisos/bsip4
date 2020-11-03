#!/bin/bash 

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeDesc_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeDesc_lib :: Loading Library -- /bisos/bsip/bin/bxeDesc_lib.sh"
else
    TM_trace 7 "bxeDesc_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeDesc_lib.sh" ; return
fi
####+END:



function bxaeBxeDescBaseGet {
    local cp_bxeAutonomy=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxeAutonomy )
    local cp_bxeType=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxeType )        
    
    echo "/bisos/var/bxae/bxeDesc/${cp_bxeAutonomy}/${cp_bxeType}"
}


function vis_bxeDescStash {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxeDesc}" != "MANDATORY" ]]

    local cp_bxePrefix=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} bxePrefix )
    local cp_rdn=$( fileParamManage.py  -i fileParamRead  ${bxeDesc} rdn )        

    local bxeLocalName="${cp_bxePrefix}-${cp_rdn}"
    local stashedBxeDescBase="$( bxaeBxeDescBaseGet )/${bxeLocalName}"

    lpDo cp -r "${bxeDesc}" "${stashedBxeDescBase}"

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

