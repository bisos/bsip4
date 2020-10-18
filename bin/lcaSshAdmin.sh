#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaSshAdmin.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaSshAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*
Establishing trust between
    callerUser@callerHost and calledUser@calledHost

on calledHost as calledUser
  lcaSshAdmin.sh -e "run as root for now" -p localUser=mohsen -i userKeyUpdate
  lcaSshAdmin.sh -p localUser=mohsen -i userKeyVerify

  lcaSshAdmin.sh -p localUser=mohsen -p remoteUser=mohsen -p remoteHost=callerHost -i authorizedKeysUpdate

on callerHost as callerHost
  lcaSshAdmin.sh -e "run as root for now" -p localUser=mohsen -i userKeyUpdate
  lcaSshAdmin.sh -p localUser=mohsen -i userKeyVerify

lcaSshAdmin.sh -p localUser=mohsen -p remoteUser=mohsen -p remoteHost=calledHost -i authorizedKeysUpdate

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/opAcctLib.sh

# PRE parameters
TagVar localUser=""
#TagVar localHost="" Perhaps Later
TagVar remoteUser=""
TagVar remoteHost=""


function G_postParamHook {
     return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""
  #typeset oneLocalUser=${opRunAcctName}
  typeset oneLocalUser="bystar"
  #typeset oneRemoteUser=${opRunAcctName}
  typeset oneRemoteUser="bystar"  
  typeset oneRemoteHost=cvs.bysource.org


  visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
--- SERVER KEY MANIPULATORS ---
${G_myName} -i serverKeyUpdate
--- KNOWN HOSTS MANIPULATION ---
${G_myName} -p localUser=${oneLocalUser} -p remoteHost=${oneRemoteHost} -i hostIsInKnownHostsFile
--- USER KEY MANIPULATORS ---
${G_myName} -p localUser=${oneLocalUser} -i userKeyVerify
${G_myName} -p localUser=${oneLocalUser} -i userKeyDelete
${G_myName} -p localUser=${oneLocalUser} -i userKeyUpdate
${G_myName} ${extraInfo} -p localUser=${oneLocalUser} -f -i userKeyUpdate
--- PUBLIC KEY EXPORT MANIPULATORS ---
${G_myName} ${extraInfo} -p localUser=${oneLocalUser} -p remoteUser=${oneRemoteUser} -p remoteHost=${oneRemoteHost}  -i authorizedKeysUpdate
--- AUTHORZED KEYS MANIPULATORS ---
${G_myName} -p localUser=${oneLocalUser} -p remoteUser=${oneRemoteUser} -p remoteHost=${oneRemoteHost}  -i logNameIsInAuthKeysFile
--- ACCESS CONTROL ---
${G_myName}  -i denyUsersShow
${G_myName}  -i denyUsersAdd userid
${G_myName}  -i xforwardingEnabled
--- FULL MANIPLATORS --- 
${G_myName} -i fullVerify
${G_myName} -i fullUpdate
--- VERIFY ---
${G_myName} -p localUser=${oneLocalUser} -i sshUserVerify
--- SERVER OPERATION --- 
${G_myName} -i start
${G_myName} -i stop
${G_myName} -i showProcs
${G_myName} -i killProcs
${G_myName} -i showLog
--- USAGE EXAMPLES ---
${G_myName} -i sshUsageExamples

_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Functions
_CommentEnd_


typeset sshEtcDir
#sshEtcDir="/here/etc/ssh"
sshEtcDir="/etc/ssh"
FN_dirCreatePathIfNotThere ${sshEtcDir}


function vis_sshUsageExamples {
 cat  << _EOF_
ssh -X user@host.fqdn
sftp
scp
_EOF_
}

function vis_serverKeyGeneration {
  vis_serverKeyUpdate "$@"
}

function vis_serverKeyUpdate {
  G_abortIfNotRunningAsRoot

  echo "Key generation may take a while..."
  echo "If during dsa key generation the system seem to stall,"
  echo "do not panick.  Try to type anything and enter.  Do that several times."
  echo "Something to do with the random number pool entropy."
  #opDoComplain ssh-keygen -t rsa -f ${sshEtcDir}/ssh_host_rsa_key -N "digDeep"
  #opDoComplain ssh-keygen -t dsa -f ${sshEtcDir}/ssh_host_dsa_key -N "digDeep"
  opDoComplain ssh-keygen -t rsa -f ${sshEtcDir}/ssh_host_rsa_key -N ""
  opDoComplain ssh-keygen -t dsa -f ${sshEtcDir}/ssh_host_dsa_key -N ""
}


function vis_userKeyGeneration {
  # Backwards Compatibility
  vis_userKeyUpdate "$@"
}


function vis_userKeyDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    if [ "${localUser}" == "" ] ; then
	localUser=${opRunAcctName}
    fi

    typeset currentUser=${opRunAcctName}
  
    opDoRet opAcctInfoGet ${localUser} || return $?

    if ( test -f ${opAcct_homeDir}/.ssh/id_dsa && test -f ${opAcct_homeDir}/.ssh/id_dsa.pub ) ; then
	ANT_cooked "SSH User Priv/Pub keys in place -- Will Remove Them"
	opDo /bin/rm ${opAcct_homeDir}/.ssh/id_dsa
	opDo /bin/rm ${opAcct_homeDir}/.ssh/id_dsa.pub
    else
	ANT_cooked "SSH User Priv/Pub keys not found -- Removal Skipped"
	return 1
    fi

    opDo ls -ld ${opAcct_homeDir}/.ssh  # ${opAcct_homeDir}/.ssh/id_dsa ${opAcct_homeDir}/.ssh/id_dsa.pub
}


