#!/bin/bash

IimBriefDescription="With Vagrant's Packer build a box from scratch."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaVagrantBoxBuild.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos-core/virtualization/vagrant/lcaVagrantBoxBuild.sh/fullUsagePanel-en.org][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
* All relevant documentation is in the panel.
*
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


. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Bento Boxes" )
${G_myName} ${extraInfo} -i bento_fullUpdate
$( examplesSeperatorSection "Debian and Ubuntu Bento Boxes" )
${G_myName} ${extraInfo} -i bento_boxesPrep
${G_myName} ${extraInfo} -i bento_deb10_build
${G_myName} ${extraInfo} -i bento_deb11_build
${G_myName} ${extraInfo} -i bento_ub2004_build
$( examplesSeperatorChapter "ByStar Vagrant Distro Base Boxes" )
${G_myName} -i bisos_packerBoxesBasePath
${G_myName} ${extraInfo} -i bvdbb_fullUpdate
$( examplesSeperatorSection "Debian and Ubuntu ByStar Vagrant Distro Base Boxes" )
${G_myName} ${extraInfo} -i bvdbb_boxesPrep
${G_myName} ${extraInfo} -i bvdbb_deb10_serverBuild
${G_myName} ${extraInfo} -i bvdbb_deb10_desktopBuild
${G_myName} ${extraInfo} -i bvdbb_deb11_serverBuild
${G_myName} ${extraInfo} -i bvdbb_deb11_desktopBuild
${G_myName} ${extraInfo} -i bvdbb_deb12_desktopBuild
${G_myName} ${extraInfo} -i bvdbb_deb13_desktopBuild
${G_myName} ${extraInfo} -i bvdbb_ub2004_serverBuild
${G_myName} ${extraInfo} -i bvdbb_ub2004_desktopBuild
$( examplesSeperatorChapter "BISOS Vagrant Base Boxes" )
${G_myName} ${extraInfo} -i bisos_fullUpdate
$( examplesSeperatorSection "Debian and Ubuntu BISOS Container Vagrant  Base Boxes" )
${G_myName} ${extraInfo} -i bisos_boxesPrep
${G_myName} ${extraInfo} -i bisos_deb10_build
${G_myName} ${extraInfo} -i bisos_deb11_build
${G_myName} ${extraInfo} -i bisos_ub2004_build
# Cleanup find /bxo/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes -type d -print | grep packer_cache | grep -v '/port' | xargs rm -r
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bisosVarVagrant {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    mkdir -p /bisos/var/vagrant
    echo "/bisos/var/vagrant"
    lpReturn
}

function vis_bisosVarVagrantBuilds {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    mkdir -p /bisos/var/vagrant/builds
    echo "/bisos/var/vagrant/builds"
    lpReturn
}

function vis_bento_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bento_boxesPrep

    lpDo vis_bento_deb10_build
    lpDo vis_bento_deb11_build    
    lpDo vis_bento_ub2004_build
    
    lpReturn
}



function vis_bento_boxesPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo mkdir /bisos/var/vagrant

    inBaseDirDo /bisos/var/vagrant git clone https://github.com/chef/bento

    lpReturn
}

function vis_bento_deb10_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo /bisos/var/vagrant/bento/packer_templates/debian packer build -only qemu -var "headless=true" debian-10.8-amd64.json

    lpDo vagrant box add /bisos/var/vagrant/bento/builds/debian-10.8.libvirt.box --name "bento/debian-10.8"

    lpReturn
}


function vis_bento_deb11_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # /bisos/var/vagrant/bento/packer_templates/debian/debian-11.pre-amd64.json
    inBaseDirDo /bisos/var/vagrant/bento/packer_templates/debian packer build -only qemu -var "headless=true" debian-11.pre-amd64.json

    lpDo vagrant box add /bisos/var/vagrant/bento/builds/debian-11.pre.libvirt.box --name "bento/debian-11.pre"

    lpReturn
}


function vis_bento_ub2004_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo /bisos/var/vagrant/bento/packer_templates/ubuntu packer build -only qemu -var "headless=true" ubuntu-20.04-amd64.json

    lpDo vagrant box add /bisos/var/vagrant/bento/builds/ubuntu-20.04.libvirt.box --name "bento/ubuntu-20.04"

    lpReturn
}

function vis_bisos_packerBoxesBasePath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisos_packerBoxesBase="/bisos/admin/vagrants/packerBaseBoxes"
    EH_assert [ -d "${bisos_packerBoxesBase}" ]
    echo "${bisos_packerBoxesBase}"
}


function vis_bisos_packerBoxesBasePath%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local vagrantBaseBoxes_bpoId=aip_vagrantBaseBoxes
    EH_assert vis_bxoAcctVerify "${vagrantBaseBoxes_bpoId}"
    
    local vagrantBaseBoxes_bpoHome=$( FN_absolutePathGet ~${vagrantBaseBoxes_bpoId} )
    local bisos_packerBoxesBase=${vagrantBaseBoxes_bpoHome}/vagrants/packerBaseBoxes

    EH_assert [ -d "${bisos_packerBoxesBase}" ]

    echo "${bisos_packerBoxesBase}"
    
    lpReturn
}


