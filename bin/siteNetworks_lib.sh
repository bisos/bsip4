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



function vis_withAbodeGetApplicableNetsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on Abode get applicableNetsList
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]

    local abode=$1
    
    local applicableNetsList=()

    case "${abode}" in
	"Auto")
	    applicableNetsList=("nat")
	    ;;
	"Mobile")
	    applicableNetsList=("nat")
	    ;;
	"Perim")
	    applicableNetsList=("perimA")
	    ;;
	"Shield")
	    applicableNetsList=("privA")
	    ;;
	"Internet")
	    applicableNetsList=("pubA" "pubB" "perimA")
	    ;;
	*)
	    EH_problem "Bad Usage -- abodeInitial=${abodeInitial}"
    esac

    local result=""
    
    local eachNet=""
    for eachNet in ${applicableNetsList[@]} ; do
	# result+=$( echo -n "${eachNet} " )
	echo "${eachNet}"
    done

    #echo ${result}
}


function vis_forNetName_getNetAddrPrefix {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Full implementation will use python and ipaddr library.
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local netAddr=$( vis_site_netNameAddr ${netName} )
   local netMask=$( vis_site_netNameNetmask ${netName} )

   local netAddrPrefix=""

   if [ "${netMask}" == 24 ] ; then
       netAddrPrefix=$( echo "${netAddr}" | sed -e 's:.0$::' )
   elif [ "${netMask}" == 28 ] ; then
       netAddrPrefix=$( echo "${netAddr}" )
   elif [ "${netMask}" > 0 ] ; then
       EH_problem "unimplemented ${netMask}"
   else
       EH_oops
   fi

   echo ${netAddrPrefix}
}



function vis_site_netNameAddr {
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

function vis_site_netNameNetmask {
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

function vis_site_netName_routerDefault {
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
   # EH_assert [ -d "${netBase}/${routerDefault}" ]
   
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

function vis_site_srcDestNetName_routerFpsBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 2 ]]

   lpDo vis_routerSiteFpsPath $@
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
    local ipAddr_privA=$( fileParamManage.py -v 30 -i fileParamRead  ${containerBxoIdHome}/var/sysCharConveyInfo ipAddr_privA )

    echo ${ipAddr_privA}
}


function vis_assignNextAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Obtain next ip address from relevant address pool based on netName=\$1 and addrType=\$2.
*** netName=\$1 is one of privA, pubA, pubB, perimA.
*** addrType=\$2 is generic, assign, containerBoxes, etc.
*** addrPool i referenced by $( networksBaseObtain )/${netName}/addrs/${addrType}
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

    local netAddrPrefix=$( vis_forNetName_getNetAddrPrefix "${netName}" )
    
    local assignmentCandidate=""
    local i=0
    for (( i=${minAddr}; i<=${maxAddr}; i++ )) ; do
	assignmentCandidate=${assignedBase}/$i
	if [ -d "${assignmentCandidate}" ] ; then
	    doNothing
	else
	    lpDo mkdir -p "${assignmentCandidate}"
	    nextAddr="${netAddrPrefix}.$i"
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



function vis_assignBoxAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Similar to vis_assignNextAddr but uses different pool and indexes based on boxNu.
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local netName=$1
    local boxNu=$2

    local addrType=containerBoxes

    local networksBase=$( networksBaseObtain )
    EH_assert [ ! -z "${networksBase}" ]

    local netBase=${networksBase}/${netName}/addrs/${addrType}
    EH_assert [ -d "${netBase}" ]

    local minAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} minAddr.fp )
    local maxAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} maxAddr.fp )

    # NOTYET, Unused local assignedBase="${netBase}/assigned"

    local netAddrPrefix=$( vis_forNetName_getNetAddrPrefix "${netName}" )

    local boxIndex=$(( ${boxNu} - 1000 ))
    local boxAddrNu=$(( ${boxIndex} + ${minAddr} ))
    local boxAddr="${netAddrPrefix}.${boxAddrNu}"

    echo ${boxAddr}
    
    lpReturn
}



