#!/bin/bash

#
# This file is shared between ./provisionBisos.sh and /usr/local/bin/bisosProvision.sh
#

_CommentBegin_
_CommentEnd_

function bisosBinBaseGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local provisionersBinBase=""

    if [ -z "${bxp_rootDir_bisos}" ] ; then
	EH_problem "Blank bxp_rootDir_bisos"
	lpReturn 101
    elif [ -d "${bxp_rootDir_bisos}/core/bsip/bin" ] ; then
	provisionersBinBase="${bxp_rootDir_bisos}/core/bsip/bin"
    else
	EH_problem "Missing ${bxp_rootDir_bisos}/core/bsip/bin"
	lpReturn 101
    fi

    echo ${provisionersBinBase}
}



function vis_bisosProvisionExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local bisosBinBase="$( bisosBinBaseGet )"

    
    cat  << _EOF_
$( examplesSeperatorChapter "BISOS Provisioning:: From /bisos" )
$( examplesSeperatorSection "BISOS Accounts" )
${bisosBinBase}/bisosProvision.sh
${G_myName} ${extraInfo} -i provisionBisosAccts
_EOF_
}


function vis_provisionBisosAccts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosAccounts.sh
    local bisosProg="${bisosBinBase}/bisosAccounts.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i bisosAcctsProvisionSetup
    fi
    
    lpReturn
}

