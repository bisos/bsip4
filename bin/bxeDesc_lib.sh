#!/bin/bash 

# PRE parameters
typeset -t RegReqFile="MANDATORY"
typeset -t RBAE="MANDATORY"

function G_postParamHook {
    lpCurrentsGet

    if [ "${RegReqFile}_" != "MANDATORY_" ] ; then
	RegReqFile=$( FN_absolutePathGet ${RegReqFile} )
    fi
    if [ "${RBAE}_" != "MANDATORY_" ] ; then
	RBAE=$( FN_absolutePathGet ${RBAE} )
    fi
}

bystarIbParamSpecific_A_system () {
    bystarAcctTypePrefix="sa"

    if isDisposableRegisterUid ; then
        bystarIbAcctTypeRBAEBase="/libre/etc/bystar/infoBase/rbae/byName/sa"
    else
	if [ ! -d /bisos/var/bxae/bxeDesc/A/system ] ; then
	    opDo mkdir -p /bisos/var/bxae/bxeDesc/A/system
	fi
        bystarIbAcctTypeRBAEBase="/bisos/var/bxae/bxeDesc/A/system"	
    fi
}

bystarIbParamSpecific () {
    bystarServiceSupportHookRun bystarIbParamSpecific $*
}

function vis_RbaeInfo {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    ANT_raw "Running: lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${RBAE} -i fileParamsShow"
    opDo lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${RBAE} -i fileParamsShow 2> /dev/null
}


function vis_RbaeLocate {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    targetAcctTypePrefix=${bystarUid%%-*}
    targetAcctNu=${bystarUid##${targetAcctTypePrefix}-}

    # can be optimized based on TypePrefix
    #
    RBAEList=$( find /libre/ByStar/InfoBase/RBAE -type d -print | egrep '/[0-9]*$' | sort )
    
    for thisDir in ${RBAEList} ; do
	if RbaeFound=$( RbaeMatchesBystarUid ${thisDir} ${targetAcctTypePrefix} ${targetAcctNu}) ; then
	    echo ${RbaeFound}
	    return
	fi
    done
}

function vis_RbaeDeleteWithUid {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    targetAcctTypePrefix=${bystarUid%%-*}
    targetAcctNu=${bystarUid##${targetAcctTypePrefix}-}

    # can be optimized based on TypePrefix
    #
    RBAEList=$( find /libre/ByStar/InfoBase/RBAE -type d -print | egrep '/[0-9]*$' | sort )
    
    for thisDir in ${RBAEList} ; do
	if RbaeFound=$( RbaeMatchesBystarUid ${thisDir} ${targetAcctTypePrefix} ${targetAcctNu}) ; then
	    opDo echo rm -r -f ${RbaeFound}
	    return
	fi
    done
}


RbaeMatchesBystarUid () {
    EH_assert [[ $# -eq 3 ]]

    #opDo fileParamsLoadVarsFromBaseDir  ${1}
    fileParamsLoadVarsFromBaseDir  ${1}

    #ANT_raw "${cp_acctPrefix} ${2} ${cp_acctNu} ${3}"

    if [ "${cp_acctPrefix}_" == "${2}_" -a  "${cp_acctNu}_" == "${3}_" ] ; then
	echo $1
	return 0
    else
	return 1
    fi
}




RBAeParamInitSpecificCommon () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

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

  echo "service@mohsen.banan.1.byname.net" > ${thisDir}/AdminContactEmail:m
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
    
    fileParamsLoadVarsFromBaseDir  ${1}

    lpReturn #  NOTYET, for now

    #thisRegReqFileName=$( FN_absolutePathGet ${cp_RegReqFileName} )
    thisRegReqFileName=$( FN_absolutePathGet ${RegReqFileName} )    
    if [ "${thisRegReqFileName}_" == "${RegReqFile}_" ] ; then
	EH_problem "DUPLICATE RegReqFile=${RegReqFile}"
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

 

bystarTypeSpecific_BCA_DEFAULT () {
    cp_MasterAcct=${bc_masterAcct}
    opDo masterAcctBagpLoad

    # NOTYET: Check Duplicate -- Perhaps in bystarCtldAcctAdmin.sh -p barc=xxx

    controlledAcctUid=$( bystarNextControlledAcct )

    RBAeBaseDir=${cp_master_acctUidHome}/BAGP/BCA/${controlledAcctUid}/RBAE

    opDoExit mkdir -p ${RBAeBaseDir}

    thisDir=${RBAeBaseDir}
    nextNu=${controlledAcctUid##ca-}

    bystarIbParamSpecific
}

bystarTypeSpecific_DEFAULT_DEFAULT () {
    bystarIbParamSpecific

    opDoExit cd ${bystarIbAcctTypeRBAEBase}

    if isDisposableRegisterUid ; then
	selectorNu=1

	nextNu=$( bystarNextDisposableScopeAcctNu )
	FN_dirSafeKeep ${nextNu}
	opDoExit mkdir ${nextNu}
    else
	RBAEList=$( ls | grep -v CVS | sort )
	
	selectorNu=1
    
	for thisDir in ${RBAEList} ; do
	    if ! RBAeCheckDuplicateSpecific ${thisDir} ; then 
		return 101
	    fi
	done

	lastNuStr=${thisDir} 

	nextNu=$( expr $lastNuStr +  1 )
	opDoExit mkdir ${nextNu}
    fi


    thisDir=${nextNu}
}

  #if [ "${bc_bystarUid}_" == "_" ] ; then
      bystarServiceSupportHookRun bystarTypeSpecific $*
  # else
  #     # We Were assigned a particular bc_bystarUid -- make it so
  #     opDoExit bystarIbParamSpecific
  #     acctNu=${bc_bystarUid##${bystarAcctTypePrefix}-}
  #     if [ -d ${bystarIbAcctTypeRBAEBase}/${acctNu} ] ; then
  # 	  EH_problem "${bystarIbAcctTypeRBAEBase}/${acctNu} Exists"
  # 	  return 101
  #     else
  # 	  opDoExit sudo -u lsipusr mkdir -p ${bystarIbAcctTypeRBAEBase}/${acctNu}
  # 	  thisDir=${bystarIbAcctTypeRBAEBase}/${acctNu}
  # 	  nextNu=${acctNu}
  #         selectorNu=1
  #     fi
  # fi

  RBAeParamInitSpecific ${thisDir}

  opDoExit cd ${thisDir}

  echo "date=\"$( date )\"" >>  ${RegReqFile}
  echo "RBAE=$( pwd )" >> ${RegReqFile}

  opDo sudo chown -R bisos:bisos .

  opDo pwd 1>&2
  opDo grep ^ *  1>&2

  pwd
}


function isDisposableRegisterUid  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Just a place holder. It should perhaps be eliminated.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn 101  # for now NOTYET

    opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage

    if [[ "${cp_platformUsageRegisterUid:-}_" == "DISPOSABLE_" ]] ; then
       return 0
    else   
	return 101
    fi
}

