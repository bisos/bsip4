#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

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
USAGE SEQUENCES
===============

1- lueBystarUser.sh -h -v -n showRun -p bystarUid=unassociated -p user=bystar -p developer=user -p cvsMode=EDIT -i fullUpdate

or if you already have an account assigned,

  lueBystarUser.sh -h -v -n showRun -p bystarUid=sa-xxx -p user=bystar -p developer=user -p cvsMode=EDIT -i fullUpdate

1.1- change ~bystar passwd
1.2- login as bystar

2- (On the OLD Container) Select a Service User Account  -- sa-xxx ua-xxx ea-xxx
   Use
   bystarInfoBaseAdmin.sh   -i RbaeAllLong 2> /dev/null
   to look for the full list

2.1 (On the OLD Container) Make sure service account is under CVS
   If not uner CVS, then  initialize it with the following instructions.
   Go to the container for the account
   --- CONTAINER: ByStar Account Developer Init (CVS Import ...)  ---
   bystarDevelopers.sh -h -v -n showRun -p bystarUid=sa-xxx -p developer=lsipusr -i containerDevFullSetup

3- (On User Environment) Make that account current
   
  lueBystarUser.sh -h -v -n showRun -p bystarUid=sa-xxx -p user=bystar -p developer=user -p cvsMode=EDIT -i userServiceFullUpdate


Related Files
-------------

 - bystarDevelopers.sh 
 - lueBystarAdmin.sh 
 - lueBystarUser.sh
 - lueDesktopAdmin.sh 


See bystarOld2New.sh -i help

MODEL:
======
   Three parameters go into most commands

      - bystarUid (Bystar Account)
      - user (Bystar User Account)
      - developer (Bystar CVS Account)

~/gatherer/bxo specifies list of accounts associated with this user
 
develoepr+EDIT specifies the uid of CVS out files.



GENERAL
=======

- Accounts ~user and ~bystar have the same uid (Bystar User Account)

- Account ~user is first created -- without a skeleton
- Account ~bystar is next created -- without a skeleton
- ssh auth is setup for ~user
- Basic skeleton is setup for ~bystar
- Unassociated mode is setup for bystarAcct

- Select the bystarAcct
- 


ORDERED ACTIONS
===============

- On Maemo don't create ~user 

- On Maemo cvsAuth with cvs.bysource.org

- user

- bystar acct is first created with a blank skeleton.

- Next an editable or non-editable skeleton is added to it.
  bystar is meant not to have its own CVS tree.
  lsipusr's editable CVS can be used.

- Next one or more bystarAcct (byname/bysmb/...) is added to it
   under ~bystar/ByStar/accts/ea-xxxx

- Next the current current of the bystarAcct  is specified
  and toplevel bystar sym links are adjusted.

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/lpErrno.libSh

. ${opBinBase}/mmaLib.sh
. ${opBinBase}/opAcctLib.sh
# . ${opBinBase}/distHook.libSh

# . ${opBinBase}/bystarHook.libSh

# bystarLib.sh
# . ${opBinBase}/bystarLib.sh
# . ${opBinBase}/bynameLib.sh
# . ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh

# . ${opBinBase}/opAcctLib.sh
# . ${opBinBase}/lcaPloneLib.sh

. ${opBinBase}/lpCurrents.libSh


# PRE parameters
typeset -t developer="NOT" # noedit or valid user id
typeset -t cvsMode="EDIT"  # READ | EDIT
typeset -t user="MANDATORY"
typeset -t bystarUid="MANDATORY"


function G_postParamHook {
    lpCurrentsGet
    
   userHome=$( FN_absolutePathGet ~${user} )
   bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

  case ${cvsMode} in
    "READ"|"EDIT")
	       doNothing
       ;;
    *)
       EH_problem "unknown cvsMode ${cvsMode}"
       ;;
  esac

  return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    local thisUid=$( id -u -n )

    if [ "${opRunDistFamily}_" == "MAEMO_" ] ; then 
	typeset uidInfo="-p uid=user"
    else
	typeset uidInfo="-p uid=${thisUid}"
    fi

    #typeset uidInfo="-p uid=lsipusr,bystar"
    #typeset extraInfo="-h "

    if [ "${currentBynameUid}_" != "_" ] ; then
	oneBystarUid=${currentBynameUid}
    else
	oneBystarUid=${currentBystarUid}
    fi

    #thisUserAcct=$( vis_showCurrentDeveloper ) || thisUserAcct=lsipusr
    if [ "${opRunDistFamily}_" == "MAEMO_" ] ; then 
	thisUserAcct="user"
    else
      thisUserAcct="${thisUid}"
    fi
    #thisUserAcct=${opRunAcctName}

    #typeset oneDeveloper=$( lpSysDevelopers.sh -i showCurrentDeveloper 2> /dev/null )
    typeset oneDeveloper=user

    #typeset oneUser=bystar
    typeset oneUser=${thisUid} 
    
    
    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Usage Currents Management" )
