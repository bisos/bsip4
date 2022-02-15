#!/bin/osmtKsh
#!/bin/osmtKsh

typeset RcsId="$Id: seedBbdbProc.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
  /opt/public/osmt/bin/seedActions.sh -l $0 "$@"
  exit $?
fi

processorName="bbdbProc.sh"

#. ${opBinBase}/lcnLcntLib.sh
. ${opBinBase}/lpInBaseDirDo.libSh

function isDirsProcessor {
  #set -x
  TM_trace 9 "dirsList=${dirsList}"
  typeset isEmpty="TRUE"
  for thisOne in ${dirsList} ; do
    isEmpty="FALSE"
    break
  done

  if [[ ${isEmpty} == "TRUE" ]] ; then 
    return 1
  else
    return 0
  fi
}


function G_postParamHook {
  TM_trace 9 "G_postParamHook"

  lcntProcType=regular

  docsList=""

  destUrls=""

  ### Auto Selections Below ###

  docsList=""
#  typeset thisDoc
 # for thisDoc in ${lcnt_docSrcList} ; do
  #  docsList="${docsList} ${thisDoc}.${lcnt_contentSrcFormat}"
  #done

#  if  ! isDirsProcessor  ; then 
}

function vis_examples {

  #typeset extraInfo="-v -n showRun"
  typeset extraInfo=""
  typeset oneDoc=`echo ${docsList} | cut -d ' ' -f 1 `
  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- Recurse Dirs ---
${G_myName} ${extraInfo}  -i bbdbProcShStdout
${G_myName} ${extraInfo}  -i refreshDirsProcs
${G_myName} ${extraInfo}  -i dirsRecurse refreshDirsProcs
${G_myName} ${extraInfo}  -i refreshLeafProcs
${G_myName} ${extraInfo}  -i htmlView
${G_myName} ${extraInfo}  -i basePrep
${G_myName} ${extraInfo}  -i dirsRecurse basePrep
${G_myName} ${extraInfo}  -i dirsRecurse refreshLeafProcs
${G_myName} ${extraInfo}  -i dirsRecurse fullPublish
${G_myName} ${extraInfo}  -i dirsRecurse fullRefresh
${G_myName} ${extraInfo}  -i dirsRecurse fullUpdate
--- FULL MANIPLATORS ---
${G_myName} ${extraInfo} -i  fullUpdate
${G_myName} ${extraInfo} -i  fullFast
${G_myName} ${extraInfo} -i  fullRefresh
${G_myName} ${extraInfo} -i  fullClean
--- EACH MANIPLATORS ---
_EOF_
  
  hookRun "examplesHookPost"
}


function vis_help {
  cat  << _EOF_

    TODO: NOTYET, 
    Explain the process of publication after production.

_EOF_
}

function noArgsHook {
  vis_examples
}

function vis_dirsRecurse {
  typeset thisOne=""
  typeset currentDir=`pwd`

  ANT_raw "#### ${currentDir}/${thisOne} ####"
  opDoComplain ${G_myName} -n showRun -i "$@"

  for thisOne in ${dirsList} ; do
    opDoComplain cd ${currentDir}/${thisOne} || return
    ANT_raw "#### ${currentDir}/${thisOne} ####"
    
    opDoComplain ${G_myName} -n showRun -i "$@"

    opDoComplain ${G_myName} -n showRun -i dirsRecurse "$@"
  
  done
}


function vis_prep {
    return
}


#
# Full Manipulators
#

function vis_fullUpdate {
    hookRun "fullUpdateHookPre"

  vis_prep
  typeset thisOne=""

  for thisOne in ${docsList} ; do
    vis_build ${thisOne}
	
   done
    hookRun "fullUpdateHookPost"
}

function vis_fullClean {
  #set -x

  isDirsProcessor && return $?

  return

}

function vis_fullRefresh {

 isDirsProcessor && return $?
}

