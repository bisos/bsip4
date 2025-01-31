#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxeRealize.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

# PRE parameters

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    if [ ! -z "${bpoId}" ] ; then
        bpoIdPrepValidate    

        if [ ! -z "${bpoId}" ] ; then
            bpoHome=$( FN_absolutePathGet ~${bpoId} )
        fi
    fi
    bisosCurrentsGet
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    # local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
    
    # local sysCharContainerBxoId=$( sysCharRealize.sh -i sysCharContainerBxoId ${containerBase} )
    # oneBxoId="${sysCharContainerBxoId}"

    # oneBxoId="${currentBxoId}"
    oneBxoId=$( vis_bpoIdPrep "sysChar" )

    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vmRun                 # on host
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "FULL SYSTEM Identity LEVEL SETUPS" )
$( examplesSeperatorSection "Update" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i identityUpdate
${G_myName} ${extraInfo} -i opConfigUpdate
$( examplesSeperatorChapter "General Identity Parameters" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i motdSet
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i motdSet
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i nodename
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i nodename
$( examplesSeperatorChapter "Network Interfaces" )
${G_myName} ${extraInfo} -i loopback_stdout
${G_myName} ${extraInfo} -i loopback_update
${G_myName} -p bpoId="${oneBxoId}" -i privA_stdout
${G_myName} -p bpoId=sysChar -i privA_stdout
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i privA_update
${G_myName} -p bpoId="${oneBxoId}" -i perimA_stdout
${G_myName} -p bpoId=sysChar -i perimA_stdout
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i perimA_update
${G_myName} -p bpoId="${oneBxoId}" -i pubA_stdout
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i pubA_update
${G_myName} -p bpoId="${oneBxoId}" -i interface_stdout
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i interface_update
$( examplesSeperatorChapter "Container Abode Based Full Network Interfaces Update" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i netL3InterfacesUpdate  # above updates
${G_myName} ${extraInfo} -p bpoId=sysChar -i netL3InterfacesUpdate
${G_myName} ${extraInfo} -p bpoId=sysChar -i netL3InterfacesStdout
$( examplesSeperatorChapter "Network Identity Parameters" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i netEtcHosts
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i sysCharReport
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i csSysCharReport
${G_myName} ${extraInfo} -i identitySetAscertain
_EOF_
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



function vis_identityUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bpoIdPrep
    
    ANT_raw "About To identityUpdate"


    # ---- IDENTITY
    opDoComplain vis_motdSet
    opDoComplain vis_nodename
  
    #NETWORK
    opDoComplain vis_netL3InterfacesUpdate
    # opDoComplain vis_netEtcHosts  # produces vis_netEtcHosts [ErrCode]= 25, Why, NOTYET
    lpDo vis_netEtcHosts


    lpReturn 0
}

function vis_opConfigUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # Make sure contents of opConfig.sh are in effect.
    lpDo sudo rm /etc/osmtInfo
    lpDo opConfig.sh
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: FN_fileDotDistKeep |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fileDotDistOrDateTagKeep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Keep the \$1=originalFile as \${originalFile}.dist
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset originalFile="$1"
    typeset originalFileDotDist="${originalFile}.dist"
    typeset dateTag=$( DATE_nowTag )    

    if [ ! -f "${originalFile}" ] ; then
        EH_problem "Missing ${originalFile}"
        lpReturn 101
    fi

    if [ -f "${originalFileDotDist}" ] ; then
        originalFileDotDist="${originalFile}"."${dateTag}"
    fi

    lpDo sudo cp -p "${originalFile}" "${originalFileDotDist}"
    
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: motdSet |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_motdSet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    opDo vis_fileDotDistOrDateTagKeep /etc/hostname

    vis_containerAssignRead
    EH_assert [ ! -z "${containerAssign_abode}" ]

    case ${containerAssign_abode} in
        Shield|Auto|Mobile|Perim)
            doNothing
            ;;
        Internet)
            opDo vis_fileDotDistOrDateTagKeep /etc/motd 
            cat << _EOF_ | sudo tee /etc/motd > /dev/null

Private ByStar Machine -- This service is restricted to authorized users only. 
_EOF_

            ANT_raw "/etc/motd now reads:"
            cat /etc/motd
            ;;

        *)
            ANT_raw "Unsupprted -- containerAssign_abode=${containerAssign_abode}"
            ;;
    esac

    lpReturn 0
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: vis_nodename |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_identitySetAscertain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local hostName=$( cat /etc/hostname )

    if [ "${hostName}" == "intra" ] ; then
        ANT_raw "sysChar Identity Has Not Been Set"
    else
        if [ -e /bisos/var/bpoId/sysChar.fp/value ] ; then
            lpDo cat /bisos/var/bpoId/sysChar.fp/value
        else
            EH_problem "Missing /bisos/var/bpoId/sysChar.fp/value"
            echo "unknown"
        fi
    fi
}


