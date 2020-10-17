#!/bin/osmtKsh 
#!/bin/osmtKsh

typeset RcsId="$Id: bystarRbaeAdmin.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
  `dirname $0`/seedActions.sh -l $0 "$@"
  exit $?
fi


. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh

# /opt/public/osmt/bin/bystarBarc.libSh 
. ${opBinBase}/bystarBarc.libSh
. ${opBinBase}/opDoAtAsLib.sh

. ${opBinBase}/bystarHook.libSh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
. ${opBinBase}/bystarInfoBase.libSh
. ${opBinBase}/bystarNspLib.sh

# ./bystarPlatform.libSh
. ${opBinBase}/bystarPlatform.libSh

. ${opBinBase}/lpCurrents.libSh

# PRE parameters
typeset -t BarcFile="MANDATORY"
typeset -t RBAE="MANDATORY"

function G_postParamHook {
    lpCurrentsGet

    if [ "${BarcFile}_" != "MANDATORY_" ] ; then
	BarcFile=$( FN_absolutePathGet ${BarcFile} )
    fi
    if [ "${RBAE}_" != "MANDATORY_" ] ; then
	RBAE=$( FN_absolutePathGet ${RBAE} )
    fi
}

noArgsHook() {
  vis_examples
}

function vis_examples {
    #extraInfo="-h -v -n showRun"
    extraInfo=""
    oneBarcFile="/libre/ByStar/InfoBase/BARC/BYNAME/TRIAL/090125235441_25039.BARC"
    oneRBAE="/libre/ByStar/InfoBase/RBAE/BYSMB/ea/59001"
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
#### INFO  ####
${G_myName} ${extraInfo} -p RBAE="${oneRBAE}" -i RbaeInfo
--- Create RBAE from BARC ---
${G_myName} ${extraInfo} -p BarcFile="${oneBarcFile}" -i RbaeCreate
${G_myName} ${extraInfo} -p BarcFile="${oneBarcFile}" -i RbaeUpdate
${G_myName} ${extraInfo} -p RBAE="${oneRBAE}" -i RbaeUpdate
--- Locate bystarUid ---
${G_myName} ${extraInfo} -p bystarUid="ea-59001" -i RbaeLocate
${G_myName} ${extraInfo} -p bystarUid="ea-59001" -i RbaeDeleteWithUid
_EOF_
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

  echo "${bc_serviceType}" > ${thisDir}/ServiceType:mr

  echo "${bc_serviceSupportType}" > ${thisDir}/ServiceSupportType:mr

  echo "${bc_originationMethod}" > ${thisDir}/BarcOriginationMethod:mr

  echo "${BarcFileName}" > ${thisDir}/BarcFileName:mr


  echo "${bystarAcctTypePrefix}" > ${thisDir}/acctPrefix:dr

  # acctBystarDomain
  # acctMainDomain

  #
  # Admin PARAMETERS
  #

  echo "service@mohsen.banan.1.byname.net" > ${thisDir}/AdminContactEmail:m
}

RBAeParamInitSpecific_BYNAME_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

  #
  # SERVICE SPECIFIC PARAMETERS
  #

  echo "${bc_firstName}" > ${thisDir}/FirstName:m

  echo "${bc_lastName}" > ${thisDir}/LastName:m

  echo "${bc_firstName} ${bc_lastName}" > ${thisDir}/AdminContactPerson:m


  # nameSelector
 case ${bc_serviceSupportType} in 
   "COMMITTED")
	    echo "${selectorNu}" > ${thisDir}/nameSelector:mr
	    ;;
   "TRIAL")
	    echo "t${selectorNu}" > ${thisDir}/nameSelector:mr
  	    ;;
   *)
      EH_problem "Unknown serviceSupportType=${bc_serviceSupportType} -- selectorNu: ${selectorNu}"
      return 1
      ;;
 esac
 
}

RBAeParamInitSpecific_BYMEMORY_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

  #
  # SERVICE SPECIFIC PARAMETERS
  #

  echo "${bc_firstName}" > ${thisDir}/FirstName:m

  echo "${bc_lastName}" > ${thisDir}/LastName:m

  echo "${bc_firstName} ${bc_lastName}" > ${thisDir}/AdminContactPerson:m


  # nameSelector
 case ${bc_serviceSupportType} in 
   "COMMITTED")
	    echo "${selectorNu}" > ${thisDir}/nameSelector:mr
	    ;;
   "TRIAL")
	    echo "t${selectorNu}" > ${thisDir}/nameSelector:mr
  	    ;;
   *)
      EH_problem "Unknown serviceSupportType=${bc_serviceSupportType} -- selectorNu: ${selectorNu}"
      return 1
      ;;
 esac
 
}


