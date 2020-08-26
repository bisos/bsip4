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

function vis_bisosAcct_bystarUid { echo 2001; }
function vis_bisosAcct_bystarName { echo bystar; }
function vis_bisosAcct_bystarGid { echo bisos; }

function vis_bisosAcct_bxisoDelimiterUid { echo 1000000; }
function vis_bisosAcct_bxisoDelimiterName { echo bxisoDelimiter; }
function vis_bisosAcct_bxisoDelimiterGid { echo bisos; }

function vis_bisosGeneralAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "BISOS User Accounts Management" )
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

function vis_bisosGroupExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "BISOS Account And Group Management" )
${G_myName} ${extraInfo} -i userAcctUpdate_bisos passwd_tmpSame
${G_myName} ${extraInfo} -i bisosAcctVerify
_EOF_
}

function vis_usgAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "Usage (usg) Accounts" )
${G_myName} ${extraInfo} -i usgAcctNextLocalUidNu
${G_myName} ${extraInfo} -i usgAcctPasswd bystar
${G_myName} ${extraInfo} -i usgAcctPasswd oneUsgAcct
${G_myName} ${extraInfo} -i usgAcctAdd bystar
${G_myName} ${extraInfo} -i usgAcctAdd oneUsgAcct
${G_myName} ${extraInfo} -i usgAcctCreate bystar    # acctAdd, passwdSet, sudoers, report
${G_myName} ${extraInfo} -i usgAcctCreate oneUsgAcct
${G_myName} ${extraInfo} -i usgAcctDelete bystar
${G_myName} ${extraInfo} -i usgAcctdelete oneUsgAcct
${G_myName} ${extraInfo} -i usgAcctVerify bystar
${G_myName} ${extraInfo} -i usgAcctVerify oneUsgAcct
_EOF_
}

function vis_bxisoAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "BxISO (Info and Service Objects) Accounts" )
${G_myName} ${extraInfo} -i bxisoAcctNextLocalUidNu
${G_myName} ${extraInfo} -i bxisoAcctAdd bxisoAcct0
${G_myName} ${extraInfo} -i bxisoAcctAdd oneBxisoAcct
${G_myName} ${extraInfo} -i bxisoAcctCreate bxisoAcct0   # acctAdd, passwdSet, sudoers, report
${G_myName} ${extraInfo} -i bxisoAcctCreate oneBxisoAcct
${G_myName} ${extraInfo} -i bxisoAcctVerify bxisoAcct0
${G_myName} ${extraInfo} -i bxisoAcctVerify oneBxisoAcct
${G_myName} ${extraInfo} -i bxisoAcctDelete bxisoAcct0
${G_myName} ${extraInfo} -i bxisoAcctDelete oneBxisoAcct
_EOF_
}



function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local passwdPolicy=$1

    #
    # Order is important
    #
    
    lpDo vis_userAcctUpdate_bisos ${passwdPolicy}
    
    # lpDo vis_userAcctUpdate_bystar ${passwdPolicy}

    lpDo vis_userAcctsReport bisos  # bystar

    lpReturn
}


function vis_userAcctPasswdSet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This is not being used at this time. It should be moved into a bisos environment script.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

}


function vis_userAcctCreate_bystar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This is not being used at this time. It should be moved into a bisos environment script.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    local passwdPolicy=$1

    local userAcctName="bystar"
    local userAcctGroup="bisos"
    #local userAcctSupplementryGroups=""        
    local userAcctPasswd=""

    if vis_userAcctsExist ${userAcctName} ; then
	EH_problem "${userAcctName} Exists"
	lpReturn 101
    fi

    userAcctPasswd=$( vis_getPasswdForAcct ${userAcctName} ${passwdPolicy} )

    lpDo useradd \
	 --uid "${acctUid}" \
	 --comment "ByStar User Acct" \
	 --gid "${userAcctGroup}" \
	 --shell /bin/bash \
	 --create-home \
	 ${userAcctName}

    lpDo eval "echo ${userAcctName}:${userAcctPasswd} | sudo -S /usr/sbin/chpasswd"    

    #
    #  NOTYET, below is for Fedora/Centos/Redhat
    #
    #lpDo eval "echo ${userAcctPasswd} | sudo -S passwd ${userAcctPasswd} --stdin"
    #
    #lpDo sudo usermod -aG wheel ${userAcctPasswd}
    #

    lpDo sudo sh -c "echo ${userAcctName} ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers"

    lpDo vis_userAcctsReport ${userAcctName}

    lpReturn
}


function vis_usgAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1

    if vis_userAcctExists "${acctName}" ; then
	EH_problem "${acctName} Already Exists -- Addition Skipped"
	lpReturn 101
    fi

    lpDo vis_usgAcctAdd "${acctName}"

    lpDo vis_usgAcctPasswdSet "${acctName}"

    lpDo vis_userAcctsReport ${userAcctName}
}

function vis_usgAcctPasswd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1

    if vis_userAcctExists "${acctName}" ; then
	EH_problem "${acctName} Already Exists -- Processing Skipped"
	lpReturn 101
    fi

    local userAcctPasswd=$( vis_getPasswdForAcct ${acctName} ${passwdPolicy} )

    lpDo eval "echo ${acctName}:${userAcctPasswd} | sudo -S /usr/sbin/chpasswd"    

    #
    #  NOTYET, below is for Fedora/Centos/Redhat
    #
    #lpDo eval "echo ${userAcctPasswd} | sudo -S passwd ${userAcctPasswd} --stdin"
    #
    #lpDo sudo usermod -aG wheel ${userAcctPasswd}
    #
}


