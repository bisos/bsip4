#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${scsRealize_lib:-}" ] ; then
    scsRealize_lib="LOADED" ; TM_trace 7 "scsRealize_lib :: Loading Library -- /bisos/bsip/bin/scsRealize_lib.sh"
else
    TM_trace 7 "scsRealize_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/scsRealize_lib.sh" ; return
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
** Creates a BARC (Bystar Account Request Scs) based on command line.
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



function vis_scs_bxoRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]
}       


function vis_scs_getBxoId {
        G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRepoScope -- \$2 is path to siteScsAssignBase 
*** -p passive= instead of  EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]

   local bxoName=$1

   echo "pmz_${bxoName}"
}

function vis_scs_basicBxoRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRepoScope -- \$2 is path to siteScsAssignBase 
*** -p passive= instead of  EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local bxoName=$1

   local bxoRealizationScope="full" # NOTYET
   
   local scsBxoId=$(vis_scs_getBxoId "${bxoName}" )
   EH_assert [ ! -z "${scsBxoId}" ]

   local parentBxoId="prs_bisos"
   
   if vis_bxoAcctVerify "${scsBxoId}" ; then
       ANT_raw "${scsBxoId} account exists, already realized -- provisioning skipped"
   else
       ANT_raw "${scsBxoId} will be realized"       
       lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="scs" -p parent="${parentBxoId}" -p name="${bxoName}" -i startToPrivRealize ${bxoRealizationScope}
   fi

   bxoId="${scsBxoId}"
   EH_assert vis_bxoAcctVerify "${bxoId}"

   echo "${bxoId}"
}

function vis_scs_repoBasesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat  << _EOF_
panel
_EOF_

    lpReturn
}

function vis_scs_nonRepoBasesList {
    cat  << _EOF_
var
_EOF_
}

function vis_scs_repoBasesAllCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    lpDo eval vis_scs_repoBasesList \| vis_bxoRealize_repoBasesCreate scs
}       

function vis_scs_repoBasesAllPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    lpDo eval vis_scs_repoBasesList \| vis_bxoRealize_repoBasesPush
}       

function vis_scs_nonRepoBasesAllCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    lpDo eval vis_scs_nonRepoBasesList \| vis_bxoRealize_nonRepoBasesCreate scs
}       


function vis_scs_nonRepoBaseCreate_var {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Create /bisos/var/bxoId/${bxoId} and symlink to it.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    local baseName=${FUNCNAME##vis_scs_nonRepoBaseCreate_}
    local basePath="${bxoHome}/${baseName}"
    
    local bisosVarBaseDir="/bisos/var/bxoId/${bxoId}"

    lpDo FN_dirCreatePathIfNotThere ${bisosVarBaseDir}
    
    lpDo FN_fileSymlinkUpdate ${bisosVarBaseDir} ${basePath}

    lpReturn
}       

function vis_scs_repoBaseCreate_panel { vis_repoBaseCreate_panel; }

function vis_scs_repoBaseCreate_BAGP%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    local repoName=${FUNCNAME##vis_scs_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
for now just a bin directory
_EOF_

    # vis_sysCharWrite is in ./sysChar_lib.sh 
    #lpDo vis_sysCharWrite

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

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
