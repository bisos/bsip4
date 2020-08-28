#!/bin/bash # -*- mode: sh-mode; -*-

IimBriefDescription="Library: For BISOS Accounts -- BleePanel: XXX"

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

function vis_bisosAcct_bystarName { echo bystar; }
function vis_bisosAcct_bystarUid { echo 2001; }

function vis_bisosAcct_usgGid { vis_bisosGroup_bisosGid; }
function vis_bisosAcct_usgHomeBase { echo "${bxp_rootDir_bxo}/usg"; }

function vis_bisosAcct_bxisoDelimiterName { echo bxisoDelimiter; }
function vis_bisosAcct_bxisoDelimiterUid { echo 1000000; }

function vis_bisosAcct_bxisoGid { vis_bisosGroup_bisosGid; }
function vis_bisosAcct_bxisoHomeBase { echo "${bxp_rootDir_bxo}/iso"; }


function vis_bisosAccountsProvisionExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "Provisioning Setups" )
${G_myName}  -i bisosAcctsProvisionSetup   # Summary outputs
${G_myName} ${extraInfo} -i bisosAcctsProvisionSetup    # Detailed outputs
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
${G_myName} ${extraInfo} -i usgAcctCreate bystar    # acctAdd,  sudoers, report, passwdSet
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
${G_myName} ${extraInfo} -i bxisoAcctAdd bxisoDelimiter
${G_myName} ${extraInfo} -i bxisoAcctAdd oneBxsoAcct
${G_myName} ${extraInfo} -i bxisoAcctCreate bxisoDelimiter  # acctAdd, sudoers, report
${G_myName} ${extraInfo} -i bxisoAcctCreate oneBxsoAcct
${G_myName} ${extraInfo} -i bxisoAcctDelete bxisoDelimiter
${G_myName} ${extraInfo} -i bxisoAcctDelete oneBxsoAcct
${G_myName} ${extraInfo} -i bxisoAcctVerify bxisoDelimiter
${G_myName} ${extraInfo} -i bxisoAcctVerify oneBxsoAcct
_EOF_
}

function vis_bisosAcctsProvisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Update required groups and accounts at provisioning time.
Repeatable: 
	You can re-run this function multiple times.
Assumptions:
	1) bisos group has already been created.
	2) bisos account has already been created.
Actions:
	1) Verify that bisos group is properly setup.
	2) Verify that bisos account is properly setup.
	3) Create the bystar account.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosGroupName=$( vis_bisosGroup_bisosGroupName )
    
    if vis_bisosGroupVerify ; then
	ANT_raw "${bisosGroupName} group is as expected."
    else
	EH_problem "${bisosGroupName} group is missing or misconfigured -- Re-run bisosGroupAdd"
	lpReturn 101
    fi

    local bisosGroupAcctName="$( vis_bisosAcct_bisosName )"

    if vis_bisosGroupAcctVerify ; then
	ANT_raw "${bisosGroupAcctName} account is as expected."
    else
	EH_problem "${bisosGroupAcctName} account is missing or misconfigured -- Re-run bisosGroupAdd"
	lpReturn 101
    fi

    opDo vis_usgAcctCreate bystar

    opDo vis_bxisoAcctCreate bxisoDelimiter

    lpReturn
}


function vis_usgAcctVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete bisos group, if needed.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]


    local acctName="$1"
    
    local acctUid=0
    local acctGid="$( vis_bisosAcct_usgGid )"
    local acctHome="$( vis_bisosAcct_usgHomeBase )/${acctName}"    

    if vis_userAcctExists "${acctName}" ; then
	acctUid=$( forAcctNameGetUid ${acctName} )
    else
	ANT_raw "${acctName} account entry does not exist in /etc/passwd"
	lpReturn 101
    fi
    
    if ! vis_bisosGroupVerify ; then
	EH_problem "${acctGid} Group is missing or misconfigured -- Re-run bisosGroupAdd"
	lpReturn 101
    fi
    
    lpDo vis_accountVerify ${acctName} ${acctUid} ${acctGid} ${acctHome}
}



function vis_usgAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1

    local acctGid="$( vis_bisosGroup_bisosGroupName )"
    
    if vis_groupExists ${acctGid} ; then    
	if ! vis_bisosGroupVerify ; then
	    EH_problem "${acctGid} group is misconfigured -- Re-run bisosGroupAdd"
	    lpReturn 101
	fi
    else
	EH_problem "${acctGid} group is missing Re-run bisosGroupAdd"
	lpReturn 101
    fi

   if vis_userAcctExists "${acctName}" ; then
       if vis_usgAcctVerify "${acctName}" ; then
	   ANT_raw "${acctName} exists and is properly configured. It will be used"
       else
	   EH_problem "${acctName} account is misconfigured"
	   lpReturn 101
       fi
   else
       opDo vis_usgAcctAdd ${acctName}
   fi

   opDo vis_sudoersAddLine "${acctName}" ALL NOPASSWD

   # the sudo -u ${acctName} id -- results in creation of the homeDir
   opDo vis_userAcctsReport ${acctName}   

   lpDo vis_usgAcctPasswdSet "${acctName}"
}

