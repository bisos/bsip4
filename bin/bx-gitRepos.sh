#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bx-gitRepos.sh,v 1.2 2019-04-20 02:06:24 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/bx-gitRepos.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
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


# PRE parameters

baseDir=""   # defaults to /bisos/git/auth/bxRepos or /bisos/git/anon/bxRepos based on clout
             # -- or could be anything
clout="auth"  # authenticated or anonymous "anon"

message="auto"     # git commit message


function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local oneRepoBaseDir="/bisos/git/auth/bxRepos/bisos-pip/bx-bases"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Manage Git Repo Base Directories" )
$( examplesSeperatorSection "Top Repos BaseDir" )
${G_myName} -i bxReposBaseDir  # $( ${G_myName} -i bxReposBaseDir )
${G_myName} -p clout=anon -i bxReposBaseDir # $( ${G_myName} -p clout=anon -i bxReposBaseDir )
ls -l $( ${G_myName} -i bxReposBaseDir ) $( ${G_myName} -p clout=anon -i bxReposBaseDir )
$( examplesSeperatorSection "List BxRepo Base Directories (FTO WalkDirs)" )
cd /bisos/git/auth/bxRepos && ftoProc.sh -v -n showRun -i treeRecurse gitReposList 2> /dev/null | egrep '^GitRepo' | cut -d ':' -f 2 
stdbuf -i0 -o0 -e0 ${G_myName} ${extraInfo} -i bxReposList   # default clout=auth
stdbuf -i0 -o0 -e0 ${G_myName} ${extraInfo} -p clout=anon -i bxReposList   # default clout=auth
$( examplesSeperatorSection "List Cached BxRepos Base Directories" )
${G_myName} -i cachedBxReposListFileName  # $( ${G_myName} -i cachedBxReposListFileName )
${G_myName} -p clout=anon -i cachedBxReposListFileName  # $( ${G_myName} -p clout=anon -i cachedBxReposListFileName )
ls -l $( ${G_myName} -i cachedBxReposListFileName ) $( ${G_myName} -p clout=anon -i cachedBxReposListFileName )
${G_myName} ${extraInfo} -i cachedBxReposListRefresh
${G_myName} ${extraInfo} -p clout=anon -i cachedBxReposListRefresh
${G_myName} ${extraInfo} -p basedDir="/bisos/git/auth/bxRepos/bisos-pip" -p clout=auth -i cachedBxReposListRefresh
${G_myName} ${extraInfo} -i cachedBxReposList
${G_myName} ${extraInfo} -p clout=anon -i cachedBxReposList
$( examplesSeperatorSection "gitBaseIsCollection Git Repo Base Directories" )
${G_myName} -i gitBaseIsCollection ${oneRepoBaseDir}
${G_myName} -i cachedBxReposList | ${G_myName} -i gitBaseIsCollection
${G_myName} -p clout=anon -i cachedBxReposList | ${G_myName} -i gitBaseIsCollection
$( examplesSeperatorSection "List BxRepo Base grep GIT-DIGEST" )
cd /bisos/git/auth/bxRepos && ftoProc.sh -v -n showRun -i treeRecurse gitStatusReport 2> /dev/null | grep GIT-DIGEST
${G_myName} ${extraInfo} -i gitStatusReport ${oneRepoBaseDir}
${G_myName} -i cachedBxReposList | ${G_myName} -i gitStatusReport
${G_myName} -i cachedBxReposList | ${G_myName} -i gitStatusReport | grep CHANGED
${G_myName} -p clout=anon -i cachedBxReposList | ${G_myName} -i gitStatusReport
${G_myName} -p clout=anon -i cachedBxReposList | ${G_myName} -i gitStatusReport | grep CHANGED
$( examplesSeperatorSection "Remote Status" )
${G_myName} ${extraInfo} -i gitRemStatus ${oneRepoBaseDir}
${G_myName} -i cachedBxReposList | ${G_myName} -i gitRemStatus  # Does not work reliably
$( examplesSeperatorSection "Pull Remote" )
${G_myName} ${extraInfo} -i gitRemPull ${oneRepoBaseDir}
${G_myName} -i cachedBxReposList | ${G_myName} -i gitRemPull
$( examplesSeperatorSection "Add, Commit and Push" )
${G_myName} ${extraInfo} -i addCommitPush ${oneRepoBaseDir} 
${G_myName} -i cachedBxReposList | ${G_myName} -i addCommitPush
$( examplesSeperatorSection "Update Git Repo Base Directories" )
${G_myName} ${extraInfo} -i baseUpdateDotIgnore ${oneRepoBaseDir}
${G_myName} ${extraInfo} -i baseUpdateDotIgnore .
${G_myName} -i cachedBxReposList | ${G_myName} ${extraInfo} -i baseUpdateDotIgnore
startAnyFto.sh -h -v -n showRun -i startFtoUpdate auxNode
$( examplesSeperatorSection "Verify Git Repo Base Directories" )
${G_myName} ${extraInfo} -i baseVerifyDotIgnore ${oneRepoBaseDir}
${G_myName} ${extraInfo} -i baseVerifyDotIgnore .
${G_myName} -i cachedBxReposList | ${G_myName} -i baseVerifyDotIgnore
${G_myName} -i cachedBxReposList | ${G_myName} -i baseVerifyDotIgnore | grep Missing
_EOF_
}

