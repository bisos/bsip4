#!/bin/bash

IcmBriefDescription="Qemu-KVM (libvirt -- virsh) Management Facilities"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaVirshManage.sh,v 1.6 2017-02-22 00:55:30 lsipusr Exp $"
# *CopyLeft*
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
*  /This File/ :: /bisos/bsip/bin/lcaVirshManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/fullUsagePanel-en.org::Xref-][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
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


# PRE parameters

baseDir=""

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    typeset currentVmName="ub-1604-bx2-bxInstaller-"$( ${G_myName}  -i getCurNuForVmTemplate ub-1604-bx2-bxInstaller-)

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "GUI Interfaces" )
virt-manager  # Gui Interface for managing VMs
virt-viewer   # Connect to desktop of running VM with VNC
$( examplesSeperatorChapter "List/Start/Stop/Manage Existing VMs" )
sudo ls -l /var/lib/libvirt/images
virsh list --all  # List Existing/Known VMs
virsh --connect qemu:///system list --all
virsh -c qemu+ssh://lsipusr@192.168.0.194/system list --all
$( examplesSeperatorChapter "KVM Clone VMs" )
$( examplesSeperatorSection "Clone An Existing VM" )
virt-clone --connect=qemu:///system --original bx-dist1604 --name bx1-generic --auto-clone
virt-clone --connect=qemu://example.com/system -o this-vm -n that-vm --auto-clone
virt-clone --original demo --name newdemo --file /var/lib/xen/images/newdemo.img'
virsh dumpxml VMNAME > domxml.xml
${G_myName} ${extraInfo} -i bxClone ub-1604-bx2-bxInstaller-6
$( examplesSeperatorChapter "KVM Import And Export" )
$( examplesSeperatorSection "Export An Existing VM" )
${G_myName} ${extraInfo} -i exportVmTo virgin-ub-1604 /uniform/VMs/Public/bx/1/kvm/
$( examplesSeperatorSection "Import A VM Image" )
${G_myName} ${extraInfo} -i importVmFrom /uniform/VMs/Public/bx/1/kvm/ virgin-ub-1604 
$( examplesSeperatorChapter "Virt-Install -- Create New VMs From Scratch" )
bxBootstrap.sh ${extraInfo} -i virtBuild next distro medium ubuntu 1604 bx2
bxBootstrap.sh ${extraInfo} -i virtBuild next distro medium debian 8 bx2
bxBootstrap.sh ${extraInfo} -i virtBuild next bxInstaller small ubuntu 1604 bx2
bxBootstrap.sh ${extraInfo} -i virtBuild next bxContainer small ubuntu 1604 bx2
$( examplesSeperatorChapter "Delete VMs" )
${G_myName} ${extraInfo} -i vmDelete vmName
${G_myName} ${extraInfo} -i vmDelete ub1604preseed4
$( examplesSeperatorChapter "Get Current Number Based On VM Template" )
${G_myName} ${extraInfo} -i getNextNuForVmBuild ub-1604-bx2-distro-
${G_myName} ${extraInfo} -i getNextNuForVmBuild ub-1604-bx2-bxInstaller-
${G_myName} ${extraInfo} -i getCurNuForVmTemplate ub-1604-bx2-distro-
${G_myName} ${extraInfo} -i getCurNuForVmTemplate ub-1604-bx2-bxInstaller-
$( examplesSeperatorChapter "Start And Connect To VMs" )
${G_myName} ${extraInfo} -i virtStartConnect ub-1604-bx2-bxInstaller-13
${G_myName} ${extraInfo} -i virtStartConnect ${currentVmName}
$( examplesSeperatorChapter "Development And Experimentation" )
${G_myName} ${extraInfo} -i examplesPlus
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examplesPlus    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examplesPlus {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    typeset currentVmName="ub-1604-bx2-bxInstaller-"$( ${G_myName}  -i getCurNuForVmTemplate ub-1604-bx2-bxInstaller-)

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
dmseg | grep kvm   # Verify that virtualization has not been disabled in the bios
--- Qemu-KVM  Additional Tools ---
--- Virtual Machine Networks NOTYET
--- Passthrough Mode -- 172. NOTYET
--- Local Network -- 172 NOTYET
sudo killall -HUP vmnet-dhcpd NOTYET
$( examplesSeperatorChapter "GUI Interfaces" )
virt-manager  # Gui Interface for managing VMs
virt-viewer   # Connect to desktop of running VM with VNC
$( examplesSeperatorChapter "List/Start/Stop/Manage Existing VMs" )
$( examplesSeperatorSection "List / Locate" )
sudo ls -l /var/lib/libvirt/images
virsh list  # List Running  VMs
virsh -c qemu+ssh://lsipusr@192.168.0.194/system list
-----
virsh list --all  # List Existing/Known VMs
virsh --connect qemu:///system list --all
virsh -c qemu+ssh://lsipusr@192.168.0.194/system list --all
$( examplesSeperatorChapter "KVM Clone VMs" )
$( examplesSeperatorSection "Clone An Existing VM" )
virt-clone --connect=qemu:///system --original bx-dist1604 --name bx1-generic --auto-clone
virt-clone --connect=qemu://example.com/system -o this-vm -n that-vm --auto-clone
virt-clone --original demo --name newdemo --file /var/lib/xen/images/newdemo.img'
virsh dumpxml VMNAME > domxml.xml
$( examplesSeperatorChapter "KVM Import And Export" )
$( examplesSeperatorSection "Export An Existing VM" )
${G_myName} ${extraInfo} -i exportVmTo virgin-ub-1604 /uniform/VMs/Public/bx/1/kvm/
$( examplesSeperatorSection "Import A VM Image" )
${G_myName} ${extraInfo} -i importVmFrom /uniform/VMs/Public/bx/1/kvm/ virgin-ub-1604 
$( examplesSeperatorSection "KVM Cluster (NFS/Samba) and Web OVF Imports" )
ovftool ovf-input vmx-output
ovftool --lax /uniform/VMs/ClusterConfidential/bx1/ubuntu/1404/ovf/vm-ubuntu-1404-bx1-bisp
${G_myName} ${extraInfo} -i vmwareOvfClusterImport /uniform/VMs/ClusterConfidential/bx1/ubuntu/1404/ovf/vm-cur-bx1-bisp15-mb/vm-cur-bx1-bisp15-mb.ovf ~/vmware
$( examplesSeperatorSection "VmWare Cluster (NFS/Samba) and Web OVF Exports" )
ovftool ~/vmware/vm-ubuntu-1404-bx1-bisp15-tson/Ubuntu1404.vmx ~/vmware/ovf-${dateTag}
ovftool --lax ~/vmware/vm-ubuntu-1404-bx1-bisp15-tson-mb/Ubuntu1404.vmx /uniform/VMs/ClusterConfidential/bx1/ubuntu/1404/ovf
${G_myName} ${extraInfo} -i vmwareOvfClusterExport ~/vmware/vm-cur-bx1-bisp15-mb/vm-cur-bx1-bisp15-mb.vmx /uniform/VMs/ClusterConfidential/bx1/ubuntu/1404/ovf
$( examplesSeperatorChapter "Virt-Install -- Create New VMs From Scratch" )
${G_myName} ${extraInfo} -i virtBuild next distro medium ubuntu 1604 bx2
${G_myName} ${extraInfo} -i virtBuild next distro medium debian 8 bx2
${G_myName} ${extraInfo} -i virtBuild next bxInstaller small ubuntu 1604 bx2
${G_myName} ${extraInfo} -i virtBuild next bxContainer small ubuntu 1604 bx2
$( examplesSeperatorChapter "Virt-Install -- Create New VMs From Scratch" )
${G_myName} ${extraInfo} -i vmDelete vmName
${G_myName} ${extraInfo} -i vmDelete ub1604preseed4
${G_myName} ${extraInfo} -i getNextNuForVmBuild ub-1604-bx2-distro-
${G_myName} ${extraInfo} -i getNextNuForVmBuild ub-1604-bx2-bxInstaller-
${G_myName} ${extraInfo} -i getCurNuForVmTemplate ub-1604-bx2-distro-
${G_myName} ${extraInfo} -i getCurNuForVmTemplate ub-1604-bx2-bxInstaller-
$( examplesSeperatorChapter "Virt-Install -- Create New VMs From Scratch" )
${G_myName} ${extraInfo} -i virtStartConnect ub-1604-bx2-bxInstaller-13
${G_myName} ${extraInfo} -i virtStartConnect ${currentVmName}
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_vmInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_vmInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset vmHost=$1
    shift
    typeset vmName
    typeset vmHostUri="qemu+ssh://${vmHost}/system"

    for vmName in $@ ; do
	
	echo "======= ${G_myName} vmInfo ============"
	echo "vmHost: ${vmHost}"
	echo "vmTitle: $(virsh --connect ${vmHostUri} desc ${vmName} --title)"
	echo "=============virsh dominfo ============"	
	opDo virsh --connect ${vmHostUri} dominfo ${vmName}
	echo "======================================="
    done
    
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_vmInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_guestsInfoAtHosts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset vmDefinedNames
    typeset vmHostUri
    
    for kvmHost in $@ ; do
	vmHostUri="qemu+ssh://${kvmHost}/system"	
	vmDefinedNames=$( virsh --connect ${vmHostUri} list --all --name )	
	opDo vis_vmInfo ${kvmHost} ${vmDefinedNames}
    done
    
    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_vmDelete  <vmName>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_vmDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset vmHost=$1
    shift
    typeset vmName
    typeset vmHostUri="qemu+ssh://${vmHost}/system"

    for vmName in $@ ; do    

	typeset vmDefinedNames=$( virsh --connect ${vmHostUri} list --all --name )

	if LIST_isIn ${vmName} "${vmDefinedNames}" ; then
	    opDo virsh --connect ${vmHostUri} destroy ${vmName}
	    opDo virsh --connect ${vmHostUri} undefine ${vmName}
	else
	    EH_problem "${vmName} is not defined, undefine skipped"
	fi

	if [ "${vmHost}" != "localhost" ] ; then
	    EH_problem "Not on localhost -- Image deletion skipped"
	else
	    typeset vmDisksList=$( sudo ls  /var/lib/libvirt/images )
	    
	    if LIST_isIn ${vmName}.qcow2 "${vmDisksList}" ; then
		opDo sudo /bin/rm /var/lib/libvirt/images/${vmName}.qcow2
	    else
		EH_problem "${vmName} image does not exist, deletion skipped"
	    fi
	fi
    done
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_getNextNuForVmBuild  <vmNameTemplate>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getNextNuForVmBuild {
  EH_assert [[ $# -eq 1 ]]
  nameTemplate=${1}

  lastUsedNu=$( vis_getCurNuForVmTemplate ${nameTemplate} )

  if [ ${lastUsedNu} -eq "-1" ] ; then
      echo "0"
  else
      integer nextNu=$( expr ${lastUsedNu} + 1 )
      echo ${nextNu}
  fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_getCurNuForVmTemplate   <vmNameTemplate>  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getCurNuForVmTemplate {
  EH_assert [[ $# -eq 1 ]]
  nameTemplate=${1}

  typeset vmDefinedNames=$( virsh --connect qemu:///system list --all --name |  grep ${nameTemplate} )  

  if [ -z "${vmDefinedNames}" ] ; then
      ANT_cooked "Missing VM Images -- Assuming -1"
      echo "-1"
      return
  fi

  lastUsedNu=0
  for thisName in ${vmDefinedNames}; do
      thisUsedNu=${thisName#${nameTemplate}}
      if [ ${thisUsedNu} -ge ${lastUsedNu} ] ; then
	  lastUsedNu=${thisUsedNu}
      fi
  done
  echo ${lastUsedNu}
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_virtBuild (bxBootstrap.sh -i virtBuild)  <vmName> <buildState> <vmProfile> <distroName> <distroGen> <bxGeneration>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_virtBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
See bxBootstrap.sh -i virtBuild
_EOF_
    }
    
    describeF
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_virtStartConnect   <vmName>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_virtStartConnect {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add -p location={bx,std} After apt-mirror has been setup
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset vmHost=$1
    typeset vmName=$2    

    opDo virsh --connect qemu+ssh://lsipusr@${vmHost}/system start ${vmName}
    
    opDo virt-viewer --connect qemu+ssh://lsipusr@${vmHost}/system  ${vmName} &
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_exportVmTo  <vmName> <destBasePath>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_exportVmTo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset vmName=$1    
    typeset destBasePath=$2

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
       
    # NOTYET, verify that vmName and destBasePath exist

    typeset vmNameExp="${vmName}-exp"

    typeset vmDefinedNames=$( virsh --connect qemu:///system list --all --name )

    if LIST_isIn ${vmNameExp} "${vmDefinedNames}" ; then
	#opDo virsh destroy ${vmNameExp}
	opDo virsh undefine ${vmNameExp}
    fi

    if [ -f ${destBasePath}/${vmNameExp}.qcow2 ] ; then
	# NOTYET, subject it to forceMode
	opDo /bin/rm ${destBasePath}/${vmNameExp}.qcow2
    fi

    opDo virt-clone --original ${vmName} --name ${vmNameExp} --file ${destBasePath}/${vmNameExp}.qcow2

    # Needed for NFS access
    opDo chmod 644 ${destBasePath}/${vmNameExp}.qcow2
    
    opDo virsh dumpxml ${vmName} > ${destBasePath}/${vmNameExp}.xml
    
    #opDo fileParamManage.py -i fileParamWrite ${destBasePath} vmName "${vmName}"

    if LIST_isIn ${vmNameExp} "${vmDefinedNames}" ; then
	#opDo virsh destroy ${vmNameExp}
	opDo virsh undefine ${vmNameExp}
    fi

    opDo ls -ldt  ${destBasePath}/*

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_listGuests <vmHost1> <vmHostN>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_listGuests {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    for thisHost in $@; do    
	opDo virsh --connect qemu+ssh://lsipusr@${thisHost}/system list --all --title
    done
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxClone    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bxClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset vmName=$1    

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
       
    # NOTYET, verify that vmName and destBasePath exist

    typeset vmNameClone="cloneOf-${vmName}"

    typeset vmDefinedNames=$( virsh --connect qemu:///system list --all --name )

    if LIST_isIn ${vmNameClone} "${vmDefinedNames}" ; then
	#opDo virsh destroy ${vmNameClone}
	opDo virsh undefine ${vmNameClone}
    fi

    opDo virt-clone --original ${vmName} --name ${vmNameClone} --auto-clone

    virsh --connect qemu:///system list --all --title    

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_importVmFrom  <sourceBasePath>   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_importVmFrom {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset sourceBasePath=$1
    typeset vmName=$2    

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
       
    # NOTYET, verify that vmName and destBasePath exist

    typeset vmNameExp="${vmName}-exp"
    

    #on the destination host run virsh define domxml.xml

    #start thew VM.

    #If the disk location differs, you need to edit the xml's devices/disk node to point to the image on the destination host
    #If the VM is attached to custom defined networks, you'll need to either edit them out of the xml on the destination host
    # or redefine them as well (virsh net-dumpxml > netxml.xml and the virsh net-define netxml.xml && virsh net-start NETNAME & virsh net-autostart NETNAME)
    

    typeset vmDefinedNames=$( virsh --connect qemu:///system list --all --name )

    if LIST_isIn ${vmName} "${vmDefinedNames}" ; then
	EH_problem "${vmName} Already Exists"
	echo "virsh undefine ${vmName}"
	lpReturn
    fi

    if [ ! -f ${sourceBasePath}/${vmNameExp}.qcow2 ] ; then
	EH_problem "${sourceBasePath}/${vmNameExp}.qcow2 is Missing"
	lpReturn
    fi

    id

    opDo sudo cp ${sourceBasePath}/${vmNameExp}.qcow2 /var/lib/libvirt/images/${vmName}.qcow2
    # dd if=xx | pv -s | dd of=yy

    opDo virsh define ${sourceBasePath}/${vmNameExp}.xml
    
    #opDo fileParamManage.py -i fileParamWrite ${destBasePath} vmName "${vmName}"

    vmDefinedNames=$( virsh --connect qemu:///system list --all --name )    

    if LIST_isIn ${vmName} "${vmDefinedNames}" ; then
	ANT_raw "${vmName} Is Ready"
    else
	EH_problem "Missing ${vmName}"
    fi

    opDo ls -ldt  /var/lib/libvirt/images/${vmName}.qcow2

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_wgetThenImport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_wgetThenImport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset -A uriParsed=$( uriParseStdout.py $1 )

    typeset thisFileName=$( FN_nonDirsPart "${uriParsed[path]}" )
    typeset receivedFile=/tmp/"${thisFileName}"

    opDo wget http://www.bybinary.org/public/bavm/ubuntu1204/ubuntu1204-bx1-bacs0-example.ova --output-document=${receivedFile}

    opDo vis_import ${receivedFile}

    lpReturn
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