$( examplesSeperatorSection "INFORMATION" )
${G_myName} -i currentAssociatedShow
${G_myName} -p user=${oneUser} -i bystarAccountsShow
${G_myName} ${extraInfo} -i showCurrentDeveloper
$( examplesSeperatorSection "Full Updates" )
# clones in gatherer/bxo/bxoId if needed -- Then 
${G_myName} ${uidInfo} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -p developer=${oneUser} -i userServiceFullUpdate
${G_myName} ${uidInfo} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bueFullUpdate
$( examplesSeperatorSection "ASSOCIATE ~/BUE (ByStar User Account)  TO BxO-BUE" )
${G_myName} ${uidInfo} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${thisUserAcct} -i userServiceAssociateCurrent # Do the symlinks
${G_myName} ${uidInfo} ${extraInfo} -p bystarHome=/acct/subs/banan/1/mohsen -p bystarUid=${oneBystarUid} -p user=${thisUserAcct} -i userServiceAssociateCurrent # Do MAEMO  symlinks
$( examplesSeperatorSection "BxU-BxISo-UE Setup For Offlineimap" )
${G_myName} ${extraInfo} -p bystarUid=all -p user=${oneUser} -i offlineimapUpdate
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i offlineimapUpdate
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i offlineimapStdout
$( examplesSeperatorSection "Update ~/.authinfo" )
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i authInfoUpdate
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i authInfoStdout
$( examplesSeperatorSection "Update Blee BUE Profile -- Converts BUE pars elisp" )
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bleeUpdateOne
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bleeStdoutOne
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bleeAcctMainStdout
${G_myName} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bleeAcctMainUpdate
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function developerVerify {
  if [ "${developer}X" == "NOTX" ] ; then
    EH_oops "developer has to be specified."
    exit 1
  fi

  case ${cvsMode} in
    "READ")
      cvsRootParameter="cvsRoot_bySourceCvs1Pserver"
       ;;
    "EDIT")
      cvsRootParameter="cvsRoot_bySourceCvs1Ssh"
       ;;
    *)
	  EH_problem "unknown cvsMode ${cvsMode}"
	  ;;
  esac
}