function vis_userKeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    if [ "${localUser}" == "" ] ; then
	localUser=${opRunAcctName}
    fi

    typeset currentUser=${opRunAcctName}
  
    opDoRet opAcctInfoGet ${localUser} || return $?

    if ( test -f ${opAcct_homeDir}/.ssh/id_dsa && test -f ${opAcct_homeDir}/.ssh/id_dsa.pub ) ; then
	ANT_cooked "SSH User Priv/Pub keys in place"
	opDo ls -ld ${opAcct_homeDir}/.ssh  ${opAcct_homeDir}/.ssh/id_dsa ${opAcct_homeDir}/.ssh/id_dsa.pub
	return 0
    else
	ANT_cooked "SSH User Priv/Pub keys not found"
	opDo ls -ld ${opAcct_homeDir}/.ssh  ${opAcct_homeDir}/.ssh/id_dsa ${opAcct_homeDir}/.ssh/id_dsa.pub
	return 1
    fi
}


function vis_userKeyUpdateOrig {
  if [ "${localUser}X" == "X" ] ; then
    localUser=${opRunAcctName}
  fi

  #typeset currentUser=${opRunAcctName}
  if [[ "${opRunOsType}_" == "SunOS_" ]] ; then
    typeset currentUser=`/usr/ucb/whoami`
  else
    typeset currentUser=`whoami`
  fi


  if [ "${currentUser}X" != "${localUser}X" -a "${currentUser}X" != "rootX" -a "$( id -u ${currentUser})X" != "$( id -u ${localUser})X" ] ; then
    EH_problem "You are not ${localUser} or root. currentUser=${currentUser} Permission denied."
    return 1
  else
    opDoRet opAcctInfoGet ${localUser} || return $?

    if ! test -d ${opAcct_homeDir}/.ssh ; then
	FN_dirCreateIfNotThere ${opAcct_homeDir}/.ssh
	opDoComplain chown ${localUser} ${opAcct_homeDir}/.ssh
	opDoComplain chmod 700 ${opAcct_homeDir}/.ssh
    fi

    if [[ "${G_forceMode}_" != "force_" ]] ; then
      if ( test -f ${opAcct_homeDir}/.ssh/id_dsa && test -f ${opAcct_homeDir}/.ssh/id_dsa.pub ) ; then
	ANT_cooked "User keys in place, skipped"
	return 0
      fi
    fi
      

    if [ "$( id -u ${currentUser})X" == "$( id -u ${localUser})X" ] ; then
      opDoComplain ssh-keygen -t dsa -f ${opAcct_homeDir}/.ssh/id_dsa -N ""
      #opDoComplain ssh-keygen -t rsa -f ${opAcct_homeDir}/.ssh/ssh_host_rsa_key -N ""
      opDo ssh-add   # inform ssh-agent of the change
    else
      opDoComplain sudo -u ${localUser} ssh-keygen -t dsa -f ${opAcct_homeDir}/.ssh/id_dsa -N ""
    #opDoComplain sudo -u ${localUser} ssh-keygen -t dsa -f ${opAcct_homeDir}/.ssh/id_dsa -N "digDeep"
      opDo ssh-add   # inform ssh-agent of the change
    fi
  fi
}

