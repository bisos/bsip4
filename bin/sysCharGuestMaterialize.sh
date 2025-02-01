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


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash".
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

. ${opBinBase}/siteRegistrar_lib.sh


# PRE parameters

typeset -t bpoId=""
# usg=""

# Associative Array
declare -A vmNetIfsArray=(
    [auto]="none"
    [privA]="none"
    [pubA]="none"
    [pubB]="none"
    [perimA]="none"
)

vmNetIf_auto="blank"
vmNetIf_privA="blank"
vmNetIf_pubA="blank"
vmNetIf_pubB="blank"
vmNetIf_perimA="blank"

function G_postParamHook {

    if [ ! -z "${bpoId}" ] ; then
        bpoIdPrepValidate
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
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

    #oneBxoId="prs-bisos"
    #oneBxoId="${currentBxoId}"
    oneBxoId="pmp_VAG-deb12_"
    #oneBxoId="pic_dnsServer"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VAG-deb12_  # Generic, Auto, Dhcp,
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VSG-deb12_  # Generic, Shielded, StaticIP
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VSS-1009    # Specific, Shielded, StaticIP
$( examplesSeperatorChapter "Activate Subject sysContainerBxo" )
sysCharActivate.sh -h -v -n showRun -p bpoId="${oneBxoId}" -i activate_sysContainerBxo
$( examplesSeperatorChapter "VM File -- VM Name" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantBase_last     # on host - Show Vagrant Directory
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantFile_last
${G_myName} -i vagrantFile_vmName  $( ${G_myName} -p bpoId="${oneBxoId}" -i vagrantFile_last )
$( examplesSeperatorChapter "Specialized Actions" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantBaseBoxFromSysChar   # which vagrantBaseBox will be used
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantFile_run       # PRIMARY Generates image for SITED BISOS
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p phases="P0 P1" -i vagrantFile_run   # Generates image for Raw-BISOS (UnSited-BISOS)
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p phases="P0" -i vagrantFile_run      # Generates image for Fresh-DEBIAN
$( examplesSeperatorChapter "Vagrantfile Stdout and Creation " )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantFile_bottomPart
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vagrantFile_stdout    # on host
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -p phases="P0 P1" -i vagrantFile_stdout    # on host - Equivalent of UnSited BISOS
${G_myName} -p bpoId="${oneBxoId}" -i vagrantFile_stdout    # on host
$( examplesSeperatorChapter "Post Vagrant Virsh Activities" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vmCustomize           # using virsh sets up guest ip addrs
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i vmRun                 # on host
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "Generic Container Materialization" )
${G_myName} -i containerGenericMaterialize examples
${G_myName} ${extraInfo} -i containerGenericMaterialize doIt
$( examplesSeperatorChapter "Guest / VM / Vagrant -- Management And Deletion" )
vagrant global-status  # List Vagrant Directories, Names and IDs, runningh status is inacurate
virsh --connect qemu:///system list --all --title  # List running and shut off VMs
bpoCntnrGuestStation.sh  # Manage VMs with their Guest BPOs
lcaVirshManage.sh   # Low level virsh Management
echo vagrant destroy id  # Name does not work. Id is obtained from vagrant global-status
_EOF_
}

# $( examplesSeperatorChapter "Phases Specification" )
# ${G_myName} -i vagrantPhasesGet
# ${G_myName} -p phases="P0 P1" -i vagrantPhasesGet



vagrantPhasesList=( "P0" "P1" "P2" "P3" )

typeset -t phases=""

function vis_vagrantPhasesSet {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_

                         }
   if [ ! -z "${phases}" ] ; then
       vagrantPhasesList=( ${phases} )
   fi
}

function vis_vagrantPhasesGet {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_

                         }
   lpDo  vis_vagrantPhasesSet
   for each in  ${vagrantPhasesList[@]} ; do
       echo -n "${each} "
   done
   echo
}

function netNameInfoInit {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if [ -d /tmp/netNameInfo ] ; then
        lpDo rm -r /tmp/netNameInfo
    fi
    lpDo mkdir -p /tmp/netNameInfo
}


function netNameInfoWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 2 ]]
    local key=$1
    local value=$2

    lpDo fileParamManage.py -v 30 -i fileParamWrite /tmp/netNameInfo "${key}" "${value}"
}

function netNameInfoRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Vagrant stdout -- Based on Abode and Host Network Interface put on stdout needed guest.vm.network info.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    local key=$1

    lpDo fileParamManage.py -v 30 -i fileParamRead /tmp/netNameInfo "${key}"
}


