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

. ${opBinBase}/siteRegistrar_lib.sh

. ${opBinBase}/niche_lib.sh


# PRE parameters

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    #bpoIdPrepValidate    

    # if [ ! -z "${bpoId}" ] ; then
     #   bpoHome=$( FN_absolutePathGet ~${bpoId} )
    # fi
    
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

    # oneBxoId="${currentBxoId}"
    local oneBpoId="pmp_VAG-deb12_"
    local oneBxoHome=$( FN_absolutePathGet ~${oneBpoId} )

    bpoId=${oneBpoId}

    local vagrantLastVmName=$( vis_vagrantLastVmName )


    local oneTargetBox=${curTargetBox:-}

    local thisBpoId=$( vis_bpoIdPrep "sysChar" )

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBpoId}"
$( examplesSeperatorChapter "All BPO Containers List" )
bxoGitlab.py
bxoGitlab.py -i acctList
bxoGitlab.py -i acctList | grep pmp_V   # All Hosts
$( examplesSeperatorChapter "This Container" )
cntnrThisManage.sh
this.sh  # -> $( this.sh )
${G_myName} ${extraInfo} -i bpoIdPrep "sysChar" # vis_bpoIdPrep "sysChar" ->  $( vis_bpoIdPrep "sysChar" )
$( examplesSeperatorSection "This Container Accounts Info" )
egrep 'pmp_V' /etc/passwd   # Guest accounts in this container
egrep 'pmp_V' /etc/passwd | egrep -v 'pmp_VAG-|pmp_VSG-'  # Non Generic Guest accounts in this container
${G_myName}  -p bpoId="${oneBpoId}" -i vagrantLastVmName
$( examplesSeperatorChapter "BPO Container Guests -- Stationing (VMs start, stop, auto-star, delete)" )
lcaVirshManage.sh  #
virsh --connect qemu:///system list --all --title
virsh --connect qemu:///system stop ${vagrantLastVmName}
virsh --connect qemu:///system start ${vagrantLastVmName}
virsh --connect qemu:///system restart ${vagrantLastVmName}
virsh --connect qemu:///system restart ${vagrantLastVmName}
virsh --connect qemu://localhost/system autostart ${vagrantLastVmName}   # enable auto start
virsh --connect qemu://localhost/system autostart ${vagrantLastVmName} --disable  # disable auto start
virsh --connect qemu://localhost/system dominfo ${vagrantLastVmName}
ls -l /etc/libvirt/qemu/autostart
virsh --connect qemu+ssh://localhost/system desc ${vagrantLastVmName} --current --title "TitleOfVm" --new-desc "Description of VM comes here"
virsh --connect qemu://localhost/system desc ${vagrantLastVmName} --title
virsh domifaddr
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i virshDominfo
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i virshDomifaddr
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i ipAddrOfBpoVm
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i virshStart
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i virshStop
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i validateFacter
$( examplesSeperatorSection "Network" )
${G_myName}  ${extraInfo} -p bpoId="${oneBpoId}" -i netIfs   # Used by Vagrant
$( examplesSeperatorChapter "Pure Container Actions" )
_EOF_
}

function vis_vagrantLastVmName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    local lastVagrantFile=$( sysCharGuestMaterialize.sh -p bpoId="$bpoId" -i vagrantFile_last )
    local vmName=$( sysCharGuestMaterialize.sh -i vagrantFile_vmName ${lastVagrantFile} )

    echo ${vmName}
}


function vis_ipAddrOfBpoVm {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    local addrLine=$( vis_virshDomifaddr | tail -2 | head -1 | grep 192.168.121 )

    local ipAddr=$( echo ${addrLine} |  cut -d ' ' -f 4 | cut -d '/' -f 1 |  xargs echo )

    echo ${ipAddr}
}



function vis_virshDominfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    lpDo virsh --connect qemu:///system dominfo $(vis_vagrantLastVmName)
}

function vis_virshDomifaddr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    lpDo virsh --connect qemu:///system domifaddr  $(vis_vagrantLastVmName)
}

function vis_virshStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    lpDo virsh --connect qemu:///system start   $(vis_vagrantLastVmName)
}

function vis_virshStop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    lpDo virsh --connect qemu:///system stop   $(vis_vagrantLastVmName)
}

function vis_validateFacter {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    lpDo vis_virshStart

    lpDo sleep 25

    local ipAddrOfBpoVm=$(vis_ipAddrOfBpoVm)

    lpDo facter-roInv.cs --svcName="svcFacter" --perfName="${ipAddrOfBpoVm}" --rosmu="facter-roInv.cs" --perfIpAddr="${ipAddrOfBpoVm}"  -i inv_sapCreate

    lpDo facter-roInv.cs --perfName="${ipAddrOfBpoVm}"  -i factName networking
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
