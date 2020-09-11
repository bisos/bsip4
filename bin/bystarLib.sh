#!/bin/bash

typeset RcsId="$Id: bystarLib.sh,v 1.3 2016-07-29 02:02:53 lsipusr Exp $"

# if [ "${loadFiles}X" == "X" ] ; then
#   seedActions.sh -l $0 "$@"
#   exit $?
# fi

# ./opAcctLib.sh
. ${opBinBase}/opAcctLib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh


bystarBackupHost=198.62.92.131
#bystarBackupDestDir="/backup/plone/${opRunHostName}"
bystarBackupDestDir="/backup/${opRunHostName}"
bystarBackupBaseDir="/backup"

function bystarNextDisposableScopeAcctNu {
  EH_assert [[ $# -eq  0 ]]

  passwdFileInfo=$( egrep '^..-15' /etc/passwd | sort | tail -1 | cut -d: -f1 )

  if [ "${passwdFileInfo}_" == "_" ] ; then 
    echo "15001"
  else
    lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
    nextNu=$( expr $lastNuStr +  1 )
    echo ${nextNu}
  fi
}

function bystarNextLocalScopeAcctNu {
  EH_assert [[ $# -eq  0 ]]

  passwdFileInfo=$( egrep '^..-16' /etc/passwd | sort | tail -1 | cut -d: -f1 )

  if [ "${passwdFileInfo}_" == "_" ] ; then 
    echo "16001"
  else
    lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
    nextNu=$( expr $lastNuStr +  1 )
    echo ${nextNu}
  fi
}


function bystarNextControlledAcct {
  EH_assert [[ $# -eq  0 ]]

    nextNu=$( bystarNextLocalScopeAcctNu )
    echo ca-${nextNu}
}


function bystarNextControlledAcctOld {
  EH_assert [[ $# -eq  0 ]]

  passwdFileInfo=$( egrep '^ca-' /etc/passwd | sort | tail -1 | cut -d: -f1 )

  if [ "${passwdFileInfo}_" == "_" ] ; then 
    echo "ca-16001"
  else
    lastNuStr=${passwdFileInfo##ca-}
    nextNu=$( expr $lastNuStr +  1 )
    echo ca-${nextNu}
  fi
}

function bystarIsControlledAcct {
  EH_assert [[ $# -eq  1 ]]

  bystarUid=$1	
  bystarBagpLoad

  if [ "${cp_MasterAcct}_" == "_" ] ; then
    #EH_problem "Missing Master Acct"
    return 101
  fi
  return 0
}

function bystarIsMasterAcct {
  EH_assert [[ $# -eq 1 ]]

  # NOTYET, uid

  # NOTYET, test for BCA directory
  #
  #
  #if [ "${cp_MasterAcct}_" == "_" ] ; then
    #EH_problem "Missing Master Acct"
    #return 101
  #fi
  return 0
}


function bystarBacpBaseDirVerifyAndFix {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bystarUid}_" != "_" ]]

    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    if [ ! -d ${bystarUidHome} ] ; then
	EH_problem "Missing ${bystarUidHome}"
	return 101
    fi

    if [ ! -d ${bystarUidHome}/BACP ] ; then
	FN_dirCreatePathIfNotThere ${bystarUidHome}/BACP
    fi
}

function bystarBagpLoad {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bystarUid}_" != "_" ]]


    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

    if [ ! -d ${bystarUidHome} ] ; then
	EH_problem "Missing ${bystarUidHome}"
	return 101
    fi

    if [ ! -d ${bystarUidHome}/BAGP ] ; then
	EH_problem "Missing ${bystarUidHome}/BAGP"
	return 101
    fi

    opDo fileParamsLoadVarsFromBaseDir  ${bystarUidHome}/BAGP 2> /dev/null
}


function masterAcctBagpLoad {
  EH_assert [[ $# -eq 0 ]]

  if [ "${cp_MasterAcct}_" == "_" ] ; then
    EH_problem "Missing Master Acct"
    return 101
  fi

  paramsFileBaseDir=$( FN_absolutePathGet ~${cp_MasterAcct}/BAGP )
  
  if [[ -d ${paramsFileBaseDir} ]] ; then 
      opDoExit cd ${paramsFileBaseDir}
  else
      EH_problem "Missing ${paramsFileBaseDir} Directory"
      return 100
  fi

  fileParamsLoadVarsFromBaseDir	${paramsFileBaseDir}	
  
  funcName=cpf_$( FN_nonDirsPart ${paramsFileBaseDir} )

  tmpFileName="/tmp/codeGen.masterAcctBagpLoad.$$"

  fileParamsCodeGenOutput ${paramsFileBaseDir} "master" > ${tmpFileName}

   .  ${tmpFileName}

   ${funcName}

   opDo rm ${tmpFileName}
}



function nextUserId {

  typeset groupName="$1"

  opAcctUidGidAnalyze ${groupName}
  integer nextid=`cat ${iv_uidPolicy_homeDir}/nextid`
  echo $nextid
  if [[ "${G_runMode}_" == "showOnly_" ]] ; then
    return 0
  else
    integer new_nextid=`expr ${nextid} + 1`   
    echo ${new_nextid} > ${iv_uidPolicy_homeDir}/nextid
  fi
}

function bystarBacsAcctsList {
  EH_assert [[ $# -ge 0 ]]
  
  #acctsList=$(cat /etc/passwd | egrep \'^ea-[0-9]\*:\|sa-[0-9]\*:\' | cut -d: -f1 )
  acctsList=$(cat /etc/passwd | egrep '^[a-z][a-z]-[0-9]*:' | cut -d: -f1 )
 
  if [[ -z ${acctsList} ]] ; then
    return 101
  fi
  
  echo ${acctsList}

  return 0
}

#
# VERY DIRTY. There should just be one bystarAcctAnalyze
#

function bystarAcctPrefixAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bystar_acct_acctTypePrefix=$1

    case ${bystar_acct_acctTypePrefix} in 
      "ea")
	    bystarUidGidTag="smb"
	    ;;
      "ma")
	    bystarUidGidTag="memory"
	    ;;
      "mu")
	    bystarUidGidTag="memoryUser"
	    ;;
      "sa")
	    bystarUidGidTag="subscriber"
	    ;;
      "ua")
	    bystarUidGidTag="user"
	    ;;
      "aa")
	    bystarUidGidTag="alias"
	    ;;
      "au")
	    bystarUidGidTag="aliasUsr"
	    ;;
      "ca")
	    bystarUidGidTag="reserved"
	    ;;
	*)
	    EH_problem "Unknown ${bystar_acct_acctTypePrefix}"
	    return 101
    esac
    opAcctUidGidAnalyze ${bystarUidGidTag}

    case ${bystar_acct_acctTypePrefix} in 
      "ea")
	    bystarServiceType="BYSMB"
	    bystarServiceSupportType="COMMITTED"
	    bystarDomainsList=("bysmb.net" "bysmb.com" "libresite.org")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_Domain1}/${cp_Domain2}"
	    ;;
      "ma")
	    bystarServiceType="BYMEMORY"
	    bystarServiceSupportType="COMMITTED"
	    bystarDomainsList=("bymemory.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
	    ;;
      "mu")
	    bystarServiceType="BYMEMORY"
	    bystarServiceSupportType="TRIAL"
	    bystarDomainsList=("bymemory.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
	    ;;
      "sa")
	    bystarUidGidTag="subscriber"
	    bystarServiceType="BYNAME"
	    bystarServiceSupportType="COMMITTED"
	    bystarDomainsList=("byname.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
	    ;;
      "ua")
	    bystarUidGidTag="user"
	    bystarServiceType="BYNAME"
	    bystarServiceSupportType="TRIAL"
	    bystarDomainsList=("byname.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
	    ;;
      "aa")
	    bystarServiceType="BYALIAS"
	    bystarServiceSupportType="COMMITTED"
	    bystarDomainsList=("byname.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
	    ;;
      "au")
	    bystarUidGidTag="aliasusr"
	    bystarServiceType="BYALIAS"
	    bystarServiceSupportType="TRIAL"
	    bystarDomainsList=("byalias.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
	    ;;
      "ca")
	    bystarServiceType="BCA"
	    bystarServiceSupportType="COMMITTED"
	    bystarDomainsList=("BCA")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_acctNu}"
	    ;;
	*)
	    EH_problem "Unknown ${bystar_acct_acctTypePrefix}"
	    return 101
    esac
  return 0
}


function bystarAcctAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bystarUid=$1

  opAcctInfoGet ${bystarUid}
  EH_retOnFail

  bystar_acct_uid=${opAcct_uid}
  bystar_acct_homedir=${opAcct_homeDir}
  bystar_acct_NSPdir=${opAcct_homeDir}/NSP
  bystar_acct_acctTypePrefix=${bystarUid%%-*}

  bystar_acct_decryptedPasswd=$( bystarAcctAdmin.sh -p bystarUid="${bystarUid}" -i acctPasswdGet )
  bystarUidPasswdDecrypted=${bystar_acct_decryptedPasswd}

    bystarAcctPrefixAnalyze ${bystar_acct_acctTypePrefix}
    case ${bystar_acct_acctTypePrefix} in 
      "ea")
	    bystarServiceType="BYSMB"
	    bystarServiceSupportType="COMMITTED"
	    ;;
      "ma")
	    bystarServiceType="BYMEMORY"
	    bystarServiceSupportType="COMMITTED"
	    ;;
      "mu")
	    bystarServiceType="BYMEMORY"
	    bystarServiceSupportType="TRIAL"
	    ;;
      "sa")
	    bystarServiceType="BYNAME"
	    bystarServiceSupportType="COMMITTED"
	    ;;
      "ua")
	    bystarServiceType="BYNAME"
	    bystarServiceSupportType="TRIAL"
	    ;;
      "aa")
	    bystarServiceType="BYALIAS"
	    bystarServiceSupportType="COMMITTED"
	    ;;
      "au")
	    bystarServiceType="BYALIAS"
	    bystarServiceSupportType="TRIAL"
	    ;;
      "ca")
	    bystarServiceType="BCA"
	    bystarServiceSupportType="COMMITTED"
	    ;;
	*)
	    EH_problem "Unknown ${bystar_acct_acctTypePrefix}"
	    return 101
    esac

   bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
   opDo fileParamsLoadVarsFromBaseDir  ${bystarUidHome}/BAGP 2> /dev/null


  #. ${bystar_acct_NSPdir}/bystarSubscriberProfiles.nsp

  #if [[ "${bystar_acct_acctTypePrefix}_" == "ua_" ]] ; then
  #typeset subsSelectorType="t"
  #else
  #typeset subsSelectorType=""
  #fi
  #bystar_acct_baseDomain="${iv_subsFirstName}.${iv_subsLastName}.${subsSelectorType}${iv_subsSelector}.${bystarCluster_myDomain}"
  #bystar_acct_numberDomain="${bystar_acct_uid}.${bystarCluster_myDomainByNumber}"
  return 0
}