function vis_containerGenericMaterialize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local examplesOrDoIt=$1

   local genericBasesList=( $( vis_containersGenericsAssignList ) )

   local extraInfo="-h -v -n showRun"
   
   for each in ${genericBasesList[@]} ;  do
       local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName "${each}" )
       EH_assert [ ! -z "${sysCharContainerBxoId}" ]

       EH_assert vis_bxoAcctVerify "${sysCharContainerBxoId}"

       if [ "${examplesOrDoIt}" == "examples" ] ; then
           cat  << _EOF_
${G_myName} ${extraInfo} -p bpoId="${sysCharContainerBxoId}" -i vagrantFile_run
$( ${G_myName} -p bpoId="${sysCharContainerBxoId}" -i vagrantBase_last )
_EOF_
       elif [ "${examplesOrDoIt}" == "doIt" ] ; then
           bpoId="${sysCharContainerBxoId}"
           lpDo vis_vagrantFile_run
       else
           EH_problem "Bad Usage -- ${examplesOrDoIt}"
       fi
   done
   
   lpReturn
}       


function vis_vagrantBaseObtain%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Return stdout path to Vagrantfile's base directory of the bpoHome.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    lpDo FN_dirCreatePathIfNotThere ${bpoHome}/var/vagrantBase

    echo ${bpoHome}/var/vagrantBase
    
    lpReturn
}       

function vis_vagrantBaseObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Return stdout path to Vagrantfile's base directory of the bpoHome.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    local hostCntnr=$( vis_bpoIdPrep "sysChar" )    
    EH_assert [ ! -z "${bpoId}" ]

    # NOTYET 
    # EH_assert  vis_bxoHasBeenRealized "${bpoId}"
    
    hostCntnrHome=$( FN_absolutePathGet ~${hostCntnr} )

    lpDo FN_dirCreatePathIfNotThere ${hostCntnrHome}/var/vagrantBase/${bpoId}

    echo ${hostCntnrHome}/var/vagrantBase/${bpoId}
    
    lpReturn
}       

function vis_vagrantBase_last%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    local dirsPart=$( vis_vagrantBaseObtain )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    for thisDir in ${vmsDirsList} ; do
        doNothing
    done

    if [ ! -z "${thisDir}" ] ; then
        echo $(pwd)/${thisDir}
    fi
    
    lpReturn
}       

function vis_vagrantFile_vmName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local vagrantFile="$1"

    local vmNameLine=$( grep config.vm.define ${vagrantFile} )
    local vmName=$( echo ${vmNameLine} | cut -d ' ' -f 2 | xargs echo )

    local vmPrefixLine=$( grep default_prefix ${vagrantFile} )
    local vmPrefix=$( echo ${vmPrefixLine} | cut -d ' ' -f 3 | xargs echo )

    echo ${vmPrefix}${vmName}

    lpReturn
}


function vis_vagrantFile_last {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local lastBase=$(vis_vagrantBase_last)
    local lastFile="${lastBase}/Vagrantfile"

    if [ ! -e "${lastFile}" ] ; then
        EH_problem "Missing ${lastFile}"
        lpReturn
    fi
    echo ${lastFile}

    lpReturn
}



function vis_vagrantBase_last {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bpoId}" ]

    # EH_assert  vis_bxoAcctVerify "${bpoId}"

    local dirsPart=$( vis_vagrantBaseObtain )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    for thisDir in ${vmsDirsList} ; do
        doNothing
    done

    if [ ! -z "${thisDir}" ] ; then
        echo $(pwd)/${thisDir}
    fi
    
    lpReturn
}       


function vis_vagrantFile_run%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    local dirsPart=$( vis_vagrantBaseObtain )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    # echo ${vmsDirsList}
    for thisDir in ${vmsDirsList} ; do
        # echo $(pwd)/${thisDir}
        doNothing
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    lpDo cd ${thisDir}

    lpDo eval vis_vagrantFile_stdout ${nextNu} $@ \> Vagrantfile

    lpDo pwd

    lpDo vagrant up
    
    lpReturn
}       


function vis_vagrantFile_run {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on the Vagrantfile, create a VM image.
*** With arguments, the argument is passed through all the way to stdout
*** With arguments as callableNames, we can customized the vagrantFile.
*** NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bpoId}" ]

    # EH_assert  vis_bxoAcctVerify "${bpoId}"

    local dirsPart=$( vis_vagrantBaseObtain )
    EH_assert [ ! -z "${dirsPart}" ]

    local thisDir=""

    opDoExit cd ${dirsPart}
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    # echo ${vmsDirsList}
    for thisDir in ${vmsDirsList} ; do
        # echo $(pwd)/${thisDir}
        doNothing
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    lpDo cd ${thisDir}

    lpDo eval vis_vagrantFile_stdout ${nextNu} $@ \> Vagrantfile

    lpDo pwd

    lpDo vagrant up

    local vmName=$( vis_vagrantFile_vmName ${dirsPart}/${thisDir}/Vagrantfile )
    local dateTag=$( date +%Y%m%d%H%M%S )

    #lpDo echo "Add a Title here: -- (Prompts for Password)"
    lpDo virsh --connect qemu:///system desc ${vmName} --current --title "${vmName} - Imaged at ${dateTag} - " --new-desc "Description of VM comes here"

    lpDo echo To validate the materialiazation, run:
    lpDo echo bpoCntnrGuestStation.sh  -h -v -n showRun -p bpoId="${bpoId}" -i validateFacter

    lpReturn
}


