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

. ${opBinBase}/fileParam_lib.sh

# . ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t regReqFile="MANDATORY"

function G_postParamHook {
    # lpCurrentsGet

    if [ "${regReqFile}" != "MANDATORY" ] ; then
	regReqFile=$( FN_absolutePathGet ${regReqFile} )
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

    oneregReqFile="$( ls /bisos/var/bxae/bxeRegReq/A/system/A_system_bisos.2*.REGREQ | head -1 )"
    if [ -z "${oneregReqFile}" ] ; then
	oneregReqFile="Missing"
	EH_problem "Missing oneregReqFile"
    fi
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Register The bxeRegReq" )
${G_myName} ${extraInfo} -p regReqFile="${oneregReqFile}" -i bxeDescCreate
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function registrarBaseGet {
    # Before creation of intraSite, /bisos/var/init is used.
    echo "/bisos/var/init/selfRegistrar"
}

function registrarROidGet {
    cat $(registrarBaseGet)/registrar.roid
}

function bxeTypeROidGet {
    cat bxeType.roid
}


selfRegParamSpecific_A_system () {
    local registrarBase=$( registrarBaseGet )
    local asBaseDir="${registrarBase}/bxeDesc/A/system"
    
    bxePrefix="as"  # Autonomous System
    
    if [ ! -d "${asBaseDir}" ] ; then
	opDo mkdir -p "${asBaseDir}"
	echo 3 > ${asBaseDir}/bxeType.roid
    fi
    selfRegAcctTypeBxeDescBase="${asBaseDir}"
}

selfRegParamSpecific () {
    bystarServiceSupportHookRun selfRegParamSpecific
}


bxeDescParamInitSpecificCommon () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"

    #
    # COMMON PARAMETERS
    #

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeROid "${nextNu}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeOid "$( bxeOidGet ${nextNu} )"

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeAutonomy  "${bc_autonomy}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeType  "${bc_type}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxePrefix  "${bxePrefix}"    

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} RegReqOriginationMethod  "${bc_originationMethod}"    
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} requestingSysId "${opRunHostName}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} AdminContactEmail "${bc_email}"

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} regReqFileName "${RegReqFileName}"
}

function bxeOidGet {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local bxeROid="$1"

    local registrarROid=$( registrarROidGet )
    local bxeTypeROid=$( bxeTypeROidGet )
    
    local bxeOid="${registrarROid}.${bxeTypeROid}.${bxeROid}"

    echo ${bxeOid}
    lpReturn
}	

bxeDescParamInitSpecific_A_system () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    

    local rdnSelectorTag=""

    bxeDescParamInitSpecificCommon ${1}

    #
    # SERVICE SPECIFIC PARAMETERS
    #

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} sysName "${bc_sysName}"

    if (( selectorNu == 1 )) ; then
	rdnSelectorTag=""
    else
	rdnSelectorTag="_${selectorNu}"
    fi

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} rdn "${bc_sysName}${rdnSelectorTag}"
}


bxeDescParamInitSpecific_DEFAULT_DEFAULT () {
    ANT_cooked "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}

bxeDescParamInitSpecific () {
    bystarServiceSupportHookRun bxeDescParamInitSpecific $*
}

#
# bxeDescCheckDuplicate
#

bxeDescCheckDuplicateSpecificCommon () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    

    local cp_regReqFileName=$( fileParamManage.py  -i fileParamRead  ${thisPath} regReqFileName )
    
    thisregReqFileName=$( FN_absolutePathGet ${cp_regReqFileName} )
    if [ "${thisregReqFileName}" == "${regReqFile}" ] ; then
	ANT_cooked "DUPLICATE regReqFile=${regReqFile}"
	return 0
    else
	return 101
    fi
}

bxeDescCheckDuplicateSpecific_A_system () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    
    local retVal=""
    
    bxeDescCheckDuplicateSpecificCommon ${1}
    retVal=$?

    local cp_sysName=$( fileParamManage.py  -i fileParamRead  ${thisPath} sysName )    
    
    if [ "${bc_sysName}_" == "${cp_sysName}_" ] ; then
	ANT_cooked "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

    lpReturn ${retVal}
}

bxeDescCheckDuplicateSpecific_DEFAULT_DEFAULT () {
   ANT_cooked "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}

bxeDescCheckDuplicateSpecific () {
    bystarServiceSupportHookRun bxeDescCheckDuplicateSpecific $*
}

vis_bxeDescCreate () {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${regReqFile}" != "MANDATORY" ]]

    local thisDir=""
    
    . ${regReqFile}
    RegReqContainer

    autonomy="${bc_autonomy}"
    type="${bc_type}"

    bystarServiceSupportHookParamsSet ${autonomy} ${type}

    selfRegParamSpecific

    opDoExit cd ${selfRegAcctTypeBxeDescBase}

    BxeDescList=$( ls | grep -v CVS | grep -v bxeType.roid | sort )
	
    selectorNu=1
    
    for thisDir in ${BxeDescList} ; do
	if bxeDescCheckDuplicateSpecific ${thisDir} ; then
	    ANT_cooked "duplicate Detected -- ${thisDir}"
	    echo $(pwd)/${thisDir}
	    lpReturn
	fi
    done

    lastNuStr=${thisDir} 

    nextNu=$( expr $lastNuStr +  1 )
    opDoExit mkdir ${nextNu}

    thisDir=${nextNu}

    bxeDescParamInitSpecific ${thisDir}

    opDoExit cd ${thisDir}

    echo "date=\"$( date )\"" >>  ${regReqFile}
    echo "BxeDesc=$( pwd )" >> ${regReqFile}

    opDo sudo chown -R bisos:bisos .

    #opDo pwd 1>&2
    #opDo grep ^ *  1>&2

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
