#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeProvision_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeProvision_lib :: Loading Library -- /bisos/bsip/bin/bxeProvision_lib.sh"
else
    TM_trace 7 "bxeProvision_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeProvision_lib.sh" ; return
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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


function vis_containerBxoId_getContainerId {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** For example, from  pmp_VSG-deb11_, get "G" for generic
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]    
    local containerBxoId=$1
    echo ${containerBxoId} | sed -e 's:pmp_::'
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
        deb11)
            baseBoxDistro=debian-11.pre
            ;;
        deb12|default)
            baseBoxDistro=debian-12.4.0
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

   # lpDo vis_bpoIdPrep "sysChar"
   
    if [ "${virtualizationType}" == "physical" ] ; then
        boxId=$( siteBoxAssign.sh -i thisBoxFindId )
        lpDo vis_withBoxIdFindContainerBase "${boxId}"
    else
        bpoId=$( vis_bpoIdPrep "sysChar" )
        lpDo vis_fromBxoIdFindContainerBase ${bpoId}
    fi
}


function vis_fromBxoIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   
   EH_assert [[ $# -eq 1 ]]
   local bpoId="$1"
   local bpoHome=$( FN_absolutePathGet ~${bpoId} )
   echo ${bpoHome}/siteContainersRepo
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

    bpoId=${sysCharContainerBxoId}
    EH_assert vis_bxoAcctVerify "${bpoId}"
    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    lpDo vis_sysCharReport
    
    lpReturn
}       


function vis_sysCharReportObsolete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    fileParamManage.py -i fileParamDictReadDeep ${bpoHome} | grep -v bxeTree | grep -v bxeDesc
    
    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/siteContainersRepo/assign

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/siteContainersRepo

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/siteContainersRepo/steady/net/networks
    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/siteContainersRepo/steady/net/routes        
    
    lpReturn
}       

function vis_sysCharReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local containerId=${bpoId##pmp_}

    EH_assert  vis_userAcctExists "${bpoId}"
    local bpoHome=$( FN_absolutePathGet ~${bpoId} )

    fileParamManage.py -i fileParamDictReadDeep ${bpoHome} | grep -v bxeTree | grep -v bxeDesc

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/${containerId}/self

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/${containerId}

    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/${containerId}/steady/net/networks
    lpDo fileParamManage.py -i fileParamDictReadDeep ${bpoHome}/${containerId}/steady/net/routes

    lpReturn
}

