#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxo_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxo_lib :: Loading Library -- /bisos/bsip/bin/bxo_lib.sh"
else
    TM_trace 7 "bxo_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxo_lib.sh" ; return
fi
####+END:

# ./opAcctLib.sh
. ${opBinBase}/opAcctLib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh


function bxoGitServerPrivTag { echo "bxoPriv"; }   # used to prefix entries in ~usg/.ssh/config and corresponding git urls

function bxoGitServerSshKeyName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used both for pushing key to server and also for keeping at ~usg/.ssh.
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    local gitServerType=$1
    local bxoId=$2
    local sshKeyType=$3

    echo "${gitServerType}_${bxoId}_${sshKeyType}"
}

function bxoGitServerSshAlias {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used as Host in ~usg/.ssh/config -- and ~usg/.ssh/configSeg/bxoPriv_as-bisos.configSeg.
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    local gitServerType=$1
    local bxoId=$2

    echo "${gitServerType}_${bxoId}"
}

function rbxeSshBase { echo "rbxe/credentials/ssh"; }

function vis_bxoSshAcctKeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local retVal=0

    lpDo lcaSshAdmin.sh ${G_commandOptions} -p localUser=${bxoId} -p sshDir=rbxe/credentials/ssh -i userKeyVerify
    retVal=$?

    lpReturn ${retVal}
}

function vis_bxoKindTypeFacility {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
For example for bxoId=pir_privRegistrar, facility=bxioRegistrar.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    local bxeDescBase="${bxoHome}/rbxe/bxeDesc"
    
    local bxeKind=$( fileParamManage.py  -i fileParamRead  ${bxeDescBase} bxeKind )    
    local bxeType=$( fileParamManage.py  -i fileParamRead  ${bxeDescBase} bxeType )

    local bxeTypeWord=${bxeType^}

    local bxeKindTag=""
    
    case ${bxeKind} in 
      real)
	    bxeKindTag="bxro"
	    ;;
      info)
	    bxeKindTag="bxio"
	    ;;
      svc)
	    bxeKindTag="bxso"
	    ;;
      container)
	    bxeKindTag="bxco"
	    ;;
      *)
	    EH_problem "Unknown bxeKind=${bxeKind}"
	    return 101
    esac

    echo "${bxeKindTag}${bxeTypeWord}.sh"
    
    lpReturn
}



function vis_bxoSshKeyUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    lpDo lcaSshAdmin.sh ${G_commandOptions} -p localUser=${bxoId} -p sshDir=rbxe/credentials/ssh -i userKeyUpdate

    local curUser=$( id -u -n )    
    bxoHome=$( FN_absolutePathGet ~${bxoId} )
    lpDo sudo chown -R "${curUser}":bisos ${bxoHome}/rbxe/credentials/ssh
    
    lpReturn
}

function vis_bxoIdObtainForPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local inPath="$1"
    local canonInPath=$( FN_absolutePathGet ${inPath} )
    local thisElem=""

    typeset bxoBaseFound="FALSE"

    pathToArray ${canonInPath}

    set ${pathArray[@]}

    for thisElem in ${pathArray[@]} ; do
	#echo "${thisElem}"
	shift
	if [[ "${bxoBaseFound}" == "TRUE" ]] ; then
	    break
	fi
	if [[ "${thisElem}" == "iso" ]] ; then
	    bxoBaseFound="TRUE"
	fi
    done
    
    if [[ "${bxoBaseFound}" != "TRUE" ]] ; then
	ANT_raw "bxoId not found"
	lpReturn 101
    fi

    echo "${thisElem}"
    lpReturn
}

function vis_repoCreateAndPushBasedOnPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local repoPath="$1"
    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    if [ ! -z "${gitRemote}" ] ; then
	EH_problem "${canonRepoPath} Is Already A Git Repo -- Skipped"
	lpReturn 101
    fi

    local baseName=$( basename "${canonRepoPath}" )
    
    bxoId=$( vis_bxoIdObtainForPath "${canonRepoPath}" )

    lpDo vis_repoCreateAndPush "${baseName}" "${canonRepoPath}" priv
    
    lpReturn
}


