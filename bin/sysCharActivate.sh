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

. ${opBinBase}/siteRegistrar_lib.sh

. ${opBinBase}/container_lib.sh

# PRE parameters

typeset -t bpoId=""
typeset -t privA=""
typeset -t registrar=""
typeset -t id=""
typeset -t password=""


function G_postParamHook {
    if [ ! -z "${bpoId}" ] ; then
        bpoIdPrepValidate
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi
    
    # bisosCurrentsGet
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

    bisosCurrentsGet
    oneBxoId="${currentBxoId}"
    
    # local selectedContainerBxoId=$( vis_selectedContainerBxoId 2> /dev/null )

    # if [ -z "${selectedContainerBxoId}" ] ; then

    #     local containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
    #     EH_assert [ ! -z "${containerAssignBase}" ]
   
    #     local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName ${containerAssignBase} )

    #     effectiveContainerBxoId="${sysCharContainerBxoId}"
    # else
    #     effectiveContainerBxoId="${selectedContainerBxoId}"
    # fi

    local effectiveContainerBxoId=${oneBxoId}

    visLibExamplesOutput ${G_myName} 
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${effectiveContainerBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VAG-deb11_  # Generic, Auto, Dhcp,  
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId pmp_VSG-deb11_  # Generic, Shielded, StaticIP
$( examplesSeperatorChapter "SysChar Containers Info" )
${G_myName} -i containerReposList  # listAvaiableSysChars
${G_myName} -i containerBposList  # grep -i pmp_ to bxoGitlab.py -i acctList
$( examplesSeperatorChapter "SysChar Box Facilities" )
${G_myName} ${extraInfo}  -i thisSys_locateBoxInAll
${G_myName} ${extraInfo}  -i cntnrThis_regBpoId
${G_myName} ${extraInfo}  -i cntnrThis_activate
$( examplesSeperatorChapter "SysChar Container Activate" )
${G_myName} ${extraInfo}  -i activate_virtGenerics  # pmp_VAG-deb11_ pmp_VSG-deb11_
$( examplesSeperatorChapter "SysChar Container Activate" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i activate_sysContainerBxo
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i activate_sysContainerBxo
${G_myName} ${extraInfo} -i activate_containersAll # Activates each of containerReposList
$( examplesSeperatorChapter "BISOS Container Add and Select Information" )
${G_myName} ${extraInfo} -i bisosContainerBase
${G_myName} ${extraInfo} -i selectedContainerBxoId
$( examplesSeperatorChapter "BISOS Container Add and Select Actions" )
${G_myName} ${extraInfo} -i bisosContainerAdd "${effectiveContainerBxoId}"
${G_myName} ${extraInfo} -i bisosContainerSelect "${effectiveContainerBxoId}"
${G_myName} ${extraInfo} -i selectedContainerBxoId
${G_myName} ${extraInfo} -i selectedContainerBxoPath
$( examplesSeperatorChapter "Overview Report And Summary" )
${G_myName} ${extraInfo} -p bpoId="${effectiveContainerBxoId}" -i sysCharContainerReport
_EOF_
}

function vis_thisSys_locateBoxInAll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** onTarget obtain the bpoId for the box, the bpoId account may or may not exist.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local containerCharNames=$( lpDo eval svcInvSiteRegContainer.cs  -i thisSys_locateBoxInAll 2\> /dev/null \| pyLiteralToBash.cs -i stdinToBash )

    if [ -z "${containerCharNames}" ] ; then
        ANT_raw "No containerCharName found for this box"
        lpReturn
    fi

    eval declare -a listOfDicts="${containerCharNames}"
    if [ "${#listOfDicts[@]}" == "0" ] ; then
       echo "Empty List"
    fi
    for eachDictStr in "${listOfDicts[@]}" ; do
        declare -A eachDict="${eachDictStr}"

        echo ${eachDict[@]} -- ${!eachDict[@]} --- ${eachDict['model']}

        for eachKey in "${!eachDict[@]}"; do
            echo "$eachKey - ${eachDict[$eachKey]}"
        done
    done

    lpReturn
}


function vis_cntnrThis_regBpoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** onTarget obtain the bpoId for the box, the bpoId account may or may not exist, but must have been reg-ed and relaized
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local regBpoId=$( lpDo eval "cntnrCharThis.cs -i cntnrThis_regBpoId 2\> /dev/null" )

    echo "${regBpoId}"
    
    lpReturn
}

function vis_cntnrThis_activate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Uses bpoChar
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # NOTYET, Rename to:: cntnrCharThis.cs -i cntnrThis_regBpoId
    local regBpoId=$( lpDo vis_cntnrThis_regBpoId )

    if [ -z "${regBpoId}" ] ; then
        ANT_cooked "Empty result from cntnrThis_regBpoId -- activation skipped"
        lpReturn
    fi

    lpDo bpoManage.sh -h -v -n showRun -p privacy="priv" -p bpoId="${regBpoId}" -i fullConstruct
    
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
