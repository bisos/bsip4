#!/bin/bash # -*- mode: sh-mode; -*-

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

function vis_unisosAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "Unisos User Accounts Management" )
$( examplesSeperatorSection "Accounts Manipulation" )
${G_myName} ${extraInfo} -i groupsExist bisos bystar lsipusr ; echo \$?
${G_myName} ${extraInfo} -i userAcctsExist bisos bystar lsipusr ; echo \$?
${G_myName} ${extraInfo} -i userAcctsDelete bisos bystar ; echo \$?
${G_myName} ${extraInfo} -i groupsDelete bystar ; echo \$?
$( examplesSeperatorChapter "General Purpose Accounts Processing Facilities" )
${G_myName} -i userAcctsReport bisos bystar lsipusr
${G_myName} ${extraInfo} -i userAcctsReport bystar
sudo tail /etc/sudoers
pwck
grpck
_EOF_
}

function vis_userAcctsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete specified user accounts.
Design Pattern: processEach based on args or stdin.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local userAcctName=$1
	if ! vis_userAcctsExist ${userAcctName} ; then
	    EH_problem "${userAcctName} Does Not Exist -- ${thisFunc} Processing Skipped"
	    lpReturn 101
	fi
	lpDo sudo userdel ${userAcctName}    	
    }

####+BEGIN: bx:bsip:bash/processEachArgsOrStdin 
    if [ $# -gt 0 ] ; then
	local each=""
	for each in ${inputsList} ; do
	    lpDo processEach ${each}
	done
    else
	local eachLine=""
	while read -r -t 1 eachLine ; do
	    if [ ! -z "${eachLine}" ] ; then
		local each=""
		for each in ${eachLine} ; do
		    lpDo processEach ${each}
		done
	    fi
	done
    fi

####+END:
    
    
    lpReturn
}

function vis_groupsAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add specified groups.
Design Pattern: processEach based on args or stdin.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local groupName=$1
	if vis_groupsExist ${groupName} ; then
	    EH_problem "${groupName} Already Does Exist -- ${thisFunc} Processing Skipped"
	    lpReturn 101
	fi
	lpDo sudo groupadd ${groupName}    	
    }

####+BEGIN: bx:bsip:bash/processEachArgsOrStdin 
    if [ $# -gt 0 ] ; then
	local each=""
	for each in ${inputsList} ; do
	    lpDo processEach ${each}
	done
    else
	local eachLine=""
	while read -r -t 1 eachLine ; do
	    if [ ! -z "${eachLine}" ] ; then
		local each=""
		for each in ${eachLine} ; do
		    lpDo processEach ${each}
		done
	    fi
	done
    fi

####+END:
    
    lpReturn
}


function vis_groupsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete specified groups.
Design Pattern: processEach based on args or stdin.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local groupName=$1
	if ! vis_groupsExist ${groupName} ; then
	    EH_problem "${groupName} Does Not Exist -- ${thisFunc} Processing Skipped"
	    lpReturn 101
	fi
	lpDo sudo groupdel ${groupName}    	
    }

####+BEGIN: bx:bsip:bash/processEachArgsOrStdin 
    if [ $# -gt 0 ] ; then
	local each=""
	for each in ${inputsList} ; do
	    lpDo processEach ${each}
	done
    else
	local eachLine=""
	while read -r -t 1 eachLine ; do
	    if [ ! -z "${eachLine}" ] ; then
		local each=""
		for each in ${eachLine} ; do
		    lpDo processEach ${each}
		done
	    fi
	done
    fi

####+END:
    
    lpReturn
}



function vis_userAcctsReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Report on a user account, inputs can come from args or from stdin.
Design Pattern: processEach based on args or stdin.
Examples:
      ${G_myName} -i userAcctsReport bisos
      echo bisos bystar | ${G_myName} -i userAcctsReport
_EOF_
    }
    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local userAcctName=$1
	if vis_userAcctExists. ${userAcctName} ; then
	    EH_problem "${userAcctName} Does Not Exist -- ${thisFunc} Processing Skipped"
	    lpReturn 101
	fi

	ANT_raw "--- ${userAcctName}: passwd, group, id, sudoers ---"
	
	lpDo getent passwd ${userAcctName}
	lpDo getent group ${userAcctName}

	lpDo sudo -u ${userAcctName} id
	lpDo sudo grep ${userAcctName} /etc/sudoers
    }

####+BEGIN: bx:bsip:bash/processEachArgsOrStdin 
    if [ $# -gt 0 ] ; then
	local each=""
	for each in ${inputsList} ; do
	    lpDo processEach ${each}
	done
    else
	local eachLine=""
	while read -r -t 1 eachLine ; do
	    if [ ! -z "${eachLine}" ] ; then
		local each=""
		for each in ${eachLine} ; do
		    lpDo processEach ${each}
		done
	    fi
	done
    fi

####+END:
    
    lpReturn
}

function vis_groupExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Return zero if specified group exists.
Return non-zero -- exitCode of getent -- if specified group does not exist.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local groupNameOrGid="$1"
    local exitCode=0

    getent group ${groupNameOrGid} > /dev/null 2>&1
    exitCode=$?

    lpReturn ${exitCode}
}

    

function vis_userAcctExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Return zero if specified userAcct exists.
Return non-zero -- exitCode of getent -- if specified userAcct does not exist.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local userAcctNameOrUid="$1"
    local exitCode=0

    getent passwd ${userAcctNameOrUid} > /dev/null 2>&1
    exitCode=$?

    lpReturn ${exitCode}
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