function vis_sysCharReportShort {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local containerId=${bpoId##pmp_}

    EH_assert  vis_userAcctExists "${bpoId}"
    local bpoHome=$( FN_absolutePathGet ~${bpoId} )

    local bisosSysChar=$( lpDo fileParamManage.py -i fileParamRead /bisos/var/bpoId sysChar.fp )

    containerBoxBase=${bpoHome}/${containerId}/self/box.fps

    local boxName=$( lpDo fileParamManage.py -i fileParamRead  ${containerBoxBase} boxId )
    local boxNu=$( lpDo fileParamManage.py -i fileParamRead  ${containerBoxBase} boxNu )

    local mem=$( free -h | egrep '^Mem:' | tr -s " " | cut -d ' ' -f 2 )
    local cpus=$(nproc --all )
    # local cpus=$( lcaKvmAdmin.sh -i nuOfVirtCpus )

    echo "bisosSysChar=${bisosSysChar} boxName=${boxName} boxNu=${boxNu} cpus=${cpus} mem=${mem} deb=notyet usgBpo=notyet"

}




function vis_containerAssignRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bpoId is the sysChar. From which the link to assign is followed.
When boxId is "virt", virtSpec.fps become effective.
_EOF_
                      }

    EH_assert [[ $# -lt 2 ]]
    
    local containerAssignBase=""
    
    if [ $# -eq 0 ] ; then
        EH_assert [ ! -z "${bpoId}" ]

        EH_assert vis_bxoAcctVerify "${bpoId}"
        bpoHome=$( FN_absolutePathGet ~${bpoId} )

        local thisContainerId=${bpoId##pmp_}

        containerAssignBase=${bpoHome}/${thisContainerId}/self/container.fps
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


function vis_containerAssignReadObsolete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
bpoId is the sysChar. From which the link to assign is followed.
When boxId is "virt", virtSpec.fps become effective.
_EOF_
                      }

    EH_assert [[ $# -lt 2 ]]

    local containerAssignBase=""

    if [ $# -eq 0 ] ; then
        EH_assert [ ! -z "${bpoId}" ]

        EH_assert vis_bxoAcctVerify "${bpoId}"
        bpoHome=$( FN_absolutePathGet ~${bpoId} )

        containerAssignBase=${bpoHome}/siteContainersRepo/assign
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
bpoId is the sysChar. From which the link to the steady dir of container repo is followed.
From there links to networks and routes are also followed.
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${bpoId}" ]

   EH_assert vis_bxoAcctVerify "${bpoId}"
   bpoHome=$( FN_absolutePathGet ~${bpoId} )
  
   local containerSteadyBase=${bpoHome}/siteContainersRepo/steady

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

   # blank or auto or static
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

   if [ ! -z "${containerSteady_pubA_addr:-}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerSteadyBase}/net/ipv4/pubA.fps addr "${containerSteady_pubA_addr}"

       local netSiteFpsPath=$( vis_netSiteFpsPath pubA )
       lpDo FN_fileSymlinkUpdate "${netSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/pubA.fps/net.fps

       local routerSiteFpsPath=$( vis_routerSiteFpsPath privA pubA)
       lpDo FN_fileSymlinkUpdate "${routerSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/pubB.fps/router-pubA.fps
   fi

   if [ ! -z "${containerSteady_pubB_addr:-}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerSteadyBase}/net/ipv4/pubB.fps addr "${containerSteady_pubB_addr}"

       local netSiteFpsPath=$( vis_netSiteFpsPath pubB )
       lpDo FN_fileSymlinkUpdate "${netSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/pubB.fps/net.fps

       local routerSiteFpsPath=$( vis_routerSiteFpsPath privA pubB)
       lpDo FN_fileSymlinkUpdate "${routerSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/pubB.fps/router-pubB.fps
   fi


}


function vis_sysChar_netIfsRead%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** bpoId is the sysChar and can be specified through -p or as \$1. Reads value of applicable net interfaces.
_EOF_
                       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bpoId}"
    
    if [ $# -eq 1 ] ; then
        thisBxoId=$1
    fi

    thisBxoId=$( bpoIdPrep ${thisBxoId} )

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bpoHome=$( FN_absolutePathGet ~${thisBxoId} )
  
    local sysCharBase=${bpoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

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
bpoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
                       }

    EH_assert [[ $# -eq 2 ]]

    local paramName=$1
    local paramValue=$2

    if [ -z "${bpoId}" ] ; then
        bpoId="sysChar"
    fi

    EH_assert bpoIdPrep
    
    # local thisBxoId="${bpoId}"

    # EH_assert [ ! -z "${thisBxoId}" ]

    # EH_assert vis_bxoAcctVerify "${thisBxoId}"
    # bpoHome=$( FN_absolutePathGet ~${thisBxoId} )

    local sysCharConveyInfoBase="${bpoHome}/var/sysCharConveyInfo"
    
    if [ ! -d "${sysCharConveyInfoBase}" ] ; then
        lpDo mkdir -p "${sysCharConveyInfoBase}"
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
bpoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
                       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bpoId}"
    
    if [ $# -eq 1 ] ; then
        thisBxoId=$1
    fi

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bpoHome=$( FN_absolutePathGet ~${thisBxoId} )

    local sysCharConveyInfoBase="${bpoHome}/var/sysCharConveyInfo"
    
    if [ -d "${sysCharConveyInfoBase}" ] ; then
        sysChar_conveyInfo_vmNameQualifier=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} vmNameQualifier )
        sysChar_conveyInfo_hostCntnr=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} hostCntnr )       
        sysChar_conveyInfo_ipAddr_privA=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} ipAddr_privA )
        sysChar_conveyInfo_ipAddr_pubA=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} ipAddr_pubA )
        sysChar_conveyInfo_privGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} privGit )
        sysChar_conveyInfo_pubGitMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} pubGitMode )
        sysChar_conveyInfo_securityMode=$( fileParamManage.py -i fileParamRead  ${sysCharConveyInfoBase} securityMode )
    else
        sysChar_conveyInfo_vmNameQualifier=""
        sysChar_conveyInfo_hostCntnr="" 
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
bpoId is the sysChar.
sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
_EOF_
                       }

    EH_assert [[ $# -lt 2 ]]

    local thisBxoId="${bpoId}"
    
    if [ $# -eq 1 ] ; then
        thisBxoId=$1
    fi

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bpoHome=$( FN_absolutePathGet ~${thisBxoId} )
  
    local sysCharBase=${bpoHome}/sysChar
    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

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
** Writes into ~containerBxo/sysChar
*** bpoId is the sysChar.
*** sysInfo.fps of sysChar overwrites sysInfo.fps of siteContainersRepo.
*** TODO Needs to be developed in conjunction with siteNetworks_lib.sh
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

    local thisCntnrId=${bpoId##pmp_}

    local siteContainersRepo="${bpoHome}/${thisCntnrId}"
    local containerAssignBase="${siteContainersRepo}/self/container.fps"

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
            distro="deb12"  # NOTYET get it from facter or from /etc/issue
            distroType="desktop"
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distro ${distro}
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${sysInfoFps} distroType ${distroType}
            ;;
        *)
            EH_problem "Unimplemented yet -- ${function}"
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

            ANT_raw "For model=${model} Network InterfaceName was communicated at VM creation"
            ANT_raw "Through conjecture, we label them as any enabled"      
            lpDo vis_cntnr_netName_interfacesUpdateBasedOnConjecture
            ;;
        Host|Pure)
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${virtSpecFps} virtType none

            lpDo vis_cntnr_netName_interfacesUpdateBasedOnConjecture
            ;;
        *)
            EH_problem "Bad Usage model=${model}"
            ;;
    esac
}


