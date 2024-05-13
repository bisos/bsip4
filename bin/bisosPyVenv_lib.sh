#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bisosPyVenv_lib:-}" ] ; then
    bisosPyVenv_lib="LOADED" ; TM_trace 7 "bisosPyVenv_lib :: Loading Library -- /bisos/git/auth/bxRepos/bisos/bsip4/bin/bisosPyVenv_lib.sh"
else
    TM_trace 7 "bisosPyVenv_lib :: Prviously Loaded -- Skipping /bisos/git/auth/bxRepos/bisos/bsip4/bin/bisosPyVenv_lib.sh" ; return
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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


function vis_venvPy3Dev_stash {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Move
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local py3BisosDevStashBase="${pdb_venv_py3Bisos3Dev}-stash"

    if [ -d "${py3BisosDevStashBase}" ] ; then
        if [ -d  "${pdb_venv_py3Bisos3Dev}" ] ; then
            EH_problem "Both ${py3BisosDevStashBase} and ${pdb_venv_py3Bisos3Dev}"
            lpReturn 101
        else
            ANT_raw "Already Stashed -- ${py3BisosDevStashBase} -- skipped"
            lpReturn
        fi
    else
        if [ -d  "${pdb_venv_py3Bisos3Dev}" ] ; then
            lpDo mv "${pdb_venv_py3Bisos3Dev}" "${py3BisosDevStashBase}"
        else
            EH_problem "Missing ${pdb_venv_py3Bisos3Dev} -- You need to create it first."
            lpReturn
        fi
    fi

    lpReturn
}

function vis_venvPy3Dev_unStash {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3/dev. Not py3. Installs packages as editable. Uses ftoWalkRunCmnd pypiProc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local py3BisosDevStashBase="${pdb_venv_py3Bisos3Dev}-stash"

    if [ -d "${pdb_venv_py3Bisos3Dev}" ] ; then
        if [ -d  "${py3BisosDevStashBase}" ] ; then
            EH_problem "Both ${py3BisosDevStashBase} and ${pdb_venv_py3Bisos3Dev}"
            lpReturn 101
        else
            ANT_raw "Already Unstashed -- "${pdb_venv_py3Bisos3Dev}" -- skipped"
            lpReturn
        fi
    else
        if [ -d  "${py3BisosDevStashBase}" ] ; then
            lpDo mv  "${py3BisosDevStashBase}" "${pdb_venv_py3Bisos3Dev}"
        else
            EH_problem "Missing ${py3BisosDevStashBase} -- You need to stash it first."
            lpReturn
        fi
    fi

    lpReturn
}

function vis_venvPy3Dev_stashStatus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3/dev. Not py3. Installs packages as editable. Uses ftoWalkRunCmnd pypiProc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local py3BisosDevStashBase="${pdb_venv_py3Bisos3Dev}-stash"

    if [ -d "${pdb_venv_py3Bisos3Dev}" ] && [ -d  "${py3BisosDevStashBase}" ] ; then
        echo  "Both ${pdb_venv_py3Bisos3Dev} ${py3BisosDevStashBase} exist. Problem"
    elif [ -d "${pdb_venv_py3Bisos3Dev}" ] ; then
        echo "Unstashed: ${pdb_venv_py3Bisos3Dev}"
    elif [ -d "${py3BisosDevStashBase}" ] ; then
        echo "Stashed: ${py3BisosDevStashBase}"
    else
        echo "Neither ${pdb_venv_py3Bisos3Dev} ${py3BisosDevStashBase} exists."
    fi

    lpReturn
}


function vis_venvPy3Dev_exists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3/dev. Not py3. Installs packages as editable. Uses ftoWalkRunCmnd pypiProc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -d "${pdb_venv_py3Bisos3Dev}" ] ; then
        echo "venvPy3Dev Exists: ${pdb_venv_py3Bisos3Dev}"
        lpReturn 0
    else
        echo "venvPy3Dev Does Not Exist: Missing ${pdb_venv_py3Bisos3Dev}."
        lpReturn 1
    fi

    lpReturn
}


function vis_venvPy3Dev_stashExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3/dev. Not py3. Installs packages as editable. Uses ftoWalkRunCmnd pypiProc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local py3BisosDevStashBase="${pdb_venv_py3Bisos3Dev}-stash"

    if [ -d "${py3BisosDevStashBase}" ] ; then
        echo "venvPy3Dev_stash Exists: ${py3BisosDevStashBase}"
        lpReturn 0
    else
        echo "venvPy3Dev_stach Does Not Exist: Missing ${py3BisosDevStashBase}."
        lpReturn 1
    fi

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