function vis_nodename {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    opDo vis_fileDotDistOrDateTagKeep /etc/hostname

    lpDo vis_containerAssignRead
    EH_assert [ ! -z "${containerAssign_containerId}" ]

    vis_sysCharConveyInfoRead

    local hostCntnr=$(echo ${sysChar_conveyInfo_hostCntnr} | sed -e 's/pmp_//' )

    if [ -z "${hostCntnr}" ] ; then
        opDo eval "echo ${containerAssign_containerId}-${sysChar_conveyInfo_vmNameQualifier} | sed -e s/_// -e 's/-$//' | sudo tee /etc/hostname"
    else
        opDo eval "echo ${containerAssign_containerId}-${sysChar_conveyInfo_vmNameQualifier}-${hostCntnr} | sed -e s/_// -e 's/-$//' | sudo tee /etc/hostname"
    fi
    
    opDo sudo chmod 444 /etc/hostname
    opDo sudo hostname --file /etc/hostname

    return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: vis_netEtcHosts |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_netEtcHosts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Puts the containerId in /etc/hosts. Keeps the old one.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    lpDo vis_containerAssignRead

    lpDo vis_netEtcHostsAsRoot ${containerAssign_containerId}
    
    hostsFileName=/etc/hosts

    opDo FN_textReplaceOrAdd "^127.0.1.1.*$" "127.0.1.1       ${containerAssign_containerId}" "$hostsFileName"

    ANT_raw "/etc/hosts now reads:"
    cat /etc/hosts
    
    lpReturn 0
}

function vis_netEtcHostsAsRoot {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Puts the containerId in /etc/hosts. Keeps the old one.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local containerId=$1
    local hostsFileName=/etc/hosts
    
    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo FN_textReplaceOrAdd "^127.0.1.1.*$" "127.0.1.1       ${containerId}" "$hostsFileName"

    ANT_raw "${hostsFileName} now reads:"
    cat ${hostsFileName}
}


function vis_loopback_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
auto lo
iface lo inet loopback

_EOF_

}

function vis_loopback_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    local interfacesBaseDir="/etc/network/interfaces.d"
    local filePath="/etc/network/interfaces.d/ifc-lookback.conf"

    if [ ! -d "${interfacesBaseDir}" ] ; then
        EH_problem "Missing ${interfacesBaseDir}"
        lpReturn
    fi

    lpDo eval vis_loopback_stdout \> "${filePath}"
}


function vis_netName_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local netName="$1"
    
    local interfacesBaseDir="/etc/network/interfaces.d"
    local filePath="/etc/network/interfaces.d/ifc-${netName}.conf"

    if [ ! -d "${interfacesBaseDir}" ] ; then
        EH_problem "Missing ${interfacesBaseDir}"
        lpReturn
    fi

    lpDo eval vis_${netName}_stdout \| sudo tee "${filePath}" \> /dev/null
}


function vis_netName_control_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    
    EH_assert bpoIdPrep

    local netName="$1"
    local netIfControl="$2"
    local netIf="$3"

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# Controlled BISOS netName: ${netName} control: ${netIfControl}

#auto ${netIf}
#iface ${netIf} inet static
_EOF_
}    

function vis_privA_update { lpDo vis_netName_update "privA"; }