function vis_vmCustomize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
- using virsh sets up guest ip addrs
- Network settings based on bxoContainer.
- bxoService preparations/settings based on svcsSpec.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    lpDo describeF
    
    lpReturn
}       


function vis_vmDeploy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Use virsh to autostart the VM.
Perhaps use related ICMs to run services.
_EOF_
                       }
    local thisDescribeF=describeF
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    lpDo echo ${thisDescribeF}
    
    lpReturn
}       

vmParamRam=2049
vmParamDisk=20GB
vmParamCpus=2    


function setVmParamsBasedOnSizing {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
From a given sysChar, based on  containerDistro and containerDistroType determine vagrantBaseBox.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead
    
    local vmSizing="${sysChar_virtSpec_sizing}"

    if [ "${vmSizing}" == "minimal" ] ; then
        vmParamRam=512
        vmParamDisk=5GB
        vmParamCpus=1    
    elif [ "${vmSizing}" == "small" ] ; then
        vmParamRam=1024
        vmParamDisk=8GB
        vmParamCpus=1    
    elif [ "${vmSizing}" == "medium" ] ; then
        vmParamRam=2048
        vmParamDisk=20GB
        vmParamCpus=2    
    elif [ "${vmSizing}" == "large" ] ; then
        vmParamRam=4096
        vmParamDisk=100GB
        vmParamCpus=2    
    elif [ "${vmSizing}" == "Large" ] ; then
        vmParamRam=4096
        vmParamDisk=100GB
        vmParamCpus=2    
    elif [ "${vmSizing}" == "huge" ] ; then
        vmParamRam=4096
        vmParamDisk=100GB
        vmParamCpus=2    
    else
        EH_problem "Unknown vmSizing=${vmSizing}"
        return 101
    fi
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

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    lpDo printf ${thisDescribeF}
    
    lpReturn
}

function vis_vagrantBaseBoxFromSysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
From a given sysChar, based on  containerDistro and containerDistroType determine vagrantBaseBox.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    if [ ! -z "${sysChar_virtSpec_vagBaseBox}" ] ; then
        lpDo echo "${sysChar_virtSpec_vagBaseBox}"
        lpReturn
    fi

    local vagrantBaseBox=$( withDistroGetVagBaseBox "${sysChar_sysInfo_distro}" "${sysChar_sysInfo_distroType}" "bxcntnr" )
    
    echo ${vagrantBaseBox}
}


# function withAbodeGetApplicableNetsList%%Obsoleted {
#     G_funcEntry
#     function describeF {  G_funcEntryShow; cat  << _EOF_
# ** Based on Abode get applicableNetsList
# _EOF_
#                      }
#     EH_assert [[ $# -eq 1 ]]

#     local abode=$1
    
#     applicableNetsList=()   # global variable

#     case "${containerAssign_abode}" in
#       "Auto")
#           applicableNetsList=("nat")
#           ;;
#       "Mobile")
#           applicableNetsList=("nat")
#           ;;
#       "Perim")
#           applicableNetsList=("perimA")
#           ;;
#       "Shield")
#           applicableNetsList=("privA")
#           ;;
#       "Internet")
#           applicableNetsList=("pubA" "pubB" "perimA")
#           ;;
#       *)
#           EH_problem "Bad Usage -- abodeInitial=${abodeInitial}"
#     esac
# }


function vis_getIpAddr_privA {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** If generic, one way, if not anotherway
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    local functionAbbrev=$(lpDo vis_containerBxoId_getFunction pmp_${containerAssign_containerId})

    if [ "${functionAbbrev}" == "G" ] ; then
        lpDo vis_assignNextAddr privA generic
    else
        lpDo echo "containerBxoId"
    fi
}


inUseEthCount=0

