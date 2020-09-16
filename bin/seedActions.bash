#!/bin/bash
#
#

#set -v
#set -x

set -u            # unset vars are an error
#set -e            # exit if pipeline fails  
set -o pipefail   # return is that of rightmost

#IFS=$'\n\t'      #

# set-u fix
G_myName=""
FUNCNAME=""

CURENVBASE=""
opRunOsType=""
opRunSiteName=""
opRunClusterName=""
opRunHostName=""
G_myInvokedName=""
loadSegment=""
opRunDistFamily=""
opRunDistGeneration=""
skipIt=""
tm_setFile=""

#OSMTROOT="/opt/public/osmt"
OSMTROOT="/bisos/core/bsip"

if [ "${OSMTROOT}X" != "X" ] ; then
    if [ -f ${OSMTROOT}/bin/opConfig.sh ] ; then
      .  ${OSMTROOT}/bin/opConfig.sh 
    else
      echo "${OSMTROOT}/bin/opConfig.sh not found.\n"
      exit 1
    fi
else
    if [ -f `dirname $0`/opConfig.sh ] ; then
	.  `dirname $0`/opConfig.sh
    else
      echo "OSMTROOT not set and `dirname $0`/opConfig.sh not found.\n"
      exit 1
    fi
fi


. ${opBase}/lib/ocp-lib.sh
#.  $( dirname $0 )/bsipBases.sh


opBasePathSet

#systemName=`uname -n`
#devlOsType=`uname -s`


###

#PATH=/usr/sbin:/usr/bin:/sbin

# Get options (defaults immediately below):

badUsage=
traceLevel=

Array paramInfo
loadFiles=""

#G_checkMode=""
#G_forceMode=""

G_argsArray=("$@")      # You can then walk through this as for eachArg in "${G_argsArray[@]}" ; do
G_argsOrig="$@"         # This becomes a string and is not good, use $@ instead
G_progName=`FN_nonDirsPart ${0}`



G_humanUser=FALSE

TM_trace 9 ${G_argsOrig}

dotMeParamTmpFile=/tmp/${G_progName}.dotMe.$$

G_runMode="runOnly"
G_runModeCmndOption=" -n runOnly "

G_recordMode=""
G_recordModeCmndOption=""

G_paramCmndOption=""

# set-u fix
G_myName=""
G_checkCmndOption=""
G_verboseCmndOption=""
G_humanCmndOption=""
G_forceModeCmndOption=""
G_forceMode=""
G_checkMode=""

# set-u fix  -- These need to perhaps be placed elsewhere
opRunAcctName=""

visibleFunction=""   # Dec 2019 to address unbound param

while getopts e:T:c:i:p:l:u?n:r:vfh c
do
    case $c in
    T)
	case $OPTARG in
	*[!0-9]* )
	    echo "$0: -T requires a numeric option"
 	    badUsage=TRUE
	    ;;
        [0-9]* )
	    traceLevel=$OPTARG
	    ;;
	esac
	;;
    i)
        visibleFunction="${OPTARG}"   # rest of argv is passed to visibleFunction
	;;
    p)
       leftSide=`ATTR_leftSide "${OPTARG}"`
       rightSide=`ATTR_rightSide "${OPTARG}"`
  
       echo "${leftSide}"="${rightSide}" >> ${dotMeParamTmpFile}

       G_paramCmndOption=" -p ${OPTARG} ${G_paramCmndOption}"
       ;;
    l)
	loadFiles="${loadFiles} ${OPTARG}"
	G_myName=`FN_nonDirsPart ${OPTARG}`
        G_myInvokedName=${OPTARG}
	;;

    c)
	G_checkMode="${OPTARG}"
	G_checkCmndOption=" -c "
	;;

    e)
	# Elaboration Text SimplyIgnored
        elaborationTextSimplyIgnored="${OPTARG}"
	;;

    n)
	case ${OPTARG} in 
	    "runOnly")
		G_runMode="runOnly"
   	        G_runModeCmndOption=" -n runOnly "
		;;
	    "showOnly")
		G_runMode="showOnly"
   	        G_runModeCmndOption=" -n showOnly "
		;;
	    "seeRun")
		G_runMode="seeRun"
   	        G_runModeCmndOption=" -n seeRun "
		;;
	    "showRun")
		G_runMode="showRun"
   	        G_runModeCmndOption=" -n showRun "
		;;
	    "runSafe")
		G_runMode="runSafe"
   	        G_runModeCmndOption=" -n runSafe "
		;;
	    "showProtected")
		G_runMode="showProtected"
   	        G_runModeCmndOption=" -n showProtected "
		;;
	    "showRunProtected")
		G_runMode="showRunProtected"
   	        G_runModeCmndOption=" -n showRunProtected "
		;;
	    *)
		badUsage=TRUE
		;;
	esac
	;;

    r)
	case ${OPTARG} in 
	    "basic")
		G_recordMode="basic"
   	        G_recordModeCmndOption=" -r basic "
		;;
	    *)
		G_recordMode="${OPTARG}"
   	        G_recordModeCmndOption=" -r ${OPTARG} "
		##badUsage=TRUE
		;;
	esac
	;;

    v)
	G_verbose="verbose"
        G_verboseCmndOption=" -v "
	;;

    f)
	G_forceMode="force"
	G_forceModeCmndOption=" -f "
	;;

    h)
	G_humanUser=TRUE
	G_humanCmndOption=" -h "
	;;

    u | \?)
	badUsage=TRUE
	;;
    esac
