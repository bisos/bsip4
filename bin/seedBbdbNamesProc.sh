#!/bin/bash

typeset RcsId="$Id: seedBbdbNamesProc.sh,v 1.2 2018-04-26 19:14:10 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
  seedActions.bash -l $0 "$@"
  exit $?
fi

distBaseDir="."  # NOTYET, temp
mailingSpecification="NOTYET"
distKeepBaseDir="."
iv_logSentFile="logSentFile"

processorName="bbdbNamesProc.sh"

#bbdbNamesBase="/usr/devenv/bbdbNames"
bbdbNamesBase="/acct/employee/lsipusr/BUE/names/oldDevenv/bbdbNames"
#. ${bbdbNamesBase}/bin/bbdbNamesLib.sh

typeset -t mailingSpecification=""

includeList=""

excludeList=""

dateTag=`date +%y%m%d%H%M%S`

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
XXX Perhaps this has been obsoleted by seedNameDistProc.sh XXX
EXAMPLES:
${visLibExamples}
--- Initial Template Generators ---
${G_myName} ${extraInfo}  -i bbdbProcShStdout
${G_myName} ${extraInfo}  -i refreshDirsProcs
${G_myName} ${extraInfo}  -i refreshLeafProcs
--- Recurse Dirs ---
${G_myName} ${extraInfo}  -i dirsRecurse refreshDirsProcs
${G_myName} ${extraInfo}  -i dirsRecurse refreshLeafProcs
${G_myName} ${extraInfo}  -i dirsRecurse fullRefresh
${G_myName} ${extraInfo}  -i dirsRecurse fullUpdate
${G_myName} ${extraInfo}  -i dirsRecurse fullClean
--- FULL MANIPLATORS ---
${G_myName} ${extraInfo} -i  fullUpdate
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

  typeset genedFilesList=$( find . -maxdepth 1  -print | egrep "\.gened$" )

  if [ "${genedFilesList}_" != "_" ] ; then
      opDo rm ${genedFilesList}
  else
      ANT_raw "Empty genedFilesList -- Cleaning skipped"
  fi

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
#!/bin/bash

typeset RcsId="\$Id: seedBbdbNamesProc.sh,v 1.2 2018-04-26 19:14:10 lsipusr Exp $"

if [ "\${loadFiles}X" == "X" ] ; then
  seedBbdbNamesProc.sh -l \$0 "\$@"
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


