#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${siteNetworks_lib:-}" ] ; then
    siteNetworks_lib="LOADED" ; TM_trace 7 "siteNetworks_lib :: Loading Library -- /bisos/bsip/bin/siteNetworks_lib.sh"
else
    TM_trace 7 "siteNetworks_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/siteNetworks_lib.sh" ; return
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

function vis_siteNetworksBxoIdHome {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/networks.bpoFp
    local selectedNetworksPath="${usgHome}/bisos/sites/selected/siteBpos/networks.bpoFp"
    
    local networksBxoId=""

    if [ -d "${selectedNetworksPath}" ] ; then
	networksBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedNetworksPath} )
	if [ -z "${networksBxoId}" ] ; then
	    EH_problem "Missing networksBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${networksBxoId}" ; then
	    EH_problem "Missing networksBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedNetworksPath}"
	lpReturn 101
    fi

    # 
    local networksBxoIdHome=$( FN_absolutePathGet ~${networksBxoId} )
    EH_assert [ -d "${networksBxoIdHome}" ]

    echo "${networksBxoIdHome}"

    lpReturn
}	

function networksBaseObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local networksBxoIdHome=$( vis_siteNetworksBxoIdHome )
    EH_assert [ -d "${networksBxoIdHome}" ]

    local networksBase="${networksBxoIdHome}/networks"
    EH_assert [ -d "${networksBase}" ]

    echo "${networksBase}"

    lpReturn
}	

function vis_netsReport {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   # Use readDeep instead
   find ${networksBase} -print | grep value | xargs egrep ^.
}

function vis_netAddr {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   # local netBase=${networksBase}/netDefinitions.fv/${netName}
   local netBase=${networksBase}/${netName}/net.fps  

   local netAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} netAddr )

   echo ${netAddr}
}

function vis_netmask {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   local netBase=${networksBase}/${netName}/net.fps  

   local netmask=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} netmask )

   echo ${netmask}
}

function vis_routerDefault {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )
   EH_assert [ ! -z "${networksBase}" ]

   local netBase=${networksBase}/${netName}/net.fps  

   local routerDefault=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} routerDefault )
   EH_assert [ -d "${routerDefault}" ]
   
   echo ${routerDefault}
}

function vis_netSiteFpsPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )
   EH_assert [ ! -z "${networksBase}" ]

   local netsBase=${networksBase}/${netName}/net.fps
   EH_assert [ -d "${netsBase}" ]

   echo ${netsBase}
}

function vis_routerSiteFpsPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 2 ]]

   local srcNetName="$1"
   local destNetName="$2"   

   local siteNetworksBxoIdHome=$( vis_siteNetworksBxoIdHome )
   EH_assert [ -d "${siteNetworksBxoIdHome}" ]

   local routerSiteFpsPath=${siteNetworksBxoIdHome}/routes/${srcNetName}-${destNetName}.fps
   EH_assert [ -d "${routerSiteFpsPath}" ]

   echo ${routerSiteFpsPath}
}


function vis_containerIpAddrObtain_privA {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** If generic, one way, if not anotherway
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local containerBxoId=$1
    local addrType=$2    # generic/assign/auto

    #local containerBxoId=$( withContainerIdGetBxoId ${containerId} )

    EH_assert vis_bxoAcctVerify "${containerBxoId}"

    containerBxoIdHome=$( FN_absolutePathGet ~${containerBxoId} )
    local ipAddr_privA=$( fileParamManage.py -v 30 -i fileParamRead  ${containerBxoIdHome}/var/sysCharDeployInfo ipAddr_privA )

    echo ${ipAddr_privA}
}


function vis_assignNextAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** If generic, one way, if not anotherway
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local netName=$1
    local addrType=$2    # generic/assign/auto

    local networksBase=$( networksBaseObtain )
    EH_assert [ ! -z "${networksBase}" ]

    local netBase=${networksBase}/${netName}/addrs/${addrType}
    EH_assert [ -d "${netBase}" ]

    local minAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} minAddr.fp )
    local maxAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} maxAddr.fp )

    local assignedBase="${netBase}/assigned"

    local nextAddr=""
    
    local assignmentCandidate=""
    local i=0
    for (( i=${minAddr}; i<=${maxAddr}; i++ )) ; do
	assignmentCandidate=${assignedBase}/$i
	if [ -d "${assignmentCandidate}" ] ; then
	    doNothing
	else
	    lpDo mkdir -p "${assignmentCandidate}"
	    nextAddr="192.168.0.$i"
	    break
	fi
    done

    if (( i > ${maxAddr} )) ; then
	EH_problem "All available Addrs Have Already Been Assigned"
	nextAddr=""
    fi

    echo ${nextAddr}
    
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