done

G_commandOptions="${G_checkCmndOption} ${G_runModeCmndOption} ${G_verboseCmndOption} ${G_humanCmndOption} ${G_forceModeCmndOption} ${G_paramCmndOption}"
#echo "G_commandOptions=${G_commandOptions}"

typeset myOptind=$OPTIND

function opMyFullNameGet {
  typeset firstChar=${G_myInvokedName:0:1}

  if [[ "${firstChar}X" == "/X" ]] ; then 
    G_myFullName=${G_myInvokedName}
    G_myFullName=$( FN_absolutePathGet ${G_myFullName} )
    return 
  fi
  
  if [[ -f ${G_myInvokedName} ]] ; then
    G_myFullName=${PWD}/${G_myInvokedName}
  else
    G_myFullName=`which ${G_myName}`
  fi

  G_myFullName=$( FN_absolutePathGet ${G_myFullName} )
  
  if [[ ! -f ${G_myFullName} ]] ; then
     print -u2  ${G_myFullName} not found
     return 1
  fi
}

opMyFullNameGet


if [[ "${G_forceMode}_" != "_" ]] ; then
    export G_forceMode="${G_forceMode}"
fi
if [[ "${G_checkMode}_" != "_" ]] ; then
    export G_checkMode="${G_checkMode}"
    #print -u2 G_checkMode="${G_checkMode}"
fi


#defaultLoadFile=${mmaBinDistBase}/bin/`FN_prefix $0`.load
#    TM_trace 7 "Loading ${defaultLoadFile}"

#if test -f ${defaultLoadFile} ; then
#    TM_trace 7 "Loading ${defaultLoadFile}"
#    . ${defaultLoadFile}
#fi

#
# Load In Parameter Specificication Code 
# and possibly item_ code ...
# 
#

for i in ${loadFiles} ; do
    if test -f ${i} ; then
	TM_trace 7 "Pre Loading: $i"
	loadSegment="PRE"
	. ${i}
    else
	EH_problem "${i} not found: skiping it."
	usage=TRUE
	#exit
    fi
done

#opParamMandatoryVerify
#
# Now that we have all the parameters, get the job done.
#

#
# Bring in post load code
# 

#TM_trace 7  "loadSegment=${loadSegment}"

if [ "${loadSegment}_" == "POST_" ] ; then
for i in ${loadFiles} ; do
    if test -f ${i} ; then
	TM_trace 7 "Post Loading: $i"
	. ${i}
    else
	EH_problem "${i} not found: skiping it."
	usage=TRUE
	#exit
    fi
done
fi

G_preParamHookVal=`ListFuncs | egrep '^G_preParamHook$'`
if [ "${G_preParamHookVal}X" != "X" ] ;   then
  G_preParamHook 
fi

#
# EXECUTE PARAMETER ASSIGNMENTS
#