function vis_usgAcctAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add the USG account if it does not exist.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"

    if vis_userAcctExists "${acctName}" ; then
	EH_problem "${acctName} Already Exists -- Addition Skipped"
	lpReturn 101
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    local acctGid="$( vis_bisosAcct_bystarGid )"
    local acctUid=""
    local acctComment=""
    local acctHome="/bxo/usg/${acctName}"
    local supplementaryGroups="lsipusr"  # NOTYET, locate existing code in 

    if [ "${acctName}" == "$( vis_bisosAcct_bystarName )" ] ; then
	acctUid=$( vis_bisosAcct_bystarUid )
	acctComment="BISOS Default Usage Acct"
    else
	acctUid=$( vis_usgAcctNextLocalUidNu )
	acctComment="BISOS Named Usage Acct"	
    fi

    lpDo useradd \
	 --uid "${acctUid}" \
	 --gid "${acctGid}" \
	 --groups "${supplementaryGroups}" \
	 --shell /bin/bash \
	 --home-dir "${acctHome}" \
	 --comment "${acctComment}" \
	 ${acctName}

    lpReturn
}


function vis_bxisoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1
    local acctUidIncrement=$2
}

function vis_bxisoAcctAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1
    local acctUidIncrement=$2

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    local passwdPolicy=$1

    local userAcctName="bystar"
    local userAcctGroup="bisos"
    #local userAcctSupplementryGroups=""        
    local userAcctPasswd=""

    if vis_userAcctsExist ${userAcctName} ; then
	EH_problem "${userAcctName} Exists"
	lpReturn 101
    fi

    userAcctPasswd=$( vis_getPasswdForAcct ${userAcctName} ${passwdPolicy} )

    lpDo useradd \
	 --uid "${acctUid}" \
	 --comment "ByStar User Acct" \
	 --gid "${userAcctGroup}" \
	 --shell /bin/bash \
	 --create-home \
	 ${userAcctName}

    lpDo eval "echo ${userAcctName}:${userAcctPasswd} | sudo -S /usr/sbin/chpasswd"    

    #
    #  NOTYET, below is for Fedora/Centos/Redhat
    #
    #lpDo eval "echo ${userAcctPasswd} | sudo -S passwd ${userAcctPasswd} --stdin"
    #
    #lpDo sudo usermod -aG wheel ${userAcctPasswd}
    #

    lpDo sudo sh -c "echo ${userAcctName} ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers"

    lpDo vis_userAcctsReport ${userAcctName}

    lpReturn
}




function vis_userAcctUpdate_bisos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    local passwdPolicy=$1

    if [ -z "${bisosUserName}" ] ; then
	EH_problem "Missing bisosUserName"
	lpReturn 101
    fi

    if [ -z "${bisosGroupName}" ] ; then
	EH_problem "Missing bisosGroupName"
	lpReturn 101
    fi

    local userAcctName="${bisosUserName}"
    local userAcctGroup="${bisosGroupName}"

    if vis_userAcctsExist ${userAcctName} ; then
	EH_problem "${userAcctName} User Acct Already Exists"

	#
	# The account does not exist, so the group should not exist as well
	#

	if vis_groupsExist ${userAcctGroup} ; then
	    EH_problem "${userAcctGroup} Group Exists, It Should Not"
	    lpDo vis_groupsDelete ${userAcctGroup}
	fi
	lpReturn 101
    fi

    if vis_groupsExist ${userAcctGroup} ; then
	ANT_raw "${userAcctGroup} Group Exists, groupsAdd skipped"
    else
	vis_groupsAdd ${userAcctGroup}
    fi

    #
    # No Home, No Login-Shell
    #  	 	 --gid ${userAcctGroup}

    lpDo useradd \
	 --home /bisos \
	 --no-create-home \
	 --gid "${userAcctGroup}" \
	 --shell /usr/sbin/nologin \
	 --comment "ByStar Internet Services OS" \
	 ${userAcctName}

    lpDo sudo sh -c "echo ${userAcctName} ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers"

    lpDo vis_userAcctsReport ${userAcctName}

    lpReturn
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

function vis_getInitialPasswdForAcct {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on specified policy, get an initial passwd for account. 
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local userAcctName=$1    
    local passwdPolicy=$2

    local userAcctPasswd="bisos"

    case ${passwdPolicy} in
	"passwd_tmpSame")
	    userAcctPasswd=${userAcctName}
	    ;;
	*)
	    EH_problem "Unknown: ${passwdPolicy}"
	    ;;
    esac

    echo ${userAcctPasswd}

    lpReturn 
}


function vis_usgAcctNextLocalUidNu {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Usage Account (usg) -- usgAcctMin=2000 -- hence :2[0-9][0-9][0-9]:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local lastNuStr=$( sort -g -t : -k 3 /etc/passwd | \
			   egrep '^.*:.*:2[0-9][0-9][0-9]:' |\
			   tail -1 |\
			   cut -d : -f 3 \
	  )
    local nextNu=0

    if [ -z "${lastNuStr}" ] ; then
	EH_problem ""
	lpReturn 101
    fi

    nextNu=$( expr $lastNuStr +  1 )
    
    echo ${nextNu}

    lpReturn
}	

function vis_bxisoAcctNextLocalUidNu {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
ByStar Information Or Service Object Account (bxiso) -- bxisoAcctMin=1000000 -- hence :1[0-9][0-9][0-9][0-9][0-9][0-9]:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local lastNuStr=$( sort -g -t : -k 3 /etc/passwd | \
			   egrep '^.*:.*:1[0-9][0-9][0-9][0-9][0-9][0-9]:' |\
			   tail -1 |\
			   cut -d : -f 3 \
	  )
    local nextNu=0

    if [ -z "${lastNuStr}" ] ; then
	EH_problem ""
	lpReturn 101
    fi

    nextNu=$( expr $lastNuStr +  1 )
    
    echo ${nextNu}

    lpReturn
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
