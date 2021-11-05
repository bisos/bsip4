#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${tabsExpand_lib:-}" ] ; then
    tabsExpand_lib="LOADED" ; TM_trace 7 "tabsExpand_lib :: Loading Library -- /bisos/git/auth/bxRepos/bisos/bsip4/bin/tabsExpand_lib.sh"
else
    TM_trace 7 "tabsExpand_lib :: Prviously Loaded -- Skipping /bisos/git/auth/bxRepos/bisos/bsip4/bin/tabsExpand_lib.sh" ; return
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

# PRE parameters

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function FILE_hasTabsEach_p {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Returns 0 if \$1 has tabs, none-0 otherwise.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    local each="$1"
    local retVal=0
    lpDo grep -q -P "\t" "${each}"
    retVal=$?
    lpReturn ${retVal}
}

function FILE_expandTabsEach {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Returns 0 if \$1 has tabs, none-0 otherwise.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    local each="$1"
    local tmpFile=$( FN_tempFile )

    if FILE_hasTabsEach_p "${each}" ; then
        ANT_cooked "${each}: ==FOUND==  File has tabs. Being Processed."
        lpDo FN_fileSafeCopy ${each} ${each}.tabs
        lpDo eval getfacl --absolute-names ${each} \> ${tmpFile}
        lpDo eval expand ${each}.tabs \> ${each}
        lpDo setfacl --restore=${tmpFile}
        lpDo rm ${tmpFile}
    else
        ANT_cooked "${each}: File has no tabs. Skipped."
    fi
    lpReturn
}

function vis_fileHasTabs {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Returns 0 if \$1 has tabs, none-0 otherwise.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    local each="$1"
    local retVal=0
    FILE_hasTabsEach_p "${each}"
    retVal=$?
    lpReturn ${retVal}
}

function vis_filesHaveTabsReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** argsOrStdin input pattern. Expand tabs and keep backup.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local each="$1"
        if FILE_hasTabsEach_p "${each}" ; then
            echo "${each}: ==FOUND== File has tabs."
        else
            echo "${each}: File has no tabs."
        fi
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
    if [ $# -gt 0 ] ; then
        local each=""
        for each in ${inputsList} ; do
            lpDo processEach ${each}
        done
    else
        local eachLine=""
        while read -r -t 1 eachLine ; do
            if [ ! -z "${eachLine}" ] ; then
                local each=""
                for each in ${eachLine} ; do
                    lpDo processEach ${each}
                done
            fi
        done
    fi

####+END:

    lpReturn
}



function vis_expandTabs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** argsOrStdin input pattern. Expand tabs and keep backup.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        lpDo FILE_expandTabsEach $1
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
    if [ $# -gt 0 ] ; then
        local each=""
        for each in ${inputsList} ; do
            lpDo processEach ${each}
        done
    else
        local eachLine=""
        while read -r -t 1 eachLine ; do
            if [ ! -z "${eachLine}" ] ; then
                local each=""
                for each in ${eachLine} ; do
                    lpDo processEach ${each}
                done
            fi
        done
    fi

####+END:

    lpReturn
}