function vis_currentAssociatedShow {
    EH_assert [[ $# -eq 0 ]]

    userHome=$( FN_absolutePathGet ~ )

    if [ ! -d ${userHome}/gatherer/bxo ] ; then
	ANT_raw "None: No BxISo Account Is Currently Associated With BxU"
	lpReturn
    fi

    opDoExit cd ${userHome}/gatherer/bxo

    currentBystarUid=$( cat currentAssociated )

    echo ${currentBystarUid}
}


function vis_bystarAccountsShow {
    EH_assert [[ $# -eq 0 ]]

    EH_assert [[ "${user}_" != "MANDATORY_" ]]

    typeset thisExpectedUid="lsipusr"
    #typeset thisExpectedUid="lsipusr,bystar"

    if ! uidIsAsExpected "${thisExpectedUid}" ; then 
	EH_problem "Unexpected uid (${thisExpectedUid})"
	return 101
    fi

    userHome=$( FN_absolutePathGet ~${user} )

    opDoExit cd ${userHome}/gatherer/bxo

    currentBystarUid=$( cat currentAssociated )

    # opDo ls -ld $( pwd )/*

    bystarUidHome=$( FN_absolutePathGet ~${currentBystarUid} )

    # opDo ls -ld ${bystarUidHome}

    echo ${currentBystarUid}
}

#
# BASE =  ByStar Autonomous Service Environment  -- Remote, Cloud 
# BASA =  ByStar Autonomous Service Account      --
#
# BLA  =  ByStar Local Account -- One of lsipusr or bystar
# 
# 

function vis_currentBasaBueConfigUpdate {
    #
    # This does not belong here
    #
    EH_assert [[ $# -eq 0 ]]

    lpReturn
    
    #
    # - Get Current Basa
    # - Locate currentBasa's ~bystarUid/BUE
    # - Analyze content of ~bystarUid/BUE and update as needed
    #

    typeset thisExpectedUid="lsipusr"
    #typeset thisExpectedUid="lsipusr,bystar"

    if ! uidIsAsExpected "${thisExpectedUid}" ; then 
	EH_problem "Unexpected uid (${thisExpectedUid})"
	return 101
    fi

    userHome=$( FN_absolutePathGet ~ )

    bystarUid=$( vis_currentAssociatedShow 2> /dev/null )

    if [[ -z ${bystarUid} ]] ; then
	EH_problem "empty vis_currentAssociatedShow"
	return 101
    fi

    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

    #opDo ls -ld  ${bystarUidHome}/LUE/dotBbdbV6
    #opDo ls -ld  ${bystarUidHome}/LUE/diary 
    #opDo ls -ld  ${bystarUidHome}/LUE/org 

    opDo mkdir -p ${bystarUidHome}/LUE/emacs 
    opDo mkdir -p ${bystarUidHome}/LUE/elisp 
    opDo mkdir -p ${bystarUidHome}/LUE/bin 
    opDo mkdir -p ${bystarUidHome}/LUE/control 
    opDo mkdir -p ${bystarUidHome}/LUE/PlayLists 
    opDo mkdir -p ${bystarUidHome}/LUE/Devices 
    opDo mkdir -p ${bystarUidHome}/LUE/activeDocs 
    opDo mkdir -p ${bystarUidHome}/LUE/inserts

    opDo ls -ld ${bystarUidHome}/LUE/*

}


function vis_userServiceAssociateCurrent {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:
Given a platform user and a BASA, associate them and update information.
Safe to run multiple times.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${user}_" != "MANDATORY_" ]]

    if [ "${opRunDistFamily}" == "MAEMO" ] ; then
	EH_assert [[ "${bystarHome}_" != "_" ]]
    fi

    if [ "${opRunDistFamily}" != "MAEMO" ] ; then
	typeset thisExpectedUid="lsipusr"
    else
	typeset thisExpectedUid="user"
    fi

    #typeset thisExpectedUid="lsipusr,bystar"

    if ! uidIsAsExpected "${thisExpectedUid}" ; then 
	EH_problem "Unexpected uid (${thisExpectedUid})"
	return 101
    fi

    userHome=$( FN_absolutePathGet ~${user} )

    #opDo  sudo -u ${user} mkdir -p ${userHome}/gatherer/bxo
    opDo mkdir -p ${userHome}/gatherer/bxo
    opDo chmod g+w ${userHome}/gatherer/bxo
    opDoExit cd ${userHome}/gatherer/bxo

    opDoExit cd ${userHome}/gatherer/bxo

    echo ${bystarUid} > currentAssociated

    opDo ls -l $( pwd )/currentAssociated

    if [ "${opRunDistFamily}" == "MAEMO" ] ; then
	bystarUidHome=${bystarHome}
    else
	bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    fi
    # For Maemo bystarUidHome is passed as an argument


    opDo FN_fileSymlinkUpdate ${bystarUidHome}  ${userHome}/gatherer/bxo/${bystarUid}

    #opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/dotBbdbV6 ${userHome}/.bbdbV6
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/dotBbdbV9 ${userHome}/.bbdbV9    
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/diary ${userHome}/diary
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/org ${userHome}/org


    #opDo  sudo -u ${user} mkdir -p ${userHome}/...
    opDo mkdir -p ${userHome}/BUE
    opDo chmod g+w ${userHome}/BUE
    opDo mkdir -p ${userHome}/BUE/var
    opDo chmod g+w ${userHome}/BUE/var

    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/emacs ${userHome}/BUE/emacs
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/elisp ${userHome}/BUE/elisp
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/bin ${userHome}/BUE/bin
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/control ${userHome}/BUE/control
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/PlayLists ${userHome}/BUE/PlayLists
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/Devices ${userHome}/BUE/Devices
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/inserts ${userHome}/BUE/inserts
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/Sync ${userHome}/BUE/Sync
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/activeDocs ${userHome}/BUE/activeDocs
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/mailings ${userHome}/BUE/mailings
    opDo FN_fileSymlinkUpdate ${bystarUidHome}/LUE/names ${userHome}/BUE/names

    opDo bueMailManage.sh -p bystarUid=${bystarUid} -i mhonarcBasePrep

    opDo vis_authInfoUpdate

    opDo vis_bleeUpdate
}


function vis_userServiceFullUpdate {
  EH_assert [[ $# -eq 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  opDoRet developerVerify

  userHome=$( FN_absolutePathGet ~${user} )

  if [ -d ${userHome}/gatherer/bxo/${bystarUid} ] ; then
      ANT_raw "Acct ${bystarUid} Exists at ${userHome}/gatherer/bxo/${bystarUid}"
  else
      opDo vis_bystarServiceAcctAdd 
  fi

  opDo vis_bueFullUpdate
}


function vis_bueFullUpdate {
  EH_assert [[ $# -eq 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]


  opDo vis_userServiceAssociateCurrent

  # Now Set Emacs Up for it

  opDo vis_authInfoUpdate

  opDo vis_bleeUpdateOne
}


#
# 
#

function developerVerify {
  if [ "${developer}X" == "NOTX" ] ; then
    EH_oops "developer has to be specified."
    exit 1
  fi

  case ${cvsMode} in
    "READ")
      cvsRootParameter="cvsRoot_bySourceCvs1Pserver"
      ;;
    "EDIT")
      cvsRootParameter="cvsRoot_bySourceCvs1Ssh"
      ;;
    *)
	  EH_problem "unknown cvsMode ${cvsMode}"
	  ;;
  esac
}


function vis_bystarServiceAcctAdd {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]
  EH_assert [[ "${developer}_" != "MANDATORY_" ]]

  developerVerify

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${user}" != $( id -u -n ) ] ; then
      if [ "root" != $( id -u -n ) ] ; then
	  # NOTYET, bystar should be able to run without becoming root
	  EH_problem "Run it as $( id -u -n ) or root if user=bystar/user"
	  return -1
      fi

      #
      # Running as root -- with sudo
      #
      opDo  sudo -u ${user} mkdir -p ${userHome}/gatherer/bxo/${bystarUid}
      opDo chmod g+w ${userHome}/gatherer/bxo/${bystarUid}
      opDoExit cd ${userHome}/gatherer/bxo/${bystarUid}

      opDo sudo -u ${developer} /usr/mapFiles/bystarAcctBase/mapVerModules.sh -p bystarUid=${bystarUid} -p cvsRoot=${cvsRootParameter} -s all -a moduleCheckout
  else
       if [ "${user}" != ${developer} ] ; then
	  EH_problem "${user} != ${developer} -- Perhaps Re-Run It As Root."
	  return -1
       fi

      opDo  mkdir -p ${userHome}/gatherer/bxo/${bystarUid}
      opDoExit cd ${userHome}/gatherer/bxo/${bystarUid}

      opDo /usr/mapFiles/bystarAcctBase/mapVerModules.sh -p bystarUid=${bystarUid} -p cvsRoot=${cvsRootParameter} -s all -a moduleCheckout
  fi
}


function prepedAcctPasswdGet {
    EH_assert [[ $# -eq 0 ]]

    thisKey=$( STR_toLower ${cp_ServiceType} )
    #ANT_raw decryptedPasswd=$(  echo ${cp_currentPasswd}  | gcipher -C Vigenere -k ${thisKey} - )
    decryptedPasswd=$(  echo ${cp_currentPasswd}  | gcipher -C Vigenere -k ${thisKey} - )

    echo ${decryptedPasswd}
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs        :: vis_offlineimapUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_offlineimapUpdate {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  #typeset thisExpectedUid="root"
  if [ "${opRunDistFamily}_" == "MAEMO_" ] ; then 
      typeset thisExpectedUid="user"
  else
      typeset thisExpectedUid="lsipusr"
  fi

  if ! uidIsAsExpected "${thisExpectedUid}" ; then 
      EH_problem "Unexpected uid (${thisExpectedUid})"
      return 101
  fi

  opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage

  userHome=$( FN_absolutePathGet ~${user} )

  if [ ! -d ${userHome} ] ; then
      EH_problem "Unknown User ${user} -- Missing ${userHome}"
      lpReturn
  fi

  if [ "${cp_bueCapMailRetrieve}_" == "_" ] ; then
      FN_fileSafeKeep ${userHome}/.offlineimaprc
	vis_offlineimapStdout > ${userHome}/.offlineimaprc

	opDo chown ${user} ${userHome}/.offlineimaprc
	opDo chmod 600 ${userHome}/.offlineimaprc
	
	opDo ls -l ${userHome}/.offlineimaprc
#  elif [ "${cp_bueCapMailRetrieve}_" == "none_" ] ; then # NOTYET none should be replaced by imap/smtp
#	opDo /bin/rm ${userHome}/.offlineimaprc
  else  # applies to all urgent 
      FN_fileSafeKeep ${userHome}/.offlineimaprc      
	vis_offlineimapStdout > ${userHome}/.offlineimaprc

	opDo chown ${user} ${userHome}/.offlineimaprc
	opDo chmod 600 ${userHome}/.offlineimaprc
	
	opDo ls -l ${userHome}/.offlineimaprc
  fi
}


function vis_offlineimapStdout {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${bystarUid}_" == "all_" ] ; then
      opDoExit cd ${userHome}/gatherer/bxo
      
      acctsList=$( echo * ) 
      for thisBystarUid in ${acctsList} ; do
	  bystarUid=${thisBystarUid}
	  vis_offlineimapStdout
      done
  else
      vis_offlineimapStdout      
  fi
}


function vis_offlineimapStdout {
  EH_assert [[ $# -eq 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${opRunDistFamily}" != "MAEMO" ] ; then
      bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
  else
      bystarUidHome="${userHome}/gatherer/bxo/${bystarUid}"
  fi

  if [ -d ${currentMirrorBase}/gatherer/bxo/${bystarUid} ] ; then
      bystarUidBase="${currentMirrorBase}/gatherer/bxo/${bystarUid}"
  elif [ -d ${userHome}/gatherer/bxo/${bystarUid} ] ; then
      # /acct/employee/bystar/
      bystarUidBase="${userHome}/gatherer/bxo/${bystarUid}"
  elif [ -d ${bystarUidHome} ] ; then
      bystarUidBase="${bystarUidHome}"
  else
      EH_problem "Missing ${currentMirrorBase}/gatherer/bxo/${bystarUid} or ${userHome}/gatherer/bxo/${bystarUid}"
      return 101
  fi

  opDoExit fileParamsLoadVarsFromBaseDir  ${bystarUidBase}/BAGP
  
  passwd=$( prepedAcctPasswdGet )

  if [ ! -d ${bystarUidHome}/ByStarMailDir ] ; then
      opDo mkdir ${bystarUidHome}/ByStarMailDir
  fi

  cat << _EOF_
# Machine Generated -- Do Not Hand Edit
[general]
accounts = MyAccount
#pythonfile = .offlineimap.py

[Account MyAccount]
localrepository = LocalIMAP
remoterepository = RemoteIMAP
# autorefresh = 5
# postsynchook = notmuch new

[Repository LocalIMAP]
type = Maildir
localfolders =  ${bystarUidHome}/ByStarMailDir

[Repository RemoteIMAP]
type = IMAP
remotehost = imap.${cp_acctMainBaseDomain}
remoteuser = ${cp_acctUid}
remotepass = ${passwd}
# ssl = yes
#nametrans = lambda name: re.sub('^INBOX.', '', name)
nametrans = lambda foldername: re.sub('^INBOX\.*', '.', foldername)
# folderfilter = lambda name: name in [ 'INBOX.important', 'INBOX.work' ]
folderfilter = lambda name: name in [ 'INBOX.test', 'INBOX', 'INBOX.family'  ]
# folderfilter = lambda name: not (name in [ 'INBOX.spam', 'INBOX.commits' ])
# holdconnectionopen = yes
# maxconnections = 3
# foldersort = lld_cmp
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs        :: vis_authInfoUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_authInfoUpdate {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  #typeset thisExpectedUid="root"
  if [ "${opRunDistFamily}_" == "MAEMO_" ] ; then 
      typeset thisExpectedUid="user"
  else
      typeset thisExpectedUid="lsipusr"
  fi

  if ! uidIsAsExpected "${thisExpectedUid}" ; then 
      EH_problem "Unexpected uid (${thisExpectedUid})"
      return 101
  fi

  # opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage
  cp_bueCapMailRetrieve=""

  userHome=$( FN_absolutePathGet ~${user} )

  if [ ! -d ${userHome} ] ; then
      EH_problem "Unknown User ${user} -- Missing ${userHome}"
      lpReturn
  fi

  if [ "${cp_bueCapMailRetrieve}_" == "_" ] ; then
      FN_fileSafeKeep ${userHome}/.authinfo      
	vis_authInfoStdout > ${userHome}/.authinfo

	opDo chown ${user} ${userHome}/.authinfo
	opDo chmod 600 ${userHome}/.authinfo
	
	opDo ls -l ${userHome}/.authinfo
#  elif [ "${cp_bueCapMailRetrieve}_" == "none_" ] ; then # NOTYET none should be replaced by imap/smtp
#	opDo /bin/rm ${userHome}/.authinfo
  else  # applies to all urgent 
      FN_fileSafeKeep ${userHome}/.authinfo
	vis_authInfoStdout > ${userHome}/.authinfo

	opDo chown ${user} ${userHome}/.authinfo
	opDo chmod 600 ${userHome}/.authinfo
	
	opDo ls -l ${userHome}/.authinfo
  fi
}


function vis_authInfoStdout {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${bystarUid}_" == "all_" ] ; then
      opDoExit cd ${userHome}/gatherer/bxo
      
      acctsList=$( echo * ) 
      for thisBystarUid in ${acctsList} ; do
	  bystarUid=${thisBystarUid}
	  vis_authInfoStdoutOne  
      done
  else
    vis_authInfoStdoutOne
  fi
}


function vis_authInfoStdoutOne {
  EH_assert [[ $# -eq 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${opRunDistFamily}" != "MAEMO" ] ; then
      bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
  else
      bystarUidHome="${userHome}/gatherer/bxo/${bystarUid}"
  fi

  if [ -d ${currentMirrorBase}/gatherer/bxo/${bystarUid} ] ; then
      bystarUidBase="${currentMirrorBase}/gatherer/bxo/${bystarUid}"
  elif [ -d ${userHome}/gatherer/bxo/${bystarUid} ] ; then
      # /acct/employee/bystar/
      bystarUidBase="${userHome}/gatherer/bxo/${bystarUid}"
  elif [ -d ${bystarUidHome} ] ; then
      bystarUidBase="${bystarUidHome}"
  else
      EH_problem "Missing ${currentMirrorBase}/gatherer/bxo/${bystarUid} or ${userHome}/gatherer/bxo/${bystarUid}"
      return 101
  fi

  opDoExit fileParamsLoadVarsFromBaseDir  ${bystarUidBase}/BAGP
  
  passwd=$( prepedAcctPasswdGet )

  echo "machine imap.${cp_acctMainBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
  echo "machine imap.${cp_acctNu}.${cp_factoryBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"

  echo "machine smtp.${cp_acctMainBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
  echo "machine smtp.${cp_acctNu}.${cp_factoryBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs        :: bleeUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_bleeUpdate {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${bystarUid}_" == "all_" ] ; then
      opDoExit cd ${userHome}/gatherer/bxo
      
      acctsList=$( echo * ) 
      for thisBystarUid in ${acctsList} ; do
	  bystarUid=${thisBystarUid}
	  vis_bleeUpdateOne  
      done
  else
    acctsList="${bystarUid}"
    vis_bleeUpdateOne  
  fi

#

  # /bxo/r3/usg/bystar/BUE/elisp
  cat <<  _EOF_ > ${userHome}/BUE/elisp/bystar-all.el
;; 
;; bystar-all.el
;; 

(defun bystar-all ()
  "bystar setting for all"
  (interactive)
  (setq bystarAcctsList '())
  (require 'bystar-this-acct)
  (add-to-list 'bystarAcctsList  'bystar-this-acct)
)
  
(provide 'bystar-all)  
_EOF_

  opDo ls -l  ${userHome}/BUE/elisp/bystar-all.el
}


function vis_bleeAcctMainUpdate {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )
  #bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

  # ~/BUE/elisp/bue-acct-main.el
  vis_bleeAcctMainStdout > ${userHome}/BUE/elisp/bue-acct-main.el

  opDo ls -l  ${userHome}/BUE/elisp/bue-acct-main.el
}



function vis_bleeUpdateOne {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )

  if [ "${opRunDistFamily}" != "MAEMO" ] ; then
      bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
  else
      bystarUidHome="${userHome}/gatherer/bxo/${bystarUid}"
  fi

  if [ -d ${currentMirrorBase}/gatherer/bxo/${bystarUid} ] ; then
      bystarUidBase="${currentMirrorBase}/gatherer/bxo/${bystarUid}"
  elif [ -d ${userHome}/gatherer/bxo/${bystarUid} ] ; then
      # /acct/employee/bystar/
      bystarUidBase="${userHome}/gatherer/bxo/${bystarUid}"
  elif [ -d ${bystarUidHome} ] ; then
      bystarUidBase="${bystarUidHome}"
  else
      EH_problem "Missing ${currentMirrorBase}/gatherer/bxo/${bystarUid} or ${userHome}/gatherer/bxo/${bystarUid}"
      return 101
  fi

  opDoExit fileParamsLoadVarsFromBaseDir  ${bystarUidBase}/BAGP
 
  #vis_bleeStdoutOne > ${userHome}/lisp/bystar-${cp_acctUid}.el
  # ~/BUE/elisp/
  vis_bleeStdoutOne > ${userHome}/BUE/elisp/bystar-this-acct.el

  opDo ls -l  ${userHome}/BUE/elisp/bystar-this-acct.el
}


mkpipe () {
	rm -f -- "$1"
	mkfifo -m600 -- "$1"
}

thisPipe=/tmp/pipe$$

mkpipe ${thisPipe}


function vis_bleeAcctMainStdout {
  EH_assert [[ $# -eq 0 ]]

      cat <<  _EOF_

;; (bue:acct:main)
(defun bue:acct:main ()
  ""
  (interactive)

  (message "bue:acct:main -- Done." )
  )

(provide 'bue-acct-main)
_EOF_

}


function vis_bleeStdoutOne {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  EH_assert [[ "${user}_" != "MANDATORY_" ]]

  userHome=$( FN_absolutePathGet ~${user} )
  bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

  if [ -d ${currentMirrorBase}/gatherer/bxo/${bystarUid} ] ; then
      bystarUidBase="${currentMirrorBase}/gatherer/bxo/${bystarUid}"
  elif [ -d ${userHome}/gatherer/bxo/${bystarUid} ] ; then
      # /acct/employee/bystar/
      bystarUidBase="${userHome}/gatherer/bxo/${bystarUid}"
  elif [ -d ${bystarUidHome} ] ; then
      bystarUidBase="${bystarUidHome}"
  else
      EH_problem "Missing ${currentMirrorBase}/gatherer/bxo/${bystarUid} or ${userHome}/gatherer/bxo/${bystarUid}"
      return 101
  fi

  opDoExit fileParamsLoadVarsFromBaseDir  ${bystarUidBase}/BAGP
 

      cat <<  _EOF_
;; 
;; bystar-${cp_acctUid}.el
;; bystar-this-acct.el
;; Machine generated by bueAcctCurrent.sh
;; 

;;;(defun bystar-${cp_acctUid} ()
(defun bystar-this-acct ()
  "bystar setting for the ${cp_acctUid}"
  (interactive)

_EOF_

  lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${bystarUidBase}/BAGP -i fileParamsShow 2> /dev/null 1>${thisPipe}  &


cat ${thisPipe} | 
while read  thisLine  ; do
    #echo "${thisLine}"
    rightSide=$( Equal_rightSide "${thisLine}" )
    leftSide=$( Equal_leftSide "${thisLine}" )
    if [ "${leftSide}_" != "cp_currentPasswd_" ] ; then 
	echo "(setq bystar-${leftSide} \"${rightSide}\")"
    fi
done



   cat <<  _EOF_
  )

;;(provide 'bystar-${cp_acctUid})  
(provide 'bystar-this-acct)  

_EOF_
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
