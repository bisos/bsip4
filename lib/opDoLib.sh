typeset RcsId="$Id: opDoLib.sh,v 1.8 2020-01-05 20:54:40 lsipusr Exp $"

#
# See seedHelp in visLib.sh for usage and high level
# description of opDo Run level modes and selections.
#

#
#  Report And Return After a given invokation
#  After an invokation, In case of a failure (||),
#  Report (RepV "string";)  and return (Ret)
#

# function vis_testMe {
#   print "start"
#   true ||  RepV "Some true";  Ret
#   print "did true"
#   false ||  RepV "Some Error"; Ret
#   print "did false"
# }



alias RepV='(retRepGotVal=$? &&  repAnv_ "${G_myName}" "$LINENO" "$0" '
alias RepA='(retRepGotVal=$? &&  repAnt_ "${G_myName}" "$LINENO" "$0" '
alias Ret=') ||  return ${retRepGotVal}'


function repAnv_ {
  typeset progName=$1
  typeset lineNu=$2
  typeset callingFunc=$3

  shift; shift; shift
  ANV_raw "${progName}:${callingFunc}:${lineNu}  returned: ${retRepGotVal} -- $@"
  return ${retRepGotVal}
}

function repAnt_ {
  typeset progName=$1
  typeset lineNu=$2
  typeset callingFunc=$3

  shift; shift; shift
  ANT_raw "${progName}:${callingFunc}:${lineNu}  returned: ${retRepGotVal} -- $@"
  return ${retRepGotVal}
}

function rightHere_ {
  typeset progName=$1
  typeset lineNu=$2
  typeset callingFunc=$3

  shift; shift; shift
  ANT_raw "AN_,Mark: ${progName}:${callingFunc}:${lineNu}  -- $@"
  return ${retRepGotVal}
}

function dashExampleH {
    echo "-h "
}

function dashExampleV {
    echo "-v "
}

function dashExampleN {
    echo "-n showRun "
}


function dashH {
    if [ "${G_humanUser}" != "TRUE" ] ; then
	echo ""
    else
	echo "-h "
    fi
}

function dashV {
    if [ "${G_humanUser}" != "verbose" ] ; then
	echo ""
    else
	echo "-v "
    fi
}

function dashN {
    if [ -z "${G_runMode}" ] ; then
	echo ""
    else
	echo "-n ${G_runMode} "
    fi
}



_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IimSeed      :: iimRecordBegin  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimRecordBegin {
    typeset dateTag=$( date +%y%m%d%H%M%S%N )
    typeset userIdTag=$( id -u -n )

    typeset recordingBaseDir="/tmp"

    if [ -z "${G_recordMode}" ] ; then
	EH_problem "Blank G_recordMode -- Should Not Happen"
	exit 1
    fi

    if [ "${G_recordMode}" == "basic" ] ; then
	if [[ -d "/var/log/bisos/iim/bash" ]] ; then
	    recordingBaseDir="/var/log/bisos/iim/bash"
	fi
    else
	mkdir -p ${G_recordMode}
	recordingBaseDir=$( FN_absolutePathGet ${G_recordMode} )
	if [[ ! -d "${recordingBaseDir}" ]] ; then
	    #opDo mkdir ${recordingBaseDir}
	    mkdir -p ${recordingBaseDir}	    
	fi
    fi

    logFile=${recordingBaseDir}/${userIdTag}-${G_myName}-${dateTag}-log.org
    
    exec &> >(tee "${logFile}")
    printf  1>&2 "Started Logging To ${logFile}\n"
    cat 1>&2  << _EOF_
${G_myName}  ${G_argsOrig} 
at ${G_myFullName} started at 
$( date ) by $( id -u -n) 
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
_EOF_
}


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IimSeed      :: iimRecordEnd  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimRecordEnd {
    printf 1>&2 "End Logging To ${logFile}\n"
    date 1>&2
    cat 1>&2 << _EOF_
* Parameters:
#+STARTUP: content
_EOF_
}


