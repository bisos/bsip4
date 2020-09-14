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
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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


function vis_describe {  cat  << _EOF_
Assumes that bisos account exists.

./bisosAccounts.sh              :: has created bisos account
./bisosSysPythonSetup.sh        :: has sys installed python and pip
./bisosProvisionersVenvSetup.sh :: has created the venv and has installed bisos.bases 

Based on these we now:

- Creates /bisos, /de,
- Runs bisos.bases and creates everything and symlinks

===== Sets Up Platform as needed ======
- Builds and installs emacs
- Brings platform to minimum bisos level

_EOF_
		      }

# Import Libraries

#

. ${opBinBase}/platformBases_lib.sh

# PRE parameters

vcMode="auth"  # authenticated or anonymous "anon"

function G_postParamHook {
     return 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "BISOS Git Bases Rebuild" )
${G_myName} ${extraInfo} -i bxGitReposAnonReBuildBisos     # Runs with sudo -u bisos
${G_myName} ${extraInfo} -i bxGitReposAuthReBuildBisos     # Runs with sudo -u bisos
$( examplesSeperatorChapter "Git Bases Rebuild As Specified" )
${G_myName} ${extraInfo} -p vcMode=anon -i bxGitReposBasesReBuild /bisos/git/anon   # runs as current user
${G_myName} ${extraInfo} -p vcMode=auth -i bxGitReposBasesReBuild /bisos/git/auth   # runs as current user
_EOF_
}

noArgsHook() {
  vis_examples
}


function vis_bxGitReposAnonReBuildBisos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Runs as bisos user.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo bxGitReposReBuildBisos "anon"
 }

function vis_bxGitReposAuthReBuildBisos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Runs as bisos user.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo bxGitReposReBuildBisos "auth"
 }


function bxGitReposReBuildBisos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Runs as bisos user.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local vcMode="$1"

    if [ -z "${bxp_bisosUserName}" ] ; then
	EH_problem "Missing bisosUserName"
	lpReturn 101
    fi

    if [ -z "${bxp_bisosGroupName}" ] ; then
	EH_problem "Missing bisosGroupName"
	lpReturn 101
    fi

    local currentUser="${bxp_bisosUserName}"
    local currentUserGroup="${bxp_bisosGroupName}"

    local bxGitReposBase=""	    
    
    if [ "${vcMode}" == "auth" ] ; then
	bxGitReposBase="${bxp_rootDir_bisos}/git/auth"	
    elif [ "${vcMode}" == "anon" ] ; then
	bxGitReposBase="${bxp_rootDir_bisos}/git/anon"	
    else
	EH_problem "vcMode=${vcMode} is neither auth nor anon"
	EH_retOnFail
    fi

    lpDo sudo --set-home --user=${currentUser} ${G_myFullName} -h -v -n showRun -p vcMode=${vcMode} -i bxGitReposBasesReBuild "${bxGitReposBase}"
}



function vis_bxGitReposBasesReBuild {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Arg1 is expected to be something like /bisos/git/anon to which bxRepos and ext will be appended.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local baseDir=$1

    if [ "${vcMode}" == "auth" ] ; then
	doNothing
    elif [ "${vcMode}" == "anon" ] ; then
	doNothing
    else
	EH_problem "vcMode=${vcMode} is neither auth nor anon"
	EH_retOnFail
    fi

    local py2ActivateFile="${pdb_venv_py2Bisos3}/bin/activate"
    local thisDateTag="${dateTag}"

    if [ ! -f "${py2ActivateFile}" ] ; then
	EH_problem "Missing ${py2ActivateFile} -- BISOS Provisioners venv pip installs aborted"
	lpReturn 101
    fi

    source ${py2ActivateFile}

    lpDo echo ${VIRTUAL_ENV}

    if [ -d "${baseDir}/bxRepos" ] ; then
	lpDo mv "${baseDir}/bxRepos" "${baseDir}/bxRepos.${thisDateTag}"
    fi

    lpDo bx-gitReposBases -v 20 --baseDir="${baseDir}" --pbdName="bxReposCollection" --vcMode=${vcMode}  -i pbdUpdate all

    EH_assert [[ -d "${baseDir}/bxRepos" ]]
	
    lpDo bx-gitReposBases -v 20 --baseDir="${baseDir}/bxRepos" --pbdName="bxReposRoot" --vcMode=${vcMode}  -i pbdUpdate all
    
    lpDo bx-gitReposBases -v 20 --baseDir="${baseDir}/ext" --pbdName="extRepos" --vcMode=${vcMode}  -i pbdUpdate all    
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

