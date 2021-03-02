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

. ${opBinBase}/bxo_lib.sh

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

    #oneBxoId="prs-bisos"
    #oneBxoId="${currentBxoId}"
    oneBxoId="pic_dnsServer"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "Specialized Actions" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_path      # on host
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_create    # on host - vag-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_create testNetSet   # on host - vag-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_run       # on host - ends with image
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_run testNetSet      # on host - ends with image
$( examplesSeperatorChapter "Vagrantfile Stdout and Creation " )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_bottomPart
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_bottomPart testNetSet
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_stdout    # on host
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vagrantFile_stdout testNetSet
$( examplesSeperatorChapter "Post Vagrant Virsh Activities" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vmCustomize           # using virsh sets up guest ip addrs
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i vmRun                 # on host
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i recordDeployment      # inside of parent bxo
_EOF_
}


function vis_vagrantFile_path {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
stdout path to Vagrantfile's base directory of the bxoHome.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    lpDo FN_dirCreatePathIfNotThere ${bxoHome}/var/vagrantBase

    opDoRet touch ${bxoHome}/var/vagrantBase/Vagrantfile

    echo ${bxoHome}/var/vagrantBase/Vagrantfile
    
    lpReturn
}	


function vis_vagrantFile_create%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Look in ~bxoId for sysSpec info (distro+ram+disk). 
Based on that get the appropriate Vagrantfile.
Genesis target being container.
Network being NAT. 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    echo OBSOLETED

    lpReturn

    EH_assert  vis_userAcctExists "${bxoId}"

    local virtType=$( fileParamManage.py  -i fileParamRead  ${bxoHome}/sysSpec/virtualization.fps virtType )
    local baseBoxVagrantFile=""    

    function baseBoxVagrantFileObtain {
	G_funcEntry
	function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET	
_EOF_
			   }
	
	local baseBox=$( fileParamManage.py  -i fileParamRead  ${bxoHome}/sysSpec/vmSpec.fps baseBox )
	local baseBoxTarget="NOTYET"

	if [ "${baseBox}" == "medium" ] ; then
	    baseBoxVagrantFile="~aip_vagrantBaseBoxes/vagrants/ubuntu/20.04/server/medium-nat/bxBase/kvm/1/Vagrantfile"
	elif [ "${baseBox}" == "large" ] ; then
	    baseBoxVagrantFile="NOTYET"
	else
	    EH_problem ""
	fi
	echo ${baseBoxVagrantFile}
    }

    if [ "${virtType}" == "default" ] ; then
	baseBoxVagrantFile=$(baseBoxVagrantFileObtain)

    elif [ "${virtType}" == "none" ] ; then
	opDoNothing
	lpReturn
    else
	EH_problem ""
	lpReturn
    fi

    if [ ! -z "${baseBoxVagrantFile}" ] ; then
	lpDo echo cp ${baseBoxVagrantFile} $(vis_vagrantFile_path)
    else
	EH_problem ""
    fi
					      
    lpReturn
}	



function vis_vagrantFile_create {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Look in ~bxoId for sysSpec info (distro+ram+disk). 
Based on that get the appropriate Vagrantfile.
Genesis target being container.
Network being NAT. 
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local virtType=$( fileParamManage.py  -i fileParamRead  ${bxoHome}/sysSpec/virtualization.fps virtType )

    if [ "${virtType}" == "none" ] ; then
	lpReturn
    fi

    local vagrantFile_path=$(vis_vagrantFile_path)

    lpDo eval vis_vagrantFile_stdout $@ \> ${vagrantFile_path}

    lpDo ls -l ${vagrantFile_path}
					      
    lpReturn
}	


function vis_vagrantFile_run {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local dirsPart=$( FN_dirsPart $(vis_vagrantFile_path) )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort )

    echo ${vmsDirsList}
    for thisDir in ${vmsDirsList} ; do
	echo $(pwd)/${thisDir}
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    lpDo cd ${thisDir}

    lpDo eval vis_vagrantFile_stdout $@ \> Vagrantfile

    lpDo pwd

    lpDo vagrant up
    
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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    lpDo echo ${thisDescribeF}
    
    lpReturn
}	

