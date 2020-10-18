#!/bin/bash

# TODO: NOTYET: Needs to be renamed as bxcuSshAccess.sh

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bxuSshAccess.sh,v 1.2 2017-04-09 23:21:06 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
* /[dblock]/--Seed/: /opt/public/osmt/bin/seedActions.bash
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
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
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bystarCentralAcct.libSh

. ${opBinBase}/lpCurrents.libSh

# PRE parameters
typeset -t bxo="MANDATORY"

function G_postParamHook {
    bxoHome=$( FN_absolutePathGet ~${bxo} )
    lpCurrentsGet
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo="
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local oneBxo=${currentBxo}
    local oneGitBxSeLn="git.bysource.org"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Full Actions" )
${G_myName} ${examplesInfo} -p bxo=${oneBxo} -i fullUpdate   
${G_myName} ${examplesInfo} -p bxo=${oneBxo} -i bxuBxoFullUpdate
$( examplesSeperatorChapter "Bxo Ssh Private Keys" )
$( examplesSeperatorSection "lcaSshAdmin.sh" )
lcaSshAdmin.sh
lcaSshAdmin.sh -p localUser=lsipusr -p remoteHost=cvs.bysource.org -i hostIsInKnownHostsFile
lcaSshAdmin.sh -p localUser=${oneBxo} -i userKeyVerify
lcaSshAdmin.sh -p localUser=${oneBxo} -i userKeyUpdate
${G_myName} ${examplesInfo} -p bxo=${oneBxo} -i bxoSshAcctKeyVerify
${G_myName} ${examplesInfo} -p bxo=${oneBxo} -i bxoSshAcctKeyUpdate
$( examplesSeperatorSection "Ssh Invoker Keys" )
${G_myName} ${examplesInfo} -p bxo=${oneBxo} -i bxuAcctBxoCredentialsUpdate
${G_myName} ${examplesInfo} -i  bxuAcctBxoList
$( examplesSeperatorChapter "Ssh Config File Manipulation" )
${G_myName} ${extraInfo} -i configFileNameGet
${G_myName} ${extraInfo} -i sshFullConfigStdout
${G_myName} ${extraInfo} -i configSegsCollectStdout
${G_myName} ${extraInfo} -p bxo=${oneBxo} -i configSegmentGitBxSeLnStdout ${oneGitBxSeLn} 2> /dev/null
${G_myName} ${extraInfo} -p bxo=${oneBxo} -i configSegmentGitBxSeLnStdout ${oneGitBxSeLn} 2> /dev/null > ~/.ssh/dest-${oneBxo}-${oneGitBxSeLn}
${G_myName} ${extraInfo} -p bxo=${oneBxo} -i configSegmentStdout 2> /dev/null  # Per Bxo Segment
${G_myName} ${extraInfo} -i configFileUpdate
${G_myName} ${extraInfo} -i configFileVerify
${G_myName} ${extraInfo} -i configFileShow
${G_myName} ${extraInfo} -i configFileDelete
$( examplesSeperatorSection "Tests And Verifications" )
$( examplesSeperatorChapter "Access, Verification And Test" )
${G_myName} ${extraInfo} -p bxo="${oneBxo}" -i  sshAccess
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Full Actions
_CommentEnd_

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    opDo vis_bxuBxoFullUpdate
    lpReturn
}


function vis_bxuBxoFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    opDo vis_bxoSshAcctKeyUpdate

    opDo vis_bxuAcctBxoCredentialsUpdate
    opDo vis_configFileUpdate

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Bxo Ssh Acct Keys
_CommentEnd_


function vis_bxoSshAcctKeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    opDo lcaSshAdmin.sh -p localUser=${bxo} -i userKeyVerify

    lpReturn
}


function vis_bxoSshAcctKeyUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    opDo lcaSshAdmin.sh -p localUser=${bxo} -i userKeyUpdate

    lpReturn
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Manage Bxu Acct Credentials
_CommentEnd_


function vis_bxuAcctBxoCredentialsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Take the Bxo's public and private keys and copy them to lsipusr.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    opDo sudo cp ${bxoHome}/.ssh/id_dsa.pub ~lsipusr/.ssh/${bxo}.pub
    EH_retOnFail

    opDo sudo cp ${bxoHome}/.ssh/id_dsa ~lsipusr/.ssh/${bxo}
    EH_retOnFail

    opDo sudo chown lsipusr:employee ~lsipusr/.ssh/${bxo}.pub
    opDo sudo chown lsipusr:employee ~lsipusr/.ssh/${bxo}

    opDo chmod 644 ~lsipusr/.ssh/${bxo}.pub
    opDo chmod 600 ~lsipusr/.ssh/${bxo}

    lpReturn
}

function vis_destBxuAcctBxoList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List Bxo keys at lsipusr ssh client.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset lsResults=$( inBaseDirDo ~lsipusr/.ssh ls dest-*-[0-9][0-9][0-9][0-9][0-9]-* 2> /dev/null )

    if [ -z "${lsResults}" ] ; then
	ANT_raw "No Bxo Accounts found in ~lsipusr/.ssh"
	return 1
    else
	echo ${lsResults}
	return 0
    fi
}


