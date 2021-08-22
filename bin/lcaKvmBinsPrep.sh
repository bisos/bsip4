#!/bin/bash

IcmBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
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


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaKvmBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
Xref-Here-
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/fullUsagePanel-en.org::Xref-][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Components List
_CommentEnd_

#apt-cache search something | egrep '^something'
#sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=(
        linux_kvm
        #qemu_system
        #qemu_kvm
        libvirt_bin
        ubuntu_vm_builder
        bridge_utils
        virt_manager
        libguestfs_tools
        kvmExtraSetups
    )
}

function pkgsList_DEBIAN_11 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #qemu-system libvirt-clients libvirt-daemon-system
    
    itemOrderedList=(
        qemu_kvm
        "$( itemNameFor libvirt-daemon-system )"
        "$( itemNameFor libvirt-clients )"
        "$( itemNameFor bridge-utils )"
        virt_manager
        libguestfs_tools
        kvmExtraSetups
    )
}


function pkgsList_UBUNTU_2004 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=(
        qemu_kvm
        "$( itemNameFor libvirt-daemon-system )"
        "$( itemNameFor libvirt-clients )"
        "$( itemNameFor bridge-utils )"
        virt_manager
        libguestfs_tools
        kvmExtraSetups
    )
}


function pkgsList_UBUNTU_1804 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=(
        qemu_kvm
        libvirt_bin
        ubuntu_vm_builder
        bridge_utils
        virt_manager
        libguestfs_tools
        kvmExtraSetups
    )
}

function pkgsList_UBUNTU_1604 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=(
        kvm
        #qemu_system
        #qemu_kvm
        libvirt_bin
        ubuntu_vm_builder
        bridge_utils
        virt_manager
        libguestfs_tools
        kvmExtraSetups
    )
}


distFamilyGenerationHookRun pkgsList



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
dmesg | grep kvm   # Verify that virtualization has not been disabled in the bios
kvm-ok
${G_myName} -v -n showRun -i addKvmGroups
${G_myName} -v -n showRun -i fullUpdatePlus
_EOF_
}


item_kvmExtraSetups () {
  distFamilyGenerationHookRun binsPrep_kvmExtraSetups
}

binsPrep_kvmExtraSetups_DEFAULT_DEFAULT () {
    mmaThisPkgName="kvmExtraSetups"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_addKvmGroups
    }
}

function vis_addKvmGroups {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local libvirtGroupName="libvirt"

    if [ "${opRunDistFamily}" == "UBUNTU" ] ; then
        if [ "${opRunDistGeneration}" == "1604" ] ; then
            libvirtGroupName="libvirtd"
        fi
    fi

    local effectiveCurUser=$( id -un )

    #ANT_raw "Maybe This Is Broken, because libvirtd does not exist at that time"
    opDo sudo adduser ${effectiveCurUser} ${libvirtGroupName}

    # This needs to be revisited.
    # initialInvokerUser=$( id -un )
    # InitialInvokerUser should be passed as part of re-run as root.
    opDo sudo adduser bystar ${libvirtGroupName}
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== fullUpdatePlus
_CommentEnd_

function vis_fullUpdatePlus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_fullUpdate

    lpDo vis_addKvmGroups
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== x64P
_CommentEnd_

function vis_x64P {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

}


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "linux-kvm"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: linux-kvm [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_linux_kvm () { distFamilyGenerationHookRun binsPrep_linux_kvm; }

binsPrep_linux_kvm_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "linux-kvm"; }

####+END:


####+BEGINNOT: bx:dblock:lsip:binsprep:apt :module "kvm"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: kvm  (Changed to linux-kvm)  [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_kvm () { distFamilyGenerationHookRun binsPrep_kvm; }

binsPrep_kvm_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "kvm"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "qemu-kvm"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: qemu-kvm [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_qemu_kvm () { distFamilyGenerationHookRun binsPrep_qemu_kvm; }

binsPrep_qemu_kvm_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "qemu-kvm"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libvirt-bin"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: libvirt-bin [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libvirt_bin () { distFamilyGenerationHookRun binsPrep_libvirt_bin; }

binsPrep_libvirt_bin_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libvirt-bin"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "ubuntu-vm-builder"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: ubuntu-vm-builder [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ubuntu_vm_builder () { distFamilyGenerationHookRun binsPrep_ubuntu_vm_builder; }

binsPrep_ubuntu_vm_builder_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "ubuntu-vm-builder"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "bridge-utils"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: bridge-utils [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_bridge_utils () { distFamilyGenerationHookRun binsPrep_bridge_utils; }

binsPrep_bridge_utils_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "bridge-utils"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "virt-manager"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: virt-manager [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_virt_manager () { distFamilyGenerationHookRun binsPrep_virt_manager; }

binsPrep_virt_manager_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "virt-manager"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libguestfs-tools"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: libguestfs-tools [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libguestfs_tools () { distFamilyGenerationHookRun binsPrep_libguestfs_tools; }

binsPrep_libguestfs_tools_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libguestfs-tools"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libvirt-daemon-system"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libvirt-daemon-system [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libvirt_daemon_system () { distFamilyGenerationHookRun binsPrep_libvirt_daemon_system; }

binsPrep_libvirt_daemon_system_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libvirt-daemon-system"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libvirt-clients"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libvirt-clients [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libvirt_clients () { distFamilyGenerationHookRun binsPrep_libvirt_clients; }

binsPrep_libvirt_clients_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libvirt-clients"; }

####+END:




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