function vis_refreshLeafProcs {
  isDirsProcessor && return $?

  here=$( pwd )
  #ANT_raw "HUNK HUNK -- ${here} HUNK"

  typeset listOfMailings=$( find . -maxdepth 1  -print | egrep "\.preface$" )

  for thisOne in ${listOfMailings} ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )

      if [[ ${thisExtension} != "preface" ]] ; then
	EH_problem "OOPS"
	exit
      fi

      #opDo ls -l ${thisPrefix}.from ${thisPrefix}.subject ${thisPrefix}.preface

      vis_mailTmpltStdOut ${thisPrefix} > ${thisPrefix}.genedTmplt
    opDo ls -l ${thisPrefix}.genedTmplt
  done

}


function vis_htmlView {
  isDirsProcessor && return $?

  here=$( pwd )
  #ANT_raw "HUNK HUNK -- ${here} HUNK"

  typeset listOfMailings=$( find . -maxdepth 1  -print | egrep "\.preface$" )

  for thisOne in ${listOfMailings} ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )

      if [[ ${thisExtension} != "preface" ]] ; then
	EH_problem "OOPS"
	exit
      fi

      #opDo ls -l ${thisPrefix}.from ${thisPrefix}.subject ${thisPrefix}.preface

      opDo grep -v disposition=inline ${thisPrefix}.preface > /tmp/${thisPrefix}.preface
      #echo "file://${here}/${thisPrefix}.preface"
      echo "file:///tmp/${thisPrefix}.preface"
  done

}


function vis_mailTmpltStdOut {
  # $1=prefix

  EH_assert [[ $# -eq 1 ]]
  typeset thisPrefix=$1

  echo "X-BASEDIR: `pwd`"
  echo "X-MailingName: ${thisPrefix}"

  print -n "From: "
  cat ${thisPrefix}.from 

  print -n "Subject: "
  cat ${thisPrefix}.subject 

  echo ""
  echo "--text follows this line--"
  echo ""
  cat ${thisPrefix}.preface
}
  


function vis_bbdbProcShStdout {

  typeset subDirs=$( find . -maxdepth 1 -type d  -print )

  typeset subDirsList=""

  for thisOne in ${subDirs} ; do
      typeset dirsPart=$( FN_dirsPart ${thisOne} )
      typeset nonDirsPart=$( FN_nonDirsPart ${thisOne} )

      if [[ ${nonDirsPart} == "CVS" ]] ; then
	continue
      fi

      if [[ ${nonDirsPart} == "." ]] ; then
	continue
      fi

      subDirsList="${subDirsList} ${nonDirsPart}"  
  done

 cat  << _EOF_
#!/bin/osmtKsh

typeset RcsId="\$Id: seedBbdbProc.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "\${loadFiles}X" == "X" ] ; then
  seedBbdbProc.sh -l \$0 "\$@"
  exit \$?
fi

dirsList="
${subDirsList}
"
_EOF_
}

function vis_refreshDirsProcs {
  typeset thisOne=""
  typeset currentDir=`pwd`
  typeset here=${currentDir}

  typeset subDirs=$( find . -maxdepth 1 -type d  -print )

  #for thisOne in ${subDirs} ; do
  for thisOne in ${dirsList} ; do
    typeset dirsPart=$( FN_dirsPart ${thisOne} )
    typeset nonDirsPart=$( FN_nonDirsPart ${thisOne} )

    if [[ ${nonDirsPart} == "." ]] ; then
      continue
    fi

    if [[ ${nonDirsPart} == "CVS" ]] ; then
      continue
    fi

    currentDir=${here}/${nonDirsPart}
    opDoComplain cd ${currentDir} || return
    print "%%%%%% ${currentDir} %%%%%%"
    if [ -f ${processorName} ] ; then
      FN_fileSafeKeep ${processorName}
    fi
    

    vis_bbdbProcShStdout > ${processorName}

    opDo chmod 775 ${processorName}
    opDo ls -l ${currentDir}/${processorName}
  done
}


function vis_basePrep {
  isDirsProcessor && return $?

  here=$( pwd )
  
  ANT_raw "No Action Needed For ${here}"

  # It may be something like
  #genedBase=$( echo ${here} | sed -e 's/MailingsKeep/MailingsGened/' )
  #opDo ln -s ${here}/msend-Open3Papers-Extras.el  ${genedBase}
}