function vis_bxuAcctBxoList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List Bxo keys at lsipusr ssh client.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset lsResults=$( inBaseDirDo ~lsipusr/.ssh ls *-[0-9][0-9][0-9][0-9][0-9] 2> /dev/null )

    if [ -z "${lsResults}" ] ; then
	ANT_raw "No Bxo Accounts found in ~lsipusr/.ssh"
	return 1
    else
	echo ${lsResults}
	return 0
    fi
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Config File Generate/Update
_CommentEnd_


function vis_configFileNameGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep
    echo $( FN_absolutePathGet ~lsipusr/.ssh/config )

    lpReturn
}


function vis_sshFullConfigStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset bxAcctsList=$( vis_bxuAcctBxoList )
    EH_retOnFail

    cat  << _EOF_
# Machine Generated by ${G_myName}:${G_thisFunc} on $( date ) -- Do Not Hand Edit
_EOF_

    
    for thisAcct in ${bxAcctsList}; do
	bxo=${thisAcct}
	vis_configSegmentStdout
    done
}

function vis_configSegsCollectStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset destBxAcctsList=$( vis_destBxuAcctBxoList )
    EH_retOnFail

    cat  << _EOF_
# Machine Generated by ${G_myName}:${G_thisFunc} on $( date ) -- Do Not Hand Edit
_EOF_

    
    for thisDestFile in ${destBxAcctsList}; do
	inBaseDirDo ~lsipusr/.ssh cat ${thisDestFile}
    done
}


function vis_configSegmentGitBxSeLnStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    gitBxSeLn="$1"

    typeset thisFunc="${G_thisFunc}"

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    cat  << _EOF_
# Bxo=${bxo}  gitBxSeLn=${gitBxSeLn}
Host ${bxo}.${gitBxSeLn}
	Hostname ${gitBxSeLn}
	User git
	IdentityFile ~/.ssh/${bxo}
_EOF_

    lpReturn
}

function vis_configSegmentStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisFunc="${G_thisFunc}"

    EH_assert bxoCentralPrep
    opDoRet bystarAcctAnalyze ${bxo}

    if [ -f  ~lsipusr/.ssh/${bxo}.dest ] ; then

	cat ~lsipusr/.ssh/${bxo}.dest |
	while read  thisLine  ; do
	    destAddr=$( echo  ${thisLine} | cut -d ':' -f 1 )
	    destUser=$( echo  ${thisLine} | cut -d ':' -f 2 )

	    cat  << _EOF_
# Bxo=${bxo} -- destAddr=${destAddr} destUser=${destUser}
Host ${bxo}%${destAddr}
	Hostname ${destAddr}
	User ${destUser}
	IdentityFile ~/.ssh/${bxo}
_EOF_
	done
    fi

    cat  << _EOF_
# Bxo=${bxo}
Host git.${cp_acctMainBaseDomain}
	Hostname git.${cp_acctMainBaseDomain}
	User git
	IdentityFile ~/.ssh/${bxo}
_EOF_

    lpReturn
}

function vis_configFileUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    FN_fileSafeKeep ${thisConfigFile}

    vis_configSegsCollectStdout > ${thisConfigFile}

    opDo chmod 600 ${thisConfigFile}

    opDo ls -l ${thisConfigFile}
}


function vis_configFileUpdateOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    FN_fileSafeKeep ${thisConfigFile}

    vis_sshFullConfigStdout > ${thisConfigFile}

    opDo chmod 600 ${thisConfigFile}

    opDo ls -l ${thisConfigFile}
}

function vis_configFileVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    typeset tmpFile=$( FN_tempFile )

    vis_sshFullConfigStdout > ${tmpFile} 

    FN_fileCmpAndDiff ${thisConfigFile} ${tmpFile}
 
    FN_fileRmIfThere ${tmpFile} 
}

function vis_configFileShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    opDo ls -l "${thisConfigFile}"
}

function vis_configFileDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #EH_assert bxoCentralPrep

    typeset thisConfigFile=$( vis_configFileNameGet )

    opDo /bin/rm "${thisConfigFile}"
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Access, Verfications and Tests
_CommentEnd_

function vis_sshAccess {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bxoCentralPrep
    bystarAcctAnalyze ${bxo}

    bxUrl="git.${cp_acctMainBaseDomain}"

    if [ -f  ~lsipusr/.ssh/${bxo}.dest ] ; then

	cat ~lsipusr/.ssh/${bxo}.dest |
	while read  thisLine  ; do
	    destAddr=$( echo  ${thisLine} | cut -d ':' -f 1 )
	    destUser=$( echo  ${thisLine} | cut -d ':' -f 2 )

	    cat  << _EOF_
ssh -vT git@${bxo}%${destAddr}
ssh ${bxo}%${destAddr}
ssh git@${bxo}%${destAddr} info
_EOF_
	done
    fi

    cat  << _EOF_
ssh -vT git@${bxUrl} 
ssh ${bxUrl}
ssh git@${bxUrl} info
_EOF_

    bxUrl=sa-20000.git.bysource.org

    cat  << _EOF_
ssh -vT git@${bxUrl}
ssh ${bxUrl}
ssh git@${bxUrl} info
_EOF_


    lpReturn
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