RBAeParamInitSpecific_BYALIAS_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

  #
  # SERVICE SPECIFIC PARAMETERS
  #

  echo "${bc_AliasName}" > ${thisDir}/AliasName:m

  echo "${bc_firstName} ${bc_lastName}" > ${thisDir}/AdminContactPerson:m
}


RBAeParamInitSpecific_BYSMB_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

  #
  # SERVICE SPECIFIC PARAMETERS
  #

  echo "${bc_Domain1}" > ${thisDir}/Domain1:m

  echo "${bc_Domain2}" > ${thisDir}/Domain2:m

   if [ "${bc_AdminContactPerson}_" == "_" ] ; then
      echo "ByStar Factory" > ${thisDir}/AdminContactPerson:m
   fi
}

RBAeParamInitSpecific_BCA_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    thisDir=${1}

    RBAeParamInitSpecificCommon ${1}

  #
  # SERVICE SPECIFIC PARAMETERS
  #

  echo "${bc_firstName}" > ${thisDir}/FirstName:m

  echo "${bc_lastName}" > ${thisDir}/LastName:m

  echo "${bc_BcaTag}" > ${thisDir}/BcaTag:m

  echo "${bc_BcaTag}" > ${thisDir}/DomainRel:m

  echo "${bc_BcaTag}" > ${thisDir}/MasterAcctMailName1:m

  echo "main@${bc_BcaTag}.${cp_master_acctFactoryBaseDomain}" > ${thisDir}/MasterAcctMailFwd1:m

  echo "${bc_masterAcct}" > ${thisDir}/MasterAcct:m

}


RBAeParamInitSpecific_DEFAULT_DEFAULT () {
   ANT_raw "Missing ${bystarServiceType}_${bystarServiceSupportType}"
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

    thisBarcFileName=$( FN_absolutePathGet ${cp_BarcFileName} )
    if [ "${thisBarcFileName}_" == "${BarcFile}_" ] ; then
	EH_problem "DUPLICATE BarcFile=${BarcFile}"
	return 101
    fi
}

RBAeCheckDuplicateSpecific_BYNAME_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    RBAeCheckDuplicateSpecificCommon ${1}

    if [ "${bc_firstName}_" == "${cp_FirstName}_" -a  "${bc_lastName}_" == "${cp_LastName}_" ] ; then
	ANT_raw "$1: DUPLICATE, ${selectorNu}"
	selectorNu=$( expr ${selectorNu} +  1 )
    fi

}

RBAeCheckDuplicateSpecific_BYMEMORY_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    RBAeCheckDuplicateSpecificCommon ${1}
}


RBAeCheckDuplicateSpecific_BYALIAS_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    RBAeCheckDuplicateSpecificCommon ${1}
}


RBAeCheckDuplicateSpecific_BYSMB_DEFAULT () {
    EH_assert [[ $# -eq 1 ]]
    RBAeCheckDuplicateSpecificCommon ${1}

    if [ "${bc_Domain1}_" == "${cp_Domain1}_" -a  "${bc_Domain2}_" == "${cp_Domain2}_" ] ; then
	EH_problem "$1: DUPLICATE, ${bc_Domain1}.${bc_Domain2}"
	return 101
    fi
}

RBAeCheckDuplicateSpecific_DEFAULT_DEFAULT () {
   ANT_raw "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}

RBAeCheckDuplicateSpecific () {
    bystarServiceSupportHookRun RBAeCheckDuplicateSpecific $*
}

vis_RbaeCreate () {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${BarcFile}_" != "MANDATORY_" ]]
    
    . ${BarcFile}
    BarcContainer

    serviceType="${bc_serviceType}"
    serviceSupportType="${bc_serviceSupportType}"

    bystarServiceSupportHookParamsSet ${serviceType} ${serviceSupportType}

 

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

  if [ "${bc_bystarUid}_" == "_" ] ; then
      bystarServiceSupportHookRun bystarTypeSpecific $*
  else
      # We Were assigned a particular bc_bystarUid -- make it so
      opDoExit bystarIbParamSpecific
      acctNu=${bc_bystarUid##${bystarAcctTypePrefix}-}
      if [ -d ${bystarIbAcctTypeRBAEBase}/${acctNu} ] ; then
	  EH_problem "${bystarIbAcctTypeRBAEBase}/${acctNu} Exists"
	  return 101
      else
	  opDoExit sudo -u lsipusr mkdir -p ${bystarIbAcctTypeRBAEBase}/${acctNu}
	  thisDir=${bystarIbAcctTypeRBAEBase}/${acctNu}
	  nextNu=${acctNu}
          selectorNu=1
      fi
  fi

  RBAeParamInitSpecific ${thisDir}

  opDoExit cd ${thisDir}

  echo "date=\"$( date )\"" >>  ${BarcFile}
  echo "RBAE=$( pwd )" >> ${BarcFile}

  opDo chown -R lsipusr:employee .

  opDo pwd 1>&2
  opDo grep ^ *  1>&2

  pwd
}