function basicInfoLoad {
  typeset domainHost=${1}

  if [[ "${domainHost}_" == "bysmb.net_" || "${domainHost}_" == "bysmb.com_" || "${domainHost}_" == "libresite.org_" ]] ; then
    acct_group_uid="smb"
    acct_type="ea"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${domainName} ${domainNameExt}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${domainNameExt}/${domainName}"
  elif [[ "${domainHost}_" == "bymemory.net_" ]] ; then
    acct_group_uid="memory"
    acct_type="ma"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_FirstName} ${cp_LastName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
  elif [[ "${domainHost}_" == "bymemory.com_" ]] ; then
    acct_group_uid="memusr"
    acct_type="mu"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_FirstName} ${cp_LastName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
  elif [[ "${domainHost}_" == "byalias.net_" ]] ; then
    acct_group_uid="alias"
    acct_type="aa"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${aliasName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
  elif [[ "${domainHost}_" == "byalias.com_" ]] ; then
    acct_group_uid="aliasusr"
    acct_type="au"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${aliasName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
  elif [[ "${domainHost}_" == "byname.net_" ]] ; then
    acct_group_uid="subscriber"
    acct_type="sa"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="sa/1/${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/1/${cp_LastName}/${cp_FirstName}"
  elif [[ "${domainHost}_" == "byname.com_" ]] ; then
    acct_group_uid="user"
    acct_type="ua"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="ua/1/${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${cp_acctUidHome}"
  elif [[ "${domainHost}_" == "reserved_" ]] ; then
    acct_group_uid="reserved"
    acct_type="ca"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${assignedUserIdNumber}"
  else
    EH_problem "Unknown domainHost=${domainHost}"
  fi

}

function checkAcctExist {

  typeset thisName="$@"

  typeset inEtcPasswd_userid=`cat /etc/passwd | grep -i ":${thisName}:" | cut -d: -f1`
  
  if [[ -n ${inEtcPasswd_userid} ]] ; then
    print "${inEtcPasswd_userid}"
    return 1
  else
    print "none"
    return 0
  fi
}


function developerVerify {
  if [ "${developer}X" == "NOTX" ] ; then
    EH_oops "developer has to be specified."
    exit 1
  fi

  case ${cvsMode} in
    "READ")
      cvsRootParameter="cvsRoot_bySourceCvs1Pserver"
      readEditPathOffSet="/readonly"
      ;;
    "EDIT")
      cvsRootParameter="cvsRoot_bySourceCvs1Ssh"
      readEditPathOffSet=""
      ;;
    *)
	  EH_problem "unknown cvsMode ${cvsMode}"
	  ;;
  esac

  mirrorBystarAccountsBase="/mirror/bystar/accounts"

}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== bystarSrAnalyze
_CommentEnd_

