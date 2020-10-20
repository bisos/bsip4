#!/bin/bash


IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/usgAcctCurrents.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

vis_help () {
  cat  << _EOF_

This file is the primary interface to the Browser. 
Two methods are supported:

  1) MozRepl -- 
      Powerfull but not reliable
  2) firefox -remote 'openURL(http://emacswiki.org/, new-tab)'
      Reliable but not flexible. Mouse goes to the 

WEB SAYS:
I finally get it: set browser.link.open_newwindow to 1 (for example
using about:config), ie make Firefox "Open links, that would normally
open in a new window, in the current tab/window.".


_EOF_
}


. ${opBinBase}/lpErrno.libSh

# . ${opBinBase}/bystarHook.libSh

# bystarMail.libSh 
. ${opBinBase}/bystarMail.libSh

# ./bystarDnsDomain.libSh 
# . ${opBinBase}/bystarDnsDomain.libSh
# . ${opBinBase}/mmaDnsLib.sh


# . ${opBinBase}/bynameLib.sh
# . ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh

# bxo_lib.sh
. ${opBinBase}/bxo_lib.sh

# bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh

# bystarCentralAcct.libSh 
# . ${opBinBase}/bystarCentralAcct.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarHook.libSh

# ./bxo_lib.sh
. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t acctTypePrefix=""
typeset -t bystarUid=""

function G_postParamHook {
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    lpCurrentsGet
}


function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""
# NOTYET, outofdate
  typeset doLibExamples=`doLibExamplesOutput ${G_myName}`

  typeset thisAcctTypePrefix="sa"
  typeset thisOneSaNu="sa-20000"
  #typeset thisOneSaNu=${oneBystarAcct}
  #typeset thisOneSaNu=${currentBystarUid}
  typeset oneSubject="qmailAddr_test"
  typeset runInfo="-p ri=any:mailFolders"
  typeset runInfo=""

  typeset oneMailDirBase=$( FN_absolutePathGet ~sa-20000 )/${bystarAcctMailDirBase}

  typeset oneSubjectFolder=INBOX.job
  typeset oneDestSpamFolder=INBOX.spam.detected.often


#${doLibExamples}
 cat  << _EOF_
EXAMPLES:
----
${G_myName} ${extraInfo} ${runInfo} -i openUrlNewTabOne http://www.byname.com
${G_myName} ${extraInfo} ${runInfo} -i openUrlThisTab http://www.neda.com
lpEach.sh -i prepend "http://" www.neda.com www.byname.com | ${G_myName} ${extraInfo} ${runInfo} -i openUrlNewTab
_EOF_
}


noArgsHook() {
  vis_examples
}

noSubjectHook() {
  return 0
}


####+BEGIN: bx:dblock:lsip:bash:function :func "vis_openUrlNewTabSleep" :type "nonidempotent"
# {{{ vis_openUrlNewTab
function vis_openUrlNewTabSleep {
    #TM_funcEntered
    #thisFuncName=$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )
####+END:
    EH_assert [[ $# -ge 0 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }
    retVal=0 

    if [ $# -eq 0 ] ; then
	while read this ; do
	    vis_openUrlNewTabOne ${this}
	    opDo sleep 1
	done
    else
	for this in $@; do
	    vis_openUrlNewTabOne ${this}
	    opDo sleep 1
	done
    fi

    lpReturn ${retVal}
}
# }}}




####+BEGIN: bx:dblock:lsip:bash:function :func "vis_openUrlNewTab" :type "nonidempotent"
# {{{ vis_openUrlNewTab
function vis_openUrlNewTab {
    #TM_funcEntered
    thisFuncName=$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )
####+END:
    EH_assert [[ $# -ge 0 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }
    retVal=0 

    if [ $# -eq 0 ] ; then
	while read this ; do
	    vis_openUrlNewTabOne ${this}
	done
    else
	for this in $@; do
	    vis_openUrlNewTabOne ${this}
	done
    fi

    lpReturn ${retVal}
}
# }}}



####+BEGINNOT: bx:dblock:lsip:bash:function :func "vis_openUrlNewTabOne" :type "nonidempotent"
# {{{ vis_openUrlNewTabOne
function vis_openUrlNewTabOne {
    # TM_funcEntered
    # thisFuncName=$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )
####+END:

    G_funcEntry
    EH_assert [[ $# -eq 1 ]]
    function describeF {  cat  << _EOF_
_EOF_
    }

    #opDoRet firefox -remote "openURL("${1}", new-tab)"
    
    #opDo rm /acct/employee/lsipusr/.mozilla/firefox/2x91uh1p.default/.parentlock
    #opDoRet firefox --new-tab ${1}  &

    opDoRet firefox-bx ${1}

    lpReturn
}
# }}}


function vis_openUrlThisTab {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 

You must first set browser.link.open_newwindow to 1 (using about:config),
ie make Firefox "Open links, that would normally
open in a new window, in the current tab/window.".

_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    opDoRet firefox -remote "openURL("${1}")"

    lpReturn
}
