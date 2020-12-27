#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxioCommon_lib:-}" ] ; then
    bxoLib="LOADED"
    TM_trace 7 "bxioCommon_lib :: Loading Library -- /bisos/bsip/bin/bxioCommon_lib.sh"
else
    TM_trace 7 "bxioCommon_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxioCommon_lib.sh"
    return
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

function vis_bxioCommonExamples {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]
    cat  << _EOF_
$( examplesSeperatorChapter "Assemble And Push Initial Bxo Repo Bases" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitialBxoCommonRepoBases
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i pushInitialBxoCommonRepoBases
$( examplesSeperatorChapter "Assemble And Push Initial bxeTree Base" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -f -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -i repoCreateAndPushBasedOnPath "${oneBxoHome}/bxeTree"
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "bxeTree" "${oneBxoHome}/bxeTree" "priv"
$( examplesSeperatorChapter "Assemble And Push Initial mapFiles Base" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitial_mapFiles
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "mapFiles" "${oneBxoHome}/mapFiles" "priv"
_EOF_
}


function vis_pushInitialBxoCommonRepoBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"    

    lpDo vis_repoCreateAndPush "bxeTree" "${bxoHome}/bxeTree" "priv"

    lpDo vis_repoCreateAndPush "mapFiles" "${bxoHome}/mapFiles" "priv"    
    
    lpReturn
}

function vis_assembleInitialBxoCommonRepoBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In addition to bxo, the bxeDesc param is needed for the rbxeSetup.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"
    
    lpDo vis_assembleInitial_bxeTree leaf

    lpDo vis_assembleInitial_mapFiles    
    
    lpReturn
}


function vis_assembleInitial_bxeTree {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Node could be leaf or branch.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"
    
    local node=$1

    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    function doThis {
	lpDo mkdir ${bxoHome}/bxeTree
	if [ "${node}" == "leaf" ] ; then
	    lpDo fileParamManage.py -i fileParamWrite ${bxoHome}/bxeTree node leaf
	elif [ "${node}" == "branch" ] ; then
	    lpDo fileParamManage.py -i fileParamWrite ${bxoHome}/bxeTree node branch
	    lpDo mkdir ${bxoHome}/bxeTree/regReq
	    lpDo mkdir ${bxoHome}/bxeTree/bxeDesc
	else
	    EH_problem ""
	fi
    }

    if [ -d "${bxoHome}/bxeTree" ] ; then
	if [ "${G_forceMode}" == "force" ] ; then
	    lpDo doThis
	else
	    ANT_raw "${bxoHome}/bxeTree exists and forceMode is not specified."
	fi
    else
	lpDo doThis
    fi
    
    lpReturn
}


function vis_assembleInitial_mapFiles {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"
    
    local bxoRepoBase="mapFiles"

    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    function doThis {
	lpDo FN_dirCreatePathIfNotThere ${bxoHome}/${bxoRepoBase}

	lpDo FN_FileCreateIfNotThere ${bxoHome}/${bxoRepoBase}/fullMap.sh
    }

    if [ -d "${bxoHome}/${bxoRepoBase}" ] ; then
	if [ "${G_forceMode}" == "force" ] ; then
	    lpDo doThis
	else
	    ANT_raw "${bxoHome}/${bxoRepoBase} exists and forceMode is not specified."
	fi
    else
	lpDo doThis
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