function vis_assignVirtAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local netName=$1
    local containerNu=$2

    local addrType=containers

    local networksBase=$( networksBaseObtain )
    EH_assert [ ! -z "${networksBase}" ]

    local netBase=${networksBase}/${netName}/addrs/${addrType}
    EH_assert [ -d "${netBase}" ]

    local minAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} minAddr.fp )
    local maxAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} maxAddr.fp )

    # NOTYET, unused local assignedBase="${netBase}/assigned"

    local netAddrPrefix=$( vis_forNetName_getNetAddrPrefix "${netName}" )
    
    local containerIndex=$(( ${containerNu} - 1000 ))
    local containerAddrNu=$(( ${containerIndex} + ${minAddr} ))
    local containerAddr="${netAddrPrefix}.${containerAddrNu}"

    echo ${containerAddr}
    
    lpReturn
}


function vis_cntnr_netName_ipAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, list applicable netNames based on abode.
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]

    EH_assert bxoIdPrep

    local netName="$1"
    EH_assert [ ! -z "${netName}" ]

    if [ "${netName}" == "nat" ] ; then
	ANT_raw "netName=nat requires no processing"
	lpReturn
    fi
     
    # Generics one way, auto one way, assigned one way

    local siteContainersRepo="${bxoHome}/siteContainersRepo"
    local containerAssignBase="${siteContainersRepo}/assign"

    local model=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} model )
    local abode=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} abode )
    local function=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} function )
    local containerId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )    

    local sysCharBase=${bxoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bxoHome}/${repoName}"
    
    local sysInfoFps=${repoBase}/sysInfo.fps
    EH_assert [ -d "${sysInfoFps}" ]

    local virtSpecFps=${repoBase}/virtSpec.fps
    EH_assert [ -d "${virtSpecFps}" ]

    local containerSpecFps=${repoBase}/containerSpec.fps  
    local containerSpecFps_netIfs=${containerSpecFps}/netIfs

    local result=""
    
    case ${function} in
	Generic)
	    ANR_raw "Generic IP ADDR NOTYET"
	    lpReturn 
	    ;;
	Server)
	    doNothing
	    ;;
	*)
	    EH_problem "NOTYET -- unimplemented ${function}"
	    ;;
    esac

    case ${model} in
	Virt)
	    result=$(vis_getVirtAddr ${netName} NOTYETContainerNu)
	    ;;
	Host|Pure)
	    # /bxo/r3/iso/pmp_HIS-1001/siteContainersRepo/assign/boxId/
	    local boxId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} boxId )
	    local boxNu=$( echo "${boxId}" | sed -e 's:box::' )
	    result=$(vis_getBoxAddr ${netName} ${boxNu})
	    ;;
	*)
	    EH_problem "Bad Usage model=${model}"
	    ;;
    esac

    echo "${result}"
}


function vis_getVirtAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local netName=$1
    local containerNu=$2

    local addrType=containers

    local networksBase=$( networksBaseObtain )
    EH_assert [ ! -z "${networksBase}" ]

    local netBase=${networksBase}/${netName}/addrs/${addrType}
    EH_assert [ -d "${netBase}" ]

    local minAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} minAddr.fp )
    local maxAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} maxAddr.fp )

    # NOTYET, unused local assignedBase="${netBase}/assigned"

    local netAddrPrefix=$( vis_forNetName_getNetAddrPrefix "${netName}" )
    
    local containerIndex=$(( ${containerNu} - 1000 ))
    local containerAddrNu=$(( ${containerIndex} + ${minAddr} ))
    local containerAddr="${netAddrPrefix}.${containerAddrNu}"

    echo ${containerAddr}
    
    lpReturn
}


function vis_getBoxAddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Similar to vis_assignNextAddr but uses different pool and indexes based on boxNu.
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]

    local netName=$1
    local boxNu=$2

    local addrType=containerBoxes

    local networksBase=$( networksBaseObtain )
    EH_assert [ ! -z "${networksBase}" ]

    local netBase=${networksBase}/${netName}/addrs/${addrType}
    EH_assert [ -d "${netBase}" ]

    local minAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} minAddr.fp )
    local maxAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} maxAddr.fp )

    # NOTYET, Unused local assignedBase="${netBase}/assigned"

    local netAddrPrefix=$( vis_forNetName_getNetAddrPrefix "${netName}" )

    local boxIndex=$(( ${boxNu} - 1000 ))
    local boxAddrNu=$(( ${boxIndex} + ${minAddr} ))
    local boxAddr="${netAddrPrefix}.${boxAddrNu}"

    echo ${boxAddr}
    
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
