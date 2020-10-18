#!/bin/bash # -*- mode: sh-mode; -*-

IimBriefDescription="Library: For BISOS Accounts -- BleePanel: XXX"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

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


supplementaryGroupsList=()


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
${G_myName} ${extraInfo} -i usgAcct_supplementaryGroupsUpdate bystar
${G_myName} ${extraInfo} -i usgAcct_sshKeysUpdate bystar
${G_myName} ${extraInfo} -i usgAcct_gitConfigUpdate bystar
$( examplesSeperatorChapter "Usage (usg) List Accounts" )
${G_myName} ${extraInfo} -i usgAcctNextLocalUidNu
${G_myName} ${extraInfo} -i usgAcctsList
_EOF_
}

function vis_bxisoAccountsExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    local oneAutonomousBxisoAcct="ai-first.last"    
    local oneControlledBxisoAcct="site-default"
    local oneBxisoComment="oid-2.23.34.20000"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "BxISO (Info and Service Objects) Accounts" )
${G_myName} ${extraInfo} -i bxisoAcctAdd bxisoDelimiter
${G_myName} ${extraInfo} -p acctComment=${oneBxisoComment} -i bxisoAcctAdd ${oneAutonomousBxisoAcct}  # Autonomous Individual
${G_myName} ${extraInfo} -i bxisoAcctCreate bxisoDelimiter  # acctAdd, sudoers, report
${G_myName} ${extraInfo} -p acctComment=${oneBxisoComment} -i bxisoAcctCreate ${oneAutonomousBxisoAcct}  # Autonomous Individual
${G_myName} ${extraInfo} -i bxisoAcctDelete bxisoDelimiter
${G_myName} ${extraInfo} -i bxisoAcctDelete ${oneAutonomousBxisoAcct}
${G_myName} ${extraInfo} -i bxisoAcctVerify bxisoDelimiter
${G_myName} ${extraInfo} -i bxisoAcctVerify ${oneAutonomousBxisoAcct}
$( examplesSeperatorChapter "BxISO (Info and Service Objects) List Accounts" )
${G_myName} ${extraInfo} -i bxisoAcctNextLocalUidNu
${G_myName} ${extraInfo} -i bxisoAcctsList
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

   lpDo vis_acct_createHome ${acctName}

   lpDo vis_usgAcct_supplementaryGroupsUpdate ${acctName}

   lpDo vis_usgAcct_sshKeysUpdate ${acctName}   

   lpDo vis_usgAcct_gitConfigUpdate ${acctName}   
   
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

    if [ "${acctName}" == "$( vis_bisosAcct_bystarName )" ] ; then
	acctUid=$( vis_bisosAcct_bystarUid )
	acctComment="bystar -- Default BISOS Acct"
    else
	acctUid=$( vis_usgAcctNextLocalUidNu )
	acctComment="BISOS Named Usage Acct"	
    fi

    lpDo useradd \
	 --uid "${acctUid}" \
	 --gid "${acctGid}" \
	 --shell /bin/bash \
	 --home-dir "${acctHome}" \
	 --comment "${acctComment}" \
	 ${acctName}

    lpReturn
}

function vis_usgAcctsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List all usg accounts
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    uidMinSpec=2000
    uidMaxSpec=10000

    vis_uidRangePasswdFile
}

function vis_bxisoAcctsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List all usg accounts
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    uidMinSpec=1000000
    uidMaxSpec=2000000

    vis_uidRangePasswdFile
}



function vis_acct_createHome {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Create home dir for specified acct -- acctHome is taken from passwd entry.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"

    local getentStr=$( getent passwd ${acctName} )
    
    if [ -z "${getentStr}" ] ; then
	EH_problem "Missing acct -- ${acctName}"
	lpReturn 101
    fi
    
    local getentAcctUid=$( echo ${getentStr} | cut -d : -f 3 )
    local getentAcctGid=$( echo ${getentStr} | cut -d : -f 4 )
    local getentAcctHome=$( echo ${getentStr} | cut -d : -f 6 )    

    lpDo sudo mkdir "${getentAcctHome}"
    lpDo sudo chown ${getentAcctUid}:${getentAcctGid} "${getentAcctHome}"

    lpReturn
}


function vis_usgAcct_supplementaryGroupsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add needed supplementary groups to the specified USG account.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"
    local eachGroup=""

    lpDo distFamilyGenerationHookRun "addSupplementaryGroups"

    for eachGroup in ${supplementaryGroupsList[@]} ; do
	opDo sudo usermod -G ${eachGroup} --append ${acctName}    
    done
}