function vis_vagStdout_netInterfaces {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Vagrant stdout -- Based on Abode and Host Network Interface put on stdout needed guest.vm.network info.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    #lpDo vis_containerSteadyRead

    # local containerBase=$( vis_forThisSysFindContainerBase )
    # EH_assert [ ! -z "${containerBase}" ]

    lpDo vis_containerAssignRead # "${containerBase}"
    EH_assert [ ! -z "${containerAssign_containerId}" ]

    local hostContainerId="${containerAssign_containerId}"

    lpDo vis_containerAssignRead
    EH_assert [ ! -z "${containerAssign_abode}" ]

    function netInterfaceUpdate {
        EH_assert [[ $# -eq 1 ]]

        local netName="$1"
        # local ethCount="$2"

        EH_assert [ ! -z "${netName}" ]

        local hostBxoId=$( withContainerIdGetBxoId ${hostContainerId} )
        EH_assert vis_bxoAcctVerify "${hostBxoId}"

        local netIf=""
        local netIfControl=""

        function getNetIfAsArgs { netIf=$1; netIfControl=$2; }
        lpDo getNetIfAsArgs  $(vis_cntnr_netName_interfaceObtain ${netName} sysChar)
        EH_assert [ ! -z "${netIf}" ]
        
        if [ "${netName}" == "nat" ] ; then
        cat   << _EOF_
    # NAT on hostBxoId=${hostBxoId} -- No additional network interface is being configured.
_EOF_
            lpReturn
        fi

        lpDo vis_sysCharRead ${hostBxoId}
        # EH_assert [ ! -z "${sysChar_containerSpec_netIfs_${netName}}" ]

        if [ "${netIfControl}" == "enabled" ] || [ "${netIfControl}" == "guestOnly" ] ; then

            (( inUseEthCount++ ))

            # Store netName's ethNu for use in conveyInfo
            # Mystery -- vmNetIfsArray does not work??!!
            vmNetIfsArray[${netName}]=eth${inUseEthCount}
            lpDo netNameInfoWrite ${netName} eth${inUseEthCount}
            lpDo netNameInfoWrite ${netName}-host ${netIf}
            lpDo netNameInfoWrite ${netName}-control enabled
            
            cat   << _EOF_
    # ${netName} interface on hostBxoId=${hostBxoId}  eth${inUseEthCount} netIf=${netIf} netIfControl=${netIfControl}
    guest.vm.network :public_network, :dev => "${netIf}", :mode => 'bridge', auto_config: false

_EOF_
        else
            lpDo netNameInfoWrite ${netName} unUsed
            lpDo netNameInfoWrite ${netName}-host ${netIf}
            lpDo netNameInfoWrite ${netName}-control disabled
            cat   << _EOF_
    # ${netName} interface on hostBxoId=${hostBxoId}  unUsed netIf=${netIf} netIfControl=${netIfControl}

_EOF_
        fi
    }

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${containerAssign_abode}" )

     for eachNetName in ${applicableNets} ; do
        lpDo netInterfaceUpdate ${eachNetName}
    done
    
    lpReturn
}


function vis_vagStdout_netInterfacesDown {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on XX put on stdout needed provioning facilities to produce a container.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    # EH_assert vis_bxoAcctVerify "${bpoId}"


    hostCntnr=$( vis_bpoIdPrep "sysChar" )

    cat  << _OUTER_EOF_
        cat   << _EOF_
######### PHASE -1.0: Deactivate All Network Interfaces
_EOF_
_OUTER_EOF_


    function netInterfacesDown {
        EH_assert [[ $# -eq 1 ]]

        local netName="$1"

        EH_assert [ ! -z "${netName}" ]

        if [ "${netName}" == "nat" ] ; then
            cat  << _OUTER_EOF_
        echo "netName=${netName} Requires No Deactivation."
_OUTER_EOF_
            lpReturn
        fi

        local vmNetIf=$(netNameInfoRead ${netName})
        local hostNetIf=$(netNameInfoRead ${netName}-host)
        local vmNetIfControl=$(netNameInfoRead ${netName}-control)

        if [ -z "${vmNetIf}" ] || [ "${vmNetIf}" == "unUsed" ] || [ "${vmNetIf}" == "blank" ] ; then
            cat  << _OUTER_EOF_
        echo "netName=${netName} Interface Is Not In Use cfpNetIf=${vmNetIf} cfpHostNetIf=${hostNetIf}."
_OUTER_EOF_

        else
            if [ "${netName}" == "pubA" ]  || [ "${netName}" == "pubB" ] ; then

                cat  << _OUTER_EOF_
        sudo ifconfig ${vmNetIf}  down  # Shutting Down ${netName} -- Needed for deb11
_OUTER_EOF_
            fi

        fi
    }

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${containerAssign_abode}" )
    local applicableNetsLine=$(echo ${applicableNets})

    for eachNetName in ${applicableNets} ; do
        lpDo netInterfacesDown ${eachNetName}
    done

    lpReturn
}


function vis_vagStdout_bisosSetIdAndDeploy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on XX put on stdout needed provioning facilities to produce a container.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    #lpDo vis_containerAssignRead
    #lpDo vis_containerSteadyRead

    local vmNameQualifier="$1"

    lpDo vis_sysCharRead

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )

    local siteGitServerInfoBaseDir=$( bisosSiteGitServer.sh -i gitServerInfoBaseDir )

    local site_gitServerName=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName )
    local site_gitServerUrl=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerUrl )
    local site_gitServerPrivToken=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerPrivToken )

    local registrar=$( vis_registrarHostName )
    local id=$( vis_registrarUserName )
    local password=$( vis_registrarUserPassword )

    local runInfo="-h -v -n showRun"
    local binPath="/bisos/core/bsip/bin/sysCharBoxDeploy.sh"

    local bisosDevBxoId=$( usgBpos.sh -i usgBposUsageEnvs_bisosDevBxoId_read )


    #
    # No longer needed:: /bisos/core/bsip/bin/bisosSiteGitServer.sh -h -v -n showRun -p gitServerName=${site_gitServerName} -p gitServerUrl=${site_gitServerUrl} -p gitServerPrivToken=${site_gitServerPrivToken} -i gitServerInfoSet

    hostCntnr=$( vis_bpoIdPrep "sysChar" )

    cat  << _OUTER_EOF_
        cat   << _EOF_