function distIncludeFileName {
  # $1 fileName
  EH_assert [[ $# -eq 1 ]]

  typeset thisNamesFile=$1
  if test -f ${thisNamesFile} ; then
    includeList="${includeList} ${thisNamesFile}"
  else
    EH_problem "missing ${thisNamesFile}"
    return 1
  fi
}


function distExcludeFileName {
  # $1 fileName
  EH_assert [[ $# -eq 1 ]]

  typeset thisNamesFile=$1
  if test -f ${thisNamesFile} ; then
    excludeList="${excludeList} ${thisNamesFile}"
  else
    EH_problem "missing ${thisNamesFile}"
    return 1
  fi
}



listNamesGlobalExcludes() {
  # /usr/devenv/doc/nedaComRecs/Names/excludeBounce.names 

  dName="${namesBaseDir}"
  if test -f ${dName}/exclude.names ; then
    excludeList="${excludeList} ${dName}/exclude.names"
  fi
  if test -f ${dName}/excludeBounce.names ; then
    excludeList="${excludeList} ${dName}/excludeBounce.names"
  fi

  #echo ${includeList} ${excludeList}
}


outputIncludeAndExcludeLists() {
  # $1 should go instead of

  if [ "${mode}X" == "listX" ] ;  then
    echo "###INCLUDE LIST: ${includeList}"
    cat ${includeList} 
    echo "###EXCLUDE LIST: ${excludeList}"
    cat ${excludeList} 
    return
  elif [ "${mode}X" == "stdoutX" ] ;  then
      mailingSpecification="temp"
      includeAndExcludeListsForDist temp

      vis_distNextBatch temp
  else 
      includeAndExcludeListsForDist $1     
  fi
}


includeAndExcludeListsForDist() {
  # $1 should go instead of

  if [ "${mailingSpecification}X" != "X" ] ;  then
    contentDistDir=${distBaseDir}/${mailingSpecification}
    FN_dirCreatePathIfNotThere ${contentDistDir}
  else
    contentDistDir="./"
  fi

  includeNamesFilePath=${contentDistDir}/${1}-include.names
  excludeNamesFilePath=${contentDistDir}/${1}-exclude.names

  FN_fileSafeKeep ${includeNamesFilePath}
  FN_fileSafeKeep ${excludeNamesFilePath}

  if [ "${includeList}X" != "X" ] ;  then
    cat ${includeList} >  ${includeNamesFilePath}
  else
    touch ${includeNamesFilePath}
  fi

  if [ "${excludeList}X" != "X" ] ;  then
    cat ${excludeList} >  ${excludeNamesFilePath}
  else
    touch ${excludeNamesFilePath}
  fi

  opDo ls -l ${includeNamesFilePath} ${excludeNamesFilePath} 1>&2
}




function vis_distNextBatch {
  # subjectValidatePrepare

  if [ $# -gt 0 ] ; then
    iv_distGenNames="$@"
  fi

  contentDistDir=${distBaseDir}/temp
  contentDistKeepDir=${distKeepBaseDir}/temp

  includeList=""
  excludeList=""

  # BEGIN includeList
  for i in ${iv_distGenNames} ; do
    thisFile=${contentDistDir}/${i}-include.names
    if test -f ${thisFile} ; then
      includeList="${includeList} ${thisFile}"
    else
      echo "Missing ${thisFile}" 1>&2
    fi
  done


  thisSrcFile=${contentDistKeepDir}/specials-include.names
  thisFile=${contentDistDir}/specials-include.names 

  if test -f ${thisFile} ; then
    includeList="${includeList} ${thisFile}"
  else
    if test -f ${thisSrcFile} ; then
      ln -s ${thisSrcFile} ${thisFile}
      includeList="${includeList} ${thisFile}"
    else
      echo "Missing ${thisFile}" 1>&2
    fi
  fi
  # END includeList


  # BEGIN excludeList
  for i in ${iv_distGenNames} ; do
    thisFile=${contentDistDir}/${i}-exclude.names
    if test -f ${thisFile} ; then
      excludeList="${excludeList} ${thisFile}"
    else
      echo "Missing ${thisFile}"
    fi
  done


  thisSrcFile=${contentDistKeepDir}/specials-exclude.names
  thisFile=${contentDistDir}/specials-exclude.names 

  if test -f ${thisFile} ; then
    excludeList="${excludeList} ${thisFile}"
  else
    if test -f ${thisSrcFile} ; then
      opDo ln -s ${thisSrcFile} ${thisFile}
      excludeList="${excludeList} ${thisFile}"
    else
      echo "Missing ${thisFile}" 1>&2
    fi
  fi

  thisFile=${contentDistDir}/${iv_logSentFile}
  if test -f ${thisFile} ; then
    excludeList="${excludeList} ${thisFile}"
  else
    echo "Missing ${thisFile}" 1>&2
  fi
  # END excludeList


  if [ "${includeList}X" != "X" ] ;  then
    if [[ "${opRunOsType}_" == "Linux_" ]] ; then
	# 
	#ANT_raw "Watch For case conversion -- Notyet"
	cat ${includeList} |  /usr/bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-include.sorted
    elif [[ "${opRunOsType}_" == "SunOS_" ]] ; then
	cat ${includeList} | /bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-include.sorted
    else
	EH_problem "Unsupported OS: ${opRunOsType}"
	return 1
    fi
  fi

  if [ "${excludeList}X" != "X" ] ;  then
    if [[ "${opRunOsType}_" == "Linux_" ]] ; then
	# 
	#ANT_raw "Watch For case conversion -- Notyet"
	cat ${excludeList} | /usr/bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-exclude.sorted
    elif [[ "${opRunOsType}_" == "SunOS_" ]] ; then
	cat ${excludeList} | /bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-exclude.sorted
    else
	EH_problem "Unsupported OS: ${opRunOsType}"
	return 1
    fi


  fi

  FN_fileSafeKeep ${contentDistDir}/nextBatch-dist.names

  comm -3 -2 ${contentDistDir}/${dateTag}-include.sorted ${contentDistDir}/${dateTag}-exclude.sorted > ${contentDistDir}/nextBatch-dist.names
  
  opDo ls -l ${contentDistDir}/nextBatch-dist.names 1>&2

  cat ${contentDistDir}/nextBatch-dist.names

  opDo /bin/rm ${contentDistDir}/${dateTag}-include.sorted ${contentDistDir}/${dateTag}-exclude.sorted

}


function vis_logsToNames {

    msendLogsFile="/usr/devenv/bbdbNames/Logs/bbdb-msend.sent"

    typeset mailingDistTag=$( cat mailingDistTag )

    if [ -z "${mailingDistTag}" ] ; then
	EH_problem "Missing Or Empty mailingDistTag"
	lpReturn 101
    fi

    logSentFilePath="./sentLog.names"
    
    /bin/egrep "^${mailingDistTag}" ${msendLogsFile} > /tmp/${G_myName}.$$ 


    if [ -s /tmp/${G_myName}.$$  ] ;  then
	cat /tmp/${G_myName}.$$ | cut -d: -f2 > ${logSentFilePath}
	wc ${logSentFilePath}	
    else
	echo "Empty Logs: ${mailingDistTag}"
    fi
    /bin/rm /tmp/${G_myName}.$$
}