function vis_usgAcct_sshKeysUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add sshKeys if not there, with forceMode update existing ones.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;        
    
    local acctName="$1"

    if lcaSshAdmin.sh -p localUser="${acctName}" -i userKeyVerify; then
	if [ "${G_forceMode}" == "force" ] ; then
	    ANT_raw "Ssh Keys Exist -- Overwriting Them"
	    opDo lcaSshAdmin.sh -p localUser="${acctName}" -i userKeyUpdate
	else
	    ANT_raw "Ssh Keys Exist and No G_forceMode -- Updating Skipped"
	fi
    else
	opDo lcaSshAdmin.sh -p localUser="${acctName}" -i userKeyUpdate
    fi


}

function vis_usgAcct_gitConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Configure git pars -- just a starting point for now.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;        

    local acctName="$1"

    lpDo sudo -u ${acctName} git config --global user.email "bystar@bisos.net"
    lpDo sudo -u ${acctName} git config --global user.name "Default Bisos"
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

function vis_usgAcctPasswdList {
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

   lpDo vis_acct_createHome ${acctName}

   lpDo vis_bxisoAcct_supplementaryGroupsUpdate ${acctName}

   lpDo vis_bxisoAcct_sshKeysUpdate ${acctName}   

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
    local acctHome="$( vis_bisosAcct_bxisoHomeBase )/${acctName}"    
    local supplementaryGroups="adm"  # NOTYET, locate existing code in 

    if [ "${acctName}" == "$( vis_bisosAcct_bxisoDelimiterName )" ] ; then
	acctUid=$( vis_bisosAcct_bxisoDelimiterUid )
	acctComment="BISOS Default BXISO Accts Delimiter"
    else
	acctUid=$( vis_bxisoAcctNextLocalUidNu )
	if [ -z "${acctComment}" ] ; then
	    EH_problem "Missing Acct Comment"
	    lpReturn 101
	fi
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


function vis_bxisoAcctDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Delete the bxiso account.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"

    lpDo vis_userAcctsDelete ${acctName}

    lpReturn
}


function vis_bxisoAcct_supplementaryGroupsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add needed supplementary groups to the specified USG account.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local acctName="$1"
    # local eachGroup=""

    # lpDo distFamilyGenerationHookRun "addSupplementaryGroups"

    # for eachGroup in ${supplementaryGroupsList[@]} ; do
    # 	opDo sudo usermod -G ${eachGroup} --append ${acctName}    
    # done
}

function vis_bxisoAcct_sshKeysUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Add sshKeys if not there, with forceMode update existing ones.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;        
    
    local acctName="$1"

    if lcaSshAdmin.sh -p localUser="${acctName}" -i userKeyVerify; then
	if [ "${G_forceMode}" == "force" ] ; then
	    ANT_raw "Ssh Keys Exist -- Overwriting Them"
	    opDo lcaSshAdmin.sh -p localUser="${acctName}" -i userKeyUpdate
	else
	    ANT_raw "Ssh Keys Exist and No G_forceMode -- Updating Skipped"
	fi
    else
	opDo lcaSshAdmin.sh -v -n showRun -p localUser="${acctName}" -i userKeyUpdate
    fi


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
			   cut -d : -f 3 | \
			   egrep '2[0-9][0-9][0-9]$' |\
			   tail -1 
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
			   cut -d : -f 3 | \
			   egrep '1[0-9][0-9][0-9][0-9][0-9][0-9]$' |\
			   tail -1 
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


addSupplementaryGroups_UBUNTU_1404 () {
  supplementaryGroupsList=("employee" "adm" dialout cdrom floppy dip video plugdev lpadmin scanner "admin" "audio" netdev )
}

addSupplementaryGroups_UBUNTU_1604 () {
  supplementaryGroupsList=("employee" "adm" dialout cdrom floppy dip video plugdev lpadmin scanner "audio" netdev  "vboxusers")
}

addSupplementaryGroups_UBUNTU_1804 () {
  supplementaryGroupsList=("employee" "adm" dialout cdrom floppy dip video plugdev lpadmin scanner "audio" netdev  "vboxsf" "vboxusers")
}

addSupplementaryGroups_UBUNTU_2004 () {
  supplementaryGroupsList=("employee" "subscrbr" "adm" dialout cdrom floppy dip video plugdev lpadmin scanner "audio" netdev  "vboxsf" "vboxusers" "libvirt" "kvm")
}

addSupplementaryGroups_DEBIAN_LENNY () {
  supplementaryGroupsList=(dialout cdrom floppy audio video plugdev netdev)
}

addSupplementaryGroups_DEBIAN_SQUEEZE () {
  supplementaryGroupsList=(dialout cdrom floppy audio video plugdev netdev)
}

addSupplementaryGroups_DEBIAN_7 () {
  supplementaryGroupsList=(dialout cdrom floppy audio video plugdev netdev)
}

addSupplementaryGroups_DEFAULT_DEFAULT () {
  supplementaryGroupsList=( "staff" )
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
