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

. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/usgBpos_lib.sh

. ${opBinBase}/aaisByStarAssign_lib.sh
. ${opBinBase}/aaisByStarRealize_lib.sh



# PRE parameters
typeset -t bystarUid="MANDATORY"

typeset -t bxoId=""

typeset -t correspondingBxo=""


function G_postParamHook {
    lpCurrentsGet
 
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

    if [ "${currentBynameUid:-}_" != "_" ] ; then
	oneBystarUid=${currentBynameUid:-}
    else
	oneBystarUid=${currentBystarUid:-}
    fi

    #typeset oneUser=bystar
    typeset oneUser=${thisUid} 
    
    typeset examplesInfo="${extraInfo} ${runInfo}"

    local uidInfo=""
    local thisUserAcct=""
    
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
${G_myName} ${uidInfo:-} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -p developer=${oneUser} -i userServiceFullUpdate
${G_myName} ${uidInfo} ${extraInfo} -p bystarUid=${oneBystarUid} -p user=${oneUser} -i bueFullUpdate
$( examplesSeperatorSection "ASSOCIATE ~/BUE (ByStar User Account)  TO BxO-BUE" )
${G_myName} ${uidInfo} ${extraInfo} -i usgEnvWithAaisBynameAssociate  # Do the symlinks
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

#
# BASE =  ByStar Autonomous Service Environment  -- Remote, Cloud 
# BASA =  ByStar Autonomous Service Account      --
#
# BLA  =  ByStar Local Account -- One of lsipusr or bystar
# 
# 


function vis_usgEnvWithAaisBynameAssociate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:
Given a platform user and a BASA, associate them and update information.
Safe to run multiple times.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/bbdb/dotBbdbV9 ${curUsgAcctHome}/.bbdbV9
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/diary/diary ${curUsgAcctHome}/.emacs.d/diary
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/org ${curUsgAcctHome}/org

    # opDo bueMailManage.sh -p bystarUid=${bystarUid} -i mhonarcBasePrep

    opDo vis_authInfoUpdate

    opDo vis_bleeUpdate
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
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    local userHome=${curUsgAcctHome}
    local bystarAllFilePath=${usgEnvBxoPath}/blee/elisp/bystar-all.el
    
    # opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage
    cp_bueCapMailRetrieve=""

    FN_fileSafeKeep ${userHome}/.authinfo      
    lpDo eval vis_authInfoStdout \> ${userHome}/.authinfo

    # lpDo chown ${user} ${userHome}/.authinfo
    lpDo chmod 600 ${userHome}/.authinfo
	
    opDo ls -l ${userHome}/.authinfo
}


function vis_authInfoStdout {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:
Given a platform user and a BASA, associate them and update information.
Safe to run multiple times.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    
    if [ "${bystarUid:-}_" == "all_" ] ; then
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
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:
Given a platform user and a BASA, associate them and update information.
Safe to run multiple times.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    
    opDoExit fileParamsLoadVarsFromBaseDir  ${bynameBxoPath}/BAGP
  
    local passwd=$(lpDo prepedAcctPasswdGet )

    echo "machine imap.${cp_acctMainBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
    echo "machine imap.${cp_acctNu}.${cp_factoryBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"

    echo "machine smtp.${cp_acctMainBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
    echo "machine smtp.${cp_acctNu}.${cp_factoryBaseDomain} login ${cp_acctUid} password $( prepedAcctPasswdGet )"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs        :: bleeUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bleeUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    local bystarAllFilePath=${usgEnvBxoPath}/blee/elisp/bystar-all.el

    if [ "${bystarUid:-}_" == "all_" ] ; then
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

    cat <<  _EOF_ > ${bystarAllFilePath}
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

  opDo ls -l  ${bystarAllFilePath}
}

function vis_bleeAcctMainUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    local bueAccctMainFilePath=${usgEnvBxoPath}/blee/elisp/bue-acct-main.el

    lpDo eval vis_bleeAcctMainStdout \> ${bueAccctMainFilePath}

    opDo ls -l  ${bueAccctMainFilePath}
}


function vis_bleeUpdateOne {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    local bystarThisAcctFilePath=${usgEnvBxoPath}/blee/elisp/bystar-this-acct.el
    
    opDoExit fileParamsLoadVarsFromBaseDir  ${bynameBxoPath}/BAGP
 
    #vis_bleeStdoutOne > ${userHome}/lisp/bystar-${cp_acctUid}.el
    # ~/BUE/elisp/
    lpDo eval vis_bleeStdoutOne \> ${bystarThisAcctFilePath}

    opDo ls -l  ${bystarThisAcctFilePath}
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
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bynameBxoPath=$(lpDo vis_usgBpos_aais_byname_bxoPath)
    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    local bystarThisAcctFilePath=${usgEnvBxoPath}/blee/elisp/bystar-this-acct.el
    
    opDoExit fileParamsLoadVarsFromBaseDir  ${bynameBxoPath}/BAGP
    
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

  lcnFileParamsAdmin.sh  -p fileParamsBaseDir=${bynameBxoPath}/BAGP -i fileParamsShow 2> /dev/null 1>${thisPipe}  &


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