#### 

# set-u fix  
G_runMode=${G_runMode-}
G_verbose=${G_verbose-}

if [[ -z "${G_runMode}" ]] ; then
    export G_runMode="runOnly"
fi
if [[ -z "${G_verbose}" ]] ; then
    export G_verbose="notVerbose"
fi

if [[ "${BASH_VERSION}X" != "X" ]] ; then

    alias rightHere='rightHere_ "${G_myName}" "$LINENO" "$FUNCNAME" '
    alias AN_markHere='rightHere_ "${G_myName}" "$LINENO" "$FUNCNAME" '

    # Die if fails. But be quiet otherwise
    alias opDoAssert='_opDoAssert "${G_myName}" "$FUNCNAME" $LINENO'
    alias opDoAssertContinue='_opDoAssertContinue "${G_myName}" "$FUNCNAME" $LINENO'

    # Complain and die if fails
    alias opDoExit='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "EXIT"'

    # Complain and return to calling function if fails
    #alias opDoRet="trap 'echo HAI; return \$?' ERR ;_opDo "${BASH_SOURCE[0]}" '${G_myName}' '$FUNCNAME' $LINENO 'DONT_EXIT'"
    #alias opDoRet='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "DONT_EXIT"'
    alias opDoRet='opDoComplain '

    #alias TM_funcEntered='print -u2 "TM_,Entered: ${G_myName}":$LINENO:"$FUNCNAME" args: 1="$1" 2="$2" From: -$(caller 0)-$(caller 1)'
    alias TM_funcEntered='print -u2 "TM_,${FUNCNAME}() ${G_myName}":$LINENO args: 1="$1" 2="$2"'
    alias G_funcEntry='G_thisFunc=$FUNCNAME; G_thisFuncArgs=$@'

    # Complain if fails
    #alias opDoComplain='trap "incomplain" ERR ; _opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "DONT_EXIT"'
    alias opDoComplain='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "DONT_EXIT"'
    #alias lpDoRet='trap "errHandlerRet" ERR;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" "$LINENO" "JUST_DO"'
    #alias lpDoRet='trap "TRIGGERED_ERR" ERR ;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" "$LINENO" "DONT_EXIT"'

    # Just do it
    #alias opDo='trap "" ERR ;  _opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "JUST_DO"'
    alias opDo='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "JUST_DO"'

    alias lpReturn='lpLastRetFuncIsValid=1; lpLastRetFunc=$FUNCNAME; return'

    alias lpDo='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "JUST_DO"'

    alias EH_retOnFail='errVal=$?; if [[ ${errVal} != 0 ]] ; then  print -u2 "EH_,retOnFail,${G_myName}::$FUNCNAME:$LINENO (ret=${errVal} func=${lpLastRetFunc})"; lpLastRetFunc=$FUNCNAME; return ${errVal}; fi'

    alias retIfFail='errVal=$?; if [[ ${errVal} != 0 ]] ; then  print -u2 "retFail,${G_myName}::$FUNCNAME:$LINENO (ret=${errVal})"; return ${errVal}; fi'


    alias retIfSuccess='errVal=$?; if [[ ${errVal} == 0 ]] ; then  print -u2 "retSuccess,${G_myName}::$FUNCNAME:$LINENO (ret=${errVal})"; return ${errVal}; fi'

    ###alias opDoRetFail='print -u2 "opDoRetFail,${G_myName}::$FUNCNAME:$LINENO"; return 101'
    alias opDoRetFail='print -u2 "opDoRetFail,${G_myName}::$FUNCNAME:$LINENO"; return 101'

    #alias opDoAfterPause='print -u2 "$FUNCNAME"; _pauseForVerification ; if [[ ${skipIt} == "true" ]] ; then return; fi;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" $LINENO "JUST_DO"'
    alias opDoAfterPause='_opDoAfterPause "${BASH_SOURCE[0]}" "${G_myName}" "$FUNCNAME" "$LINENO" "JUST_DO"'