######### PHASE 2.1: BISOS Site Setup And SysChar Container Activate And Identity Set -- With IpAddrs settings
_EOF_
        # prs_bisos is scped from ${registrar}. If that fails, we should exit all together.
        sudo -u bystar ${binPath} ${runInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -p siteBxoId="${siteBxoId}" -i bisosBasePlatform_siteSetup


        sudo -u bystar ${binPath} ${runInfo} -p bisosDevBxoId=${bisosDevBxoId} -i usgConvey_bisosDeveloper
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -i siteBasePlatform_sysBxoActivate
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpVmNameQualifier=\"${vmNameQualifier}\" -i conveyInfoStore
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpHostCntnr=\"${hostCntnr}\" -i conveyInfoStore
_OUTER_EOF_


    function conveyNetInterfacesInfo {
        EH_assert [[ $# -eq 1 ]]

        local netName="$1"

        EH_assert [ ! -z "${netName}" ]

        if [ "${netName}" == "nat" ] ; then
            cat  << _OUTER_EOF_
        echo "netName=${netName} Requires No ConveyInfo."
_OUTER_EOF_
            lpReturn
        fi

        local vmNetIf=$(netNameInfoRead ${netName})
        local hostNetIf=$(netNameInfoRead ${netName}-host)
        local vmNetIfControl=$(netNameInfoRead ${netName}-control)

        cat  << _OUTER_EOF_
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpNetIf="${vmNetIf}" -i conveyNetInfoStore ${netName}
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpNetIfControl="${vmNetIfControl}" -i conveyNetInfoStore ${netName}
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpHostNetIf="${hostNetIf}" -i conveyNetInfoStore ${netName}
_OUTER_EOF_

        cat  << _OUTER_EOF_

_OUTER_EOF_

        # IP Addrs are only converyed as over-writes or when Generic.

        if [ "${netName}" == "privA" ] ; then
            cfpNetAddr="$( vis_getIpAddr_${netName} )"
            if [ ! -z "${cfpNetAddr}" ] ; then
                cat  << _OUTER_EOF_
        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -p cfpNetAddr="${cfpNetAddr}" -i conveyNetInfoStore ${netName}
_OUTER_EOF_
            fi
        fi
    }

    local applicableNets=$( vis_withAbodeGetApplicableNetsList "${containerAssign_abode}" )
    local applicableNetsLine=$(echo ${applicableNets})

    cat  << _OUTER_EOF_
        cat   << _EOF_
######### PHASE 2.2: Convey Network Interfaces Info For: ${applicableNetsLine}
_EOF_
_OUTER_EOF_

    for eachNetName in ${applicableNets} ; do
        lpDo conveyNetInterfacesInfo ${eachNetName}
    done
    
    cat  << _OUTER_EOF_
        cat   << _EOF_
######### PHASE 2.3: Deploy The SysChar Based On Abobe Provided ConveyInfo
_EOF_

        # These should be merged with sysCharBoxDeploy.sh -- They simply setup /bisos/platform and /bisos/site
        sudo -u bisos bash -c 'PATH=$PATH:/bisos/venv/py3/bisos3/bin platformBasesUpdate.cs --bpoId=${bpoId}  -i platformBase update'
        sudo -u bisos bash -c 'PATH=$PATH:/bisos/venv/py3/bisos3/bin platformBasesUpdate.cs --bpoId=${bpoId}  -i siteBase update'

        sudo -u bystar ${binPath} ${runInfo} -p bpoId="${bpoId}" -i deployWithSysCharConveyInfo
_OUTER_EOF_
    

    lpReturn
}


function vis_vagStdout_platformBinsRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET, should use vis_cntnrAssemble_runLine
*** NOTYET, pre and post hooks
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    local bpoHome=$( FN_absolutePathGet ~${bpoId} )

    local cntnrAssemblePath="${bpoHome}/sys/bin/cntnrAssemble.sh"

    local runLine

    if [ -x "${cntnrAssemblePath}" ] ; then
        runLine="sudo -u bystar ${cntnrAssemblePath} -h -v -n showRun -i fullUpdate # Is being obsoleted by capMaterializationDispatch.cs"
    else
        runLine="echo Missing ${cntnrAssemblePath} -- Skipped -- Is being obsoleted by capMaterializationDispatch.cs"
    fi

    function platformBinsRun {
    EH_assert [[ $# -eq 0 ]]
    cat  << _OUTER_EOF_
             cat   << _EOF_
######### PHASE 3: Run Pre and platformBinsRun and Post
_EOF_
        ${runLine}

        # We don't use sudo -i or -E because the bisos account does not have a shell
        # sudo -u bystar bash -c 'PATH=$PATH:/bisos/venv/py3/bisos3/bin capMaterializationDispatch.cs -i fullCapSpecAndMatDispatch'
        sudo -u bisos bash -c 'PATH=$PATH:/bisos/venv/py3/bisos3/bin capMaterializationDispatch.cs -i fullCapSpecAndMatDispatch'
_OUTER_EOF_
    }

    platformBinsRun
    
    lpReturn
}


function vis_vagStdout_bisosProvision {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on vagrantBaseBoxFromSysChar put on stdout needed provioning facilities to produce a container.
*** If containerBaseBox is a distro/bxcntnr, doNothing -- NOTYET should update relevant git repos.
*** If containerBaseBox is a distro/mini or a distro/desktop, order provisioning steps.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    local containerBaseBox=$( vis_vagrantBaseBoxFromSysChar )

    case "${containerBaseBox}" in

        "bisos/ubuntu-20.04/bxcntnr")
            doNothing
            ;&   #fallthru
        "bisos/debian-11.pre/bxcntnr")
            doNothing
            ;&   #fallthru
        "bisos/debian-10.8/bxcntnr")
            cat  << _OUTER_EOF_
             cat   << _EOF_
######### PHASE 1: BISOS Provisioning -- baseBox=${containerBaseBox}
_EOF_
             echo "containerBaseBox=${containerBaseBox} -- Vagrant Skipped BISOS Provisioning."
_OUTER_EOF_
            ;;

        "bxDistro/ubuntu-20.04/desktop")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-11.0.0/desktop")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-10.8/desktop")
            doNothing
            ;&   #fallthru
        "bento/debian-10.8"|"bento/debian-11.pre")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-10.8/mini"|"bxDistro/debian-11.pre/mini")
            doNothing
            ;&   #fallthru
        "bento/ubuntu-20.04")
            doNothing
            ;&
        "bxDistro/ubuntu-20.04/mini")
        cat  << _OUTER_EOF_
      cat  << _EOF_
