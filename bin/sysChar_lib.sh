#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeProvision_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeProvision_lib :: Loading Library -- /bisos/bsip/bin/bxeProvision_lib.sh"
else
    TM_trace 7 "bxeProvision_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeProvision_lib.sh" ; return
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

# PRE parameters
typeset -t privA_addr=""


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function fromGenericContainerIdGetDistro {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
For example from VAG-deb10- get deb10
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]    
    local containerId=$1
    echo ${containerId} | sed -e 's:...-\(.*\)_:\1:' | sed -e 's:.*\(bx_\)\(.*\):\2:'
}

function fromGenericContainerIdGetBaseBoxIndicator {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
For example from VAG-bx_deb10- get bx
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]    
    local containerId=$1
    local baseBoxIndicator=$( echo ${containerId} | sed -e 's:...-\(bx\)_.*_:\1:' )

    if [ "${baseBoxIndicator}" == "bx" ] ; then
	echo "bxcntnr"
    elif [ "${baseBoxIndicator}" == "${containerId}" ] ; then
	echo "desktop"
    else
	EH_problem "Bad Usage -- ${baseBoxIndicator}"
	echo ""
	lpReturn 101
    fi
    lpReturn 0
}


function withFunctionAndContainerIdGetVagBoxType {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]    
    local function=$1
    local containerId=$2

    # local vagBaseBoxType="desktop"
    local vagBaseBoxType="bxcntnr"    
    if [ "${function}" == "Generic" ] ; then
	vagBaseBoxType=$( fromGenericContainerIdGetBaseBoxIndicator ${containerId} )
	EH_assert [ ! -z ${vagBaseBoxType} ]
    fi

    echo ${vagBaseBoxType}
}


function withDistroGetVagBaseBox {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 4 ]]    
    local function=$1
    local distro=$2   
    local distroType=$3
    local containerId=$4

    local vagBaseBoxType="desktop"
    if [ "${function}" == "Generic" ] ; then
	vagBaseBoxType=$( fromGenericContainerIdGetBaseBoxIndicator ${containerId} )
	EH_assert [ ! -z ${vagBaseBoxType} ]
    fi

    local baseBoxName=""
    local baseBoxDistro=""

    case ${distro} in
	deb10)
	    baseBoxDistro=debian-10.8
	    ;;
	deb11|default)
	    baseBoxDistro=debian-11.pre
	    ;;
	ub2004)
	    baseBoxDistro=ubuntu-20.04
	    ;;
	*)
	    EH_problem "Bad Usage -- ${distro}"
	    ;;
    esac

    case ${vagBaseBoxType} in
	bxcntnr)
	    baseBoxName=bisos
	    ;;
	desktop|mini)
	    baseBoxName=bxDistro
	    ;;
	*)
	    EH_problem "Bad Usage -- ${vagBaseBoxType}"
	    ;;
    esac

    echo ${baseBoxName}/${baseBoxDistro}/${vagBaseBoxType}
}

function vis_sysCharReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome} | grep -v bxeTree | grep -v bxeDesc
    
    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/assign

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/steady/net/networks
    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/steady/net/routes        
    
    lpReturn
}	


function vis_containerAssignRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar. From which the link to assign is followed.
When boxId is "virt", virtSpec.fps become effective.
_EOF_
		      }

    EH_assert [[ $# -lt 2 ]]
    
    local containerAssignBase=""
    
    if [ $# -eq 0 ] ; then
	EH_assert [ ! -z "${bxoId}" ]

	EH_assert vis_bxoAcctVerify "${bxoId}"
	bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
	containerAssignBase=${bxoHome}/siteContainersRepo/assign
    elif [ $# -eq 1 ] ; then
	containerAssignBase=$1
    else
	EH_oops ""
	lpReturn
    fi
 
 
    containerAssign_containerId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )
    containerAssign_boxId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} boxId )   
    containerAssign_abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
    containerAssign_function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )
    containerAssign_model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )         
}

function vis_containerSteadyRead {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar. From which the link to the steady dir of container repo is followed.
From there links to networks and routes are also followed.
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${bxoId}" ]

   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
   local containerSteadyBase=${bxoHome}/siteContainersRepo/steady

   containerSteady_privA_addr=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps addr )
   containerSteady_privA_gateway=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps gateway )

   containerSteady_privA_netmask=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/networks/privA/net.fps netmask )   

   containerSteady_privA_pubA_router=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/routes/privA-pubA.fps router )   
   containerSteady_privA_pubA_upCommand=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/routes/privA-pubA.fps upCommand )
   containerSteady_privA_pubA_downCommand=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/routes/privA-pubA.fps downCommand )   
}

