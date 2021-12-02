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
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i assembleInitialBxoCommonRepoBases
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i pushInitialBxoCommonRepoBases
$( examplesSeperatorChapter "Assemble And Push Initial bxeTree Base" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -f -i assembleInitial_bxeTree leaf
${G_myName} ${extraInfo} -i repoCreateAndPushBasedOnPath "${oneBxoHome}/bxeTree"
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoCreateAndPush "bxeTree" "${oneBxoHome}/bxeTree" "priv"
$( examplesSeperatorChapter "Specific Initial Repo Realizition" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBasesList
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesCreate   # Based on repoBasesList
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i kindTypeRealizeRepoBasesPush     # Based on repoBasesList
$( examplesSeperatorChapter "Assemble And Push Initial Sys Base -- Mandatory" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i assembleInitial_sys
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoCreateAndPush "sys" "${oneBxoHome}/sys" "priv"
$( examplesSeperatorSection "BxO Panels Root -- Mandatory" )
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBaseCreate_panel
${G_myName} ${extraInfo} -p bxoPath="." -i repoBaseCreate_panel
${G_myName} ${extraInfo} -p bpoId="${oneBxoId}" -i repoBasePush panel
${G_myName} ${extraInfo} -p bxoPath="." -i repoBasePush panel
_EOF_
}

function vis_kindTypeRealizeRepoBases {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local bxoRealizationScope=$1   
    EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
    
    EH_assert [ ! -z "${bpoId}" ]
    EH_assert vis_bxoAcctVerify "${bpoId}"

    case ${bxoRealizationScope} in
        full)
            lpDo vis_kindTypeRealizeRepoBasesCreate
            lpDo vis_kindTypeRealizeRepoBasesPush           
            ;;
        basePrep)
            lpDo vis_kindTypeRealizeRepoBasesCreate
            ;;
        realize)
            lpDo vis_kindTypeRealizeRepoBasesPush
            ;;
        *)
            EH_problem "Bad Usage"
            ;;
    esac

    lpReturn
}


function vis_repoBasePush {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** To be obsoleted by vis_bxoRealize_repoBasesPush
** Based on -p bpoId and \$1=repoName, creates a repo in bpoId.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=$1

    local repoBase="${bpoHome}/${repoName}"

    lpDo vis_repoCreateAndPushBasedOnPath "${repoBase}"
    
    lpReturn
}       

function vis_bxoRealize_repoBasesPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** For BxO, create and push each specified repo.
*** Design Pattern: processEach based on args or stdin.
*** Examples:
      ${G_myName} -i ${G_thisFunc} arg1 arg2
      printf "stdinArg1\nstdin2\n" | ${G_myName} -i ${G_thisFunc} arg1 arg2
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert bpoIdPrep

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local repoName=$1

        # For example, par_live will become par.live
        repoName=$(lpDo eval  echo ${repoName} \|  sed -e 's/_/./g')

        local repoBase="${bpoHome}/${repoName}"

        lpDo vis_repoCreateAndPushBasedOnPath "${repoBase}"
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
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



function vis_bxoRealize_repoBasesCreate {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bpoIdPrep

    # \$1 becomes \$2 in processEach
    
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -gt 1 ]]
        local eachRepoName=$1
        local moduleName=$2
        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "For each=${eachRepoName} running vis_${moduleName}_repoBaseCreate_${eachRepoName}"
        fi
        lpDo vis_${moduleName}_repoBaseCreate_${eachRepoName}
    }

####+BEGIN: bx:bsip:bash/processStdinWithArgs :noParams t 
    function processStdinWithArgs {
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
        fi
        if [ ${#stdinArgs[@]} -eq 0 ] ; then
            ANT_raw "No StdinArgs -- Processing Skipped"
            lpReturn
        fi
        for each in "${stdinArgs[@]}"; do
            lpDo processEach "${each%$'\n'}" "$@"
        done
    }
    lpDo processStdinWithArgs "$@"
####+END:
    lpReturn
}

function vis_bxoRealize_nonRepoBasesCreate {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bpoIdPrep
    
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -gt 1 ]]
        local eachRepoName=$1
        local moduleName=$2
        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "For each=${eachRepoName} running vis_${moduleName}_nonRepoBaseCreate_${eachRepoName}"
        fi
        lpDo vis_${moduleName}_nonRepoBaseCreate_${eachRepoName}
    }