######### PHASE 1: DEBIAN-11 BISOS Provisioning -- baseBox=${containerBaseBox}
_EOF_

        sudo apt-get update
        sudo echo after release  -- apt-get -y upgrade # Prompts for keyboard selection
        sudo apt-get -y install python3-pip
        sudo pip3 install --upgrade bisos.provision  
        /usr/local/bin/provisionBisos.sh -h -v -n showRun -i sysBasePlatform
_OUTER_EOF_
            ;;

        "bxDistro/debian-12.4.0/desktop")
        cat  << _OUTER_EOF_
      cat  << _EOF_
######### PHASE 1: DEBIAN-12 BISOS Provisioning -- baseBox=${containerBaseBox}
_EOF_

        wget  https://raw.githubusercontent.com/bxGenesis/start/main/raw-bisos.sh
        chmod 775 ./raw-bisos.sh
        ./raw-bisos.sh -v -n showRun -i installUnsitedBisos
_OUTER_EOF_
            ;;

        "OLDbxDistro/debian-12.4.0/desktop")
        cat  << _OUTER_EOF_
      cat  << _EOF_
######### PHASE 1: DEBIAN-12 BISOS Provisioning -- baseBox=${containerBaseBox}
_EOF_

        sudo apt-get update
        sudo apt-get -y  install pipx
        id
        echo \$HOME
        pipx install bisos.provision
        \$HOME/.local/bin/provisionBisos.sh -h -v -n showRun -i sysBasePlatform
