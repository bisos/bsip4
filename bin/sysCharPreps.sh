#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lpCurrentsAdmin.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
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
*  /This File/ :: /bxo/iso/piu_mbFullUsage/sys/bin/bxoSetup.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/niche_lib.sh

# PRE parameters
typeset -t registrar=""
typeset -t id=""
typeset -t passwdFile=""


function G_postParamHook {
        
    return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Full Operations" )
${G_myName} ${extraInfo} -i fullUpdate    # Applies to both physical and virtual systems
$( examplesSeperatorChapter "Step By Step Preps" )
${G_myName} ${extraInfo} -i sysChar_binsPrep  # installs vagrant ...
${G_myName} ${extraInfo} -i sysChar_containerPrep  # creates vag base boxes
$( examplesSeperatorChapter "Actuate Services" )
${G_myName} ${extraInfo} -i sysChar_svcsActuate
_EOF_
}

noArgsHook() {
  vis_examples
}


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_sysChar_binsPrep

    lpDo vis_sysChar_containerPrep
    
    # start up relevant guests
    vis_sysChar_svcsActuate
    
    lpReturn
}


function vis_sysChar_binsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Install sysChar specific packages.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local virtualizationType=$( facter virtual )

    if [ "${virtualizationType}" == "physical" ] ; then
        
        lpDo lcaKvmBinsPrep.sh -v -n showRun -i fullUpdatePlus   #  not just fullUpdate

        lpDo usgAcctManage.sh -h -v -n showRun -i usgAcct_supplementaryGroupsUpdate bystar

        lpDo lcaVagrantBinsPrep.sh -v -n showRun -i fullUpdate
        
        lpDo vagrant plugin list --local
        # Should produce something like
        # vagrant-libvirt (0.0.45, system)
        
    else
        lpDo echo "This is a virtual machine and we need NOTYET"
    fi
}


function vis_sysChar_containerPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Install sysChar specific packages.
*** NOTYET, cleanly determine sysChar type.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local virtualizationType=$( facter virtual )

    if [ "${virtualizationType}" == "physical" ] ; then

        # activate the aip_vagrantBaseBoxes BxO
        lpDo bpoPubGithubManage.sh -h -v -n showRun -p privacy="allGithub" -p bpoId="aip_vagrantBaseBoxes" -i fullConstruct
        
        lpDo lcaVagrantBoxBuild.sh -h -v -n showRun -i bvdbb_deb11_desktopBuild
        #
        # If Pre-Release -- Weekly Build, the digest may not match.
        # correct it by running:
        # find /bxo/iso/aip_vagrantBaseBoxes/vagrants -type f -print | xargs grep -i oldDiget
        # Then replace the old digest with the new digest in the .json file
        #
        # The lcaVagrantBoxBuild.sh can take a VERY LONG TIME.
        # Even on a fast machine it can take 40 minutes or so.
        # In the beginning be very patient with "Sending Commands" and "Waiting For SSH"
        # as these are silent. It works, it just takes along time.

        lpDo vagrant box list
        
    else
        lpDo echo "This is a virtual machine and we need NOTYET"
    fi
}

function vis_sysChar_svcsActuate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Install sysChar specific packages.
*** NOTYET, cleanly determine sysChar type.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local virtualizationType=$( facter virtual )

    if [ "${virtualizationType}" == "physical" ] ; then

        echo "Build the guest based on BxO and run the Guest"
        echo "Generic Guest To Be Materialized"
        lpDo sysCharActivate.sh -h -v -n showRun -p bpoId="pmp_VAG-deb11_" -i activate_sysContainerBxo

        lpDo sysCharGuestMaterialize.sh -h -v -n showRun -p bpoId="pmp_VAG-deb11_" -i vagrantFile_run
    else
        lpDo echo "This is a virtual machine and we need NOTYET"
    fi
}





_CommentBegin_
*      ################      *End Of Editable Text*
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