function bystarSrAnalyze {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${sr}" ] ; then
	EH_problem "Missing Service Realiztion Specification"
	lpReturn 101
    fi

    srBaseDir="${bystarUidHome}/${sr}"

    if [ ! -d ${srBaseDir} ] ; then 
	EH_problem "Missing srBaseDir=${srBaseDir}"
	lpReturn 101
    fi

    srAgent="${bystarUidHome}/${sr}/bsrAgent.sh"

    if [ ! -f ${srAgent} ] ; then 
	srAgent="${bystarUidHome}/${sr}/srAgent.sh"
	if [ ! -f ${srAgent} ] ; then 
	    EH_problem "Missing srAgent=${srAgent} and also missing bsrAgent.sh"
	    lpReturn 101
	fi
    fi

    srDomName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srDomNameGet 2> /dev/null )
    if [ -z ${srDomName} ] ; then 
	EH_problem "Blank srDomName"
    fi 

    srFqdn=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srFqdnGet 2> /dev/null )
    if [ -z ${srFqdn} ] ; then 
	EH_problem "Blank srFqdn"
    fi 

    svcName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcNameGet 2> /dev/null )
    if [ -z ${svcName} ] ; then 
	EH_problem "Blank svcName"
    fi 

    svcCapabilityName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityNameGet 2> /dev/null )
    if [ -z ${svcCapabilityName} ] ; then 
	EH_problem "Blank svcCapabilityName"
    fi 

    svcCapabilityAgent=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityAgentGet 2> /dev/null )
    if [ -z ${svcCapabilityAgent} ] ; then 
	EH_problem "Blank svcCapabilityAgent"
    fi 

    svcCapabilityFlavor=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityFlavorGet 2> /dev/null )
    if [ -z ${svcCapabilityFlavor} ] ; then 
	EH_problem "Blank svcCapabilityFlavor"
    fi 
    
    srSvcBaseLogs=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseLogs 2> /dev/null )
    if [ -z ${srSvcBaseLogs} ] ; then 
	EH_problem "Blank srSvcBaseLogs"
    fi 

    srSvcBaseData=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseData 2> /dev/null )
    if [ -z ${srSvcBaseData} ] ; then 
	EH_problem "Blank srSvcBaseData"
    fi 

    srSvcBaseControl=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseControl 2> /dev/null )
    if [ -z ${srSvcBaseControl} ] ; then 
	EH_problem "Blank srSvcBaseControl"
    fi 

    srSvcBaseTmp=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseTmp 2> /dev/null )
    if [ -z ${srSvcBaseTmp} ] ; then 
	EH_problem "Blank srSvcBaseTmp"
    fi 

    srSvcBaseMailDir=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseMailDir 2> /dev/null )
    if [ -z ${srSvcBaseMailDir} ] ; then 
	EH_problem "Blank srSvcBaseMailDir"
    fi 
    

    # Historic -- Obsoleted
    # srLogsBase=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srLogsBase  2> /dev/null )
    # if [ -z ${srLogsBase} ] ; then 
    # 	EH_problem "Blank srLogsBase"
    # fi 

    # Historic -- Obsoleted
    srA2LogBaseDir=$(vis_srA2LogBaseDirGet ${srFqdn})
    if [ -z "${srA2LogBaseDir}" ] ; then
    	EH_problem "Missing srA2LogBaseDir"
    	lpReturn
    fi


    #echo ${bystarUid} ${bystarUidHome} ${sr} ${srFqdn}

    return
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== srA2VirDomFileNameGet -- Name Of The File Based on srFqdn
_CommentEnd_