function vis_cntnr_netName_applicables {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, list applicable netNames based on abode.
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

    # local siteContainersRepo="${bpoHome}/siteContainersRepo"
    # local containerAssignBase="${siteContainersRepo}/assign"

    local thisCntnrId=${bpoId##pmp_}
    local siteContainersRepo="${bpoHome}/${thisCntnrId}"
    local containerAssignBase="${siteContainersRepo}/self/container.fps"

    local abode=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} abode )

    lpDo vis_withAbodeGetApplicableNetsList "${abode}"
}
    

function vis_cntnr_netName_interfaceObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, based on that and specified NetName, obtaine network interface.
_EOF_
                      }
    EH_assert [[ $# -lt 3 ]]

    local thisBxoId="${bpoId}"
    
    if [ $# -eq 2 ] ; then
        thisBxoId=$2
    fi

    thisBxoId=$( bpoIdPrep ${thisBxoId} )

    EH_assert [ ! -z "${thisBxoId}" ]

    EH_assert vis_bxoAcctVerify "${thisBxoId}"
    bpoHome=$( FN_absolutePathGet ~${thisBxoId} )

    #local thisCntnrId=${bpoId##pmp_}
    local thisCntnrId=${thisBxoId##pmp_}

    local netName="$1"
    EH_assert [ ! -z "${netName}" ]

    if [ "${netName}" == "nat" ] ; then
        # ANT_raw "netName=nat requires no processing"
        lpDo echo "nat" "nat"
        lpReturn
    fi
    
    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

    local siteContainersRepo="${bpoHome}/${thisCntnrId}/self"
    local containerAssignBase="${siteContainersRepo}/container.fps"

    local model=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} model )
    local abode=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} abode )
    local function=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} function )
    local containerId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )    

    # local sysInfoFps=${repoBase}/sysInfo.fps
    # EH_assert [ -d ${sysInfoFps} ]

    # local virtSpecFps=${repoBase}/virtSpec.fps
    # EH_assert [ -d ${virtSpecFps} ]

    local containerSpecFps=${repoBase}/containerSpec.fps  
    local containerSpecFps_netIfs=${containerSpecFps}/netIfs

    local interfaceOfNet=""
    local interfaceOfNetControl=""    
    
    case ${model} in
        Virt)
            # Result is something like eth0  and is obtained from
            # sysCharBxoHome/var

            interfaceOfNet=$( fileParamManage.py -v 30 -i fileParamRead ${bpoHome}/var/sysCharConveyInfo/netIfs "${netName}" )
            interfaceOfNetControl=$( fileParamManage.py -v 30 -i fileParamRead ${bpoHome}/var/sysCharConveyInfo/netIfs "${netName}-control" )               
            ;;
        Host|Pure)
            # Result is something like en0 and is obtained from
            # sysCharBxoHome/sysChar/containerSpec.fps/netIfs
            interfaceOfNet=$( fileParamManage.py -v 30 -i fileParamRead ${containerSpecFps_netIfs} "${netName}" )
            interfaceOfNetControl=$( fileParamManage.py -v 30 -i fileParamRead ${containerSpecFps_netIfs} "${netName}-control" )                    
            ;;
        *)
            EH_problem "Bad Usage model=${model}"
            ;;
    esac

    if [ -z "${interfaceOfNet}" ] ; then
        ANT_cooked "Missing Net Interface Info -- interfaceOfNet=${interfaceOfNet} -- Set to blank"
        interfaceOfNet="blank"
    fi
    if [ -z "${interfaceOfNetControl}" ] ; then
        ANT_cooked "Missing Net Interface Info -- interfaceOfNetControl=${interfaceOfNetControl} -- Set to blank"
        interfaceOfNetControl="blank"   
    fi
    
    echo "${interfaceOfNet}" "${interfaceOfNetControl}"
}