function vis_repoCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    EH_assert [ ! -z "${bxoId}" ]
    
    local repoName="$1"
    local repoPath="$2"
    local gitServerSelector="$3"

    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    if [ ! -z "${gitRemote}" ] ; then
	EH_problem "${canonRepoPath} Is Already A Git Repo -- Skipped"
	lpReturn 101
    fi

    #local gitServerUrl=git@bxoGit-${gitServerSelector}.${bxoId}:${bxoId}/${repoName}.git
    local gitServerUrl=git@bxoPriv_${bxoId}:${bxoId}/${repoName}.git    

    local curUser=$( id -u -n )

    if ! lpDo bxoGitlab.py -v 20 --bxoId="${bxoId}" -i reposCreate ${repoName} ; then
	ANT_cooked "${repoName} exists -- git push skipped"
	lpReturn 101
    fi

    #lpDo sudo chown -R "${curUser}":bisos ${baseDir}

    # previous example of using bxoId user: 
    # inBaseDirDo ${bxoHome}/rbxe sudo -u ${bxoId} git init
    
    inBaseDirDo ${canonRepoPath} git init    
    inBaseDirDo ${canonRepoPath} git add .
    inBaseDirDo ${canonRepoPath} git commit -m "Initial_bxeRealize.sh_commit_of_${canonRepoPath}"

    inBaseDirDo ${canonRepoPath} git remote add origin ${gitServerUrl}
    inBaseDirDo ${canonRepoPath} git remote -v
    inBaseDirDo ${canonRepoPath} git push origin master

    lpReturn
}


function vis_bxoConstructBaseDir_obtain  {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local privacy="$1"

    echo /bisos/var/bxo/construct/${privacy}

    lpReturn
}	


function vis_obtainRepoSnapshot {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Dispatches to priv/group/all gitServers to obtain repo snap shot.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [ ! -z "${bxoId}" ]

    local repoName=$1

    if [ -z "${privacy}" ] ; then
	privacy="priv"
    fi

    case ${privacy} in
	"priv"|"private")
	    lpDo obtainRepoSnapshot_priv $@
	    ;;
	"group")
	    lpDo obtainRepoSnapshot_group $@
	    ;;
	"all"|"public")
	    lpDo obtainRepoSnapshot_all $@
	    ;;
	"allGithub")
	    lpDo obtainRepoSnapshot_allGithub $@
	    ;;
	*)
	    EH_problem "privacy=${privacy} -- Unexpected"
	    return
	    ;;
      esac
    
    lpReturn
}

function obtainRepoSnapshot_priv {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Obtain repoSnapshot.tar in /bisos/var/bxo/construct (NOTYET to be verified)
** Untar the file in a .git dir
** clone based on the .git dir
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    local repoTarFile="${bxoConstructBaseDir}/${bxoId}/${repoName}-gitSnapot.tar"
    local gitRepoBaseDir="${bxoConstructBaseDir}/${bxoId}/${repoName}.git"

    opDo FN_dirCreatePathIfNotThere "${bxoConstructBaseDir}/${bxoId}"
    
    lpDo bxoGitlab.py -v 20 --bxoId=${bxoId} --outFile="${repoTarFile}"  -i repoSnapshot ${repoName}

    lpDo mkdir "${gitRepoBaseDir}"

    inBaseDirDo "${gitRepoBaseDir}" tar xf "${repoTarFile}"

    lpDo git clone "${gitRepoBaseDir}" "${bxoConstructBaseDir}/${bxoId}/${repoName}"
    
    lpReturn
}



function obtainRepoSnapshot_group {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET -- TBD
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET"
    
    lpReturn
}

function obtainRepoSnapshot_all {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET --
** anon git clone ${bxoId}.rbxe
** anon git clone ${bxoId}.maps
Based on those run one of the _mapFile.sh
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET"
    
    lpReturn
}