vmParamRam=2049
vmParamDisk=20GB
vmParamCpus=2    


function setVmParamsBasedOnSizing {
    EH_assert [[ $# -eq 1 ]]
    local vmSizing=$1

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
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    lpDo printf ${thisDescribeF}
    
    lpReturn
}	

function vis_vagrantFile_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Output a vagrantfile using the sysChar BxO.
_EOF_
		       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local dateTag=$( date +%Y%m%d%H%M%S )

    local containerBxoRef=$( fileParamManage.py -v 30 -i fileParamRead  ${bxoHome}/containerBxO/bxoRef.fps bxoId )

    local baseBox=$( fileParamManage.py -v 30 -i fileParamRead  ${bxoHome}/sysSpec/vmSpec.fps baseBox )
    local sizing=$( fileParamManage.py -v 30 -i fileParamRead  ${bxoHome}/sysSpec/vmSpec.fps sizing )        

    EH_assert  vis_userAcctExists "${containerBxoRef}"

    lpDo setVmParamsBasedOnSizing ${sizing}

    local containerHome=$( FN_absolutePathGet ~${containerBxoRef} )

    local containerName=$( fileParamManage.py -v 30 -i fileParamRead  ${containerHome}/containerSpec/hostname.fps name )

    local defaultInterface=$( ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' )

    function topPart {
    cat  << _EOF_
# -*- mode: ruby -*-

# Vagrantfile for ${bxoId} -- 
# Generated with ${G_myName}:${thisFunc} on $(hostname) at ${dateTag} -- Do Not Hand Edit
# 
# ${bxoHome}/containerBxO/bxoRef.fps/bxoId = ${containerBxoRef}
# ${bxoHome}/sysSpec/vmSpec.fps/baseBox/value = ${baseBox}
# ${bxoHome}/sysSpec/vmSpec.fps/sizing/value = ${sizing}
# ${containerHome}/containerSpec/hostname.fps/name = ${containerName}
# 

# The "2" in Vagrant.configure is for configuration version. Don't change it.
Vagrant.configure("2") do |config|
  config.vm.define "${containerBxoRef}" do |guest|
    guest.vm.box = "${baseBox}"
    guest.vm.hostname = "${containerName}"
    guest.vm.network :public_network, :dev => "${defaultInterface}", :mode => 'bridge', auto_config: false

    config.vm.provider :libvirt do |libvirt|
      libvirt.driver = "kvm"
      libvirt.default_prefix = 'bxo'  # Set a prefix for the machine different from dir name.

      libvirt.memory = ${vmParamRam}
      libvirt.cpus = ${vmParamCpus}

    end
    
    guest.disksize.size = "${vmParamDisk}"

_EOF_
    }
    
    topPart
    vis_vagrantFile_bottomPart $@
}


function vis_vagrantFile_bottomPart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Output a vagrantfile using the sysChar BxO.
_EOF_
		       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

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
      cat  << _EOF_
 ######### PHASE 0: Bx Level Distro (serverToDesktop)
_EOF_
        set -x

        sudo apt-get update
        sudo apt-get -y install ubuntu-desktop        
        sudo service gdm3 start

      cat  << _EOF_
 ######### PAHSE 1: Updating And Installing Distro Pkgs 
_EOF_

        sudo apt-get -y install python3-pip
        sudo pip3 install --upgrade bisos.provision  
        /usr/local/bin/provisionBisos.sh -h -v -n showRun -i sysBasePlatform

      cat  << _EOF_
 ######### PHASE 2: Cleanup and Shutdown  -- Running As Root
_EOF_
      
      shutdown now
      exit 0

_EOF_MainRootShell_
  end
end

_OUTER_EOF_
    }

    function testNetSet {
    cat  << _OUTER_EOF_

    ## SHELL PROVISIONING
    guest.vm.provision "shell", inline: <<-_EOF_MainRootShell_
      cat  << _EOF_
 ######### PHASE 0: Bx Level Distro (serverToDesktop)
_EOF_
        set -x

        sudo apt-get update

        sudo apt-get -y install net-tools
        sudo ifconfig eth1 192.168.0.217 netmask 255.255.255.0 up
        sudo route add default gw 192.168.0.220       
    
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
