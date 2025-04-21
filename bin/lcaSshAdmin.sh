#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

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
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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

TagVar sshDir=""


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
${G_myName} -p localUser=${oneLocalUser} -i keysFilesList
${G_myName} -p localUser=${oneLocalUser} -i userKeyVerify
${G_myName} -p localUser=${oneLocalUser} -i userKeyDelete
${G_myName} -p localUser=${oneLocalUser} -i userKeyUpdate
${G_myName} -p localUser=${oneLocalUser} -p sshDir=credentials/ssh -i userKeyUpdate
${G_myName} ${extraInfo} -p localUser=${oneLocalUser} -f -i userKeyUpdate
--- PUBLIC KEY EXPORT MANIPULATORS ---
${G_myName} ${extraInfo} -p localUser=${oneLocalUser} -p remoteUser=${oneRemoteUser} -p remoteHost=${oneRemoteHost}  -i authorizedKeysUpdate
--- AUTHORZED KEYS MANIPULATORS ---
${G_myName} -p localUser=${oneLocalUser} -p remoteUser=${oneRemoteUser} -p remoteHost=${oneRemoteHost}  -i logNameIsInAuthKeysFile
${G_myName} -i knownHostsAddSystem bystar 192.168.0.2        
--- ACCESS CONTROL ---
${G_myName}  -i denyUsersShow
${G_myName}  -i denyUsersAdd userid
${G_myName}  -i xforwardingEnabled
--- FULL MANIPLATORS --- 
${G_myName} -i fullVerify
${G_myName} -i fullUpdate
--- VERIFY ---
${G_myName} -p localUser=${oneLocalUser} -i sshUserVerify           # Verify file perms and ownership
${G_myName} -v -n showRun -i sshKeyRemoteVerify bystar localhost     # ssh into user@dest
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
# System Keys
sudo ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key # fingerprint of the server's public key
ssh-keygen -lv -f ~/.ssh/known_hosts
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

    if [ -z "${sshDir}" ] ; then
        sshDir=".ssh"
    fi

    typeset currentUser=${opRunAcctName}
  
    opDoRet opAcctInfoGet ${localUser} || return $?

    if ( test -f ${opAcct_homeDir}/${sshDir}/id_dsa && test -f ${opAcct_homeDir}/${sshDir}/id_dsa.pub ) ; then
        ANT_cooked "SSH User Priv/Pub keys in place -- Will Remove Them"
        opDo /bin/rm ${opAcct_homeDir}/${sshDir}/id_dsa
        opDo /bin/rm ${opAcct_homeDir}/${sshDir}/id_dsa.pub
    else
        ANT_cooked "SSH User Priv/Pub keys not found -- Removal Skipped"
        return 1
    fi

    opDo ls -ld ${opAcct_homeDir}/${sshDir}  # ${opAcct_homeDir}/${sshDir}/id_dsa ${opAcct_homeDir}/${sshDir}/id_dsa.pub
}