function vis_userKeyUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ "${localUser}" == "" ] ; then
	localUser=${opRunAcctName}
    fi

    typeset currentUser=`whoami`

    if [ "${currentUser}" != "${localUser}" -a "${currentUser}" != "root" -a "$( id -u ${currentUser})" != "$( id -u ${localUser})" ] ; then

	if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

	EH_problem "OOPS -- You are not ${localUser} or root. currentUser=${currentUser} Permission denied."
	return 1
    else
	opDoRet opAcctInfoGet ${localUser} || return $?

	if ! test -d ${opAcct_homeDir}/.ssh ; then
	    FN_dirCreateIfNotThere ${opAcct_homeDir}/.ssh
	    opDoComplain chown ${localUser} ${opAcct_homeDir}/.ssh
	    opDoComplain chmod 700 ${opAcct_homeDir}/.ssh
	fi

	if [[ "${G_forceMode}_" != "force_" ]] ; then
	    if ( test -f ${opAcct_homeDir}/.ssh/id_dsa && test -f ${opAcct_homeDir}/.ssh/id_dsa.pub ) ; then
		ANT_cooked "User keys in place, skipped"
		opDo ls -ld ${opAcct_homeDir}/.ssh  ${opAcct_homeDir}/.ssh/id_dsa ${opAcct_homeDir}/.ssh/id_dsa.pub
		return 0
	    fi
	fi

	eval $(ssh-agent -s)
	
	opDoComplain ssh-keygen -t dsa -f ${opAcct_homeDir}/.ssh/id_dsa -N ""
	opDoComplain ssh-keygen -t rsa -f ${opAcct_homeDir}/.ssh/id_rsa -N ""
	opDo ssh-add   # inform ssh-agent of the change
    fi

    opDo ls -ld ${opAcct_homeDir}/.ssh  ${opAcct_homeDir}/.ssh/id_dsa ${opAcct_homeDir}/.ssh/id_dsa.pub
    opDo ls -ld ${opAcct_homeDir}/.ssh  ${opAcct_homeDir}/.ssh/id_rsa ${opAcct_homeDir}/.ssh/id_rsa.pub
}




#${G_myName} -p localUser=homer -p remoteUser=homer -p remoteHost=jamshid.intra  -i authorizedKeysAdd

function vis_authorizedKeysAdd {
  vis_authorizedKeysAdd "$@"
}

