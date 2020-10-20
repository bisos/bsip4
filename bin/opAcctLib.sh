
# The following variables are set

opAcct_name=""
opAcct_uid=""
opAcct_gid=""
opAcct_homeDir=""
opAcct_shell=""
opAcct_comment=""
opAcct_passwdType=""
opAcct_passwdEncValLinux=""
opAcct_passwdEncValSol=""

function opAcct_systemNoLoginNoHomeCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset thisUser="$1"

    opDo id ${thisUser}
    if [ "$?" = "0" ]; then
	ANT_raw "User '${thisUser}' already exists. Creation Skipped."
	lpReturn 101
    else
	ANT_raw "Adding user account '${thisUser}' to system ..."
	opDo useradd --system --shell /usr/sbin/nologin --home /nonexistent ${thisUser}
    fi

    lpReturn
}


function opAcct_IsUserValid {

  #$1 - loginAcctName
  
  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi 

  if [ "X${opRunOsType}" == "XSunOS" ] ; then
    #fullInfoOnSystem=`/usr/bin/logins -x -o -l $1`
    fullInfoOnSystem=`cat /etc/passwd | egrep "^$1:"`
  elif [ "X${opRunOsType}" == "XLinux" ] ; then
    fullInfoOnSystem=`cat /etc/passwd | egrep "^$1:"`
  fi

  if [ "${fullInfoOnSystem}X" == "X" ] ; then
    TM_trace 7 "The acct $1 does not exist in this system."
    return 1
  else
    TM_trace 7 "The acct $1 exists in this system."
    return 0
  fi
}

function opAcct_loginGivenHomeDir {

  #$1 - given home dir
  
  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi 

  if [ "X${opRunOsType}" == "XSunOS" ] ; then
    #loginName=`/usr/bin/logins -x -o | egrep ":$1:" | cut -d':' -f 1`
    loginName=`cat /etc/passwd | egrep ":$1:" | cut -d':' -f 1`
  elif [ "X${opRunOsType}" == "XLinux" ] ; then
    loginName=`cat /etc/passwd | egrep ":$1:" | cut -d':' -f 1`
  fi

  if [ "${loginName}X" == "X" ] ; then 
    #TM_trace 7 "not found"
    return 1
  else
    echo ${loginName}
    return 0
  fi

}


function opAcctInfoGet {
  # set -x
  # $1 - loginAcctName
  # 

  opAcct_IsUserValid $1 ; retVal=$?

  if [ ${retVal} == 0 ] ; then

    if [ "X${opRunOsType}" == "XSunOS" ] ; then
# Using /etc/passwd
      opAcct_name=`echo ${fullInfoOnSystem} | cut -d: -f1`
      opAcct_uid=`echo ${fullInfoOnSystem} | cut -d: -f3`
      sysSays_acctTypeId=`echo ${fullInfoOnSystem} | cut -d: -f4`
      opAcct_gid=`cat /etc/group | egrep ":${sysSays_acctTypeId}:" | cut -d: -f1`
      opAcct_comment=`echo ${fullInfoOnSystem} | cut -d: -f5`
      opAcct_homeDir=`echo ${fullInfoOnSystem} | cut -d: -f6`
      opAcct_shell=`echo ${fullInfoOnSystem} | cut -d: -f7`

# If using logins, uncomment this one
#       opAcct_name=`echo ${fullInfoOnSystem} | cut -d: -f1`
#       opAcct_uid=`echo ${fullInfoOnSystem} | cut -d: -f2`
#       opAcct_gid=`echo ${fullInfoOnSystem} | cut -d: -f3`
#       opAcct_comment=`echo ${fullInfoOnSystem} | cut -d: -f5`
#       opAcct_homeDir=`echo ${fullInfoOnSystem} | cut -d: -f6`
#       opAcct_shell=`echo ${fullInfoOnSystem} | cut -d: -f7`

    elif [ "X${opRunOsType}" == "XLinux" ] ; then

      opAcct_name=`echo ${fullInfoOnSystem} | cut -d: -f1`
      opAcct_uid=`echo ${fullInfoOnSystem} | cut -d: -f3`
      sysSays_acctTypeId=`echo ${fullInfoOnSystem} | cut -d: -f4`
      opAcct_gid=`cat /etc/group | egrep ":${sysSays_acctTypeId}:" | cut -d: -f1`
      opAcct_comment=`echo ${fullInfoOnSystem} | cut -d: -f5`
      opAcct_homeDir=`echo ${fullInfoOnSystem} | cut -d: -f6`
      opAcct_shell=`echo ${fullInfoOnSystem} | cut -d: -f7`

    else

      EH_oops "${opRunOsType} is not supported."
      exit 2
    fi
    TM_trace 7 "The account does exist."
    lpReturn 0
  else
    TM_trace 7 "The account does not exist."
    lpReturn 1
  fi
}

function acctLogins {


  if [ "X${opRunOsType}" == "XSunOS" ] ; then
    #/usr/bin/logins -x -o -l $*
    cat /etc/passwd | egrep "^$*:"
  elif [ "X${opRunOsType}" == "XLinux" ] ; then
    cat /etc/passwd | egrep "^$*:"
  fi
	
}

function prUid {
    # NOTYET, verify number of args
    # $*s should be $1

  if [ "X${opRunOsType}" == "XSunOS" ] ; then
    #logins -x -o -l $* | cut -d: -f1
    cat /etc/passwd | egrep "^$*:" | cut -d: -f1
  elif [ "X${opRunOsType}" == "XLinux" ] ; then
    cat /etc/passwd | egrep "^$*:" | cut -d: -f1
  fi
	
}

function opAcctUidGidAnalyze {
    # # $1=acctType

    EH_assert [[ $# -eq 1 ]]

  #   # /opt/public/osmt/policies/acct/opUidGidAssignments.mma 
  # . ${opPoliciesBase}/acct/opUidGidAssignments.mma

  # targetSubject=item_uidGid_${1}
  #   ${targetSubject}

  # uidPolicy_PasswdFileAcct="${iv_uidPolicy_PasswdFileAcct}"
  # uidPolicy_PasswdIdStart="${iv_uidPolicy_PasswdIdStart}"
  # uidPolicy_PasswdIdEnd="${iv_uidPolicy_PasswdIdEnd}"
  # uidPolicy_loginShell="${iv_uidPolicy_loginShell}"
  # uidPolicy_homeDir="${iv_uidPolicy_homeDir}"
  # groupPolicy_grpName="${iv_groupPolicy_grpName}"
  # groupPolicy_grpId="${iv_groupPolicy_grpId}"
}