function vis_bvdbb_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bvdbb_boxesPrep

    lpDo vis_bvdbb_deb10_build
    lpDo vis_bvdbb_deb11_build    
    lpDo vis_bvdbb_ub2004_build
    
    lpReturn
}



function vis_bvdbb_boxesPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_bvdbb_deb10_serverBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/mini
    inBaseDirDo ${bisosPackerBoxesPath}/debian/mini packer build -only qemu -var "headless=true" debian-10.8-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-10.8.libvirt.box --name "bxDistro/debian-10.8/mini"

    lpReturn
}


function vis_bvdbb_deb11_serverBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/mini/debian-11.pre-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/debian/mini packer build -only qemu -var "headless=true" debian-11.pre-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-11.pre.libvirt.box --name "bxDistro/debian-11.pre/mini"

    lpReturn
}


function vis_bvdbb_ub2004_serverBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/ubuntu/mini/ubuntu-20.04-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/ubuntu/mini packer build -only qemu -var "headless=true" ubuntu-20.04-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/ubuntu-20.04.libvirt.box --name "bxDistro/ubuntu-20.04/mini"

    lpReturn
}



function vis_bvdbb_deb10_desktopBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/desktop
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer build -only qemu -var "headless=true" debian-10.8-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-10.8-desktop.libvirt.box --name "bxDistro/debian-10.8/desktop"

    lpReturn
}


function vis_bvdbb_deb12_desktopBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # installs needed plugins
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer init debian-12.4.0-amd64.pkr.hcl

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/desktop/debian-12.4.0-amd64.pkr.hcl
    # /bisos/admin/vagrants/packerBaseBoxes/debian/desktop/debian-12.4.0-amd64.pkr.hcl
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer  build -var "headless=true" debian-12.4.0-amd64.pkr.hcl

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-12.4.0-desktop.libvirt.box --name "bxDistro/debian-12.4.0/desktop"

    lpReturn
}



function vis_bvdbb_deb13_desktopBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # installs needed plugins
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer init debian-13.trixie-amd64.pkr.hcl

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/desktop/debian-12.4.0-amd64.pkr.hcl
    # /bisos/admin/vagrants/packerBaseBoxes/debian/desktop/debian-13.trixie-amd64.pkr.hcl
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer  build -var "headless=true" debian-13.trixie-amd64.pkr.hcl

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-13.trixie-desktop.libvirt.box --name "bxDistro/debian-23.trixie/desktop"

    lpReturn
}


function vis_bvdbb_deb11_desktopBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # installs needed plugins
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer init debian-11.0.0-amd64.pkr.hcl

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/desktop/debian-11.pre-amd64.json
    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/desktop/debian-11.0.0-amd64.json
    # inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer build -only qemu -var "headless=true" debian-11.0.0-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/debian/desktop packer build -var "headless=true" debian-11.0.0-amd64.pkr.hcl

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-11.0.0-desktop.libvirt.box --name "bxDistro/debian-11.0.0/desktop"

    lpReturn
}


function vis_bvdbb_ub2004_desktopBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    
    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/ubuntu/desktop/ubuntu-20.04-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/ubuntu/desktop packer build -only qemu -var "headless=true" ubuntu-20.04-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/ubuntu-20.04-desktop.libvirt.box --name "bxDistro/ubuntu-20.04/desktop"

    lpReturn
}


function vis_bisos_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bisos_boxesPrep

    lpDo vis_bisos_deb10_build
    lpDo vis_bisos_deb11_build    
    lpDo vis_bisos_ub2004_build
    
    lpReturn
}


function vis_bisos_boxesPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_bisos_deb10_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/bxcntnr
    inBaseDirDo ${bisosPackerBoxesPath}/debian/bxcntnr packer build -only qemu -var "headless=true" debian-10.8-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-10.8-bxcntnr.libvirt.box --name "bisos/debian-10.8/bxcntnr"
    
    lpReturn
}


function vis_bisos_deb11_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/debian/bxcntnr/debian-11.pre-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/debian/bxcntnr packer build -only qemu -var "headless=true" debian-11.pre-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/debian-11.pre-bxcntnr.libvirt.box --name "bisos/debian-11.pre/bxcntnr"

    lpReturn
}


function vis_bisos_ub2004_build {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosPackerBoxesPath=$( vis_bisos_packerBoxesBasePath )

    # /bxo/r3/iso/aip_vagrantBaseBoxes/vagrants/packerBaseBoxes/ubuntu/bxcntnr/ubuntu-20.04-amd64.json
    inBaseDirDo ${bisosPackerBoxesPath}/ubuntu/bxcntnr packer build -only qemu -var "headless=true" ubuntu-20.04-amd64.json

    lpDo vagrant box add $(vis_bisosVarVagrantBuilds)/ubuntu-20.04-bxcntnr.libvirt.box --name "bisos/ubuntu-20.04/bxcntnr"

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
