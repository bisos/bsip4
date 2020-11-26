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
*  /This File/ :: /bisos/bsip/bin/privCentralRegistrar.sh 
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

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t regReqFile=""

parent=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${regReqFile}" ] ; then
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

    local regReqInfoBasePath=$( bxeRegReqManage.sh -i regReqInfoBasePath_obtain )
    
    #local oneRegReqFile="$( ls /bisos/var/bxe/regReq/real/system/real_system_bisos.2*.REGREQ | head -1 )"
    local oneRegReqFile="$( ls ${regReqInfoBasePath}/real/system/real_system_bisos.2*.REGREQ | head -1 )"
    
    if [ -z "${oneRegReqFile}" ] ; then
	oneRegReqFile="Missing"
	EH_problem "Missing oneRegReqFile"
    fi
    
    visLibExamplesOutput ${G_myName} 
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Registrar Bases" )
${G_myName} ${extraInfo} -i registrarBaseGet
$( examplesSeperatorChapter "Register The bxeRegReq" )
${G_myName} ${extraInfo} -p regReqFile="${oneRegReqFile}" -i bxeDescCreate
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_registrarBaseGet { registrarBaseGet; }

function registrarBaseGet {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    readonly privRegistrarBxoId="pir_privRegistrar"
    local bxoHome=""
    
    if ! unisosAccts.sh -i userAcctExists "${privRegistrarBxoId}" ; then
	# Missing bxoId
	# Before creation of privRegistrarBxoId, /bisos/var/init is used.
	echo "/bisos/var/init/privRegistrar"
	lpReturn 
    else
	bxoHome=$( FN_absolutePathGet ~${privRegistrarBxoId} )
	if [ -z "${bxoHome}" ] ; then
	    EH_problem "Missing bxoHome -- privRegistrarBxoId=${privRegistrarBxoId}"
	    lpReturn 101
	fi
	bxePrivRegBase="${bxoHome}/regBxe"
	if [ ! -d "${bxePrivRegBase}" ] ; then
	    lpDo mkdir "${bxePrivRegBase}"
	    lpDo eval echo 102 \> ${bxePrivRegBase}
	fi
	echo "${bxePrivRegBase}"
    fi
}
    

function registrarROidGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxoHome=""
    local subBxeDir=""
    local regReqBaseDir=""

    if [ -z "${parent}" ] ; then
	lpDo cat $(registrarBaseGet)/registrar.roid    
    else
	if ! unisosAccts.sh -i userAcctExists "${parent}" ; then
	    EH_problem "Missing bxoId -- parent=${parent}"
	    lpReturn 101
	fi
	bxoHome=$( FN_absolutePathGet ~${parent} )
	if [ -z "${bxoHome}" ] ; then
	    EH_problem "Missing bxoHome -- parent=${parent}"
	    lpReturn 101
	fi
	bxeDescDir="${bxoHome}/rbxe/bxeDesc"
	if [ ! -d "${bxeDescDir}" ] ; then
	    EH_problem "Missing bxeDescDir=${bxeDescDir}"
	    lpReturn 101
	fi
	lpDo fileParamManage.py  -i fileParamRead  ${bxeDescDir} bxeOid
    fi
}
    
function bxeTypeROidGet {

    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # cat bxeType.roid    # obsoleted
    
    local bxeTypeROid=$( vis_kindTypeTag_obtain ${kind} ${type} "numeric" )

    echo ${bxeTypeROid}
}


function privRegBxeDescKindType_prep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    local baseDir=$1
    local bxeTypeROid=$2
    
    if [ ! -d "${baseDir}" ] ; then    
	opDo mkdir -p "${baseDir}"
    fi
    if [ ! -f ${baseDir}/bxeType.roid ] ; then
	lpDo eval echo ${bxeTypeROid} \> ${baseDir}/bxeType.roid
    fi
}


privRegParamSpecific_real_system () {
    #
    # Left here as an example -- other wise same as default_default
    #
    local registrarBase=$( registrarBaseGet )
    privRegAcctTypeBxeDescBase="${registrarBase}/bxeDesc/real/system"
    
    bxePrefix="prs"  # Real System

    local bxeTypeROid=$( vis_kindTypeTag_obtain ${kind} ${type} "numeric" )

    lpDo privRegBxeDescKindType_prep ${privRegAcctTypeBxeDescBase} ${bxeTypeROid}
}

privRegParamSpecific_DEFAULT_DEFAULT () {
    local registrarBase=$( registrarBaseGet )
    privRegAcctTypeBxeDescBase="${registrarBase}/bxeDesc/${kind}/${type}"
    
    bxePrefix=$( vis_bxePrefix_obtain "priv" ${kind} ${type} )

    local bxeTypeROid=$( vis_kindTypeTag_obtain ${kind} ${type} "numeric" )

    lpDo privRegBxeDescKindType_prep ${privRegAcctTypeBxeDescBase} ${bxeTypeROid}
}


privRegParamSpecific () {
    bystarServiceSupportHookRun privRegParamSpecific
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

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxePrivacy  "${bc_privacy}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeKind  "${bc_kind}"    
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxeType  "${bc_type}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} bxePrefix  "${bxePrefix}"

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} parentBxoId  "${bc_parentBxoId}"
    
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} RegReqOriginationMethod  "${bc_originationMethod}"    
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} requestingSysId "${opRunHostName}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} AdminContactEmail "${bc_email}"

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} regReqFileName "${regReqFileName}"
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