_OUTER_EOF_
            ;;

        * )
            EH_problem "Unsupported containerBaseBox=${containerBaseBox}"
            ;;
    esac
    lpReturn
}


function vis_vagStdout_serverToDesktop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Based on vagrantBaseBoxFromSysChar put on stdout needed instructions for creating the desktop distro
*** If containerBaseBox is a distro/bxcntnr, or distro/bxcntnr doNothing.
*** If containerBaseBox is a distro/mini order desktop installation steps -- based on distro.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    local containerBaseBox=$( vis_vagrantBaseBoxFromSysChar )
    
    case "${containerBaseBox}" in

        "bxDistro/ubuntu-20.04/desktop"|"bisos/ubuntu-20.04/bxcntnr")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-11.0.0/desktop"|"bisos/debian-11.pre/bxcntnr")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-12.4.0/desktop")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-10.8/desktop"|"bisos/debian-10.8/bxcntnr")
            cat  << _OUTER_EOF_
             cat   << _EOF_
 ######### PHASE 0: Bx Level Distro (serverToDesktop) -- baseBox=${containerBaseBox}
_EOF_
             echo "containerBaseBox=${containerBaseBox} -- Vagrant Skipped desktop addition."
_OUTER_EOF_
            ;;
        
        "bento/debian-10.8"|"bento/debian-11.pre")
            doNothing
            ;&   #fallthru
        "bxDistro/debian-10.8/mini"|"bxDistro/debian-11.pre/mini")
            # From https://linuxhint.com/install_gnome_debian_10_minimal_server/
            cat  << _OUTER_EOF_
       cat  << _EOF_
 ######### PHASE 0: Bx Level Distro (serverToDesktop) -- baseBox=${containerBaseBox}
_EOF_
            
        echo "Be Patient -- tasksel is silent and install can be loooong" 
        sudo apt-get update
        sudo apt-get -y install --reinstall debconf
        sudo apt-get -y install task-gnome-desktop
        sudo apt-get -y install task-laptop
        sudo systemctl set-default graphical.target     
_OUTER_EOF_
            ;;

        "bento/ubuntu-20.04")
            doNothing
            ;&
        "bxDistro/ubuntu-20.04/mini")
            cat  << _OUTER_EOF_
             cat  << _EOF_
 ######### PHASE 0: Bx Level Distro (serverToDesktop) -- baseBox=${containerBaseBox}
_EOF_
         
        sudo apt-get update
        sudo apt-get -y install ubuntu-desktop        
        sudo service gdm3 start
_OUTER_EOF_
            ;;
        
        * )
            EH_problem "Unsupported containerBaseBox=${containerBaseBox}"
            ;;
    esac
    lpReturn
}

function thisPlatformName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 2 ]]
    local containerId="$1"
    local vmNameQualifier="$2"
    local phaseName="BlankPhase"

    lpDo vis_vagrantPhasesSet

    if IS_inList "P3" "${vagrantPhasesList[@]}" ; then
        phaseName="P3"
    elif IS_inList "P1" "${vagrantPhasesList[@]}" ; then
        phaseName="P1"
    elif IS_inList "P0" "${vagrantPhasesList[@]}" ; then
        phaseName="P0"
    else
        phaseName="MissingPhase"
        EH_problem "Missing Phase: ${vagrantPhasesList[@]}"
    fi

    echo "${containerId}-${phaseName}-${vmNameQualifier}"
}