function iimParamFuncsInvoke {
    EH_assert [[ $# -eq 0 ]]
    declare iimParamFuncsList=$( declare -F | grep iimParam_ | sed -e s/"declare -f "// | cut -d= -f1 )
    for thisFunc in ${iimParamFuncsList} ; do
	#opDo ${thisFunc} # NOTYET, subject this to tracing
	${thisFunc}
    done
}

iimParamFuncsInvoke

if [[ -f ${dotMeParamTmpFile} ]] ; then
  . ${dotMeParamTmpFile}
  rm ${dotMeParamTmpFile}
fi


G_postParamHookVal=`ListFuncs | egrep '^G_postParamHook$'`
if [ "${G_postParamHookVal}X" != "X" ] ;   then
  G_postParamHook 
fi


#
# VERIFY COMPLETENESS OF REQUIRED PARAMETERS
#
function opParamMandatoryVerify {

  #if [[ "${BASH_VERSION}_" != "_" ]] ; then
    # Because bash does not implement 
    # typeset -t, this feature is not
    # functional in bash
  #  return 0
  #fi

  typeset retVal=0
  typeset i=""

  paramsList=`TagVarList`
  
  for i in ${paramsList} ; do
    if  [ "${i}X" == "X" ] ; then continue; fi;
      print "if [ \"\${$i}_\" == \"MANDATORY_\" ] || [ \"\${$i}_\" == \"mandatory_\" ] ; then echo \"$i must be specified\"; badUsage=TRUE; fi;" > ${dotMeParamTmpFile}

      #cat ${dotMeParamTmpFile}
      . ${dotMeParamTmpFile}
  done

  if [[ "${badUsage}" == "TRUE" ]] ; then
    exit 1
  fi

  FN_fileRmIfThere ${dotMeParamTmpFile}

  return ${retVal}
}


# BEGIN item_ FUNCTIONS

# END item_ FUNCTIONS


#  BEGIN do_ FUNCTIONS

#  END OF DO_ FUNCTIONS


function dash_i_set {
    if [ "${dash_i}" = "" ] ; then
	dash_i="-i"
    elif [ "${dash_i}" = "nil" ] ; then
	dash_i=""
    else
	EH_problem "Oops"
	exit 1
    fi
}

function usage {

  # to get subject specific itemCmd_ lines

  printf >&2 "Usage: ${G_myName} [ -T traceLevel ] [ -u ] [ -p parameter=value ] [-i visibleFunction] \n"
    
    visFuncsList=`ListFuncs | egrep '^vis_'`
    printf >&2 "Usage: visibleFunction is one of: "
    for i in ${visFuncsList}
    do
      printf >&2 "${i##vis_} "
    done
    printf >&2 "\n"

}


#########  EXECUTION STARTS HERE ############

#G_validateOption ${action}  "${actionValidList}"

#G_validateRunOS "${runOSValidList}"


#
# REPORT USAGE PROBLEMS
#

if [ ${badUsage} ]
then
    usage
    exit 1
fi

#shift `expr $OPTIND - 1`
shift `expr $myOptind - 1`

G_argv="$@"

#TM_trace 9 Args="$@"

#
# PERFORM REQUESTED TASKS
#

if [ ! -z "${G_recordMode}" ] ; then
    trap iimRecordEnd EXIT
    #trap iimRecordEnd ERR    
fi

if [ "${visibleFunction}X" != "X" ]
then
    #echo "running ${visibleFunction}"
    if [ ! -z "${G_recordMode}" ] ; then
	iimRecordBegin
    fi
    
    vis_${visibleFunction} "$@"
    exitCode=$?

    if [ ! -z "${G_recordMode}" ] ; then	
	iimRecordEnd
    fi
    
    exit ${exitCode}
fi

function runNoArgsHook {
  noArgsHookVal=`ListFuncs | egrep '^noArgsHook$'`
  if [ "${noArgsHookVal}X" != "X" ] ;   then
    noArgsHook "$@"
  else
    echo "No action taken. Specify options."
    usage
  fi
  exit
}

if [ ! -z "${G_recordMode}" ] ; then
    iimRecordBegin
fi

runNoArgsHook "$@"
exitCode=$?

if [ ! -z "${G_recordMode}" ] ; then	
    iimRecordEnd
fi

exit ${exitCode}