function vis_authorizedKeysUpdate {
  if [ "${remoteHost}_" == "_" ] ; then
    EH_problem "remoteHost must be specified"
    return 1
  fi

  if [ "${localUser}_" == "_" ] ; then
    localUser=${opRunAcctName}
  fi

  if [ "${remoteUser}_" == "_" ] ; then
    remoteUser=${localUser}
  fi


  #if [[ "${G_forceMode}_" != "force_" ]] ; then
    #rightHere "localUser=${localUser} Should authorizedKeysUpdate?"
    #getConfirmation 
 #fi

  ANT_raw "About to authorizedKeysUpdate for localUser=${localUser}"
  pauseForVerification


  #typeset currentUser=${opRunAcctName}
  if [[ "${opRunOsType}_" == "SunOS_" ]] ; then
    typeset currentUser=`/usr/ucb/whoami`
  else
    typeset currentUser=`whoami`
  fi



  
  if [ "${currentUser}X" != "${localUser}X" -a "${currentUser}X" != "rootX" -a "$( id -u ${currentUser})X" != "$( id -u ${localUser})X" ] ; then
    EH_problem "You are not ${localUser} or root. currentUser=${currentUser} Permission denied."
    return 1
  else
    opDoRet opAcctInfoGet ${localUser} || return $?

    if [ ! -f ${opAcct_homeDir}/.ssh/id_dsa.pub ]  ; then
      EH_problem "${opAcct_homeDir}/.ssh/id_dsa.pub not found"
      return 1
    fi

    #print -- cat ${opAcct_homeDir}/.ssh/id_dsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys2'

    opDo eval "cat ${opAcct_homeDir}/.ssh/id_dsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys2; chmod 644 .ssh/authorized_keys2'"
    opDo eval "cat ${opAcct_homeDir}/.ssh/id_rsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys2; chmod 644 .ssh/authorized_keys2'"    
  fi
}


# NOTYET, 
# currentUser should become -p localUser
# destHost shouldBecome RemoteHost
function vis_hostIsInKnownHostsFile {
  #set -x
  typeset currentUser=${opRunAcctName}
  opAcctInfoGet ${currentUser}

  # NOTYET hosts2 vs hosts Why? 09 February
  #typeset sshKnownHostFile="${opAcct_homeDir}/.ssh/known_hosts2"
  typeset sshKnownHostFile="${opAcct_homeDir}/.ssh/known_hosts"

  if test -f ${sshKnownHostFile} ; then
    hostIsKnown=`cat ${sshKnownHostFile} | egrep "${destHost}"`
  else
    echo "The file: ${sshKnownHostFile} does not exist."
    return 1
  fi

  if [ "${hostIsKnown}X" != "X" ] ; then
    TM_trace 7 "host is in known_hosts2 file"
    return 0
  else
    EH_oops "host is not in known_hosts2 file"
    return 1
  fi
}

#
# NOTYET, 
# -p localUser
# -p remoteHost
# -p remoteUser
#
function vis_logNameIsInAuthKeysFile {
  EH_problem "NOTYET"
  return 0

  #set -x
  opAcctInfoGet osmt
  currentUser=${opRunAcctName}

  userIsInAuthKeys=`cat ${opAcct_homeDir}/.ssh/authorized_keys2 | egrep "${currentUser}@"` ; retVal=$?
  
  if [ ${retVal} != 0 ] ; then
    EH_problem "You have permission problem to check for ${opAcct_homeDir}/.ssh/authorized_keys2"
    exit 3
  else
    if [ "${userIsInAuthKeys}X" != "X" ] ; then
      TM_trace 7 "user is authorized to log in w/o passwd"
      return 0
    else
      EH_problem "user is not authorized to log in w/o passwd"
      exit 1
    fi
  fi
}


vis_start() {
  if [[ "${opRunOsType}_" == "SunOS_" ]] ; then
    /etc/init.d/sshd start
    sleep 2
    vis_showProcs
  elif [[ "${opRunOsType}_" == "Linux_" ]] ; then
    /etc/init.d/ssh start    
  else
    EH_problem "Unsupported OS: ${opRunOsType}"
  fi
}

vis_stop() {
  /etc/init.d/ssh stop
}

vis_showProcs() {
  echo "Running command: pgrep -l -u root sshd"
  #ps -ef | grep sshd
  pgrep -l -u root sshd
}