else

    alias rightHere='rightHere_ "${G_myName}" "$LINENO" "$0" '
    alias AN_markHere='rightHere_ "${G_myName}" "$LINENO" "$0" '

    # Die if fails. But be quiet otherwise
    alias opDoAssert='_opDoAssert "${G_myName}" "$0" $LINENO'
    alias opDoAssertContinue='_opDoAssertContinue "${G_myName}" "$0" $LINENO'

    # Complain and die if fails
    alias opDoExit='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "EXIT"'

    # Complain and return to calling function if fails
    #alias opDoRet="trap 'echo HAI; return \$?' ERR ;_opDo "${BASH_SOURCE[0]}" '${G_myName}' '$0' $LINENO 'DONT_EXIT'"
    #alias opDoRet='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "DONT_EXIT"'
    alias opDoRet='opDoComplain '

    alias TM_funcEntered='print -u2 "TM_,Entered: ${G_myName}":$LINENO:"$0" args: 1="$1" 2="$2"'

    # Complain if fails
    #alias opDoComplain='trap "incomplain" ERR ; _opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "DONT_EXIT"'
    alias opDoComplain='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "DONT_EXIT"'
    #alias lpDoRet='trap "errHandlerRet" ERR;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" "$LINENO" "JUST_DO"'
    #alias lpDoRet='trap "TRIGGERED_ERR" ERR ;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" "$LINENO" "DONT_EXIT"'

    # Just do it
    #alias opDo='trap "" ERR ;  _opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "JUST_DO"'
    alias opDo='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "JUST_DO"'

    alias lpReturn='lpLastRetFuncIsValid=1; lpLastRetFunc=$0; return'

    alias lpDo='_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "JUST_DO"'

    alias EH_retOnFail='errVal=$?; if [[ ${errVal} != 0 ]] ; then  print -u2 "EH_,retOnFail,${G_myName}::$0:$LINENO (ret=${errVal} func=${lpLastRetFunc})"; lpLastRetFunc=$0; return ${errVal}; fi'

    alias retIfFail='errVal=$?; if [[ ${errVal} != 0 ]] ; then  print -u2 "retFail,${G_myName}::$0:$LINENO (ret=${errVal})"; return ${errVal}; fi'


    alias retIfSuccess='errVal=$?; if [[ ${errVal} == 0 ]] ; then  print -u2 "retSuccess,${G_myName}::$0:$LINENO (ret=${errVal})"; return ${errVal}; fi'

    ###alias opDoRetFail='print -u2 "opDoRetFail,${G_myName}::$0:$LINENO"; return 101'
    alias opDoRetFail='print -u2 "opDoRetFail,${G_myName}::$0:$LINENO"; return 101'

    #alias opDoAfterPause='print -u2 "$0"; _pauseForVerification ; if [[ ${skipIt} == "true" ]] ; then return; fi;_opDo "${BASH_SOURCE[0]}" "${G_myName}" "$0" $LINENO "JUST_DO"'
    alias opDoAfterPause='_opDoAfterPause "${G_myName}" "$0" $LINENO "JUST_DO"'
fi

function opDoProtectedBegin {
    if [[ -z "${__withinCritical}" ]] ; then
      # NOTYET, When all modernized and consistent, export not needed
	export __opDo_withinCritical=1
    else
	let __opDo_withinCritical=__opDo_withinCritical+1
    fi
}
function opDoProtectedEnd {
    if [[ -z "${__opDo_withinCritical}" ]] ; then
	export __opDo_withinCritical=0
    else
	let __opDo_withinCritical=__opDo_withinCritical
    fi
}
function opDoProtected {
    typeset err=0
    opDoProtectedBegin
    "$@" || err=$?
    opDoProtectedEnd
    return $err
}

#### private thingie

function runStdPrepend () {
    "$@" 2> >(sed 's/^/E: /') 1> >(sed 's/^/O: /')
}


