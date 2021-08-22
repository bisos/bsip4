#!/bin/bash

#
# RCS Revision: $Id: ocp-sup.sh,v 1.5 2017-05-06 01:42:28 lsipusr Exp $
#

#
# Description:
#


function hookRun {
  typeset hookFuncName=""

  EH_assert [[ $# -eq 1 ]]

  hookFuncName=`ListFuncs | egrep "^$1$"`

  if [ "${hookFuncName}X" != "X" ] ;   then
    ${hookFuncName}
  fi
}


function FN_safeKeepsCleanHere {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    typeset filesList=$( find ${here} -maxdepth 1 -print | egrep "\.[0-9][0-9]*$" )

    if [ ! -z "${filesList}" ] ; then
        opDo /bin/rm ${filesList}
    else
        ANT_raw "Nothing to clean in ${here}"
    fi

    lpReturn
}

function FN_safeKeepsCleanHereAndBelow {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    typeset filesList=$( find ${here} -print | egrep "\.[0-9][0-9]*$" )

    if [ ! -z "${filesList}" ] ; then
        opDo /bin/rm ${filesList}
    else
        ANT_raw "Nothing to clean in ${here}"
    fi

    lpReturn
}

function DATE_nowTag {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    date +%Y%m%d%H%M%S

    lpReturn
}


function FN_dirRemoveIfThere {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset thisDir=""
    for thisDir in $@ ; do
        if [ -d "${thisDir}" ] ; then
            opDo /bin/rm -r -f "${thisDir}"
        fi
    done
    lpReturn
}



function bashNamespaceIndexedArraysList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset -a  | cut -d '=' -f 1 | sed -e s/"declare -a "//

    lpReturn
}

function bashNamespaceAssociativeArraysList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset -A  | cut -d '=' -f 1 | sed -e s/"declare -A "//

    lpReturn
}

function slashesToUnderscores { 
    echo $1 | sed -e 's:/:_:g'
}

function underscoresToSlashes { 
    echo $1 | sed -e 's:_:/:g'
}

function FN_fileDoesExist {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if [ -f $1 ] ; then
        lpReturn 0
    else
        EH_problem "Missing $1"
        lpReturn 101
    fi
}


function g_resultsCapture {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Invokes \$@ and captures stdOut stdErr and exitValue. Returns exitValue.
Produces Global Values: g_resultsExitValue g_resultsStdout g_resultsStderr
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset procStdoutFile=$( mktemp )
    typeset procStderrFile=$( mktemp )

    opDo eval "$@" \> "${procStdoutFile}" 2\> "${procStderrFile}"
    g_resultsExitValue=$?
    #typeset -p g_resultsExitValue

    g_resultsStdout=$( cat ${procStdoutFile} )
    g_resultsStderr=$( cat ${procStderrFile} )

    #opDo rm ${procStdoutFile}
    rm ${procStdoutFile}
    #opDo rm ${procStderrFile}
    rm ${procStderrFile}

    lpReturn  ${g_resultsExitValue}
}


function EH_problem_g_resultsShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset -p g_resultsStderr g_resultsStdout
    EH_problem "g_resultsExitValue=${g_resultsExitValue}"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_linkAllFilesToAnotherDir    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_linkAllFilesToAnotherDir {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset srcDir=$1
    typeset destDir=$2

    opDo ln -s ${srcDir}/* ${destDir}

    lpReturn
}


function dictRead {   # BASH Associative Array Lookup
    EH_assert [[ $# -eq 2 ]]
    declare dict="$1"
    declare key="$2"
    
    #declare gotVal
    
    #gotVal="$( eval printf -- '$'{${dict}[${key}]} )"
    
    #printf -- "${gotVal}"

    #printf -- $( eval printf -- $( eval printf -- "'$'{${dict}[${key}]}" ))
    
    #printf --  "$( eval echo '$'{${dict}[${key}]} )"
    #eval printf --  '$'{${dict}[${key}]})
    
    #printf "%s\n" "$( eval echo  '$'{${dict}[${key}]} )"

    printf "%s\n" "$( eval  printf --  \"'$'{${dict}[${key}]}\" )"
}