function vis_cntnr_netName_interfaceUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, based on that and specified NetName, obtaine network interface.
_EOF_
                      }
    EH_assert [[ $# -eq 3 ]]

    EH_assert bpoIdPrep

    local netName="$1"
    local interfaceOfNet="$2"
    local interfaceOfNetControl="$3"       

    EH_assert [ ! -z "${netName}" ]

    if [ "${netName}" == "nat" ] ; then
        ANT_raw "netName=nat requires no processing"
        lpReturn
    fi
    
    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

    # local siteContainersRepo="${bpoHome}/siteContainersRepo"
    # local containerAssignBase="${siteContainersRepo}/assign"

    local thisCntnrId=${bpoId##pmp_}
    local siteContainersRepo="${bpoHome}/${thisCntnrId}"
    local containerAssignBase="${siteContainersRepo}/self/container.fps"

    local model=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} model )
    local abode=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} abode )
    local function=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} function )
    local containerId=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )

    local sysInfoFps=${repoBase}/sysInfo.fps
    lpDo FN_dirCreatePathIfNotThere ${sysInfoFps}

    local virtSpecFps=${repoBase}/virtSpec.fps
    lpDo FN_dirCreatePathIfNotThere ${virtSpecFps}

    local containerSpecFps=${repoBase}/containerSpec.fps  
    local containerSpecFps_netIfs=${containerSpecFps}/netIfs
    
    case ${model} in
        Virt)
            # Result is something like eth0  and is obtained from
            # sysCharBxoHome/var

            lpDo fileParamManage.py -v 30 -i fileParamWrite ${bpoHome}/var/sysCharConveyInfo/netIfs "${netName}" "${interfaceOfNet}"
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${bpoHome}/var/sysCharConveyInfo/netIfs "${netName}-control" "${interfaceOfNetControl}"         
            ;;
        Host|Pure)
            # Result is something like en0 and is obtained from
            # sysCharBxoHome/sysChar/containerSpec.fps/netIfs
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} "${netName}" "${interfaceOfNet}"
            lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} "${netName}-control" "${interfaceOfNetControl}"      
            # case ${netName} in
            #   pubA|pubB)
            #       lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} "${netName}-control" "disabled"
            #       ;;
            #   *)
            #       lpDo fileParamManage.py -v 30 -i fileParamWrite ${containerSpecFps_netIfs} "${netName}-control" "enabled"
            #       ;;
            # esac
            ;;
        *)
            EH_problem "Bad Usage model=${model}"
            ;;
    esac
}


