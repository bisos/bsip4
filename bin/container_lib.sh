#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeProvision_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeProvision_lib :: Loading Library -- /bisos/bsip/bin/bxeProvision_lib.sh"
else
    TM_trace 7 "bxeProvision_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeProvision_lib.sh" ; return
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

# PRE parameters

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bisosContainerBase {
    if [ ! -d /bisos/var/containers ] ; then
        mkdir /bisos/var/containers
    fi
    echo /bisos/var/containers
}

function vis_bisosContainerAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local containerBxoId=$1
    
    local bisosContainerBase=$( vis_bisosContainerBase )
    local containerBxoIdHome=$( FN_absolutePathGet ~${containerBxoId} )

    lpDo FN_fileSymlinkUpdate ${containerBxoIdHome} ${bisosContainerBase}/${containerBxoId}
}

function vis_bisosContainerSelect {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    local containerBxoId=$1

    local bisosContainerBase=$( vis_bisosContainerBase )  # /bisos/var/containers
    local containerBxoIdHome=$( FN_absolutePathGet ~${containerBxoId} )

    lpDo FN_fileSymlinkUpdate ${containerBxoIdHome} ${bisosContainerBase}/selected

    lpDo bpoIdManage.sh -h -v -n showRun -i bpoIdFpsWrite sysChar "${containerBxoId}"
}


function vis_selectedContainerBxoId {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** With stdout return: bpoId of selected container.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosContainerBase=$( vis_bisosContainerBase )
    
    local selectedContainerPath="${bisosContainerBase}/selected"

    if [ ! -e "${selectedContainerPath}" ] ; then
        EH_problem "Missing selectedContainerPath=${selectedContainerPath}"
        lpReturn 101
    fi
    
    local selectedContainerBxoId="$( FN_nonDirsPart $( readlink -f ${selectedContainerPath} ) )"

    if ! vis_bxoAcctVerify "${selectedContainerBxoId}" ; then
        EH_problem "Missing selectedContainerBxoId"
        lpReturn 101
    fi

    echo "${selectedContainerBxoId}"

    lpReturn
}       

function vis_selectedContainerBxoPath {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** With stdout return: bpoId of selected container.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosContainerBase=$( vis_bisosContainerBase )
    
    local selectedContainerPath="${bisosContainerBase}/selected"

    if [ ! -e "${selectedContainerPath}" ] ; then
        EH_problem "Missing selectedContainerPath=${selectedContainerPath}"
        lpReturn 101
    fi

    selectedContainerPath=$( readlink -f ${selectedContainerPath} )
    
    echo "${selectedContainerPath}"

    lpReturn
}       



function vis_activate_sysBxo {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Create the specified bpoId. 
*** For backwards compatibility. Will be OBSOLETED in due course. 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_activate_sysContainerBxo
}


function vis_activate_sysContainerBxo {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Create the specified bpoId. 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${bpoId}" ]

    if vis_bxoAcctVerify "${bpoId}" ; then
        ANT_cooked "WARNING: Did not expect ${bpoId} to exist -- Activation skipped"
    else
        lpDo bpoManage.sh -p bpoId="${bpoId}" -i fullConstruct
    fi

    EH_assert vis_bxoAcctVerify "${bpoId}"
    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    local containerId=$( vis_containerBxoId_getContainerId "${bpoId}" )

    # make sure the repo for the container is in place at site
    lpDo siteContainerRepo.sh -v -n showRun -i containerRepoNamedClone ${containerId}
    
    # Create all bases and make symlinks
    lpDo sysCharRealize.sh -h -v -n showRun -p bpoId="${bpoId}" -i basesFullCreate

    local sysCharConveyInfoBase="${bpoHome}/var/sysCharConveyInfo"

    lpDo FN_dirCreatePathIfNotThere ${sysCharConveyInfoBase}
}


function vis_containerReposList {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   local siteBxoId=$( vis_selectedSiteBxoId )
   EH_assert [ ! -z ${siteBxoId} ]
   
   local containersBxoId=$( vis_fromSiteBxoIdGet_containersBxoId "${siteBxoId}")
   EH_assert [ ! -z ${containersBxoId} ]

   local reposList=$( bxoGitlab.py --bpoId="${containersBxoId}"  -i reposList )

   local nonContainersRepos="assign panel sys bxeTree rbxe"

   for each in ${reposList} ; do
       if LIST_isIn "${each}" "${nonContainersRepos}" ; then
           doNothing
           # ANT_raw  "${each} is a nonContainersRepos -- skipped"
       else
           echo ${each}
       fi
   done
}       

function vis_activate_containersAll {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   local containerReposList=$( vis_containerReposList )

   for each in ${containerReposList} ; do
       bpoId="${each}"
       lpDo vis_activate_sysContainerBxo
   done
}       

function vis_activate_virtGenerics {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   local containerReposList="pmp_VAG-deb11_ pmp_VSG-deb11_ pmp_VAG-deb12_ pmp_VSG-deb12_"
       
   for each in ${containerReposList} ; do
       bpoId="${each}"
       lpDo vis_activate_sysContainerBxo
   done
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