function vis_privA_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on netName and Cntnr. creates debian network interface.
_EOF_
    }
   EH_assert [[ $# -eq 0 ]]

   EH_assert bpoIdPrep

   local netIf=""
   local netIfControl=""

   function getNetIfAsArgs { netIf=$1; netIfControl=$2; }
    
   lpDo getNetIfAsArgs  $(vis_cntnr_netName_interfaceObtain privA)
   EH_assert [ ! -z "${netIf}" ]
    
   if [ "${netIfControl}" != "enabled" ] ; then
       lpDo vis_netName_control_stdout privA "${netIfControl}" "${netIf}"
       lpReturn
   fi

   local ipAddr=$(lpDo vis_cntnr_netName_ipAddr privA)

   cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# BISOS netName: privA control: ${netIfControl}

auto ${netIf}
iface ${netIf} inet static
      address ${ipAddr}/$(vis_site_netNameNetmask privA)
      gateway $(vis_site_netName_routerDefault privA)
_EOF_

   privA_pubA_routerFpsBase=$(vis_site_srcDestNetName_routerFpsBase privA pubA)

   if [ ! -d "${privA_pubA_routerFpsBase}" ] ; then
       lpReturn
   fi

   privA_pubA_router=$( fileParamManage.py -i fileParamRead  ${privA_pubA_routerFpsBase} router )
   privA_pubA_upCommand=$( fileParamManage.py -i fileParamRead  ${privA_pubA_routerFpsBase} upCommand )   
   privA_pubA_downCommand=$( fileParamManage.py -i fileParamRead  ${privA_pubA_routerFpsBase} downCommand )   
    
   cat  << _EOF_
      ${privA_pubA_upCommand}
      ${privA_pubA_downCommand}
_EOF_

}

function vis_perimA_update { lpDo vis_netName_update "perimA"; }

function vis_perimA_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on netName and Cntnr. creates debian network interface.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local netIf=""
    local netIfControl=""

    function getNetIfAsArgs { netIf=$1; netIfControl=$2; }
    
    lpDo getNetIfAsArgs $(vis_cntnr_netName_interfaceObtain perimA)
    EH_assert [ ! -z "${netIf}" ]

    if [ "${netIfControl}" != "enabled" ] ; then
        lpDo vis_netName_control_stdout perimA "${netIfControl}" "${netIf}"
        lpReturn
    fi
    
    local ipAddr=$(vis_cntnr_netName_ipAddr perimA)

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# BISOS netName: perimA control: ${netIfControl}

auto ${netIf}
iface ${netIf} inet static
      address ${ipAddr}/$(vis_site_netNameNetmask perimA)
      gateway $(vis_site_netName_routerDefault perimA)
_EOF_

    perimA_pubA_routerFpsBase=$(vis_site_srcDestNetName_routerFpsBase perimA pubA)

    if [ ! -d "${perimA_pubA_routerFpsBase}" ] ; then
        lpReturn
    fi

    perimA_pubA_router=$( fileParamManage.py -i fileParamRead  ${perimA_pubA_routerFpsBase} router )
    perimA_pubA_upCommand=$( fileParamManage.py -i fileParamRead  ${perimA_pubA_routerFpsBase} upCommand )   
    perimA_pubA_downCommand=$( fileParamManage.py -i fileParamRead  ${perimA_pubA_routerFpsBase} downCommand )   
    
    cat  << _EOF_
      ${perimA_pubA_upCommand}
      ${perimA_pubA_downCommand}
_EOF_

}

function vis_pubA_update { lpDo vis_netName_update "pubA"; }

function vis_pubA_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on netName and Cntnr. creates debian network interface.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local netIf=""
    local netIfControl=""

    function getNetIfAsArgs { netIf=$1; netIfControl=$2; }
    
    lpDo getNetIfAsArgs $(vis_cntnr_netName_interfaceObtain pubA)
    EH_assert [ ! -z "${netIf}" ]

    if [ "${netIfControl}" != "enabled" ] ; then
        lpDo vis_netName_control_stdout pubA "${netIfControl}" "${netIf}"
        lpReturn
    fi
    
    local ipAddr=$(vis_cntnr_netName_ipAddr pubA)
    
    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# BISOS netName: pubA  control: ${netIfControl}