function vis_containerSteadyWrite {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   # typically something like: /bxo/r3/iso/pmc_clusterNeda-containers/VAG-deb10-/steady/
   local containerSteadyBase="$1"
   EH_assert [ -d "${containerSteadyBase}" ]

   if [ ! -z "${steady_networkMode}" ] ; then
       lpDo fileParamManage.py -v 20 -i fileParamWrite ${containerSteadyBase}/net networkMode.fp "${steady_networkMode}"
   fi
   
   if [ ! -z "${steady_privA_addr}" ] ; then
       fileParamManage.py -i fileParamWrite ${containerSteadyBase}/net/ipv4/privA.fps addr "${steady_privA_addr}"
   fi
}


function vis_sysCharRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
    local sysCharBase=${bxoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bxoHome}/${repoName}"

    local sysInfoFps=${repoBase}/sysInfo.fps
    local virtSpecFps=${repoBase}/virtSpec.fps

    sysChar_sysInfo_distro=$( fileParamManage.py -v 30 -i fileParamRead ${sysInfoFps} distro )
    sysChar_sysInfo_distroType=$( fileParamManage.py -v 30 -i fileParamRead ${sysInfoFps} distroType )      
    
    sysChar_virtSpec_vagBaseBoxType=$( fileParamManage.py -i fileParamRead ${virtSpecFps} vagBaseBoxType )
    sysChar_virtSpec_virtType=$( fileParamManage.py -i fileParamRead ${virtSpecFps} virtType )
    sysChar_virtSpec_sizing=$( fileParamManage.py -i fileParamRead ${virtSpecFps} sizing )
    sysChar_virtSpec_vagBaseBox=$( fileParamManage.py -i fileParamRead ${virtSpecFps} vagBaseBox )    

    sysChar_privA_if=$( fileParamManage.py -i fileParamRead  ${sysCharBase}/netInterface.fps privA )
}


function vis_sysCharWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    local repoName="sysChar"
    local repoBase="${bxoHome}/${repoName}"

    local siteContainersRepo="${bxoHome}/siteContainersRepo"
    local containerAssignBase="${siteContainersRepo}/assign"

    local model=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} model )
    local abode=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} abode )
    local function=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} function )
    local containerId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )    

    local sysInfoFps=${repoBase}/sysInfo.fps
    lpDo FN_dirCreatePathIfNotThere ${sysInfoFps}

    local virtSpecFps=${repoBase}/virtSpec.fps
    lpDo FN_dirCreatePathIfNotThere ${virtSpecFps}
    
    local distro="default"          # Sys
    local distroType="desktop"      # Sys
    local vagBaseBoxType=""         # Virt
    local vagBaseBox=""             # Virt

    case ${function} in
	Generic)
	    distro=$( fromGenericContainerIdGetDistro ${containerId} )
	    distroType="desktop"
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distro ${distro}
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distroType ${distroType}
	    ;;
	Server)
	    doNothing
	    ;;

	*)
	    EH_problem "NOTYET -- unimplemented ${function}"
	    ;;
    esac

    case ${abode} in
	Auto)
	    doNothing
	    ;;
	*)
	    doNothing
	    ;;
    esac

    case ${model} in
	Virt)
	    vagBaseBoxType=$( withFunctionAndContainerIdGetVagBoxType ${function} ${containerId} )
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} vagBaseBoxType ${vagBaseBoxType}
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} virtType default
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} sizing medium
  	    #vagBaseBox=$( withDistroGetVagBaseBox ${distro} ${distroType} ${vagBaseBoxType} )
	    vagBaseBox=$( withDistroGetVagBaseBox ${function} ${distro} ${distroType} ${containerId} )	    
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} vagBaseBox ${vagBaseBox}
	    ;;
	*)
	    doNothing
	    ;;
    esac
}


function vis_recordDeployment {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Use the sysChar BxO to record that the VM was deployed.
_EOF_
		       }
    local thisDescribeF=$(describeF)
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

    lpDo printf ${thisDescribeF}
    
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
