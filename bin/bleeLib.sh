#!/bin/bash # -*- mode: sh-mode; -*-

IimBriefDescription="NOTYET: Short Description Of The Module"

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



function vis_examples_bleeLib {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    local thisEmacsClient=$( vis_thisEmacsClient )
    local emacsServerSocket=$(vis_emacsServerSocketFromEnv)
    local emacsServerVersion=$(vis_emacsServerSocketEmacsVersion ${emacsServerSocket})

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "Blee Lib Feature Examples" )
$( examplesSeperatorSection "Locating The Server" )
${G_myName} ${extraInfo} -i thisEmacsClient                                            # Obatin qualified emacsclient for this Bash
${G_myName} ${extraInfo} -i emacsclientProgOfEmacsServerVersion ${emacsServerVersion}  # Obtain emacsclient based on EmacsVersion
${G_myName} ${extraInfo} -i emacsServerSocketBleeVersion ${emacsServerSocket}          # Obtain BleeVersion in Bash
${G_myName} ${extraInfo} -i emacsServerSocketEmacsVersion ${emacsServerSocket}         # Obtain EmacsVersion in Bash
${G_myName} ${extraInfo} -i emacsServerSocketFromEnv                                   # Obtain ServerSocket from environement
${G_myName} ${extraInfo} -i emacsServerPidFromEnv				       # Obatin ServerPid from environment
$( examplesSeperatorSection "Raw emacsclient Invocations" )
$( vis_thisEmacsClient ) --eval "(emacs-version)"
$( vis_examples_bleeLib )
_EOF_
}

function vis_examples_bleeLibLine {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
${G_myName} ${extraInfo} -i examples_bleeLib        # Blee Lib Feature Examples
_EOF_
}




function vis_thisEmacsClient {
    function describeF {  cat  << _EOF_

_EOF_
  }
    EH_assert [[ $# -eq 0 ]]

    local emacsServerSocket=$(vis_emacsServerSocketFromEnv)
    if [ -z "${emacsServerSocket}" ] ; then
	EH_problem "Missing emacsServerSocket"
    fi
    
    local emacsServerVersion=$(vis_emacsServerSocketEmacsVersion ${emacsServerSocket})
    local emacsClientProg=$(vis_emacsclientProgOfEmacsServerVersion ${emacsServerVersion})

    echo "${emacsClientProg} --socket-name=${emacsServerSocket}"
}


function vis_emacsclientProgOfEmacsServerVersion {
    function describeF {  cat  << _EOF_
Given EmacsVersion determine path to emacsclient
** TODO do this based on blee-version and INSIDE_EMACS variable
   SCHEDULED: <2020-02-23 Sun>
_EOF_
  }
    EH_assert [[ $# -eq 1 ]]

    local emacsVersion="$1"
    local emacsClient="$(which emacsclient)"

    #
    # NOTYET, do this based on blee-version and INSIDE_EMACS variable
    #
    case ${emacsVersion} in
	27.0.5 )
            emacsClient="/usr/local/bin/emacsclient27"
            ;;
	*)
	    emacsClient="$(which emacsclient)"
	    ;;
    esac

    echo "${emacsClient}"
}


function vis_emacsServerSocketBleeVersion {
    function describeF {  cat  << _EOF_
Given emacsServerSocket determine BleeVersion
_EOF_
  }
    EH_assert [[ $# -eq 1 ]]

    local serverSocket="$1"
    
    echo $( basename "${serverSocket}" | cut -d '-' -f 2 ) 
}


function vis_emacsServerSocketEmacsVersion {
    function describeF {  cat  << _EOF_
Given emacsServerSocket determine EmacsVersion
_EOF_
  }
    EH_assert [[ $# -eq 1 ]]

    local serverSocket="$1"
    
    echo $( basename "${serverSocket}" | cut -d '-' -f 3 ) 
}


function vis_emacsServerSocketFromEnv {
    function describeF {  cat  << _EOF_
Based on the vis_emacsServerPidFromEnv, find the emacs (server) pid and its socket file.
If no socket file, then look for server and return that.
If no server, then return blank.
_EOF_
  }
    EH_assert [[ $# -eq 0 ]]

    local parentEmacsPid=$( vis_emacsServerPidFromEnv )
    local serverSocket=$( ls -1 /run/user/$(id -u)/emacs/*${parentEmacsPid}* 2> /dev/null )

    if [ -z "${serverSocket}" ] ; then
	serverSocket=$( ls -1 /run/user/$(id -u)/emacs/server 2> /dev/null )
	if [ -z "${serverSocket}" ] ; then
	    serverSocket=""
	fi
    fi
    
    echo ${serverSocket}
}

function vis_emacsServerPidFromEnv {
    function describeF {  cat  << _EOF_
Determine Emacs Server PID based on environment variable.
_EOF_
  }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${G_emacsServerPid}" ] ; then
	EH_problem "Missing G_emacsServerPid"
	lpReturn
    fi

    echo ${G_emacsServerPid} 
}


function vis_emacsServerPidFromIcmHeritage {
    function describeF {  cat  << _EOF_
Obsoleted by: vis_emacsServerPidFromEnv
Returns on stdout the parent of the parent of the parent of current process.
This is expected to have been invoked from a shell within emacs as an icm.
The current process is the icmSeed.
The parent of the current process is this running file.
The parent of the parent of the current process is the running shell in emacs.
The parent of the parent of the parent of the current process is the running server emacs.
_EOF_
  }
    EH_assert [[ $# -eq 0 ]]

    echo $( ps ho ppid $(ps ho ppid $(ps ho ppid $$ ) ))
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
