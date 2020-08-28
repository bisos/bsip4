#!/bin/osmtKsh

# 
# NOTYET
# Add opDoAtAsRunMode
#
# opDoAtAsMode= "runOnly" "runShow" "showOnly"
# Also can be overRidden with a command option -m
#

. ${opBinBase}/opAcctLib.sh

# ./lpInBaseDirDo.libSh
. ${opBinBase}/lpInBaseDirDo.libSh

typeset destHost="localhost"
typeset user=${opRunAcctName}
typeset runMode="runShow"

function opDoAtAs {
  #set -x
  #G_abortIfNotRunningAsRoot

  typeset G_argsOrig=$@
  typeset G_progName=`FN_nonDirsPart ${0}`

  while getopts h:u:m:? c
  do
    case $c in
      h)
	 destHost="${OPTARG}"
	 ;;
      u)
	 user="${OPTARG}"
	 ;;
      m)
	 runMode="${OPTARG}"
	 ;;
      \?)
          opDoAtAsUsage
	  return 2
	  ;;
    esac
  done
  
  shift $((OPTIND-1))

  if [ $# -eq 0 ] ; then
    echo "Command String is mandatory, specify"
    opDoAtAsUsage
  fi

  # NOTYET, check for local host,
  # run According to mode
  #

  typeset retVal
  IsDestHostALocalHost ; retVal=$?

  if [ ${retVal} == 0 ] ; then   # destHost=localhost
    case ${user} in
      "osmt" | "root")
      # MB: NOTYET, what if it $1 is a function not a file
      opDoAtAsRunMode "$@"
         #opDoAtAsRunMode "sudo env PATH=$PATH $@"
	 #TM_trace 7 "Running: sudo env PATH=$PATH $@"
	 #sudo env PATH=$PATH $@
	 ;;
      *)
         opDoAtAsRunMode "$@"
	 #echo "Running: $@"
	 #case 'runMode'
	 #$@
	 ;;
    esac

  else
    hostIsInKnownHostsFile ; knownHostRetVal=$?

    if [ ${knownHostRetVal} == 0 ] ; then

      case ${user} in
	"root")
	   logNameIsInOSMTAuthKeysFile ; retVal=$?
	   if [ ${retVal} == 0 ] ; then
	    opDoAtAsRunMode "ssh osmt@${destHost} cd ${opBinBase} ; sudo env PATH=$PATH $@"
	   fi
	   ;;
	"osmt")
           logNameIsInOSMTAuthKeysFile ; retVal=$?
	   if [ ${retVal} == 0 ] ; then
	     opDoAtAsRunMode "ssh ${user}@${destHost} cd ${opBinBase} ; sudo env PATH=$PATH $@"
	   fi
	   ;;
	*)
	   opDoAtAsRunMode "ssh ${user}@${destHost} $@"
	   ;;
      esac

    else
      echo "Host are not found"
      exit 1
    fi
  fi
}

function IsDestHostALocalHost {

  typeset thisHost="${opRunHostName}"

  if [ "${destHost}X" == "localhostX" -o "${destHost}X" == "${thisHost}X" ]; then
    TM_trace "destHost is a localhost"
    return 0
  else
    TM_trace "destHost is not a localhost"
    return 2
  fi

}


function hostIsInKnownHostsFile {
  #set -x
  typeset currentUser=${opRunAcctName}
  opAcctInfoGet ${currentUser}

  typeset sshKnownHostFile="${opAcct_homeDir}/.ssh/known_hosts2"

  if test -f ${sshKnownHostFile} ; then
    hostIsKnown=`cat ${sshKnownHostFile} | egrep "${destHost}"`
  else
    echo "The file: ${sshKnownHostFile} does not exist."
    exit 1
  fi

  if [ "${hostIsKnown}X" != "X" ] ; then
    TM_trace 7 "host is in known_hosts2 file"
    return 0
  else
    EH_oops "host is not in known_hosts2 file"
    exit 1
  fi
}

function logNameIsInOSMTAuthKeysFile {
  #set -x
  opAcctInfoGet osmt
  currentUser=${opRunAcctName}

  userIsInAuthKeys=`cat ${opAcct_homeDir}/.ssh/authorized_keys2 | egrep "${currentUser}@"` ; retVal=$?
  
  if [ ${retVal} != 0 ] ; then
    EH_problem "You have permission problem to check for ${opAcct_homeDir}/.ssh/authorized_keys2"
    exit 3
  else
    if [ "${userIsInAuthKeys}X" != "X" ] ; then
      TM_trace 7 "user is authorized to log in w/o passwd"
      return 0
    else
      EH_problem "user is not authorized to log in w/o passwd"
      exit 1
    fi
  fi
}

function opDoAtAsUsage {

  EH_problem "${G_progName}: unknown option ${OPTARG}"
  print -u2 "Usage: ${G_progName} [-h destinationHost] [-u user] stringCmd"
}

function opDoAtAsRunMode {
  #set -x
  case ${runMode} in
    "runOnly")
       eval $@
       ;;
    "runShow")
       echo "Running: $@"
       eval $@
       ;;
    "showOnly")
       echo "Running: $@"
       ;;
    *)
       EH_problem "Invalid runMode: ${runMode}"
       echo "KSH_VER=$KSH_VERSION"
       return 1
       ;;
  esac
}

function doAtAsModeSet {

  typeset m_doingDefault="doit"
  m_doing=$1

  if  test $# -ne 1 ; then
    if test $# -eq 0 ; then m_doing=${m_doingDefault}; 
    else EH_problem "Too many args"; return 1; fi;
  fi

  case ${m_doing} in
    "doNot")
        echo "showOnly"
	;;
    "doit")
        echo "runOnly"
	;;
    *)
       EH_problem "Unknown Qualifier ${m_doing}"
       return 2
       ;;
  esac
}