function _opPrependedDoRunOnly {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
    # $4-: command

    #echo ZZ

    if [[ "${1}" == "JUST_DO" ]] ; then
	#echo AA
    shift; shift; shift;
    runStdPrepend  "$@" || err=$?
    return $err
  else
      #echo YY
    typeset err=0
    typeset mode="${1}"
    typeset failedMsg="${3}"
    shift; shift; shift;
    runStdPrepend "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
      EH_problem "$failedMsg" "$err"
      if [[ "${mode}X" == "EXITX" ]] ; then
	exit $err
      fi
      return $err
    fi
  fi
}


function _opDoRunOnly {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command

  if [[ "${1}" == "JUST_DO" ]] ; then
    shift; shift; shift;
    "$@" || err=$?
    return $err
  else
    typeset err=0
    typeset mode="${1}"
    typeset failedMsg="${3}"
    shift; shift; shift;
    "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
      EH_problem "$failedMsg" "$err"
      if [[ "${mode}X" == "EXITX" ]] ; then
	exit $err
      fi
      return $err
    fi
  fi
}

function _opDoShowOnly {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command
    if [[ "${BASH_VERSION}X" != "X" ]] ; then
	#echo -e ${2} 1>&2
	printf  1>&2 "%b \n" "${2}"
    else
	print -u2 "${2}"
    fi
}


function _opDoShowRun {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command
  _opDoShowOnly "$@"
  _opDoRunOnly "$@"
}


function _opDoSeeRun {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command
  _opDoShowOnly "$@"
  _opPrependedDoRunOnly "$@"
}


function shift5ThenEcho {
    shift || exit
    shift || exit
    shift || exit
    shift || exit
    shift || exit    
    echo "$@"
}

function G_funcEntryShow {
    echo "${G_myName}:${G_thisFunc}:" 1>&2
}

function _opDoAfterPause {
    #shift
    #shift
    #shift
    #shift
    shift5ThenEcho "$@"
    _pauseForVerification ; if [[ ${skipIt} == "true" ]] ; then return; fi;
    _opDo "$@"
}

__opDo_prevScriptName=""   # was unbound
__opDo_prevFunctionName=""

function _opDo {
    err=0
    typeset bashSrc="$1"; shift || exit
    typeset scriptName="$1"; shift || exit     
    typeset functionName="$1"; shift || exit
    typeset lineNumber="$1"; shift || exit
    typeset mode="$1"; shift || exit

    local bashSrcSansDirs=$(FN_nonDirsPart ${bashSrc})
    local origScriptName=${scriptName}

    #printf 1>&2 " XX ${bashSrc} XX "

    if [[ -z "${__opDo_prevScriptName}" ]] ; then
	export __opDo_prevScriptName=""
    fi
    if [[ -z "${__opDo_prevFunctionName}" ]] ; then
	export __opDo_prevFunctionName=""
    fi
    if [[ "${__opDo_prevScriptName}X" == "${scriptName}X" ]] ; then
	scriptName=""
    else
	__opDo_prevScriptName="${scriptName}"
	scriptName="${scriptName}::"
    fi
    if [[ "${__opDo_prevFunctionName}" == "${functionName}" ]] ; then
	functionName=""
    else
	__opDo_prevFunctionName="${functionName}"
    fi
    
    if [ -z "${G_recordMode}" ] ; then
	lineNumberTag="** [${lineNumber}]"
    else
	lineNumberTag="** [[file:${bashSrc}::${lineNumber}][${lineNumber}]]"	
    fi

    if [ -z "${G_recordMode}" ] ; then
	scriptFuncName="* ${bashSrc}::[${lineNumber}] -- ${origScriptName}${functionName}"	
    else
	scriptFuncName="* [[file:${bashSrc}::${lineNumber}][${origScriptName}:${bashSrcSansDirs}:${functionName}]]"		
    fi

    typeset msg
    typeset failedMsg
    dateTag=$( date +%Y%m%d%H%M%S%N )
    case "${G_verbose}" in
	"verbose")
	    if [ "${scriptName}" == "" ] ; then
		if [ "${functionName}" == "" ] ; then
		   msg="${lineNumberTag}: $@"
		else
		    #msg="* ${scriptName}${functionName} -- ${dateTag}\n${lineNumber}: $@"
		    msg="${scriptFuncName} -- ${dateTag}\n${lineNumberTag}: $@"
		fi 
	    else
		#msg="* ${scriptName}${functionName} -- ${dateTag}\n${lineNumber}: $@"
		msg="${scriptFuncName} -- ${dateTag}\n${lineNumberTag}: $@"		
	    fi
	    failedMsg="FAILED: ${scriptName}${functionName}${lineNumber}: $@ [ErrCode]="
	    ;;
	*)
	    msg="$@"
	    failedMsg="FAILED: $@ [ErrCode]="
	    ;;
    esac
    case "${G_runMode}" in
	"runOnly")
	    _opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return $?
	    ;;
	"showOnly")
	    _opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    ;;
	"showRun")
	    _opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    ;;
	"seeRun")
	    _opDoSeeRun "$mode" "$msg" "$failedMsg" "$@" || return
	    ;;
	"runSafe")
	    #runSafe = unprotected: showRun, protected: show
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
	"showCritical"|"showProtected")
	    #showCritical    = unprotected: run,     protected: show
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
	"showRunCritical"|"showRunProtected")
	    #showRunCritical = unprotected: run,     protected: showRun 
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
    esac
    return $err
}

