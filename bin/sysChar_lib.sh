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


function sansTargetName {
    echo $1 | sed -e 's/-p targetName=.* //' -e 's/-p targetName=.*$//'
}

function vis_containerBxoId_getFunction {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** For example, from  pmp_VSG-deb11_, get "G" for generic
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]    
    local containerBxoId=$1
    echo ${containerBxoId} | sed -e 's:pmp_..\(.\).*:\1:'
}



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


function vis_forThisSysFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
Incomplete -- interim work -- does not support machineId yet
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local virtualizationType=$( facter virtual )
   local boxId=""

   # lpDo vis_bxoIdPrep "sysChar"
   
    if [ "${virtualizationType}" == "physical" ] ; then
	boxId=$( siteBoxAssign.sh -i thisBoxFindId )
	lpDo vis_withBoxIdFindContainerBase "${boxId}"
    else
	bxoId=$( vis_bxoIdPrep "sysChar" )
	lpDo vis_fromBxoIdFindContainerBase ${bxoId}
    fi
}


function vis_fromBxoIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local bxoId="$1"
   local bxoHome=$( FN_absolutePathGet ~${bxoId} )
   echo ${bxoHome}/siteContainersRepo
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
For function==Generic, containerNu is not a number. So, we add an underscore
at the end.
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerNu="$1"

   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   if ! isnum ${containerNu} ; then
       # ${containerNu}- does not work with gitlab -- repos ending with a - fail.
       # so, we use ${containerNu}_
       containerNu="${containerNu}_"
   fi

   echo "${model:0:1}${abode:0:1}${function:0:1}-${containerNu}"
}


function vis_containerBoxSysCharReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** For thisBox, report sysCharContainer
*** It should be improved.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
    local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName ${containerBase} )
    local selectedSiteBxoId=$( vis_selectedSiteBxoId )

    bxoId=${sysCharContainerBxoId}
    EH_assert vis_bxoAcctVerify "${bxoId}"
    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    lpDo vis_sysCharReport
    
    lpReturn
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
    
    lpDo fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/assign

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/steady/net/networks
    lpDo fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/steady/net/routes        
    
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

   containerSteady_networkMode=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net networkMode.fp )

   containerSteady_privA_addr=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps addr )

   
   containerSteady_privA_gateway=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps/net.fps routerDefault )

   containerSteady_privA_netmask=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps/net.fps netmask )   

   containerSteady_privA_pubA_router=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps/router-pubA.fps router )   
   containerSteady_privA_pubA_upCommand=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps/router-pubA.fps upCommand )
   containerSteady_privA_pubA_downCommand=$( fileParamManage.py -i fileParamRead  ${containerSteadyBase}/net/ipv4/privA.fps/router-pubA.fps downCommand )   
}

function vis_containerSteadyWrite {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerSteadyBase="$1"
   # typically something like: /bxo/r3/iso/pmc_siteName-containers/VAG-deb10_/steady/

   EH_assert [ -d "${containerSteadyBase}" ]

   if [ ! -z "${containerSteady_networkMode:-}" ] ; then
       lpDo fileParamManage.py -v 20 -i fileParamWrite ${containerSteadyBase}/net networkMode.fp "${containerSteady_networkMode}"
   fi
   
   if [ ! -z "${containerSteady_privA_addr:-}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerSteadyBase}/net/ipv4/privA.fps addr "${containerSteady_privA_addr}"

       local netSiteFpsPath=$( vis_netSiteFpsPath privA )
       lpDo FN_fileSymlinkUpdate "${netSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/privA.fps/net.fps

       local routerSiteFpsPath=$( vis_routerSiteFpsPath privA pubA)
       lpDo FN_fileSymlinkUpdate "${routerSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/privA.fps/router-pubA.fps
   fi
}


function vis_sysChar_netIfsRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bxoId}"
    
    if [ $# -eq 1 ] ; then
	thisBxoId=$1
    fi

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bxoHome=$( FN_absolutePathGet ~${thisBxoId} )
  
    local sysCharBase=${bxoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bxoHome}/${repoName}"

    local sysInfoFps=${repoBase}/sysInfo.fps
    local virtSpecFps=${repoBase}/virtSpec.fps
    local containerSpecFps=${repoBase}/containerSpec.fps    

    sysChar_netIfs_privA="" # Global Var
    
    if [ -d "${virtSpecFps}" ] ; then
	sysChar_netIfs_privA="eth1"
    fi

    if [ -d "${containerSpecFps}" ] ; then
	sysChar_netIfs_privA=$( fileParamManage.py -i fileParamRead ${containerSpecFps}/netIfs privA )
    fi

    if [ -z "${sysChar_netIfs_privA}" ] ; then
	EH_problem "Missing sysChar_netIfs_privA"
    fi
}


function vis_sysCharConveyInfoWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
		       }

    EH_assert [[ $# -eq 2 ]]

    local paramName=$1
    local paramValue=$2

    EH_assert bxoIdPrep
    
    # local thisBxoId="${bxoId}"

    # EH_assert [ ! -z "${thisBxoId}" ]

    # EH_assert vis_bxoAcctVerify "${thisBxoId}"
    # bxoHome=$( FN_absolutePathGet ~${thisBxoId} )

    local sysCharConveyInfoBase="${bxoHome}/var/sysCharConveyInfo"
    
    if [ ! -d "${sysCharConveyInfoBase}" ] ; then
	lpDo mkdir "${sysCharConveyInfoBase}"
    fi

    case ${paramName} in
	securityMode|vmNameQualifier)
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysCharConveyInfoBase} "${paramName}" "${paramValue}"
	    ;;
	*)
	    EH_problem "Bad Usage -- ${paramName}"
	    ;;
    esac
}