####+BEGIN: bx:bsip:bash/processStdinWithArgs :noParams t 
    function processStdinWithArgs {
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
        fi
        if [ ${#stdinArgs[@]} -eq 0 ] ; then
            ANT_raw "No StdinArgs -- Processing Skipped"
            lpReturn
        fi
        for each in "${stdinArgs[@]}"; do
            lpDo processEach "${each%$'\n'}" "$@"
        done
    }
    lpDo processStdinWithArgs "$@"
####+END:
    lpReturn
}


function vis_kindTypeRealizeRepoBasesCreate {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"

    for each in $(vis_repoBasesList) ; do
        inBaseDirDo ${bpoHome} vis_repoCreateAndPushBasedOnPath ${each}
    done

    lpReturn
}       

function vis_repoBasePush {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on -p bpoId and \$1=repoName, creates a repo in bpoId.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoName=$1

    local repoBase="${bpoHome}/${repoName}"

    lpDo vis_repoCreateAndPushBasedOnPath "${repoBase}"
    
    lpReturn
}       


function vis_repoBaseCreate_panel {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    local repoBase="${bpoHome}/panel"

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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"    

    lpDo vis_repoCreateAndPush "bxeTree" "${bpoHome}/bxeTree" "priv"

    lpDo vis_repoCreateAndPush "sys" "${bpoHome}/sys" "priv"        
    #lpDo vis_repoCreateAndPush "mapFiles" "${bpoHome}/mapFiles" "priv"    
    
    lpReturn
}

function vis_assembleInitialBxoCommonRepoBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In addition to bxo, the bxeDesc param is needed for the rbxeSetup.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"
    
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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"
    
    local node=$1

    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    function doThis {
        lpDo mkdir ${bpoHome}/bxeTree
        if [ "${node}" == "leaf" ] ; then
            lpDo fileParamManage.py -i fileParamWrite ${bpoHome}/bxeTree node leaf
        elif [ "${node}" == "branch" ] ; then
            lpDo fileParamManage.py -i fileParamWrite ${bpoHome}/bxeTree node branch
            lpDo mkdir ${bpoHome}/bxeTree/regReq
            lpDo mkdir ${bpoHome}/bxeTree/bxeDesc
        else
            EH_problem ""
        fi
    }

    if [ -d "${bpoHome}/bxeTree" ] ; then
        if [ "${G_forceMode}" == "force" ] ; then
            lpDo doThis
        else
            ANT_raw "${bpoHome}/bxeTree exists and forceMode is not specified."
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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"
    
    local bxoRepoBase="mapFiles"

    bpoHome=$( FN_absolutePathGet ~${bpoId} )

    function doThis {
        lpDo FN_dirCreatePathIfNotThere ${bpoHome}/${bxoRepoBase}

        lpDo FN_FileCreateIfNotThere ${bpoHome}/${bxoRepoBase}/fullMap.sh
    }

    if [ -d "${bpoHome}/${bxoRepoBase}" ] ; then
        if [ "${G_forceMode}" == "force" ] ; then
            lpDo doThis
        else
            ANT_raw "${bpoHome}/${bxoRepoBase} exists and forceMode is not specified."
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
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_userAcctExists "${bpoId}"
    
    local bxoRepoBase="sys"

    bpoHome=$( FN_absolutePathGet ~${bpoId} )

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
        lpDo FN_dirCreatePathIfNotThere ${bpoHome}/${bxoRepoBase}

        lpDo FN_dirCreatePathIfNotThere ${bpoHome}/${bxoRepoBase}/bin   

        lpDo file_bxoPathsExtend.sh ${bpoHome}/${bxoRepoBase}/bin/bxoPathsExtend.sh
        lpDo file_placeHolder ${bpoHome}/${bxoRepoBase}/bin/bxoSetup.sh
        lpDo file_placeHolder ${bpoHome}/${bxoRepoBase}/bin/mapFull.sh          
    }

    if [ -d "${bpoHome}/${bxoRepoBase}" ] ; then
        if [ "${G_forceMode}" == "force" ] ; then
            lpDo doThis
        else
            ANT_raw "${bpoHome}/${bxoRepoBase} exists and forceMode is not specified."
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
