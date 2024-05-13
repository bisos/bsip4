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
    if [ "${G_myName}" == "this.sh" ] ; then
        vis_this
    else
        vis_examples
    fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    thisBpoId=$( vis_bpoIdPrep "sysChar" )
    bpoId=sysChar

    local oneInterface=$( vis_cntnr_netName_applicables | head -1 )

    local thisOut=$(vis_this)


    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${thisBpoId}"
${currentBxoId:-}
$( examplesSeperatorChapter "Ssh Based Cusomizations -- Bx Based (not vagrant based)" )
${G_myName} ${extraInfo} -p bpoId="sysChar" -i postCustomize  # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="sysChar" -i secureSeal     # on host - bx-ssh
${G_myName} ${extraInfo} -p bpoId="sysChar" -i recordDeployment      # inside of parent bxo
$( examplesSeperatorChapter "Full Update" )
${G_myName} ${extraInfo} -i fullUpdate
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bpoId=sysChar -i bpoIdShow  # from  bpoIdManage.sh
${G_myName} ${extraInfo} -p bpoId="${thisBpoId}" -i sysCharReport
${G_myName} ${extraInfo} -i this
${G_myName} ${extraInfo} -i containerBoxSysCharReport  # NOTYET, fails
$( examplesSeperatorChapter "Container Networks Info/Set/Update" )
${G_myName} -p bpoId=sysChar -i cntnr_netName_applicables
${G_myName} -p bpoId=sysChar -i cntnr_netName_applicables | xargs -n1 -- ${G_myName} -p bpoId=sysChar -i cntnr_netName_interfaceObtain
${G_myName} ${extraInfo} -p bpoId="${thisBpoId}" -i cntnr_netName_interfaceUpdate ${oneInterface} enSomeNu enabled
${G_myName} -p bpoId="${thisBpoId}" -i cntnr_netName_interfacesConject
${G_myName} ${extraInfo} -p bpoId=sysChar -i cntnr_netName_interfacesUpdateBasedOnConjecture
$( examplesSeperatorSection "This Container /bisos/var/bpoId/sysChar.fp/ (sysChar)  Info" )
${G_myName} ${extraInfo} -p bpoId="${thisBpoId}" -i sysCharWrite  # Initially invoked in sysCharRealize.sh
cat /bisos/var/bpoId/sysChar.fp/value  # -> (cat /bisos/var/bpoId/sysChar.fp/value)
fileParamManage.py -i fileParamRead /bisos/var/bpoId sysChar.fp  # -> $( fileParamManage.py -i fileParamRead /bisos/var/bpoId sysChar.fp )
${G_myName} ${extraInfo} -i bpoIdPrep "sysChar" # vis_bpoIdPrep "sysChar" ->  $( vis_bpoIdPrep "sysChar" )
$( examplesSeperatorSection "This Container Registrar Info" )
svcInvSiteRegContainer.cs
svcInvSiteRegBox.cs
svcInvSiteRegContainer.cs  -i thisSys_locateBoxInAll
svcInvSiteRegBox.cs  -i thisBox_read
$( examplesSeperatorSection "This Container -- Pure and Host -- Info/Set/Updates" )
egrep 'pmp_H|pmp_P' /etc/passwd   # There should only be one -- Hosts and Pures accounts in this container
$( examplesSeperatorSection "This Container -- HOST -- Info/Set/Updates" )
egrep 'pmp_V' /etc/passwd   # Guest accounts in this container
egrep 'pmp_V' /etc/passwd | egrep -v 'pmp_VAG-|pmp_VSG-'  # Non Generic Guest accounts in this container
virsh --connect qemu:///system list --all
bpoCntnrGuestStation.sh
$( examplesSeperatorChapter "GUEST Container Actions" )
egrep 'pmp_V' /etc/passwd   # Guest accounts in this container
$( examplesSeperatorChapter "Summary" )
this.sh  # -> $( vis_this )
_EOF_
}


function vis_this {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    bpoId=$( vis_bpoIdPrep "sysChar" )
    vis_sysCharReportShort

}

function vis_summary {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    local thisBpoId=$( vis_bpoIdPrep "sysChar" )

    bpoId=${thisBpoId}
    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    lpDo vis_sysCharReport
    # lpDo vis_materializedContainer
}


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update Everything.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # lpDo vis_distro_fullUpdate
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