function obtainRepoSnapshot_allGithub {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET --
** anon git clone ${bxoId}.rbxe
** anon git clone ${bxoId}.maps
Based on those run one of the _mapFile.sh
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [ ! -z "${bxoId}" ]
    EH_assert [ ! -z "${privacy}" ]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET GITHUB ${bxoConstructBaseDir} ${bxoId}"

    opDo FN_dirCreatePathIfNotThere "${bxoConstructBaseDir}/${bxoId}"
    
    lpDo git clone git://github.com/bxObjects/${bxoId}.${repoName}.git "${bxoConstructBaseDir}/${bxoId}/${repoName}"

    
    lpReturn
}


#
# Left Over From OSMT -- To be sorted.
#

function bxoNextDisposableScopeAcctNu {
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

function bxoNextLocalScopeAcctNu {
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


function bxoNextControlledAcct {
  EH_assert [[ $# -eq  0 ]]

    nextNu=$( bxoNextLocalScopeAcctNu )
    echo ca-${nextNu}
}

function bxoIsControlledAcct {
  EH_assert [[ $# -eq  1 ]]

  bxoUid=$1	
  bxoBagpLoad

  if [ "${cp_MasterAcct}_" == "_" ] ; then
    #EH_problem "Missing Master Acct"
    return 101
  fi
  return 0
}

function bxoIsMasterAcct {
  EH_assert [[ $# -eq 1 ]]
  return 0
}

function bxoBacpBaseDirVerifyAndFix {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxoUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bxoUid}_" != "_" ]]

    bxoUidHome=$( FN_absolutePathGet ~${bxoUid} )
    if [ ! -d ${bxoUidHome} ] ; then
	EH_problem "Missing ${bxoUidHome}"
	return 101
    fi

    if [ ! -d ${bxoUidHome}/BACP ] ; then
	FN_dirCreatePathIfNotThere ${bxoUidHome}/BACP
    fi
}

function bxoBagpLoad {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxoUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bxoUid}_" != "_" ]]


    bxoUidHome=$( FN_absolutePathGet ~${bxoUid} )

    if [ ! -d ${bxoUidHome} ] ; then
	EH_problem "Missing ${bxoUidHome}"
	return 101
    fi

    if [ ! -d ${bxoUidHome}/BAGP ] ; then
	EH_problem "Missing ${bxoUidHome}/BAGP"
	return 101
    fi

    opDo fileParamsLoadVarsFromBaseDir  ${bxoUidHome}/BAGP 2> /dev/null
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

function bxoBacsAcctsList {
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
# VERY DIRTY. There should just be one bxoAcctAnalyze
#

function bxoAcctPrefixAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bxo_acct_acctTypePrefix=$1

    case ${bxo_acct_acctTypePrefix} in 
      "ea")
	    bxoUidGidTag="smb"
	    ;;
      "ma")
	    bxoUidGidTag="memory"
	    ;;
      "mu")
	    bxoUidGidTag="memoryUser"
	    ;;
      "sa")
	    bxoUidGidTag="subscriber"
	    ;;
      "ua")
	    bxoUidGidTag="user"
	    ;;
      "aa")
	    bxoUidGidTag="alias"
	    ;;
      "au")
	    bxoUidGidTag="aliasUsr"
	    ;;
      "ca")
	    bxoUidGidTag="reserved"
	    ;;

      ##
      #####  BXO Generation
      ##
      "ai")
	    bxoUidGidTag="autonomousIndividual"
	    ;;
      *)
	    EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
	    return 101
    esac
    opAcctUidGidAnalyze ${bxoUidGidTag}

    case ${bxo_acct_acctTypePrefix} in 
      "ea")
	    bxoServiceType="BYSMB"
	    bxoServiceSupportType="COMMITTED"
	    bxoDomainsList=("bysmb.net" "bysmb.com" "libresite.org")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_Domain1}/${cp_Domain2}"
	    ;;
      "ma")
	    bxoServiceType="BYMEMORY"
	    bxoServiceSupportType="COMMITTED"
	    bxoDomainsList=("bymemory.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
	    ;;
      "mu")
	    bxoServiceType="BYMEMORY"
	    bxoServiceSupportType="TRIAL"
	    bxoDomainsList=("bymemory.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
	    ;;
      "sa")
	    bxoUidGidTag="subscriber"
	    bxoServiceType="BYNAME"
	    bxoServiceSupportType="COMMITTED"
	    bxoDomainsList=("byname.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
	    ;;
      "ua")
	    bxoUidGidTag="user"
	    bxoServiceType="BYNAME"
	    bxoServiceSupportType="TRIAL"
	    bxoDomainsList=("byname.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
	    ;;
      "aa")
	    bxoServiceType="BYALIAS"
	    bxoServiceSupportType="COMMITTED"
	    bxoDomainsList=("byname.net")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
	    ;;
      "au")
	    bxoUidGidTag="aliasusr"
	    bxoServiceType="BYALIAS"
	    bxoServiceSupportType="TRIAL"
	    bxoDomainsList=("byalias.com")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
	    ;;
      "ca")
	    bxoServiceType="BCA"
	    bxoServiceSupportType="COMMITTED"
	    bxoDomainsList=("BCA")
	    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_acctNu}"
	    ;;
      ##
      #####  BXO Generation
      ##
      "ai")
	    bxoServiceType="BXO"
	    bxoServiceSupportType="BXO"
	    bxoDomainsList=("BXO")
	    # thisHomeDir=$( FN_absolutePathGet ${cp_acctNu} )
	    ;;
      
      *)
	    EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
	    return 101
    esac
  return 0
}


function bxoAcctAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bxoUid=$1

  opAcctInfoGet ${bxoUid}
  EH_retOnFail

  bxo_acct_uid=${opAcct_uid}
  bxo_acct_homedir=${opAcct_homeDir}
  bxo_acct_NSPdir=${opAcct_homeDir}/NSP
  bxo_acct_acctTypePrefix=${bxoUid%%-*}

  #bxo_acct_decryptedPasswd=$( bxoAcctAdmin.sh -p bxoUid="${bxoUid}" -i acctPasswdGet )
  bxo_acct_decryptedPasswd="MissingBystarAcctAdmin.sh"
  bxoUidPasswdDecrypted=${bxo_acct_decryptedPasswd}

    bxoAcctPrefixAnalyze ${bxo_acct_acctTypePrefix}
    case ${bxo_acct_acctTypePrefix} in 
      "ea")
	    bxoServiceType="BYSMB"
	    bxoServiceSupportType="COMMITTED"
	    ;;
      "ma")
	    bxoServiceType="BYMEMORY"
	    bxoServiceSupportType="COMMITTED"
	    ;;
      "mu")
	    bxoServiceType="BYMEMORY"
	    bxoServiceSupportType="TRIAL"
	    ;;
      "sa")
	    bxoServiceType="BYNAME"
	    bxoServiceSupportType="COMMITTED"
	    ;;
      "ua")
	    bxoServiceType="BYNAME"
	    bxoServiceSupportType="TRIAL"
	    ;;
      "aa")
	    bxoServiceType="BYALIAS"
	    bxoServiceSupportType="COMMITTED"
	    ;;
      "au")
	    bxoServiceType="BYALIAS"
	    bxoServiceSupportType="TRIAL"
	    ;;
      "ca")
	    bxoServiceType="BCA"
	    bxoServiceSupportType="COMMITTED"
	    ;;

      ##
      #####  BXO Generation
      ##
      "ai")
	    bxoServiceType="BXO"
	    bxoServiceSupportType="BXO"
	    ;;
	*)
	    EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
	    return 101
    esac

   bxoUidHome=$( FN_absolutePathGet ~${bxoUid} )
   opDo fileParamsLoadVarsFromBaseDir  ${bxoUidHome}/BAGP 2> /dev/null


  #. ${bxo_acct_NSPdir}/bxoSubscriberProfiles.nsp

  #if [[ "${bxo_acct_acctTypePrefix}_" == "ua_" ]] ; then
  #typeset subsSelectorType="t"
  #else
  #typeset subsSelectorType=""
  #fi
  #bxo_acct_baseDomain="${iv_subsFirstName}.${iv_subsLastName}.${subsSelectorType}${iv_subsSelector}.${bxoCluster_myDomain}"
  #bxo_acct_numberDomain="${bxo_acct_uid}.${bxoCluster_myDomainByNumber}"
  return 0
}