function vis_usgAcctPasswdSet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1

    if ! vis_userAcctExists "${acctName}" ; then
	EH_problem "Missing ${acctName} account -- Processing Skipped"
	lpReturn 101
    fi

    local userAcctPasswd=$( vis_getInitialPasswdForAcct ${acctName} "intra" )

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

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;        
    
    if vis_userAcctExists "${acctName}" ; then
	EH_problem "${acctName} Already Exists -- Addition Skipped"
	lpReturn 101
    fi

    local acctGid="$( vis_bisosAcct_usgGid )"
    local acctUid=""
    local acctComment=""
    local acctHome="$( vis_bisosAcct_usgHomeBase )/${acctName}"
    local supplementaryGroups="adm"  # NOTYET, locate existing code in 

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

function vis_usgAcctDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the usg account.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"

    lpDo vis_userAcctsDelete ${acctName}

    lpReturn
}



function vis_bxisoAcctVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Verify a bxiso account.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]


    local acctName=$1
    
    local acctUid=0
    local acctGid="$( vis_bisosAcct_usgGid )"
    local acctHome="$( vis_bisosAcct_bxisoHomeBase )/${acctName}"

    if vis_userAcctExists "${acctName}" ; then
	acctUid=$( forAcctNameGetUid ${acctName} )
    else
	ANT_raw "${acctName} account entry does not exist in /etc/passwd"
	lpReturn 101
    fi
    
    if ! vis_bisosGroupVerify ; then
	EH_problem "${acctGid} Group is missing or misconfigured -- Re-run bisosGroupAdd"
	lpReturn 101
    fi
    
    lpDo vis_accountVerify ${acctName} ${acctUid} ${acctGid} ${acctHome}
}




function vis_bxisoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1
    
    local acctGid="$( vis_bisosGroup_bisosGroupName )"
    
    if vis_groupExists ${acctGid} ; then    
	if ! vis_bisosGroupVerify ; then
	    EH_problem "${acctGid} group is misconfigured -- Re-run bisosGroupAdd"
	    lpReturn 101
	fi
    else
	EH_problem "${acctGid} group is missing Re-run bisosGroupAdd"
	lpReturn 101
    fi

   if vis_userAcctExists "${acctName}" ; then
       if vis_bxisoAcctVerify "${acctName}" ; then
	   ANT_raw "${acctName} exists and is properly configured. It will be used"
       else
	   EH_problem "${acctName} account is misconfigured"
	   lpReturn 101
       fi
   else
       opDo vis_bxisoAcctAdd ${acctName}
   fi

   opDo vis_sudoersAddLine "${acctName}" ALL NOPASSWD

   # the sudo -u ${acctName} id -- results in creation of the homeDir
   opDo vis_userAcctsReport ${acctName}   
}

function vis_bxisoAcctAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When acctUidIncrement is 0, use bystarUid for uid.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName=$1

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;        
    
    if vis_userAcctExists "${acctName}" ; then
	EH_problem "${acctName} Already Exists -- Addition Skipped"
	lpReturn 101
    fi

    local acctGid="$( vis_bisosAcct_bxisoGid )"
    local acctUid=""
    local acctComment=""
    local acctHome="$( vis_bisosAcct_bxisoHomeBase )/${acctName}"    
    local supplementaryGroups="adm"  # NOTYET, locate existing code in 

    if [ "${acctName}" == "$( vis_bisosAcct_bxisoDelimiterName )" ] ; then
	acctUid=$( vis_bisosAcct_bxisoDelimiterUid )
	acctComment="BISOS Default BXISO Accts Delimiter"
    else
	acctUid=$( vis_bxisoAcctNextLocalUidNu )
	acctComment="BISOS OID of BXISO Acct"	
    fi

    lpDo useradd \
	 --uid "${acctUid}" \
	 --gid "${acctGid}" \
	 --groups "${supplementaryGroups}" \
	 --shell /usr/sbin/nologin \
	 --home-dir "${acctHome}" \
	 --comment "${acctComment}" \
	 ${acctName}
    
    lpReturn
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

    local userAcctPasswd=""

    case ${passwdPolicy} in
	"passwd_tmpSame")
	    userAcctPasswd=${userAcctName}
	    ;;
	"intra")
	    userAcctPasswd="intra"
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