noArgsHook() {
  vis_examples
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxReposStatus  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_bxReposStatusFtoWalk {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    pushd /bisos/git/auth/bxRepos > /dev/null \
	&& \
	stdbuf -i0 -o0 -e0  ftoProc.sh -v -n showRun -i treeRecurse gitStatusReport 2> /dev/null | \
	    egrep '^GIT-DIGEST' \
	&& \
	popd > /dev/null

    lpReturn
}	


function vis_cachedBxReposListFileName {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ ! -d "/bisos/var/core/cached" ] ; then
	lpDo mkdir -p /bisos/var/core/cached
    fi

    if [ "${clout}" == "auth" ] ; then
	echo "/bisos/var/core/cached/bxReposList.auth"
    elif [ "${clout}" == "anon" ] ; then
	echo "/bisos/var/core/cached/bxReposList.anon"
    else
	EH_problem "clout=${clout} is neither auth nor anon"
	EH_retOnFail
    fi

    lpReturn
}	


function vis_cachedBxReposListRefresh {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxReposListFileName=$( vis_cachedBxReposListFileName )
    EH_assert [[ "${bxReposListFileName}X" != "X" ]]
    
    ANT_cooked "Creating The Cache File at ${bxReposListFileName}:"
    lpDo stdbuf -i0 -o0 -e0 ${G_myName} -h -v -n showRun -p baseDir="${baseDir}" -p clout=${clout} -i bxReposList | tee "${bxReposListFileName}"

    lpReturn
}	

function vis_cachedBxReposList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxReposListFileName=$( vis_cachedBxReposListFileName )
    EH_assert [[ "${bxReposListFileName}X" != "X" ]]

    if [ -f "${bxReposListFileName}" ] ; then
	lpDo cat "${bxReposListFileName}"
    else
	lpDo vis_cachedBxReposListRefresh
    fi

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxReposList  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_bxReposBaseDir {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${baseDir}" ] ; then
	if [ "${clout}" == "auth" ] ; then
	    baseDir="/bisos/git/auth/bxRepos"
	elif [ "${clout}" == "anon" ] ; then
	    baseDir="/bisos/git/anon/bxRepos"
	else
	    EH_problem "clout=${clout} is neither auth nor anon"
	    EH_retOnFail
	fi
    fi

    echo "${baseDir}"
    
    lpReturn
}	


