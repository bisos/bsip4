#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/lcaCvsAdmin.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

vis_help () {
  cat  << _EOF_

GLOBAL CVS options often used 

cvs -f  ### Do not read the ~/.cvsrc file.
cvs -n  ### Do not change any files.

_EOF_
}


function vis_examples {
    typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
    typeset extraInfo="-h -v -n showRun"
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
_EOF_

 cat  << _EOF_
--- Current Directory Listing ---
${G_myName} ${extraInfo} -i cvsedFilesList
${G_myName} ${extraInfo} -i cvsedFilesRecurseList
${G_myName} ${extraInfo} -i cvsedDirsList
--- Current Directory Cleaning ---
${G_myName} ${extraInfo} -i cvsedFilesClean
${G_myName} ${extraInfo} -i cvsedFilesCleanDeCvs
${G_myName} ${extraInfo} -i cvsedFilesRecurseClean
${G_myName} ${extraInfo} -i cvsedFilesRecurseCleanDeCvs
--- Current Directory DeCvs (Strip CVS Directories) ---
${G_myName} ${extraInfo} -i cvsedFlatDeCvs
${G_myName} ${extraInfo} -i cvsedRecurseDeCvs
${G_myName} ${extraInfo} -i cvsedRecurseDeCvsThere .
${G_myName} ${extraInfo} -i allRecurseDeCvs
--- CVS ADD NEW DIRECTORY ---
${G_myName} ${extraInfo} -i newAddDir par.live  # here
${G_myName} ${extraInfo} -i newAddDirPath ~ma-57000/par.live
${G_myName} ${extraInfo} -i newAddFile ~ma-57000/par.live
${G_myName} ${extraInfo} -i newAddFileHere someFile
${G_myName} ${extraInfo} -i atBaseNewAddDir ~ma-57000 par.live
--- CVS UPDATE DIRECTORY ---
${G_myName} ${extraInfo} -i updateDir ~ma-57000 
${G_myName} ${extraInfo} -i updateDir /opt/public/osmt /usr/mapFiles
${G_myName} ${extraInfo} -i updateDirCommit /opt/public/osmt
_EOF_

}


noArgsHook() {
    vis_examples
}