bxeDescParamInitSpecific_real_individual () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    

    local rdnSelectorTag=""

    bxeDescParamInitSpecificCommon ${1}

    #
    # SERVICE SPECIFIC PARAMETERS
    #

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} firstName "${bc_firstName}"
    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} lastName "${bc_lastName}"    

    if (( selectorNu == 1 )) ; then
	rdnSelectorTag=""
    else
	rdnSelectorTag="_${selectorNu}"
    fi

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} rdn "${bc_firstName}_${bc_lastName}${rdnSelectorTag}"
}

bxeDescParamInitSpecific_real_system () {
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

bxeDescParamInitSpecific_real_corp () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    

    local rdnSelectorTag=""

    bxeDescParamInitSpecificCommon ${1}

    #
    # SERVICE SPECIFIC PARAMETERS
    #

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} sysName "${bc_corpName}"

    if (( selectorNu == 1 )) ; then
	rdnSelectorTag=""
    else
	rdnSelectorTag="_${selectorNu}"
    fi

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} rdn "${bc_corpName}${rdnSelectorTag}"
}



bxeDescParamInitSpecific_DEFAULT_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    

    local rdnSelectorTag=""

    bxeDescParamInitSpecificCommon ${1}

    #
    # SERVICE SPECIFIC PARAMETERS
    #

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} name "${bc_name}"

    if (( selectorNu == 1 )) ; then
	rdnSelectorTag=""
    else
	rdnSelectorTag="_${selectorNu}"
    fi

    lpDo fileParamManage.py  -i fileParamWrite  ${thisPath} rdn "${bc_name}${rdnSelectorTag}"
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

bxeDescCheckDuplicateSpecific_real_individual () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    
    local retVal=""
    
    bxeDescCheckDuplicateSpecificCommon ${1}
    retVal=$?

    local cp_firstName=$( fileParamManage.py  -i fileParamRead  ${thisPath} firstName )
    local cp_lastName=$( fileParamManage.py  -i fileParamRead  ${thisPath} lastName )
    
    if [ "${bc_firstName}" == "${cp_firstName}" ] && [ "${bc_lastName}" == "${cp_lastName}" ] ; then
	ANT_cooked "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

    lpReturn ${retVal}
}


bxeDescCheckDuplicateSpecific_real_system () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    
    local retVal=""
    
    bxeDescCheckDuplicateSpecificCommon ${1}
    retVal=$?

    local cp_sysName=$( fileParamManage.py  -i fileParamRead  ${thisPath} sysName )    
    
    if [ "${bc_sysName}" == "${cp_sysName}" ] ; then
	ANT_cooked "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

    lpReturn ${retVal}
}


bxeDescCheckDuplicateSpecific_real_corp () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    
    local retVal=""
    
    bxeDescCheckDuplicateSpecificCommon ${1}
    retVal=$?

    local cp_corpName=$( fileParamManage.py  -i fileParamRead  ${thisPath} corpName )    
    
    if [ "${bc_corpName}" == "${cp_corpName}" ] ; then
	ANT_cooked "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

    lpReturn ${retVal}
}


bxeDescCheckDuplicateSpecific_DEFAULT_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    local thisDir=${1}
    local thisPath="$(pwd)/${thisDir}"    
    local retVal=""
    
    bxeDescCheckDuplicateSpecificCommon ${1}
    retVal=$?

    local cp_name=$( fileParamManage.py  -i fileParamRead  ${thisPath} name )    
    
    if [ "${bc_name}" == "${cp_name}" ] ; then
	ANT_cooked "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

    lpReturn ${retVal}
}

bxeDescCheckDuplicateSpecific () {
    bystarServiceSupportHookRun bxeDescCheckDuplicateSpecific $*
}

vis_bxeDescCreate () {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${regReqFile}" ]]

    local thisDir=""
    
    . ${regReqFile}
    regReqContainer

    kind="${bc_kind}"
    type="${bc_type}"

    bystarServiceSupportHookParamsSet ${kind} ${type}

    privRegParamSpecific

    opDoExit cd ${privRegAcctTypeBxeDescBase}

    BxeDescList=$( ls | grep -v CVS | grep -v bxeType.roid | sort )
	
    selectorNu=1
    
    for thisDir in ${BxeDescList} ; do
	# bxeDescCheckDuplicateSpecific increments selectorNu for RDN if needed
	if bxeDescCheckDuplicateSpecific ${thisDir} ; then
	    ANT_cooked "duplicate Detected -- ${thisDir}"
	    ANT_cooked "$(pwd)/${thisDir}/regReqFileName/value  is same as -p regReqFileName"
	    echo $(pwd)/${thisDir}
	    lpReturn
	fi
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    bxeDescParamInitSpecific ${thisDir}    # writes fileparams and RDN

    opDoExit cd ${thisDir}
    
    echo "date=\"$( date )\"" >>  ${regReqFile}  # as specified with -p regReqFile=
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