function vis_vagrantFile_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Output a vagrantfile using the sysChar BxO.
*** \$1 (vmNameQualifier) [Optional] could be a digit (vmNameQualifier) that identifies an instance.
*** \$2 (callable) [Optional] passed to vagrantFile_bottomPart.
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 3 ]]

    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    lpDo vis_containerAssignRead
    lpDo vis_containerSteadyRead    
    lpDo vis_sysCharRead

    local vmNameQualifier=""
    
    if [ $# -eq 0 ] ; then
        vmNameQualifier=""
    else
        vmNameQualifier="$1"
        shift
    fi

    local dateTag=$( date +%Y%m%d%H%M%S )

    #local containerBxoRef=$( fileParamManage.py -v 30 -i fileParamRead  ${bpoHome}/containerBxO/bxoRef.fps bpoId )

    local sizing=$sysChar_virtSpec_sizing

    #EH_assert  vis_bxoAcctVerify "${containerBxoRef}"

    lpDo setVmParamsBasedOnSizing # ${sizing}

    #local containerHome=$( FN_absolutePathGet ~${containerBxoRef} )

    local containerBaseBox=$( vis_vagrantBaseBoxFromSysChar )

    local containerName=$(thisPlatformName "${containerAssign_containerId}" "${vmNameQualifier}")
    # local hostname=$( echo ${containerName} | sed -e 's:_:-:g' )
    local hostname=$( echo ${containerName} | sed -e 's:_::g' )

    local defaultInterface=$( ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' )

    lpDo netNameInfoInit
    
    function topPart {
    cat  << _EOF_
# -*- mode: ruby -*-

# Vagrantfile for ${bpoId} -- 
# Generated with ${G_myName}:${thisFunc} on $(hostname) at ${dateTag} -- Do Not Hand Edit
# 
# bpoHome=${bpoHome}  -- bpoId=${bpoId}
# 

# The "2" in Vagrant.configure is for configuration version. Don't change it.
Vagrant.configure("2") do |config|
  config.vm.define "${containerName}" do |guest|
    guest.vm.box = "${containerBaseBox}"
    guest.vm.hostname = "${hostname}"
$( vis_vagStdout_netInterfaces )

    guest.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :libvirt do |libvirt|
      libvirt.driver = "kvm"
      libvirt.default_prefix = 'bxo'  # Set a prefix for the machine different from dir name.
      
      libvirt.video_type = "vga"
      libvirt.memory = ${vmParamRam}
      libvirt.cpus = ${vmParamCpus}

    end
    
    # guest.disksize.size = "${vmParamDisk}"

_EOF_
    }
    
    topPart
    vis_vagrantFile_bottomPart "${vmNameQualifier}" $@
}


function vis_vagrantFile_bottomPart%%AllPhases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Output a vagrantfile using the sysChar BxO.
*** \$1 (callable) [Optional] would produce bottom part instead of default.
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 3 ]]
    EH_assert [[ $# -gt 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    local vmNameQualifier="$1"
    shift
    
    local shellProvisioning=""

    if [ $# -eq 0 ] ; then
        shellProvisioning=baseContainer
    else
        shellProvisioning=$1
    fi

    function baseContainer {
    cat  << _OUTER_EOF_

    ## SHELL PROVISIONING
    guest.vm.provision "shell", inline: <<-_EOF_MainRootShell_
       set -x

$(vis_vagStdout_netInterfacesDown)

$(vis_vagStdout_serverToDesktop)

$(vis_vagStdout_bisosProvision)

$(vis_vagStdout_bisosSetIdAndDeploy "${vmNameQualifier}")

$(vis_vagStdout_platformBinsRun)

      cat  << _EOF_
 ######### PHASE 4: Cleanup and Shutdown  -- Running As Root
_EOF_

      shutdown now
      exit 0

_EOF_MainRootShell_
  end
end

_OUTER_EOF_
    }

    ${shellProvisioning}
}


function vis_vagrantFile_bottomPart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Output a vagrantfile using the sysChar BxO.
*** \$1 (callable) [Optional] would produce bottom part instead of default.
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 3 ]]
    EH_assert [[ $# -gt 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    lpDo vis_vagrantPhasesSet

    local vmNameQualifier="$1"
    shift

    local shellProvisioning=""

    if [ $# -eq 0 ] ; then
        shellProvisioning=baseContainer
    else
        shellProvisioning=$1
    fi

    function baseContainer {
        cat  << _OUTER_EOF_

    ## SHELL PROVISIONING
    guest.vm.provision "shell", inline: <<-_EOF_MainRootShell_
       set -x
_OUTER_EOF_


        vis_vagStdout_netInterfacesDown

        if IS_inList "P0" "${vagrantPhasesList[@]}" ; then
            lpDo vis_vagStdout_serverToDesktop
        else
            lpDo echo "##### P0 Skipped"
        fi

        if IS_inList "P1" "${vagrantPhasesList[@]}" ; then
            lpDo vis_vagStdout_bisosProvision
        else
            lpDo echo "##### P1 Skipped"
        fi

        if IS_inList "P2" "${vagrantPhasesList[@]}" ; then
            lpDo vis_vagStdout_bisosSetIdAndDeploy "${vmNameQualifier}"
        else
            lpDo echo "##### P2 Skipped"
        fi

        if IS_inList "P3" "${vagrantPhasesList[@]}" ; then
            lpDo vis_vagStdout_platformBinsRun
        else
            lpDo echo "##### P3 Skipped"
        fi

        cat  << _OUTER_EOF_
      cat  << _EOF_
 ######### PHASE 4: Cleanup and Shutdown  -- Running As Root
_EOF_

      tail -20 /etc/passwd
      ls -ld /bisos/platform /bisos/site

      shutdown now
      exit 0

_EOF_MainRootShell_
  end
end

_OUTER_EOF_
    }

    ${shellProvisioning}
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