function vis_bxReposList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local baseDir=$( vis_bxReposBaseDir )

    EH_assert [[ "${baseDir}X" != "X" ]]
    
    lpDo pushd "${baseDir}" > /dev/null \
	&& \
	stdbuf -i0 -o0 -e0  ftoProc.sh -v -n showRun -i treeRecurse gitReposList 2> /dev/null | \
	    egrep '^GitRepo' | \
	    cut -d ':' -f 2 \
	&& \
	lpDo popd > /dev/null

    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  gitRemStatus  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function gitRemStatus {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
# To do this properly, eg in a script, you need to be able to refer to
# the current branch, and the remote branch it's tracking. The bash
# prompt-setting function in /etc/bash_completion.d has some useful code
# for getting branch names. However, you probably don't actually need to
# get the names. Git has some neat shorthands for referring to branches
# and commits (as documented in git rev-parse --help). In particular,
# you can use @ for the current branch (assuming you're not in a
# detached-head state) and @{u} for its upstream branch (eg
# origin/master). So git merge-base @ @{u} will return the (hash of) the
# commit at which the current branch and its upstream diverge and git
# rev-parse @ and git rev-parse @{u} will give you the hashes of the two
# tips. This can be summarized in the following script:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local here=$(pwd)

    local curBranch=$( git rev-parse --abbrev-ref HEAD )

    UPSTREAM=${curBranch:-'@{u}'}
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM")
    BASE=$(git merge-base @ "$UPSTREAM")

    #echo $LOCAL  $REMOTE $BASE

    if [ $LOCAL = $REMOTE ]; then
	echo "Up-to-date:${here}"
    elif [ $LOCAL = $BASE ]; then
	echo "Need to pull":${here}
    elif [ $REMOTE = $BASE ]; then
	echo "Need to push:${here}"
    else
	echo "Diverged:${here}"
    fi

}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitRemStatus  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitRemStatus {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	lpDo gitRemStatus
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  gitRemStatus  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function gitRemPull {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local here=$(pwd)

    lpDo echo "git pull in ${here}"

    lpDo git pull
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitRemPull  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitRemPull {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	lpDo gitRemPull
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}	


function addCommitPush {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local here=$(pwd)
    
    lpDo git add -u .
    EH_retOnFail

    # In -m below, space failed. Changed to _ for that reason
    lpDo git commit -m "${message}"
    EH_retOnFail

    lpDo git push origin master
    EH_retOnFail
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_addCommitPush  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_addCommitPush {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	lpDo addCommitPush
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  gitBaseIsCollection  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function gitBaseIsCollection {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET: Library Candidate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local remoteGitPath=""
    local remoteGitName=""
    
    remoteGitPath=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i path | cut -d '=' -f 2 )
    remoteGitName=$( basename "${remoteGitPath}" )

    local retVal=0

    if [ "${remoteGitName}" == "base" ] ; then
	retVal=0
    elif [ "${remoteGitName}" == "bxReposBase" ] ; then
	retVal=0
    else
	retVal=1
    fi

    lpReturn ${retVal}
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitBaseIsCollection  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitBaseIsCollection {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	if gitBaseIsCollection ; then
	    echo "COLLECTION:${here}"
	else
	    echo "REPO-ATOM:${here}"
	fi
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:

    lpReturn
}	



function gitStatusReport {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET: Library Candidate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local remoteGitPath=""
    local remoteGitName=""
    local remoteHostName=""
    local exitCode=0

    function gitDigest {    
	EH_assert [[ $# -eq 1 ]]

	local exitCode=$1

	if [ "${exitCode}" = "1" ] ; then
	    # grep for Changes was empty
	    echo  "GIT-DIGEST:current: ${here} ::${remoteHostName}:${remoteGitPath}"
	else
	    echo  "GIT-DIGEST:-CHANGED-: ${here} ::${remoteHostName}:${remoteGitPath}"	    
	fi

    }
    

    remoteHostName=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i hostname | cut -d '=' -f 2 )    
    remoteGitPath=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i path | cut -d '=' -f 2 )
    remoteGitName=$( basename "${remoteGitPath}" )

    if [ "${remoteGitName}" == "base" ] ; then
	#git status --untracked-files=no | grep -i Changes > /dev/null
	git status  --porcelain | egrep -v '/$' > /dev/null	    
	exitCode=$?
	gitDigest "${exitCode}"
    elif [ "${remoteGitName}" == "bxReposBase" ] ; then
	git status  --porcelain | egrep -v '/$' > /dev/null	    
	exitCode=$?
	gitDigest "${exitCode}"
    else
	#git status | grep -i Changes > /dev/null
	if [ -z "$(git status --porcelain)" ] ; then
	    exitCode=1
	else
	    exitCode=0
	fi
	gitDigest "${exitCode}"
    fi

    lpReturn ${exitCode}
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitBaseIsCollection  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitStatusReport {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)
	
	if gitStatusReport ; then
	    # NOTYET, distinguish between ATOM and COLLECTION
	    lpDo git status --porcelain
	fi
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_baseUpdateDotIgnore  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_baseUpdateDotIgnore {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	# if gitBaseIsCollection ; then
	#     echo "COLLECTION:${here}"
	#     if [ -f .gitignore ] ; then
	# 	lpDo echo rm ${here}/.gitignore	    
	#     fi

	#     if [ -f .gitattributes ] ; then
	# 	lpDo echo rm ${here}/.gitattributes    	    
	#     fi

	# else
	    echo "REPO-ATOM:${here}"
	    if [ ! -f .gitignore ] ; then
		lpDo cp /libre/ByStar/InitialTemplates/begin/templates/moded/git/gitignore/emacs+py .gitignore
	    else
		echo "${here}/.gitignore in place -- updating skipped"
	    fi

	    if [ ! -f .gitattributes ] ; then
		lpDo cp /libre/ByStar/InitialTemplates/begin/templates/moded/git/gitattributes/py .gitattributes
	    else
		echo "${here}/.gitattributes in place -- updating skipped"
	    fi
	# fi

    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_baseVerifyDotIgnore  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_baseVerifyDotIgnore {
    G_funcEntry
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function hereDo {
	EH_assert [[ $# -eq 0 ]]
	local here=$(pwd)

	if [ ! -f .gitignore ] ; then
	    ANT_raw "Missing ${here}/.gitignore"
	else
	    ANT_raw "Verified ${here}/.gitignore"
	fi
	if [ ! -f .gitattributes ] ; then
	    ANT_raw "Missing ${here}/.gitattributes"
	else
	    ANT_raw "Verified ${here}/.gitattributes"
	fi
	
    }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local thisOne="$1"

	# lpDo cp /libre/ByStar/InitialTemplates/begin/templates/moded/git/gitignore/emacs+py .gitignore

	# lpDo cp /libre/ByStar/InitialTemplates/begin/templates/moded/git/gitattributes/py .gitattributes    

	inBaseDirDo \
	    ${thisOne} \
	    hereDo
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin 
     function processArgsAndStdin {
	local effectiveArgs=( "$@" )
	local stdinArgs
	local each
	if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
	    readarray stdinArgs < /dev/stdin
	    effectiveArgs=( "$@" "${stdinArgs[@]}" )
	fi
	if [ ${#effectiveArgs[@]} -eq 0 ] ; then
	    ANT_raw "No Args And Stdin Is Empty"
	    lpReturn
	fi
	for each in "${effectiveArgs[@]}"; do
	    lpDo processEach "${each%$'\n'}"
	done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
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