vis_killProcs() {
  # NOTYET, This is not safe and right Just temporary
  #

  pkill sshd
  vis_showProcs
}

function vis_fullVerify {
  EH_problem "NOTYET"
  # mimic fullUpdate
}

function vis_fullUpdate {
  opDoRet lcaSshBinsPrep.sh -i compInitInstall
  opDoRet vis_serverKeyUpdate
  opDoRet vis_xforwardingEnabled
  #opDoRet vis_start

  # NotYet, per user basis, user accounts ...
}

function vis_showLog {

  if [[ "${opRunOsType}_" == "Linux_" ]] ; then
    cat /var/log/auth.log | grep ssh
  else
    print "NOTYET"
  fi

}

function vis_sshUserVerify {

  if [[ "${opRunOsType}_" == "Linux_" ]] ; then
    cmd="getfacl --absolute-names --omit-header ~${localUser}/.ssh"
  else
    cmd="getfacl ~${localUser}/.ssh | egrep -v "^\#" | cut -d \# -f1"
  fi

  integer i=0
  eval ${cmd} | 
  while read line ; do
    this[i]=$line
    i=i+1
  done

  for x in ${this[@]} ; do
    if [[ "${x%%:*}_" == "user_" ]] ; then
      user=${x##*:}
    elif [[ "${x%%:*}_" == "group_" ]] ; then
      group=${x##*:}
    elif [[ "${x%%:*}_" == "other_" ]] ; then
      other=${x##*:}
    fi
  done

  if [ "${user}_" == "rwx_" -a "${group}_" == "---_" -a "${other}_" == "---_" ] ; then
    print "~${localUser}/.ssh -- correct permission"
    ls -ld ~${localUser}/.ssh
    #NOTYET
    print "permission for ~${localUser}/.ssh/authorized_keys2 has to be 644"
    print "permission for ~${localUser} has to be 755"
    return 0
  else
    EH_problem "~${localUser}/.ssh -- incorrect permission"
    ls -ld ~${localUser}/.ssh
    return 1
  fi
  
}

function vis_denyUsersShow {

  if [[ "${opRunOsType}_" == "SunOS_" ]] ; then
    typeset sshdConfigFile="/usr/local/etc/sshd_config"
  elif [[ "${opRunOsType}_" == "Linux_" ]] ; then
    typeset sshdConfigFile="/etc/ssh/sshd_config"
  else
    EH_problem "Unsupported OS: ${opRunOsType}"
    return 1
  fi

  typeset denyUsers_lineShow=`egrep "^DenyUsers" ${sshdConfigFile}`

  if [[ -z ${denyUsers_lineShow} ]] ; then
    ANT_raw "No 'DenyUsers' specified in ${sshdConfigFile}."
    return 1
  fi
}

function vis_denyUsersAdd {

  # $1 = userID

  if [[ "${opRunOsType}_" == "SunOS_" ]] ; then
    typeset sshdConfigFile="/usr/local/etc/sshd_config"
  elif [[ "${opRunOsType}_" == "Linux_" ]] ; then
    typeset sshdConfigFile="/etc/ssh/sshd_config"
  else
    EH_problem "Unsupported OS: ${opRunOsType}"
    return 1
  fi

  typeset integer retVal=0
  opDoComplain vis_denyUsersShow || retVal=$?

  if [[ $retVal -eq 1 ]] ; then
    ANT_raw "Add 'DenyUsers' to ${sshdConfigFile}"
    FN_lineAddToFile "^DenyUsers" "DenyUsers\t$1" "${sshdConfigFile}"
  else
    ANT_raw "NOTYET, Add the following line manually"
    print "DenyUsers\t$1"
  fi
}

function vis_xforwardingEnabled {
  opDo FN_textReplace "^X11Forwarding no$" "X11Forwarding yes" ${sshEtcDir}/sshd_config
  opDo vis_stop   
  opDo vis_start
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