auto ${netIf}
iface ${netIf} inet static
      address ${ipAddr}/$(vis_site_netNameNetmask pubA)
      gateway $(vis_site_netName_routerDefault pubA)
_EOF_

    pubA_perimA_routerFpsBase=$(vis_site_srcDestNetName_routerFpsBase pubA perimA)

    if [ ! -d "${pubA_perimA_routerFpsBase}" ] ; then
        lpReturn
    fi

    pubA_perimA_router=$( fileParamManage.py -i fileParamRead  ${pubA_perimA_routerFpsBase} router )
    pubA_perimA_upCommand=$( fileParamManage.py -i fileParamRead  ${pubA_perimA_routerFpsBase} upCommand )   
    pubA_perimA_downCommand=$( fileParamManage.py -i fileParamRead  ${pubA_perimA_routerFpsBase} downCommand )   
    
    cat  << _EOF_
      ${pubA_perimA_upCommand}
      ${pubA_perimA_downCommand}
_EOF_

}


function vis_pubB_update { lpDo vis_netName_update "pubB"; }

function vis_pubB_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on netName and Cntnr. creates debian network interface.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    local netIf=""
    local netIfControl=""

    function getNetIfAsArgs { netIf=$1; netIfControl=$2; }
    
    lpDo getNetIfAsArgs $(vis_cntnr_netName_interfaceObtain pubB)
    EH_assert [ ! -z "${netIf}" ]

    if [ "${netIfControl}" != "enabled" ] ; then
        lpDo vis_netName_control_stdout pubB "${netIfControl}" "${netIf}"
        lpReturn
    fi
    
    local ipAddr=$(vis_cntnr_netName_ipAddr pubB)

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# BISOS netName: pubB

auto ${netIf}
iface ${netIf} inet static
      address ${ipAddr}/$(vis_site_netNameNetmask pubB)
      gateway $(vis_site_netName_routerDefault pubB)
_EOF_

    pubB_perimA_routerFpsBase=$(vis_site_srcDestNetName_routerFpsBase pubB perimA)

    if [ ! -d "${pubB_perimA_routerFpsBase}" ] ; then
        lpReturn
    fi

    pubB_perimA_router=$( fileParamManage.py -i fileParamRead  ${pubB_perimA_routerFpsBase} router )
    pubB_perimA_upCommand=$( fileParamManage.py -i fileParamRead  ${pubB_perimA_routerFpsBase} upCommand )   
    pubB_perimA_downCommand=$( fileParamManage.py -i fileParamRead  ${pubB_perimA_routerFpsBase} downCommand )   
    
    cat  << _EOF_
      ${pubB_perimA_upCommand}
      ${pubB_perimA_downCommand}
_EOF_

}


function vis_interface_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO NOTYET, based on ${containerAssign_abode} determine if privA is applicable.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead
    
    cat  << _EOF_
# interfaces(5) file used by ifup(8) and ifdown(8)

# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.

# Include files from /etc/network/interfaces.d:
source /etc/network/interfaces.d/*.conf
_EOF_
}


function vis_interface_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    local etcNetBaseDir="/etc/network"
    local filePath="/etc/network/interfaces"

    if [ ! -d "${etcNetBaseDir}" ] ; then
        EH_problem "Missing ${etcNetBaseDir}"
        lpReturn
    fi

    lpDo vis_fileDotDistOrDateTagKeep "${filePath}"
    
    lpDo eval vis_interface_stdout \| sudo tee "${filePath}" \> /dev/null
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: netL2Interface |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_netL3InterfacesUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
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

    lpDo vis_loopback_update

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${abode}" )
    
    local eachNet
    for eachNet in ${applicableNets} ; do
        lpDo vis_${eachNet}_update
    done
    
    lpDo vis_interface_update
    
    ANT_raw "/etc/network/interfaces now reads:"
    lpDo echo cat /etc/network/interfaces

    return 0
}


function vis_netL3InterfacesStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
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

    lpDo vis_loopback_stdout

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${abode}" )
    
    local eachNet
    for eachNet in ${applicableNets} ; do
        lpDo vis_${eachNet}_stdout
    done

    return 0
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
