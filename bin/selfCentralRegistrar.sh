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
*  /This File/ :: /bisos/bsip/bin/selfCentralRegistrar.sh 
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

# . ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t RegReqFile="MANDATORY"
typeset -t RBAE="MANDATORY"

function G_postParamHook {
    # lpCurrentsGet

    if [ "${RegReqFile}_" != "MANDATORY_" ] ; then
	RegReqFile=$( FN_absolutePathGet ${RegReqFile} )
    fi
    if [ "${RBAE}_" != "MANDATORY_" ] ; then
	RBAE=$( FN_absolutePathGet ${RBAE} )
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

    oneRegReqFile="$( ls /bisos/var/bxae/bxeRegReq/A/system/A_system_bisos.2*.REGREQ | head -1 )"
    if [ -z "${oneRegReqFile}" ] ; then
	oneRegReqFile="Missing"
	EH_problem "Missing oneRegReqFile"
    fi
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Register The bxeRegReq" )
${G_myName} ${extraInfo} -p RegReqFile="${oneRegReqFile}" -i RbaeCreate
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


bystarIbParamSpecific_A_system () {
    local registrarBase="/bisos/var/selfRegistrar"
    local asBaseDir="${registrarBase}/bxeDesc/A/system"
    
    bystarAcctTypePrefix="as"
    
    if [ ! -d "${asBaseDir}" ] ; then
	opDo mkdir -p "${asBaseDir}"
    fi
    bystarIbAcctTypeRBAEBase="${asBaseDir}"
}

bystarIbParamSpecific () {
    bystarServiceSupportHookRun bystarIbParamSpecific
}


RBAeParamInitSpecificCommon () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}

    #
    # COMMON PARAMETERS
    #
    echo ${nextNu} > ${thisDir}/acctNu:mr

    echo "${opRunHostName}" > ${thisDir}/BacsId:mr

    echo "${bc_autonomy}" > ${thisDir}/ServiceType:mr
    
    echo "${bc_type}" > ${thisDir}/ServiceSupportType:mr

    echo "${bc_originationMethod}" > ${thisDir}/RegReqOriginationMethod:mr
    
    echo "${RegReqFileName}" > ${thisDir}/RegReqFileName:mr

    echo "${bystarAcctTypePrefix}" > ${thisDir}/acctPrefix:dr

    # acctBystarDomain
    # acctMainDomain

    #
    # Admin PARAMETERS
    #

    echo "service@example.com" > ${thisDir}/AdminContactEmail:m
}


RBAeParamInitSpecific_A_system () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

    #
    # SERVICE SPECIFIC PARAMETERS
    #

    echo "${bc_sysName}" > ${thisDir}/sysName:m
}


RBAeParamInitSpecific_DEFAULT_DEFAULT () {
    ANT_cooked "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}

RBAeParamInitSpecific () {
    bystarServiceSupportHookRun RBAeParamInitSpecific $*
}

#
# RBAeCheckDuplicate
#

RBAeCheckDuplicateSpecificCommon () {
    EH_assert [[ $# -eq 1 ]]
    
    lpDo fileParamsLoadVarsFromBaseDir  ${1}

    thisRegReqFileName=$( FN_absolutePathGet ${cp_RegReqFileName} )
    if [ "${thisRegReqFileName}" == "${RegReqFile}" ] ; then
	EH_problem "DUPLICATE RegReqFile=${RegReqFile}"
	return 0
    else
	return 101
    fi
}

RBAeCheckDuplicateSpecific_A_system () {
    EH_assert [[ $# -eq 1 ]]
    RBAeCheckDuplicateSpecificCommon ${1}

    lpReturn # NOTYET, for now 
    
    if [ "${bc_firstName}_" == "${cp_FirstName}_" -a  "${bc_lastName}_" == "${cp_LastName}_" ] ; then
	ANT_raw "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

}

RBAeCheckDuplicateSpecific_DEFAULT_DEFAULT () {
   ANT_cooked "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}

RBAeCheckDuplicateSpecific () {
    bystarServiceSupportHookRun RBAeCheckDuplicateSpecific $*
}

vis_RbaeCreate () {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${RegReqFile}_" != "MANDATORY_" ]]

    local thisDir=""
    
    . ${RegReqFile}
    RegReqContainer

    autonomy="${bc_autonomy}"
    type="${bc_type}"

    bystarServiceSupportHookParamsSet ${autonomy} ${type}

    bystarIbParamSpecific

    opDoExit cd ${bystarIbAcctTypeRBAEBase}

    RBAEList=$( ls | grep -v CVS | sort )
	
    selectorNu=1
    
    for thisDir in ${RBAEList} ; do
	if RBAeCheckDuplicateSpecific ${thisDir} ; then
	    ANT_cooked "duplicate Detected -- ${thisDir}"
	    echo $(pwd)/${thisDir}
	    lpReturn
	fi
    done

    lastNuStr=${thisDir} 

    nextNu=$( expr $lastNuStr +  1 )
    opDoExit mkdir ${nextNu}

    thisDir=${nextNu}

    RBAeParamInitSpecific ${thisDir}

    opDoExit cd ${thisDir}

    echo "date=\"$( date )\"" >>  ${RegReqFile}
    echo "RBAE=$( pwd )" >> ${RegReqFile}

    opDo sudo chown -R bisos:bisos .

    opDo pwd 1>&2
    opDo grep ^ *  1>&2

    pwd
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
