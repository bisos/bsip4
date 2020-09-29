#!/bin/bash

typeset RcsId="$Id: seedSubjectBinsPrepDist.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
     $(dirname $0 )/seedSubjectAction.sh -l $0 "$@"
     exit $?
fi

function vis_help {
  cat  << _EOF_
  NOTYETs 
    - See vis_optionalOrderedList

_EOF_
}

mmaPkgExtractableFile=""
mmaPkgSelfExtractableFile=""

. ${opBinBase}/mmaLib.sh

# lcaBinsPrep.libSh
. ${opBinBase}/lcaBinsPrep.libSh

. ${opBinBase}/distHook.libSh

. ${opBinBase}/debPkgs.libSh

. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

function vis_examples {
  typeset oneSubject="${itemOrderedList[0]}"
  typeset allSubjects=`${G_myName} -i orderedList`
  #typeset extraInfo="-h -v -n showRun"
  typeset extraInfo="-v -n showRun"
  typeset doLibExamples=`doLibExamplesOutput ${G_myName}`
 cat  << _EOF_
EXAMPLES:
${doLibExamples}
--- INFORMATION ---
${G_myName} -s all -a summary
${G_myName} ${extraInfo} -s ${oneSubject} -a describe
--- OBTAIN SPKG ---
${G_myName} ${extraInfo} -s ${oneSubject} -a pkgObtain
--- COMPONENT MANIPULATORS  ---
${G_myName} ${extraInfo} -s ${oneSubject} -a compVerify
${G_myName} ${extraInfo} -s ${oneSubject} -a compUpdate
${G_myName} ${extraInfo} -s ${oneSubject} -a compDelete
--- COMPONENT ACTIVATION ---
${G_myName} ${extraInfo} -s ${oneSubject} -a compInitInstall
--- FULL SERVICE ---
${G_myName} ${extraInfo} -i fullUpdate   # ReRunsAsRoot --- Everything in here should be converted to do that
${G_myName} ${extraInfo} -i fullOptionalsUpdate
--- Per subject fullUpdate ---
${G_myName} ${extraInfo} -s ${oneSubject} -a fullVerify
${G_myName} ${extraInfo} -s ${oneSubject} -a fullUpdate
${G_myName} ${extraInfo} -s all -a fullUpdate
${G_myName} ${extraInfo} ${allSubjects} -a fullUpdate
--- INFORMATION ---
${G_myName} ${extraInfo} -s ${oneSubject} -a compInfo
${G_myName} ${extraInfo} -s all -a pkgInfo
${G_myName} ${extraInfo} -i orderedList
${G_myName} ${extraInfo} -i optionalOrderedList
_EOF_

hookRun "examplesHookPost"
}



function noArgsHook {
  vis_examples
}

firstSubjectHook() {
  case ${action} in
    "summary")
	       typeset -L25 f1="PkgName" f2="Version"
	       print "$f1$f2"
	       echo "----------------------------------------------------"
       ;;
    *)
       return
       ;;
  esac

}

lastSubjectHook() {
  case ${action} in
    "summary")
	       echo "----------------------------------------------------"
       ;;
    *)
       return
       ;;
  esac
}

function itemNameFor {
    echo "$1" | sed -r 's/-/_/g'
}

function do_summary {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  typeset -L25  v1=${mmaThisPkgName} v2=${mmaThisPkgVersion}
  print "${v1}${v2}"
}

function do_pkgObtain {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  mmaPkgAuto_obtain
}

# System
function do_compInfo {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  mmaCompAuto_info
}

function do_pkgInfo {
  binsPrepItemClear
  subjectValidatePrepar
  binsPrepPkgInfoPre
  mmaPkgAuto_info
}


function do_compVerify {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  mmaCompAuto_verify
}

function do_compUpdate {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  continueAfterThis
  opDo mmaCompAuto_update
}

function do_compDelete {
  binsPrepItemClear
  subjectValidatePrepare
  binsPrepPkgInfoPre
  mmaCompAuto_delete
}

function do_fullVerify {
  do_compVerify
  binsPrepPkgInfoPre
}

function do_fullUpdate {
    do_pkgObtain
    do_compUpdate
}

function vis_orderedList {
  typeset thisList subject
  for thisList in ${itemOrderedList[@]} ; do
    #subject=${thisList} ${subject}
    print -n -- "-s ${thisList} "
  done
    print
}

function vis_optionalOrderedList {
  typeset thisList
  #
  # NOTYET, if itemOptionalOrderedList is empty put a dummy
  # to avoid errors
  #
  for thisList in ${itemOptionalOrderedList[@]} ; do
    print -n -- "-s ${thisList} "
  done
  print
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local extraInfo="-v -n showRun"

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn 1; fi;
    typeset allOrderedSubjects=$( vis_orderedList )

    opDo sudo ${G_myFullName} ${extraInfo} ${allOrderedSubjects} -a fullUpdate
}

function vis_fullOptionalsUpdate {
    typeset allOrderedOptionalSubjects=$( vis_optionalOrderedList )

    opDo ${G_myName} ${extraInfo} ${allOrderedOptionalSubjects} -a fullUpdate
}
