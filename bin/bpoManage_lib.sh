#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxoManage_lib:-}" ] ; then
    bxoManage_lib="LOADED" ; TM_trace 7 "bxoManage_lib :: Loading Library -- /bisos/bsip/bin/bxoManage_lib.sh"
else
    TM_trace 7 "bxoManage_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxoManage_lib.sh" ; return
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
** 
** Creates a BARC (Bystar Account Request Container) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_usgSshConfigUpdate {
    EH_assert [ $# -eq 0 ]
    EH_assert [ ! -z "${bpoId}" ]
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With bxeDesc obtained from the snapShotObtain, create needed entries in ~usg/.ssh/config
_EOF_
    }

    local usg=$( id -u -n )

    lpDo usgBpoSshManage.sh ${G_commandOptions} -p usg=${usg} -p bpoId=${bpoId} -p bxosBase=$(vis_bxoConstructBaseDir_obtain priv) -i usgBxoFullUpdate

    lpReturn
}

function vis_bxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With bxeDesc obtained from the snapShotObtain, create the bxo
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local bxeDesc="$(vis_bxoConstructBaseDir_obtain priv)/${bpoId}/rbxe/bxeDesc"

    lpDo bxeRealize.sh ${G_commandOptions} -p bxeDesc="${bxeDesc}" -i bxoAcctCreate    

    lpReturn
}


function vis_bpoActivate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
Get a snapshot for the specified bpoId.
Setup the ~usg/.ssh/config.
Clone the repos in bpoHome or where specified.
_EOF_
                       }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        bpoId=$1

        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "Activating bpoId=${bpoId}"
        fi
    
        if vis_userAcctExists "${bpoId}" ; then
            ANT_raw "${bpoId} account already exists."
            lpReturn 101
        fi

        lpDo vis_obtainRepoSnapshot rbxe

        lpDo vis_usgSshConfigUpdate

        lpDo vis_bxoAcctCreate

        lpDo vis_initialReposClone
        
        lpReturn
    }

    if [ ! -z "${bpoId}" ] ; then
        processEach "${bpoId}"
	# We just used the bpoId parameter, So both Args and stdin are ignored.
	lpReturn
    fi

####+BEGIN:  bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
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


function vis_fullConstruct {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Get a snapshot for the specified bpoId.
Setup the ~usg/.ssh/config.
Clone the repos in bpoHome or where specified.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bpoId}" ]
    # EH_assert [ ! -z "${privacy}" ]

    if vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account already exists."
        lpReturn 101
    fi


    local gitCloneDest=""

    lpDo vis_obtainRepoSnapshot rbxe

    lpDo vis_usgSshConfigUpdate

    if [ $# -eq 0 ] ; then
        lpDo vis_bxoAcctCreate

        lpDo vis_initialReposClone
        
    elif [ $# -eq 1 ] ; then
        gitCloneDest=$1

        lpDo vis_initialReposClone ${gitCloneDest}      
        
    else
        EH_oops ""
        lpReturn
    fi

    
    lpReturn
}


function vis_fullRemove {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Removes everything related to specified bpoId on local system.
- usgBxoFullDelete
- bxoAcctDelete
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bpoId}" ]
    #EH_assert [ ! -z "${privacy}" ]

    if ! vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account is not valid." ; lpReturn 101
    fi

    local gitCloneDest=""

    lpDo usgBpoSshManage.sh ${G_commandOptions}  -p bpoId=${bpoId} -i usgBxoFullDelete
    
    if [ $# -eq 0 ] ; then
        lpDo echo NOTYET instead of vis_initialReposClone
        
    elif [ $# -eq 1 ] ; then
        gitCloneDest=$1

        lpDo echo NOTYET instead of vis_initialReposClone ${gitCloneDest}       
        
    else
        EH_oops ""
        lpReturn
    fi

    lpDo vis_userHomeAcctsDelete "${bpoId}"    

    lpDo vis_bxoAcctDelete "${bpoId}"
    
    lpReturn
}


function vis_fullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
FullRemove + bxoGitServerFullDelete
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bpoId}" ]
    #EH_assert [ ! -z "${privacy}" ]

    if ! vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account is not valid." ; lpReturn 101
    fi

    lpDo vis_fullRemove $@
    
    lpDo vis_bxoGitServerFullDelete
    
    lpReturn
}

function vis_bxoGitServerReposDeleteAll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
FullRemove + bxoGitServerFullDelete
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    #EH_assert [ ! -z "${privacy}" ]

    local reposList=$( bxoGitlab.py --bpoId="${bpoId}"  -i reposList )
    local each=""

    for each in ${reposList} ; do
        lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i reposDelete ${each}
    done
    
    lpReturn
}

function vis_bxoGitServerKeysDeleteAll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
FullRemove + bxoGitServerFullDelete
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    #EH_assert [ ! -z "${privacy}" ]    

    local keysList=$( bxoGitlab.py --bpoId="${bpoId}" -i pubkeysList )
    local each=""

    for each in ${keysList} ; do
        lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" --keyName="${each}" -i pubkeyDelete 
    done
    
    lpReturn
}

function vis_bxoGitServerFullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
FullRemove + bxoGitServerFullDelete
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]
    # EH_assert [ ! -z "${privacy}" ]

    lpDo vis_bxoGitServerKeysDeleteAll

    lpDo vis_bxoGitServerReposDeleteAll

    lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i acctDelete
    
    lpReturn
}


function vis_bxoTreeDescendantsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep

    local bxeTreeBase="${bpoHome}/bxeTree"
    
    if [ ! -d "${bxeTreeBase}" ] ; then
        EH_problem "Missing ${bxeTreeBase}"
        lpReturn
    fi

    local bxeDescBase="${bxeTreeBase}/bxeDesc"
    
    if [ ! -d "${bxeDescBase}" ] ; then
        EH_problem "Missing ${bxeDescBase}"
        lpReturn
    fi

    local descendantsList=$( inBaseDirDo ${bxeDescBase} ls 2> /dev/null | grep -v node)

    echo ${descendantsList}
    
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
