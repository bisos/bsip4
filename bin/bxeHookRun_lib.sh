#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeHookRun_lib:-}" ] ; then
    bxoLib="LOADED"
    TM_trace 7 "bxeHookRun_lib :: Loading Library -- /bisos/bsip/bin/bxeHookRun_lib.sh"
else
    TM_trace 7 "bxeHookRun_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeHookRun_lib.sh"
    return
fi
####+END:

function vis_description_bxeHookRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** bxeKind is one of:
*** real, info, svc
** bxeType depends o nbxeKind and is one of:
*** real: indiv, corp,sys
*** info: registrar, site
*** svc: byname, bysmb
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
}


bxeKindTypeHookParamsSet () {
  EH_assert [[ $# -eq 2 ]]
    
  bxeKindCategory=$1
  bxeTypeCategory=$2

  bxeKindTypeInfoIsSetAssert || return 1
}

function bxeKindTypeInfoIsSetAssert {
# bystarServiceInfoIsSetAssert () {

  if [ "${bxeKindCategory}" == "" ]  ; then
    EH_problem "bxeKindCategory is not set -- STOP"
    ANT_raw "Need to run -- NOTYET - opSysIdentities.sh -i osmtInfoExpand"
    return 1
  fi

  if [ "${bxeTypeCategory}" == "" ]  ; then
    EH_problem "bxeTypeCategory is not set -- STOP"
    ANT_raw "Need to run -- NOTYET - opSysIdentities.sh -i osmtInfoExpand"
    return 1
  fi

  return 0
}

function bxeKindTypeHookRun {
# bystarServiceSupportHookRun () {

  # Determine if any of the functions
  #     ${HookFuncName}_${bxeKindCategory}_${bxeTypeCategory}
  #     ${HookFuncName}_${bxeKindCategory}_DEFAULT
  #     ${HookFuncName}_DEFAULT_DEFAULT
  # in that order exists, If it exists, run the first in order
  # and return that functions exist code.
  #
  # Otherwise NAG.
  #

  #EH_assert [[ $# -eq 1 ]]

  hookFuncName=$1
  shift 1

  #bxeKindCategory=""

  bxeKindTypeInfoIsSetAssert || return 1

  fullFuncName="${hookFuncName}_${bxeKindCategory}_${bxeTypeCategory}"

  funcListResult=`ListFuncs | egrep "^${fullFuncName}\$" || true`
  if [ "${funcListResult}X" != "X" ] ; then
    ${fullFuncName} $@
    return $?
  fi
  
  fullFuncName="${hookFuncName}_${bxeKindCategory}_DEFAULT"

  funcListResult=`ListFuncs | egrep "^${fullFuncName}\$" || true`
  if [ "${funcListResult}X" != "X" ] ; then
    ${fullFuncName} $@
    return $?
  fi

  fullFuncName="${hookFuncName}_DEFAULT_DEFAULT"

  funcListResult=`ListFuncs | egrep "^${fullFuncName}\$" || true`
  if [ "${funcListResult}X" != "X" ] ; then
    ${fullFuncName}  $@
    return $?
  fi

  ANT_raw "No ${fullFuncName} for ${bxeKindCategory}_${bxeTypeCategory} -- skipped"
  return 1
}