function _opDoAssert {
    typeset err=0
    typeset scriptName="$1"; shift || exit 
    typeset functionName="$1"; shift || exit
    typeset lineNumber="$1"; shift || exit
    scriptName="${scriptName}::"
    lineNumber="[${lineNumber}]"
    typeset failedMsg="ASSERTION FAILED: ${scriptName}${functionName}${lineNumber}: $@ [ErrCode]="
    "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
	EH_problem "$failedMsg" "$err"
	exit $err
    fi
}

function _opDoAssertContinue {
    typeset err=0
    typeset scriptName="$1"; shift || exit 
    typeset functionName="$1"; shift || exit
    typeset lineNumber="$1"; shift || exit
    scriptName="${scriptName}::"
    lineNumber="[${lineNumber}]"
    typeset failedMsg="ASSERTION FAILED: ${scriptName}${functionName}${lineNumber}: $@ [ErrCode]="
    "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
	EH_problem "$failedMsg" "$err"
	return $err
    fi
}

#
# Os Dependent opDos
#

function opDoOsRun {
  typeset preName=""
  typeset postName=""
  
  if [[ $# = 1 ]] ; then
    postName=$1
    preName=""
  elif [[ $# = 2 ]] ; then
    postName=$1
    preName="$2"
  else
    EH_problem "Too many args"
    return 1
  fi

  if [ "${opRunOsType}_" == "SunOS_" ] ; then
    # NOTYET, verify that the function exists
    ${preName}${opRunOsType}${postName}
  elif [ "${opRunOsType}_" == "Linux_" ] ; then
    ${preName}${opRunOsType}${postName}
  else
    EH_problem "Unsupported OS: ${opRunOsType}"
  fi

  return 
}

alias continueAfterThis='print -u2 "${G_myName}::$0:$LINENO"; _continueAfterThis ; if [[ ${skipIt} == "true" ]] ; then return; fi;'


function _continueAfterThis {
    #
    if [[ "${G_humanUser}_" == "FALSE_" ]] ; then
	return
    fi

    #echo "About to: $*"
    /bin/echo -n "\"SKIP\" to skip, \"EXIT\" to exit,  Hit [Enter] to continue ...  : "
    skipIt=false
    while read line ; do
	if [[ "${line}_" == "SKIP_"  || "${line}_" == "skip_" ]] ; then
	echo "Skipped: $*"
	    skipIt=true
	    break
	fi

	if [[ "${line}_" == "EXIT_"  || "${line}_" == "exit_" ]] ; then
	    exit
	fi

	if [[ "${line}_" == "_" ]] ; then
	    #echo "Continuing ...."
	    break
	fi

	echo "HA! -- You Said ${line} -- Say Again"
	/bin/echo -n "\"SKIP\" to skip, \"EXIT\" to exit,  Hit [Enter] to continue ...  : "
    done
}

alias pauseForVerification='if [ "${G_verbose}_" == "verbose_" ] ; then echo "${G_myName}::$0:$LINENO"; fi; _pauseForVerification ; if [[ ${skipIt} == "true" ]] ; then return; fi;'


function _pauseForVerification {
    #
    if [[ "${G_humanUser}_" == "FALSE_" ]] ; then
	return
    fi

    #echo "About to: $*"
    /bin/echo -n "---- Pausing For You To Confirm/Verify. Hit [Enter] to continue ...  : "
    skipIt=false
    while read line ; do
	if [[ "${line}_" == "SKIP_"  || "${line}_" == "skip_" ]] ; then
	echo "Skipped: $*"
	    skipIt=true
	    break
	fi

	if [[ "${line}_" == "EXIT_"  || "${line}_" == "exit_" ]] ; then
	    exit
	fi

	if [[ "${line}_" == "_" ]] ; then
	    #echo "Continuing ...."
	    break
	fi
	break
    done
}

alias getConfirmation='echo "${G_myName}::$0:$LINENO"; _getConfirmation ; if [[ ${skipIt} == "true" ]] ; then return; fi;'

function _getConfirmation {
    #
    if [[ "${G_nonHumanUser}_" == "TRUE_" ]] ; then
	return
    fi

    #echo "About to: $*"
    /bin/echo -n "Do you want to continue? \"NO\" to skip, \"EXIT\" to exit, [YES] to continue ...  : "
    skipIt=false
    while read line ; do
	if [[ "${line}_" == "NO_"  || "${line}_" == "no_" ]] ; then
	echo "Skipped: $*"
	    skipIt=true
	    break
	fi

	if [[ "${line}_" == "EXIT_"  || "${line}_" == "exit_" ]] ; then
	    exit
	fi

	if [[ "${line}_" == "YES_"  || "${line}_" == "yes_" ]] ; then
	    #echo "Continuing ...."
	    break
	fi

	echo "HA! -- You Said ${line} -- Say Again"
	/bin/echo -n "Do you want to continue? \"NO\" to skip, \"EXIT\" to exit, [YES] to continue ...  : "
    done
}


alias getInput='echo "${G_myName}::$0:$LINENO"; _getInput ;'

function _getInput {
    #
    if [[ "${G_nonHumanUser}_" == "TRUE_" ]] ; then
	return
    fi
    read line 
	if [[ "${line}_" == "EXIT_"  || "${line}_" == "exit_" ]] ; then
	    exit
	fi

	if [[ "${line}_" == "_"  ]] ; then
	    getInputResult=${getInputDefault}
	    return
	fi

	getInputResult=${line}

}

lpErrTrapHook=""    # MB Dec 2019 to address unbound variable

function lpErrTrapProc {
    trigRetVal=$?
    # NOTYET, make it subject to verbose
    #ANT_raw "From: $FUNCNAME, lpLastRetFunc=${lpLastRetFunc} with: retVal=${trigRetVal}"
    if [[ "${lpErrTrapHook}_" != "_" ]] ; then
	${lpErrTrapHook}
	lpErrTrapHook=""
    fi
    return ${trigRetVal}
}

# {{{ lpErrTrapEnable
function lpErrTrapEnable {
    thisFuncName=$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )
    #EH_assert [[ $# -eq 0 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }
    #echo "In $FUNCNAME --"
    trap "lpErrTrapProc" ERR

    lpLastRetFuncIsValid=1; lpLastRetFunc=$0; return
}
# }}}

lpErrTrapEnable
 



# # Examples

# opDoOsRun "someFunc"

# function  Linux_someFunc {
#   print $0
#   return    
# }

# function  SunOs_someFunc {
#   print $0
#   return    
# }