function bxoIdPrepValidate {
    bxoCentralPrep $@
}

function bxoCentralPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Returns none-zero for assertion 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    case ${bxoId} in 
      "")
	    # EH_problem "bxoId=\"\" -- empty/blank -- invalid bxo"
	    lpReturn 101
	    ;;
      "INVALID"|"MANDATORY")
	    EH_problem "bxoId=${bxoId} -- empty/blank -- invalid bxo"
	    lpReturn 101
	    ;;
      "current")
	    lpCurrentsGet
	    #if [ "${currentBystarUid}" != "" ] ; then
	    if [ "${currentBxoId}" != "" ] ; then	    
		bxoId=${currentBxoId}
	    else
		EH_problem "bxoId=current But current is unset -- invalid bxo"
		lpReturn 101
	    fi	
	    ;;
      "prompt")
	    echo -n "Specify bxoId: "
	    read bxoId
	    ;;
      "default")   # e.g., first applicable entry in /etc/passwd
            doNothing
	    ;;	
      "all")
            doNothing
	    ;;	
	*)
	    doNothing
	    ;;
    esac

    #lpDo bxoCentralIsValid 
    bxoCentralIsValid 
    EH_retOnFail

    lpReturn 0
}

function bxoCentralIsValid {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    case ${bxoId} in 
      "all")
	    lpReturn 0
	    ;;
	*)
	    doNothing
    esac

    #
    # Verify that a given buid is in BxCentralInfoBase.
    #

    lpReturn 0
}

#
# NOTYET, Figure if this is totally unused.
#
function bystarCentral {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bxoId}_" != "INVALID_" ]]
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

  mirrorBxoAccountsBase="/mirror/bxo/accounts"

}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== bxoSrAnalyze
_CommentEnd_

function bxoSrAnalyze {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${sr}" ] ; then
	EH_problem "Missing Service Realiztion Specification"
	lpReturn 101
    fi

    srBaseDir="${bxoUidHome}/${sr}"

    if [ ! -d ${srBaseDir} ] ; then 
	EH_problem "Missing srBaseDir=${srBaseDir}"
	lpReturn 101
    fi

    srAgent="${bxoUidHome}/${sr}/bsrAgent.sh"

    if [ ! -f ${srAgent} ] ; then 
	srAgent="${bxoUidHome}/${sr}/srAgent.sh"
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


    #echo ${bxoUid} ${bxoUidHome} ${sr} ${srFqdn}

    return
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== srA2VirDomFileNameGet -- Name Of The File Based on srFqdn
_CommentEnd_


function vis_srBaseDirGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bxoUidHome} and \${sr} using bsrAgent.sh get srFqdn
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoUidCentralPrep
    opDoRet bxoAcctAnalyze ${bxoUid}

    if [ -z "${sr}" ] ; then
	EH_problem ""
	lpReturn
    fi

    echo ${bxoUidHome}/${sr}

    lpReturn
}


function vis_srFqdnGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bxoUidHome} and \${sr} using bsrAgent.sh get srFqdn
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
    EH_assert bxoUidCentralPrep
    opDoRet bxoAcctAnalyze ${bxoUid}

    typeset srFqdn=$1

    echo ${bxoUidHome}/var/log/apache2/${srFqdn}

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