function vis_keysFilesList {
    EH_assert [[ $# -eq 0 ]]    
    if [ "${localUser}" == "" ] ; then
        localUser=${opRunAcctName}
    fi

    if [ -z "${sshDir}" ] ; then
        sshDir=".ssh"
    fi

    opDoRet opAcctInfoGet ${localUser} || return $?

    echo ${opAcct_homeDir}/${sshDir}    
    echo ${opAcct_homeDir}/${sshDir}/id_dsa
    echo ${opAcct_homeDir}/${sshDir}/id_dsa.pub
    echo ${opAcct_homeDir}/${sshDir}/id_rsa
    echo ${opAcct_homeDir}/${sshDir}/id_rsa.pub
}

function vis_lsKeysFiles {
    EH_assert [[ $# -eq 0 ]]
    local keyFiles=$( vis_keysFilesList )
    local eachKeyFile=""

    for eachKeyFile in ${keyFiles} ; do
        if [ -e ${eachKeyFile} ] ; then
            opDo ls -l ${eachKeyFile}
        fi
    done
}

function verifyKeysFiles {
    EH_assert [[ $# -eq 0 ]]
    local keyFiles=$( vis_keysFilesList )
    local eachKeyFile=""
    local retVal=0

    for eachKeyFile in ${keyFiles} ; do
        if [ ! -e ${eachKeyFile} ] ; then
            lpReturn 1
        fi
    done
    lpReturn 0
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

    if [ -z "${sshDir}" ] ; then
        sshDir=".ssh"
    fi

    opDoRet opAcctInfoGet ${localUser} || return $?

    if verifyKeysFiles ; then
        ANT_cooked "SSH User Priv/Pub keys in place"
        opDo vis_lsKeysFiles    
        return 0
    else
        ANT_cooked "SSH User Priv/Pub keys not found"
        opDo vis_lsKeysFiles
        return 1
    fi
}

function vis_userKeyUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${localUser}" ] ; then
        localUser=${opRunAcctName}
    fi

    if [ -z "${sshDir}" ] ; then
        sshDir=".ssh"
    fi
    
    typeset currentUser=$( whoami ) 

    if [ "${currentUser}" != "${localUser}" -a "${currentUser}" != "root" -a "$( id -u ${currentUser})" != "$( id -u ${localUser})" ] ; then

        if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

        EH_problem "OOPS This Should Be Unreachable. reRunAsRoot makes currentUser be root"
        EH_problem "OOPS -- You are not ${localUser} or root. currentUser=${currentUser} Permission denied."
        return 1
    else
        opDoRet opAcctInfoGet ${localUser} || return $?

        if ! test -d ${opAcct_homeDir}/${sshDir} ; then
            # FN_dirCreateIfNotThere ${opAcct_homeDir}/${sshDir}
            lpDo sudo -u ${localUser} mkdir -p ${opAcct_homeDir}/${sshDir}          
            opDoComplain chown ${localUser}:bisos ${opAcct_homeDir}/${sshDir}
            opDoComplain chmod 700 ${opAcct_homeDir}/${sshDir}
        fi

        if [[ "${G_forceMode}_" != "force_" ]] ; then
            if verifyKeysFiles ; then       
                ANT_cooked "User keys in place, skipped -- Use G_forceMode to over-write"
                opDo ls -ld ${opAcct_homeDir}/${sshDir}
                opDo vis_lsKeysFiles                    
                return 0
            fi
        else
            lpDo eval vis_keysFilesList \| xargs rm 
        fi

        eval $(ssh-agent -s)

        # No Passphrase (-N "")
        opDoComplain ssh-keygen -t dsa -f ${opAcct_homeDir}/${sshDir}/id_dsa -N ""
        opDoComplain ssh-keygen -t rsa -b 4096 -f ${opAcct_homeDir}/${sshDir}/id_rsa -N ""

        opDoComplain chown -R ${localUser}:bisos ${opAcct_homeDir}/${sshDir}
        
        opDo ssh-add   # inform ssh-agent of the change
    fi

    opDo ls -ld ${opAcct_homeDir}/${sshDir}
    lpDo vis_lsKeysFiles
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

    #print -- cat ${opAcct_homeDir}/.ssh/id_dsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys'

    opDo eval "cat ${opAcct_homeDir}/.ssh/id_dsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys; chmod 644 .ssh/authorized_keys'"
    opDo eval "cat ${opAcct_homeDir}/.ssh/id_rsa.pub | ssh ${remoteUser}@${remoteHost} 'mkdir -p .ssh; umask 077; cat - >> .ssh/authorized_keys; chmod 644 .ssh/authorized_keys'"
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

  userIsInAuthKeys=`cat ${opAcct_homeDir}/.ssh/authorized_keys | egrep "${currentUser}@"` ; retVal=$?
  
  if [ ${retVal} != 0 ] ; then
    EH_problem "You have permission problem to check for ${opAcct_homeDir}/.ssh/authorized_keys"
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

function vis_sshKeyRemoteVerify {
    G_funcEntry
    function describeF { G_funcEntryShow; cat << _EOF_
** $1=user $2=host
   Verifies key-based auth by attempting key-based SSH connection.
_EOF_
    }

    EH_assert [[ $# -eq 2 ]]
    local user="$1"
    local host="$2"

    lpDo eval ssh -o BatchMode=yes -o ConnectTimeout=3 "${user}@${host}" "echo SSH Key Verified" 2\>/dev/null
    if [[ $? -eq 0 ]]; then
        ANT_raw "Remote SSH Key Authentication: SUCCESS for ${user}@${host}"
        return 0
    else
        EH_problem "Remote SSH Key Authentication: FAILED for ${user}@${host}"
        return 1
    fi
}


function vis_knownHostsAddSystem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** When \${system}=\$2 has been added to knownHosts, the initial initeractive prompt can be avoided.
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local knownHostsUserName=$1
    local system=$2

    local userHome=$( FN_absolutePathGet ~${knownHostsUserName} )
    local knownHostsFile=${userHome}/.ssh/known_hosts
    local gotVal=0

    lpDo ssh-keygen -F ${system}
    gotVal=$?

    if [ "${gotVal}" == 0 ] ; then
        ANT_raw "system=${system} already in ${knownHostsFile}"
    else
        ANT_raw "system=${system} is being added to ${knownHostsFile}"
        
        # -H=hash -t=type
        lpDo eval ssh-keyscan -H -t ecdsa-sha2-nistp256 "${system}" \>\> ${knownHostsFile}
    fi
    
    lpReturn
}

function vis_sshdConfigEnforce {
    G_funcEntry
    function describeF { G_funcEntryShow; cat << _EOF_
** $1=Directive $2=ExpectedValue
   Verifies (or enforces) that /etc/ssh/sshd_config contains the proper value.
_EOF_
    }

    EH_assert [[ $# -eq 2 ]]

    local directive="$1"
    local expected="$2"
    local actual

    actual=$(grep -i "^\s*${directive}\s" /etc/ssh/sshd_config | awk '{print $2}' | tail -n1)

    if [[ "$actual" == "$expected" ]]; then
        ANT_raw "Directive Match -- ${directive} ${actual}"
        return 0
    else
        EH_problem "Directive Mismatch -- ${directive} is ${actual:-<unset>} (expected: ${expected})"
        return 1
    fi
}


function vis_pathOwnerVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** $1=filePath $2=expectedOwner
   Verifies that the file or directory at \$1 is owned by \$2.
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local filePath="$1"
    local expectedOwner="$2"
    local actualOwner

    actualOwner=$(stat -c "%U" "$filePath" 2>/dev/null)

    if [[ "$actualOwner" == "$expectedOwner" ]]; then
        # ANT_raw "Ownership Match  -- ${filePath} owned by ${actualOwner}"
        return 0
    else
        EH_problem "Bad Owner -- ${filePath} is owned by ${actualOwner}, expected ${expectedOwner}"
        return 1
    fi
}


function vis_pathPermsVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** $1=filePath $2=filePermissions (in octal), if $2 matches the actual permissions return 0
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local filePath="$1"
    local expectedPerm="$2"
    local retVal=0

    # Get actual file permissions in octal
    local actualPerm
    actualPerm=$(stat -c "%a" "$filePath" 2>/dev/null)

    # Compare and return accordingly
    if [[ "${actualPerm}" == "${expectedPerm}" ]]; then
        ANT_raw "As Expected  -- ${filePath} = ${actualPerm}"
        retVal=0
    else
        EH_problem "Bad Permissions -- ${filePath} = ${actualPerm}"
        retVal=1
    fi

    if [[ -d "${filePath}" ]] ; then
      lpDo ls -ld ${filePath}
    else
      lpDo ls -l ${filePath}
    fi

    lpReturn ${retVal}
}

function vis_sshUserVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Verify all relevant files for proper ssh functioning
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    local localHome=$(eval echo ~${localUser})

    lpDo vis_pathPermsVerify ${localHome} "2755"
    lpDo vis_pathOwnerVerify ${localHome} "${localUser}"

    lpDo vis_pathPermsVerify ${localHome}/.ssh "2700"
    lpDo vis_pathOwnerVerify ${localHome}/.ssh  "${localUser}"

    lpDo vis_pathPermsVerify ${localHome}/.ssh/id_rsa "600"
    lpDo vis_pathOwnerVerify ${localHome}/.ssh/id_rsa  "${localUser}"

    lpDo vis_pathPermsVerify ${localHome}/.ssh/known_hosts "600"
    lpDo vis_pathOwnerVerify ${localHome}/.ssh/known_hosts  "${localUser}"

    lpDo vis_pathPermsVerify ${localHome}/.ssh/config "600"
    lpDo vis_pathOwnerVerify ${localHome}/.ssh/config  "${localUser}"

    lpDo vis_pathPermsVerify ${localHome}/.ssh/authorized_keys "644"
    lpDo vis_pathOwnerVerify ${localHome}/.ssh/authorized_keys  "${localUser}"

    lpDo vis_sshdConfigEnforce "PubkeyAuthentication" "yes"

}


function vis_sshUserVerifyOLD {
  local user=""
  local group=""
  local other=""
  local localHome=$(eval echo ~${localUser})
  declare -a this


  if [[ "${opRunOsType}" == "Linux" ]] ; then
    cmd="getfacl --absolute-names --omit-header ~${localUser}/.ssh"
  else
    cmd="getfacl ~${localUser}/.ssh | egrep -v "^\#" | cut -d \# -f1"
  fi

  integer i=0
  # eval ${cmd} |

  while read line ; do
    this[i]=$line
    i=i+1
  done <<< $(eval ${cmd})

  for x in ${this[@]} ; do
    if [[ "${x%%:*}" == "user" ]] ; then
      user=${x##*:}
    elif [[ "${x%%:*}_" == "group_" ]] ; then
      group=${x##*:}
    elif [[ "${x%%:*}_" == "other_" ]] ; then
      other=${x##*:}
    fi
  done

  if [ "${user}" == "rwx" -a "${group}" == "---" -a "${other}" == "---" ] ; then
    print "As Expected -- ~${localUser}/.ssh -- correct permission"
    lpDo ls -ld ${localHome}/.ssh
    #

    lpDo vis_pathPermsVerify ${localHome}/.ssh/id_rsa "600"

    lpDo vis_pathPermsVerify ${localHome}/.ssh/authorized_keys "644"

    lpDo vis_pathPermsVerify ${localHome} "2755"

    return 0
  else
    EH_problem "${localHome}/.ssh -- user=${user} group=${group} other=${other} --  incorrect permission"
    ls -ld ${localHome}/.ssh
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
