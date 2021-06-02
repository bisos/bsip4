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

. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

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

typeset -t bxoId=""
# usg=""

function G_postParamHook {
    bxoIdPrepValidate    

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
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

    local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
    
    # local sysCharContainerBxoId=$( sysCharRealize.sh -i sysCharContainerBxoId ${containerBase} )
    # oneBxoId="${sysCharContainerBxoId}"

    oneBxoId="${currentBxoId}"
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vmRun                 # on host
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "FULL SYSTEM Identity LEVEL SETUPS" )
$( examplesSeperatorSection "Update" )
${G_myName} ${extraInfo} -i identityUpdate
$( examplesSeperatorChapter "General Identity Parameters" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i motdSet
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i nodename
$( examplesSeperatorChapter "Network Interfaces" )
${G_myName} ${extraInfo} -i loopback_stdout
${G_myName} ${extraInfo} -i loopback_update
${G_myName} -p bxoId="${oneBxoId}" -i privA_stdout
${G_myName} -p bxoId=sysChar -i privA_stdout
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i privA_update
${G_myName} -p bxoId="${oneBxoId}" -i perimA_stdout
${G_myName} -p bxoId=sysChar -i perimA_stdout
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i perimA_update
${G_myName} -p bxoId="${oneBxoId}" -i pubA_stdout
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i pubA_update
${G_myName} -p bxoId="${oneBxoId}" -i interface_stdout
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i interface_update
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i netL3Interface  # above updates
$( examplesSeperatorChapter "Network Identity Parameters" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i netEtcHosts
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i sysCharReport
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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

    lpDo printf ${thisDescribeF}
    
    lpReturn
}	



function vis_identityUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"
    
    ANT_raw "About To identityUpdate"    

    # ---- IDENTITY
    opDoComplain vis_motdSet
    opDoComplain vis_nodename
  
    #NETWORK
    opDoComplain vis_netL3Interface
    # opDoComplain vis_netEtcHosts  # produces vis_netEtcHosts [ErrCode]= 25, Why, NOTYET
    lpDo vis_netEtcHosts    

    lpReturn 0
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

    opDo cp -p "${originalFile}" "${originalFileDotDist}"
    
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

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert [ ! -z "${bxoId}" ]

    opDo vis_fileDotDistOrDateTagKeep /etc/hostname

    vis_containerAssignRead
    EH_assert [ ! -z "${containerAssign_abode}" ]

    case ${containerAssign_abode} in
	Shield|Auto|Mobile|Perim)
	    doNothing
	    ;;
	Internet)
	    opDo vis_fileDotDistOrDateTagKeep /etc/motd 
	    cat << _EOF_ > /etc/motd

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
	if [ -e /bisos/var/bxoId/sysChar.fp/value ] ; then
	    lpDo cat /bisos/var/bxoId/sysChar.fp/value
	else
	    EH_problem "Missing /bisos/var/bxoId/sysChar.fp/value"
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

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"

    opDo vis_fileDotDistOrDateTagKeep /etc/hostname

    vis_containerAssignRead
    EH_assert [ ! -z "${containerAssign_containerId}" ]

    vis_sysCharConveyInfoRead
    
    opDo eval "echo ${containerAssign_containerId}-${sysChar_conveyInfo_vmNameQualifier} | sed -e s/_// -e 's/-$//' > /etc/hostname"
    opDo chmod 444 /etc/hostname

    opDo hostname --file /etc/hostname

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

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"

    lpDo vis_containerAssignRead
    
    hostsFileName=/etc/hosts

    opDo FN_textReplaceOrAdd "^127.0.1.1.*$" "127.0.1.1       ${containerAssign_containerId}" "$hostsFileName"

    ANT_raw "/etc/hosts now reads:"
    cat /etc/hosts
    
    lpReturn 0
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
    
    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    local interfacesBaseDir="/etc/network/interfaces.d"
    local filePath="/etc/network/interfaces.d/ifc-${netName}.conf"

    if [ ! -d "${interfacesBaseDir}" ] ; then
	EH_problem "Missing ${interfacesBaseDir}"
	lpReturn
    fi

    lpDo eval vis_${netName}_stdout \> "${filePath}"
}

function vis_privA_update { lpDo vis_netName_update "privA"; }

function vis_privA_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO NOTYET, based on ${containerAssign_abode} determine if privA is applicable.
** TODO Re-do all of this based on new revisions.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    lpDo echo Obsoleted vis_sysChar_netIfsRead

    netIf= $( vis_cntnr_netName_interfaceObtain privA )
    EH_assert [ ! -z "${netIf}" ]
    
    local ipAddr_privA=""
    
    if [ "${containerSteady_privA_addr}" == "generic" ] ; then
	ipAddr_privA=$( vis_containerIpAddrObtain_privA "${bxoId}" generic )
    else
	ipAddr_privA=${containerSteady_privA_addr}
    fi

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.

auto ${netIf}
iface ${netIf} inet static
      address ${ipAddr_privA}/${containerSteady_privA_netmask}
      gateway ${containerSteady_privA_gateway}
_EOF_

    cat  << _EOF_
      ${containerSteady_privA_pubA_upCommand}
      ${containerSteady_privA_pubA_downCommand}
_EOF_

}

function vis_perimA_update { lpDo vis_netName_update "perimA"; }

function vis_perimA_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO NOTYET, based on ${containerAssign_abode} determine if privA is applicable.
** TODO Re-do all of this based on new revisions.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoIdPrep

    # lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    # lpDo vis_sysCharRead

    # lpDo echo Obsoleted vis_sysChar_netIfsRead

    netIf=$(vis_cntnr_netName_interfaceObtain perimA)
    EH_assert [ ! -z "${netIf}" ]
    
    local ipAddr=""
    
    ipAddr=$(vis_cntnr_netName_ipAddr perimA)

    cat  << _EOF_
# The following was generated by ${G_myName}.${G_thisFunc}.
# Last updated on $(DATE_nowTag) by $(id -u -n).
# Do Not Hand Edit as modifications will be lost.
# BISOS netName: perimA

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

function vis_perimA_update { lpDo vis_netName_update "pubA"; }


function vis_interface_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO NOTYET, based on ${containerAssign_abode} determine if privA is applicable.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"

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
    
    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    local etcNetBaseDir="/etc/network"
    local filePath="/etc/network/interfaces"

    if [ ! -d "${etcNetBaseDir}" ] ; then
	EH_problem "Missing ${etcNetBaseDir}"
	lpReturn
    fi

    lpDo vis_fileDotDistOrDateTagKeep "${filePath}"
    
    lpDo eval vis_interface_stdout \> "${filePath}"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: netL2Interface |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_netL3Interface {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert [ ! -z "${bxoId}" ]
    EH_assert vis_bxoAcctVerify "${bxoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    lpDo vis_loopback_update

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${containerAssign_abode}" )
    
    local eachNet
    for eachNet in ${applicableNets} ; do
	lpDo vis_${eachNet}_update
    done

    lpDo vis_interface_update
    
    ANT_raw "/etc/network/interfaces now reads:"
    lpDo echo cat /etc/network/interfaces

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
