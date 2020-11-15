#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

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
*  /This File/ :: /bisos/core/bsip/bin/bxeDescManage.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
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

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t RegReqFile=""
typeset -t bxeDesc=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${RegReqFile}" ] ; then
	RegReqFile=$( FN_absolutePathGet ${RegReqFile} )
    fi
    if [ ! -z "${bxeDesc}" ] ; then
     	bxeDesc=$( FN_absolutePathGet ${bxeDesc} )
    fi
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

    local regReqInfoBasePath=$( bxeRegReqManage.sh -i regReqInfoBasePath_obtain )
    
    #local oneRegReqFile="$( ls /bisos/var/bxe/regReq/real/system/real_system_bisos.2*.REGREQ | head -1 )"
    local oneRegReqFile="$( ls ${regReqInfoBasePath}/real/system/real_system_bisos.2*.REGREQ | head -1 )"
    
    if [ -z "${oneRegReqFile}" ] ; then
	oneRegReqFile="Missing"
	EH_problem "Missing oneRegReqFile"
    fi

    local registrarPrivBase=$( registrarPrivBxe.sh -i registrarBaseGet )
    #     /bisos/var/init/privRegistrar/bxeDesc/r/system/1
    local oneRegBxeDesc="${registrarPrivBase}/bxeDesc/real/system/4"

    local bxeDescBase="$(vis_bxeDescBase_obtain)"
    
    local oneBxeDesc="${bxeDescBase}/priv/real/system/prs_bisos"    

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Register The bxeRegReq" )
registrarPrivBxe.sh
registrarPrivBxe.sh ${extraInfo} -p RegReqFile="${oneRegReqFile}" -i bxeDescCreate
registrarCentralBxe.sh
registrarCentralBxe.sh ${extraInfo} -p RegReqFile="${oneRegReqFile}" -i bxeDescCreate
$( examplesSeperatorChapter "Manage bxeDesc" )
$( examplesSeperatorSection "Registered BxeDesc Capture" )
${G_myName} ${extraInfo} -p bxeDesc="${oneRegBxeDesc}" -i bxeDescStash
$( examplesSeperatorSection "INFO" )
${G_myName} ${extraInfo} -i bxeDescBase_obtain
${G_myName} ${extraInfo} -p bxeDesc="${oneRegBxeDesc}" -i bxceBxeDescBaseGet
${G_myName} ${extraInfo} -p bxeDesc="${oneBxeDesc}" -i bxeDescInfo
${G_myName} ${extraInfo} -i bxoIdFromBxeDesc "${oneRegBxeDesc}"
${G_myName} ${extraInfo} -i parentBxoIdFromBxeDesc "${oneRegBxeDesc}"
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


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