function vis_srBaseDirGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bystarUidHome} and \${sr} using bsrAgent.sh get srFqdn
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bystarUidCentralPrep
    opDoRet bystarAcctAnalyze ${bystarUid}

    if [ -z "${sr}" ] ; then
	EH_problem ""
	lpReturn
    fi

    echo ${bystarUidHome}/${sr}

    lpReturn
}


function vis_srFqdnGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bystarUidHome} and \${sr} using bsrAgent.sh get srFqdn
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset srBaseDir="$1"
    typeset srFqdn=$( inBaseDirDo ${srBaseDir} bsrAgent.sh -i srFqdnGet )

    echo ${srFqdn}

    lpReturn
}

function vis_srA2LogBaseDirGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bystarUidCentralPrep
    opDoRet bystarAcctAnalyze ${bystarUid}

    typeset srFqdn=$1

    echo ${bystarUidHome}/var/log/apache2/${srFqdn}

    lpReturn
}


function vis_srA2VirDomFileNameGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset srFqdn=$(vis_srFqdnGet $(vis_srBaseDirGet))
    if [ -z "${srFqdn}" ] ; then
	EH_problem ""
	lpReturn
    fi

    echo "/etc/apache2/sites-available/${srFqdn}.conf"

    lpReturn
}


    # if [ -z "${sr}" ] ; then
    # 	EH_problem ""
    # 	lpReturn
    # fi

    # typeset srBaseDir=$(vis_srBaseDirGet)
    # if [ -z "${srBaseDir}" ] ; then
    # 	EH_problem ""
    # 	lpReturn
    # fi

    # typeset srFqdn=$(vis_srFqdnGet ${srBaseDir})
    # if [ -z "${srFqdn}" ] ; then
    # 	EH_problem ""
    # 	lpReturn
    # fi

    # typeset srA2LogBaseDir=$(vis_srA2LogBaseDirGet ${srFqdn})
    # if [ -z "${srA2LogBaseDir}" ] ; then
    # 	EH_problem ""
    # 	lpReturn
    # fi
