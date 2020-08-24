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

function vis_doTheWork {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_failExample
    EH_retOnFail

    lpReturn
}


function vis_bsiosAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "BISOS User Accounts Management" )
$( examplesSeperatorSection "Full Operations" )
${G_myName} ${extraInfo} -i fullUpdate passwd_tmpSame
${G_myName} ${extraInfo} -i fullDelete
$( examplesSeperatorSection "Accounts Update/Creation" )
${G_myName} ${extraInfo} -i userAcctUpdate_bisos passwd_tmpSame
${G_myName} ${extraInfo} -i userAcctUpdate_bystar passwd_tmpSame
$( examplesSeperatorSection "Accounts Manipulation" )
${G_myName} ${extraInfo} -i groupsExist bisos bystar lsipusr ; echo \$?
${G_myName} ${extraInfo} -i userAcctsExist bisos bystar lsipusr ; echo \$?
${G_myName} ${extraInfo} -i userAcctsDelete bisos bystar ; echo \$?
${G_myName} ${extraInfo} -i groupsDelete bystar ; echo \$?
$( examplesSeperatorSection "Accounts Information" )
${G_myName} ${extraInfo} -i userAcctsReport bisos bystar
${G_myName} ${extraInfo} -i userAcctsReport bystar
${G_myName} ${extraInfo} -i userAcctsReport bisos
sudo tail /etc/sudoers
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

function vis_fullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #
    # Order is important
    #

    # lpDo vis_userAcctsDelete bystar
    
    lpDo vis_userAcctsDelete bisos



    lpReturn
}


function vis_userAcctUpdate_bystar {
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
echo someParam and args
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local each=""
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
    
    for each in ${inputsList} ; do
	lpDo processEach ${each}
    done
    
    lpReturn
}

function vis_groupsAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add specified groups.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local each=""
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
    
    for each in ${inputsList} ; do
	lpDo processEach ${each}
    done
    
    lpReturn
}


function vis_groupsDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local each=""
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
    
    for each in ${inputsList} ; do
	lpDo processEach ${each}
    done
    
    lpReturn
}



function vis_userAcctsReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local each=""
    local thisFunc=${G_thisFunc}

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local userAcctName=$1
	if ! vis_userAcctsExist ${userAcctName} ; then
	    EH_problem "${userAcctName} Does Not Exist -- ${thisFunc} Processing Skipped"
	    lpReturn 101
	fi

	lpDo getent passwd ${userAcctName}
	lpDo getent group ${userAcctName}

	lpDo sudo -u ${userAcctName} id
    }
    
    for each in ${inputsList} ; do
	lpDo processEach ${each}
    done
    
    lpReturn
}

function vis_groupsExist {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local retVal=0
    local exitCode=0
    local each=""
    
    for each in ${inputsList} ; do
	getent group ${each} > /dev/null 2>&1
	exitCode=$?
	if [ ${exitCode} -ne 0 ] ; then
	    retVal=${exitCode}
	    break
	fi
    done
    lpReturn ${retVal}
}


function vis_userAcctsExist {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inputsList="$@"
    local retVal=0
    local exitCode=0
    local each=""
    
    for each in ${inputsList} ; do
	getent passwd ${each} > /dev/null 2>&1
	exitCode=$?
	if [ ${exitCode} -ne 0 ] ; then
	    retVal=${exitCode}
	    break
	fi
    done
    lpReturn ${retVal}
}

function vis_getPasswdForAcct {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
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
  EH_assert [[ $# -eq  0 ]]

  passwdFileInfo=$( egrep '^..-16' /etc/passwd | sort | tail -1 | cut -d: -f1 )

  if [ "${passwdFileInfo}_" == "_" ] ; then 
    echo "16001"
  else
    lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
    nextNu=$( expr $lastNuStr +  1 )
    echo ${nextNu}
  fi
}


function checkAcctExist {

  typeset thisName="$@"

  typeset inEtcPasswd_userid=`cat /etc/passwd | grep -i ":${thisName}:" | cut -d: -f1`
  
  if [[ -n ${inEtcPasswd_userid} ]] ; then
    print "${inEtcPasswd_userid}"
    return 1
  else
    print "none"
    return 0
  fi
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