function vis_sysCharConveyInfoRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bxoId}"
    
    if [ $# -eq 1 ] ; then
	thisBxoId=$1
    fi

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bxoHome=$( FN_absolutePathGet ~${thisBxoId} )

    local sysCharConveyInfoBase="${bxoHome}/var/sysCharConveyInfo"
    
    if [ -d "${sysCharConveyInfoBase}" ] ; then
	sysChar_conveyInfo_vmNameQualifier=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} vmNameQualifier )
	sysChar_conveyInfo_ipAddr_privA=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} ipAddr_privA )
	sysChar_conveyInfo_ipAddr_pubA=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} ipAddr_pubA )
	sysChar_conveyInfo_privGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} privGit )
	sysChar_conveyInfo_pubGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} pubGitMode )
	sysChar_conveyInfo_securityMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} securityMode )
    else
	sysChar_conveyInfo_vmNameQualifier=""
	sysChar_conveyInfo_ipAddr_privA=""
	sysChar_conveyInfo_ipAddr_pubA=""
	sysChar_conveyInfo_privGitMode=""
	sysChar_conveyInfo_pubGitMode=""
	sysChar_conveyInfo_securityMode=""
    fi
}



function vis_sysCharRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bxoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bxoId}"
    
    if [ $# -eq 1 ] ; then
	thisBxoId=$1
    fi

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bxoHome=$( FN_absolutePathGet ~${thisBxoId} )
  
    local sysCharBase=${bxoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bxoHome}/${repoName}"

    local sysInfoFps=${repoBase}/sysInfo.fps
    local virtSpecFps=${repoBase}/virtSpec.fps
    local containerSpecFps=${repoBase}/containerSpec.fps    

    sysChar_sysInfo_distro=$( fileParamManage.py -v 30 -i fileParamRead ${sysInfoFps} distro )
    sysChar_sysInfo_distroType=$( fileParamManage.py -v 30 -i fileParamRead ${sysInfoFps} distroType )      

    if [ -d "${virtSpecFps}" ] ; then
	sysChar_virtSpec_vagBaseBoxType=$( fileParamManage.py -i fileParamRead ${virtSpecFps} vagBaseBoxType )
	sysChar_virtSpec_virtType=$( fileParamManage.py -i fileParamRead ${virtSpecFps} virtType )
	sysChar_virtSpec_sizing=$( fileParamManage.py -i fileParamRead ${virtSpecFps} sizing )
	sysChar_virtSpec_vagBaseBox=$( fileParamManage.py -i fileParamRead ${virtSpecFps} vagBaseBox )    
    else
	sysChar_virtSpec_vagBaseBoxType=""
	sysChar_virtSpec_virtType=""
	sysChar_virtSpec_sizing=""
	sysChar_virtSpec_vagBaseBox=""
    fi

    

    if [ -d "${containerSpecFps}" ] ; then
	sysChar_containerSpec_netIfs_privA=$( fileParamManage.py -i fileParamRead ${containerSpecFps}/netIfs privA )
    else
	sysChar_containerSpec_netIfs_privA=""
    fi
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

    local containerSpecFps=${repoBase}/containerSpec.fps  
    local containerSpecFps_netIfs=${containerSpecFps}/netIfs
    
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
	    distro="deb11"  # NOTYET get it from facter or from /etc/issue
	    distroType="desktop"
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distro ${distro}
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distroType ${distroType}
	    ;;
	*)
	    EH_problem "NOTYET -- unimplemented ${function}"
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
	Host|Pure)
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} virtType none
	    ;;
	*)
	    EH_problem "Bad Usage model=${model}"
	    ;;
    esac

    local interfaceOfNet=""
    #
    # NOTYET, ipAddrs are hard coded for now. Should be fixed.
    # Perhaps in a bisosL3_lib.sh where privA, etc are mapped.
    #
    
    case ${abode} in
	Auto|Mobile)
	    doNothing
	    ;;
	Perim)
	    lpDo FN_dirCreatePathIfNotThere ${containerSpecFps_netIfs}
	    interfaceOfNet=$( vis_givenNetGetInterface 10.x.x..0 24 )
	    if [ -z "${interfaceOfNet}" ] ; then
		if [ ${model} == "Virt" ] ; then
		    interfaceOfNet=eth1
		else
		    interfaceOfNet=TBD
		fi
	    fi
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} perimA "${interfaceOfNet}"
	    ;;
	
	Internet)
	    lpDo FN_dirCreatePathIfNotThere ${containerSpecFps_netIfs}
	    interfaceOfNet=$( vis_givenNetGetInterface 198.62.92.0 24 )
	    if [ -z "${interfaceOfNet}" ] ; then
		if [ ${model} == "Virt" ] ; then
		    interfaceOfNet=eth2
		else
		    interfaceOfNet=TBD
		fi
	    fi
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} pubA "${interfaceOfNet}"
	    ;;
	    
	Shield)
	    lpDo FN_dirCreatePathIfNotThere ${containerSpecFps_netIfs}
	    interfaceOfNet=$( vis_givenNetGetInterface 192.168.0.0 24 )
	    if [ -z "${interfaceOfNet}" ] ; then
		if [ ${model} == "Virt" ] ; then
		    interfaceOfNet=eth1
		else
		    interfaceOfNet=TBD
		fi
	    fi
	    lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} privA "${interfaceOfNet}"
	    ;;
	
	*)
	    EH_problem "Bad Usage abode=${abode}"	    
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
