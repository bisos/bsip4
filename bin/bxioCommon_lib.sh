#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxioCommon_lib:-}" ] ; then
    bxioCommon_lib="LOADED" ; TM_trace 7 "bxioCommon_lib :: Loading Library -- /bisos/bsip/bin/bxioCommon_lib.sh"
else
    TM_trace 7 "bxioCommon_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxioCommon_lib.sh" ; return
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
$( examplesSeperatorChapter "BxIO Common Actions" )
$( examplesSeperatorChapter "Assemble And Push Initial Bxo Repo Bases" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitialBxoCommonRepoBases
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i pushInitialBxoCommonRepoBases
$( examplesSeperatorChapter "Assemble And Push Initial bxeTree Base" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -f -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -i repoCreateAndPushBasedOnPath "${oneBxoHome}/bxeTree"
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "bxeTree" "${oneBxoHome}/bxeTree" "priv"
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBasesList
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i kindTypeRealizeRepoBasesCreate   # Based on repoBasesList
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i kindTypeRealizeRepoBasesPush     # Based on repoBasesList
$( examplesSeperatorChapter "Assemble And Push Initial Sys Base -- Mandatory" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i assembleInitial_sys
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoCreateAndPush "sys" "${oneBxoHome}/sys" "priv"
$( examplesSeperatorSection "BxO Panels Root -- Mandatory" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBaseCreate_panel
${G_myName} ${extraInfo} -p bxoPath="." -i repoBaseCreate_panel
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i repoBasePush panel
${G_myName} ${extraInfo} -p bxoPath="." -i repoBasePush panel
_EOF_
}


function vis_kindTypeRealizeRepoBasesCreate {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local each

    for each in $(vis_repoBasesList) ; do
	lpDo vis_repoBaseCreate_${each}
    done

    lpReturn
}


function vis_kindTypeRealizeRepoBasesPush {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local each

    for each in $(vis_repoBasesList) ; do
	inBaseDirDo ${bxoHome} vis_repoCreateAndPushBasedOnPath ${each}
    done

    lpReturn
}	

function vis_repoBasePush {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on -p bxoId and \$1=repoName, creates a repo in bxoId.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bxoIdAssert

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoName=$1

    local repoBase="${bxoHome}/${repoName}"

    lpDo vis_repoCreateAndPushBasedOnPath "${repoBase}"
    
    lpReturn
}	


function vis_repoBaseCreate_panel {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdAssert

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoBase="${bxoHome}/panel"

    if [ -d "${repoBase}" ] ; then
	EH_problem "${repoBase} already exists -- creation skipped"
	lpReturn 101
    fi

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    cat  << _EOF_  > "${repoBase}/README.org"
BxO Panels Base.
_EOF_

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpDo startOrgPanel.sh -h -v -n showRun -i bleePanelBase node "${repoBase}"
    
    lpReturn
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

    lpDo vis_repoCreateAndPush "sys" "${bxoHome}/sys" "priv"        
    #lpDo vis_repoCreateAndPush "mapFiles" "${bxoHome}/mapFiles" "priv"    
    
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

    # lpDo vis_assembleInitial_mapFiles
    lpDo vis_assembleInitial_sys

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


function vis_assembleInitial_mapFiles%% {
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


function vis_assembleInitial_sys {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"
    
    local bxoRepoBase="sys"

    bxoHome=$( FN_absolutePathGet ~${bxoId} )

    function file_bxoPathsExtend.sh {
	EH_assert [[ $# -eq 1 ]]
	cat  << _EOF_  > "$1"
# To Be Sourced
#
export PATH=$PATH:$(dirname ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]})
_EOF_
	chmod 775 "$1"
    }

    function file_placeHolder {
	EH_assert [[ $# -eq 1 ]]
	cat  << _EOF_  > "$1"
# Place Holder
_EOF_
	chmod 775 "$1"
    }
    
    function doThis {
	lpDo FN_dirCreatePathIfNotThere ${bxoHome}/${bxoRepoBase}

	lpDo FN_dirCreatePathIfNotThere ${bxoHome}/${bxoRepoBase}/bin	

	lpDo file_bxoPathsExtend.sh ${bxoHome}/${bxoRepoBase}/bin/bxoPathsExtend.sh
	lpDo file_placeHolder ${bxoHome}/${bxoRepoBase}/bin/bxoSetup.sh
	lpDo file_placeHolder ${bxoHome}/${bxoRepoBase}/bin/mapFull.sh		
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
