#!/bin/bash

#
# RCS Revision: $Id: ocp-lineNu.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
#

#
# Author: Mohsen Banan.
# 
#

# set-u fix
# with set -u all $FUNCNAME should become ${FUNCNAME-main}
# Also add ${BASH_SOURCE} for fileName and funcName
#


if [[ "${BASH_VERSION}X" != "X" ]] ; then
    alias TM_trace='tm_fileName=${FUNCNAME-main}; tm_lineNo=$LINENO; tm_trace'
    alias LOG_event='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; log_event'
    alias LOG_message='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; log_event'
    alias EH_oops='print -u2 -- "EH_,$FUNCNAME,$LINENO: OOPS"'
    alias EH_problem='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_problem'
    alias EH_problemRet='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_problem; return'
    alias EH_fatal='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_fatal'
    alias EH_exit='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_fatal'
    alias EH_assert='opDoAssert eval '
    alias EH_assertContinue='opDoAssertContinue eval '
else
    alias TM_trace='tm_fileName=$0; tm_lineNo=$LINENO; tm_trace'
    alias LOG_event='tm_fileName=$0; tm_lineNo=$LINENO; log_event'
    alias LOG_message='tm_fileName=$0; tm_lineNo=$LINENO; log_event'
    alias EH_oops='print -u2 -- "EH_,$0,$LINENO: OOPS"'
    alias EH_problem='tm_fileName=$0; tm_lineNo=$LINENO; eh_problem'
    alias EH_problemRet='tm_fileName=$0; tm_lineNo=$LINENO; eh_problem; return'
    alias EH_fatal='tm_fileName=$0; tm_lineNo=$LINENO; eh_fatal'
    alias EH_exit='tm_fileName=$0; tm_lineNo=$LINENO; eh_fatal'
    alias EH_assert='opDoAssert eval '
    alias EH_assertContinue='opDoAssertContinue eval '
fi

tm_trace() {
  # $1 = traceNu
  # $2 = traceString

        #print "in $0"

  if [ ${traceLevel:-} ]
  then
    if test $1 -le ${traceLevel}
    then
      shift
      print -u2 -- "TM_,${tm_fileName},${tm_setFile},${tm_lineNo}: $*"
    fi
  fi
}

log_event() {
  print -u2 -r -- "LOG_,${tm_fileName},${tm_setFile},${tm_lineNo}: $*"
}

eh_problem() {
    print -u2 -r -- "EH_,${G_myName},${tm_fileName},${tm_lineNo}: PROBLEM: $*"
    return 111
}


eh_fatal() {
  print -u2 -r -- "EH_,${tm_fileName},${tm_lineNo}: FATAL $*"
  exit 1
}