function vis_cntnr_netName_interfacesUpdateBasedOnConjecture {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, based on that and specified netName, and specified interfaceOfNet, set network interface.
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local line=""
    local netName=""
    local netInterface=""

    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"
    # local containerAssignBase="${siteContainersRepo}/assign"

    local thisCntnrId=${bpoId##pmp_}

    local siteContainersRepo="${bpoHome}/${thisCntnrId}"
    local containerAssignBase="${siteContainersRepo}/self/container.fps"


    local model=$( lpDo fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} model )

    function procNetNameInterface {
        netName=$1
        netInterface=$2

        if [ "${netInterface}" == "unknown" ] ; then
            lpDo vis_cntnr_netName_interfaceUpdate ${netName} ${netInterface} "unconfigured"
            ANT_raw "No conjectures for netName=$1 and netInterface=$2"
            lpReturn
        else
            lpDo vis_cntnr_netName_interfaceUpdate ${netName} ${netInterface} "enabled"
        fi

        case ${model} in
            Virt)
                lpDo vis_cntnr_netName_interfaceUpdate ${netName} "any" "enabled"
                ;;
            Host|Pure)
                case ${netName} in
                    pubA|pubB)
                        lpDo vis_cntnr_netName_interfaceUpdate ${netName} ${netInterface} "disabled"
                        ;;
                    *)
                        doNothing
                        ;;
                esac
                ;;
            *)
                doNothing
                ;;
        esac
    }
    
    vis_cntnr_netName_interfacesConject |
        while read line ; do
            lpDo procNetNameInterface ${line} # 2 Args
        done
}


function vis_cntnr_netName_interfacesConject {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Analyze sysCharBxoId, based on that and specified netName, and specified interfaceOfNet, set network interface.
_EOF_
                      }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    # local netName="$1"
    # local interfaceOfNet="$2"

    # EH_assert [ ! -z "${netName}" ]

    # if [ "${netName}" == "nat" ] ; then
    #   ANT_raw "netName=nat requires no processing"
    #   lpReturn
    # fi
    
    local repoName="sysChar"
    local repoBase="${bpoHome}/${repoName}"

    # local siteContainersRepo="${bpoHome}/siteContainersRepo"
    # local containerAssignBase="${siteContainersRepo}/assign"

    local thisCntnrId=${bpoId##pmp_}
    local siteContainersRepo="${bpoHome}/${thisCntnrId}"
    local containerAssignBase="${siteContainersRepo}/self/container.fps"

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

    local interfaceOfNet=""
    local netAddr=""
    local netmask=""

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${abode}" )
    
    for eachNetName in ${applicableNets} ; do

        netAddr=$(vis_site_netNameAddr ${eachNetName} )
        netmask=$(vis_site_netNameNetmask ${eachNetName} )

        interfaceOfNet=$( vis_givenNetGetInterface "${netAddr}" "${netmask}" )
        if [ -z "${interfaceOfNet}" ] ; then
            interfaceOfNet="unknown"
        fi

        lpDo echo "${eachNetName}" "${interfaceOfNet}"
    done
}


function vis_recordDeployment {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Use the sysChar BxO to record that the VM was deployed.
_EOF_
                       }
    local thisDescribeF=$(describeF)
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo printf ${thisDescribeF}
    
    lpReturn
}       


function vis_withInitialGetModel {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local modelInitial=$1
   local result=""

   case "${modelInitial}" in
       "H")
           result="Host"
           ;;
       "P")
           result="Pure"
           ;;
       "V")
           result="Virt"
           ;;
       *)
           EH_problem "Bad Usage -- modelInitial=${modelInitial}"
   esac
   echo ${result}
}

function vis_withInitialGetAbode {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local abodeInitial=$1
   local result=""

   case "${abodeInitial}" in
       "A")
           result="Auto"
           ;;
       "M")
           result="Mobile"
           ;;
       "P")
           result="Perim"
           ;;
       "S")
           result="Shield"
           ;;
       "I")
           result="Internet"
           ;;
       *)
           EH_problem "Bad Usage -- abodeInitial=${abodeInitial}"
   esac
   echo ${result}
}


function vis_withInitialGetFunction {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local functionInitial=$1
   local result=""

   case "${functionInitial}" in
       "L")
           result="LinuxU"
           ;;
       "A")
           result="AndroidU"
           ;;
       "S")
           result="Server"
           ;;
       "D")
           result="Devel"
           ;;
       "G")
           result="Generic"
           ;;
       *)
           EH_problem "Bad Usage -- functionInitial=${functionInitial}"
   esac
   echo ${result}
}

function vis_distro_provisionBisos_ascertain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies identically to all distros.
*** ManagerOnly -- intra user
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         ls -l /bisos/core/bsip

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