function vis_newAddOrUpdateCommitDirPath {
    EH_assert [[ $# -eq 1 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }

    typeset dirsPart=$( FN_dirsPart ${1} )
    typeset nonDirsPart=$( FN_nonDirsPart ${1} )

    opDo vis_atBaseNewAddOrUpdateCommitDir ${dirsPart} ${nonDirsPart}
}

function vis_atBaseNewAddOrUpdateCommitDir {
    EH_assert [[ $# -eq 2 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }

    baseDir=$1
    newDir=$2

    opDoComplain pushd ${baseDir} ; EH_retOnFail

    if [ ! -d ./CVS ] ; then
	EH_problem "Missing Base ${baseDir}/CVS -- Skipped"
	lpReturn 1
    fi
   
    opDo vis_newAddOrUpdateCommitDir ${newDir}

    opDo popd ; EH_retOnFail
    lpReturn     
}

function vis_newAddOrUpdateCommitDir {
    EH_assert [[ $# -eq 1 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }

    here=$( pwd )

    if [ ! -d ./CVS ] ; then
	EH_problem "Missing Base ${here}/CVS -- Skipped"
	lpReturn 1
    fi

    if [ -d $1/CVS ] ; then
	opDo vis_updateDirCommit ${here}/$1
    else
        #filesList=$( find $1 -type f -print | grep -v CVS)
	dirsList=$( find $1 -type d -print )
	filesList=$( find $1 -type f -print )

	opDoComplain  cvs -f add -m "New" ${dirsList} 

	opDoComplain  cvs -f add -m "New" ${filesList} 
        #EH_retOnFail

	opDoComplain cvs -f commit -m "New" ${filesList}
	EH_retOnFail
    fi

    lpReturn
}


vis_newAddDirPath () {
    EH_assert [[ $# -eq 1 ]]

    typeset dirsPart=$( FN_dirsPart ${1} )
    typeset nonDirsPart=$( FN_nonDirsPart ${1} )

    opDo vis_atBaseNewAddDir ${dirsPart} ${nonDirsPart}
}


vis_atBaseNewAddDir () {
    EH_assert [[ $# -eq 2 ]]

    baseDir=$1
    newDir=$2

    opDoComplain cd ${baseDir}
    EH_retOnFail

    if [ ! -d ./CVS ] ; then
	EH_problem "Missing Base ${baseDir}/CVS -- Skipped"
	lpReturn 1
    fi
   
    vis_newAddDir ${newDir}

    lpReturn     
}

vis_newAddDir () {
    EH_assert [[ $# -eq 1 ]]

    here=$( pwd )

    if [ ! -d ./CVS ] ; then
	EH_problem "Missing Base ${here}/CVS -- Skipped"
	lpReturn 1
    fi

    if [ -d $1/CVS ] ; then
	EH_problem "Not New $1 -- Skipped"
	lpReturn 1
    fi

    #filesList=$( find $1 -type f -print | grep -v CVS)
    dirsList=$( find $1 -type d -print )
    filesList=$( find $1 -type f -print )

    opDoComplain  cvs -f add -m "New" ${dirsList} 

    opDoComplain  cvs -f add -m "New" ${filesList} 
    #EH_retOnFail

    opDoComplain cvs -f commit -m "New" ${filesList}
    EH_retOnFail

    lpReturn 0
}


vis_newAddFile () {
    EH_assert [[ $# -eq 1 ]]

    typeset dirsPart=$( FN_dirsPart ${1} )
    typeset nonDirsPart=$( FN_nonDirsPart ${1} )

    opDoComplain pushd ${dirsPart}
    EH_retOnFail

    opDo vis_newAddFileHere ${nonDirsPart}

    opDo popd
}

vis_newAddFileHere () {
    EH_assert [[ $# -eq 1 ]]

    here=$( pwd )

    if [ ! -d ./CVS ] ; then
	EH_problem "Missing Base ${here}/CVS -- Skipped"
	lpReturn 1
    fi

    if [ -d $1/CVS ] ; then
	EH_problem "Not New $1 -- Skipped"
	lpReturn 1
    fi

    #filesList=$( find $1 -type f -print | grep -v CVS)
    #dirsList=$( find $1 -type d -print )
    filesList=$( find $1 -type f -print )

    #opDoComplain  cvs -f add -m "New" ${dirsList} 

    opDoComplain  cvs -f add -m "New" ${1} 
    #EH_retOnFail

    opDoComplain cvs -f commit -m "New" ${1}
    EH_retOnFail

    lpReturn 0
}


function vis_updateDir {
    EH_assert [[ $# -ge 1 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }


    for baseDir in $* ; do
	opDoComplain pushd ${baseDir}
	EH_retOnFail

	if [ ! -d ./CVS ] ; then
	    EH_problem "Missing Base ${baseDir}/CVS -- Skipped"
	    lpReturn 1  # or continue?
	fi

	#opDo sudo -u ${lpAcct_admin} cvs -f update -d -P -- 2> /tmp/last.$$
	opDo eval "cvs -f update -d -P -- 2> /tmp/last.$$" | 
	while  read vcStatus vcFile ; do
	    ANT_raw "${vcStatus} ${vcFile}"
	    case ${vcStatus} in
		'M'|'?'|'I'|'P')  # Modified or Patched
		    doNothing
		    ;;
		'C')
		    ANT_raw "Conflict Detected -- ${vcFile}"
		    ;;
		*)
		    EH_problem "Unknown ${vcStatus} -- ${vcFile}"
		    ;;
	    esac
	done
	
	opDo popd
    done
}

function vis_updateDirCommit {
    EH_assert [[ $# -ge 1 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }

    for baseDir in $* ; do
	opDoComplain pushd ${baseDir} 2> /dev/null ; EH_retOnFail

	if [ ! -d ./CVS ] ; then
	    EH_problem "Missing Base ${baseDir}/CVS -- Skipped"
	    lpReturn 1  # or continue?
	fi
   
	opDo eval "cvs -f update -d -P -- 2> /tmp/last.$$" |
	while  read vcStatus vcFile ; do
	    ANT_raw "${vcStatus} ${vcFile}"
	    case ${vcStatus} in
		'M'|'P')
		    opDoComplain cvs -f commit -m "Auto ${G_myName}" ${vcFile}
		    EH_retOnFail
		    ;;
		'?')
		    opDoComplain  cvs -f add -m "New" ${vcFile} 
                    #EH_retOnFail

		    opDoComplain cvs -f commit -m "New" ${vcFile}
		    EH_retOnFail
		    ;;
		'C')
		    ANT_raw "Conflict Detected -- ${vcFile}"
		    ;;
		'I')
		    doNothing
		    ;;
		*)
		    EH_problem "Unknown ${vcStatus} -- ${vcFile}"
		    ;;
	    esac
	done
	opDo popd
    done
}



vis_cvsedFilesList () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    if [ ! -r CVS/Entries ] ; then
	EH_problem "Skipped -- Missing ${here}/CVS/Entries"
	return 101
    fi
        
    opDoRet eval "( egrep -v '^D$' CVS/Entries | cut -d '/' -f 2 )"
}

vis_cvsedFilesRecurseList () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    if [ ! -r CVS/Entries ] ; then
	EH_problem "Skipped -- Missing ${here}/CVS/Entries"
	return 101
    fi

    thisTmp=/tmp/${G_myName}.$$
        
    opDoRet eval "( egrep -v '^D$' CVS/Entries | cut -d '/' -f 2 1>${thisTmp} 2>/dev/null )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDoExit cd ${thisLine}
	    opDo ${G_myName} ${extraInfo} -i cvsedFilesRecurseList
	    cd ..
	fi
	echo ${here}/${thisLine}
    done

    opDo /bin/rm ${thisTmp}
}

vis_cvsedDirsListOther () {
    set -x
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    if [ ! -r CVS/Entries ] ; then
	EH_problem "Skipped -- Missing ${here}/CVS/Entries"
	return 101
    fi

    thisTmp=/tmp/${G_myName}.$$
        
    opDoRet eval "( egrep -v '^D$' CVS/Entries | cut -d '/' -f 2 1>${thisTmp} 2>/dev/null )"

    echo ${here}

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDoExit cd ${thisLine}
	    opDo ${G_myName} ${extraInfo} -i cvsedDirsList
	    cd ..
	fi
    done

    opDo /bin/rm ${thisTmp}
}


vis_cvsedDirsList () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    thisTmp=/tmp/${G_myName}.vis_cvsedDirsList.$$
        
    opDoRet eval "( find ${here} -type d -print | egrep '/CVS$'  1>${thisTmp}  )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    # /CVS elim
	    thisLineNoCvs=$( FN_dirsPart ${thisLine} )
	    echo "${thisLineNoCvs}"
	else
	    EH_problem "Should Have Been a Directory ${thisLine}"
	fi
    done

    opDo /bin/rm ${thisTmp}
}


vis_cvsedFilesClean () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    thisTmp=/tmp/${G_myName}.$$

    opDoRet eval "( vis_cvsedFilesList 1>${thisTmp} )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDo skipping  ${thisLine}
	else
	    opDo /bin/rm ${thisLine}
	fi
    done

    opDo /bin/rm ${thisTmp}
}


vis_cvsedFilesCleanDeCvs () {
    EH_assert [[ $# -eq 0 ]]

    vis_cvsedFilesClean
    vis_cvsedFlatDeCvs
}


vis_cvsedFilesRecurseClean () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    thisTmp=/tmp/${G_myName}.vis_cvsedFilesRecurseClean.$$

    opDoRet eval "( vis_cvsedFilesRecurseList 1>${thisTmp} )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDo /bin/rmdir  ${thisLine}
	else
	    opDo /bin/rm ${thisLine}
	fi
    done

    opDo /bin/rm ${thisTmp}
}

vis_cvsedFilesRecurseCleanDeCvs () {
    EH_assert [[ $# -eq 0 ]]

    # NOTYET, get list of the cvsedDirectories and save it in a tmp file
    # After DeCvs do a rmdir on those.
    #
    opDo vis_cvsedFilesRecurseClean
    opDo vis_cvsedRecurseDeCvs
}


vis_cvsedFlatDeCvs () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    if [ ! -r CVS/Entries ] ; then
	EH_problem "Skipped -- Missing ${here}/CVS/Entries"
	return 101
    fi
        
    opDoRet  /bin/rm -r ${here}/CVS
}

vis_cvsedRecurseDeCvs () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    if [ ! -r CVS/Entries ] ; then
	EH_problem "Skipped -- Missing ${here}/CVS/Entries"
	return 101
    fi

    thisTmp=/tmp/${G_myName}.vis_cvsedRecurseDeCvs.$$
        
    opDoRet eval "( vis_cvsedDirsList 1>${thisTmp}  )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDoExit cd ${thisLine}
	    vis_cvsedFlatDeCvs
	else
	    EH_problem "Should Have Been a Directory ${thisLine}"
	fi
    done

    opDo /bin/rm ${thisTmp}
}

vis_allRecurseDeCvs () {
    EH_assert [[ $# -eq 0 ]]

    here=$( pwd )

    thisTmp=/tmp/${G_myName}.vis_cvsedRecurseDeCvs.$$
        
    opDoRet eval "( find . -type d -print | egrep '/CVS$'  1>${thisTmp}  )"

    cat ${thisTmp} | 
    while read  thisLine  ; do
	if [ -d ${thisLine} ] ; then
	    opDoExit /bin/rm -r -f ${thisLine}
	else
	    EH_problem "Should Have Been a Directory ${thisLine}"
	fi
    done

    opDo /bin/rm ${thisTmp}
}

function vis_cvsedRecurseDeCvsThere {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset thisArg=""
    for thisArg in "$@" ; do
	if [ -d "${thisArg}" ] ; then
	    opDoRet pushd "${thisArg}"
	    opDo vis_cvsedRecurseDeCvs
	    opDo popd
	else
	    ANT_raw "${thisArg} is not a directory -- skipped"
	fi
    done

    lpReturn
}
