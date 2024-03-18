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

function G_myNicheNameGet {
    # if it already has a -niche we take it out
    local myName=$( echo ${G_myName} | sed -e 's/-niche//' )
    echo ${myName%%.sh}-niche.sh
}

function G_myUnNicheNameGet {
    local myName=$( echo ${G_myName} | sed -e 's/-niche//' )
    echo ${myName}
    # echo ${G_myName%%-niche.sh}.sh
}

G_myUnNicheName=$( G_myUnNicheNameGet )


function G_icmBaseDirGet {
    echo $( dirname ${G_myFullName} )
}

function vis_nicheRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local nicheIcm="$1"
    local nicheCommand="$2"

    if [ -e $(G_icmBaseDirGet)/${nicheIcm} ] ; then
        lpDo $(G_icmBaseDirGet)/${nicheIcm} ${G_commandPrefs} -i "${nicheCommand}"
    else
        EH_problem "Missing $(G_icmBaseDirGet)/${nicheIcm} -- Execution Skipped"
        lpReturn 101
    fi
    
    lpReturn
}

function vis_unNicheRunExamples {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    cat  << _EOF_
$( examplesSeperatorChapter "Run UnNiche ICM" )
${G_myUnNicheName}
_EOF_
}


function vis_examplesNicheRun {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local nicheScope="$1"

    local nicheExamplesFile=""
    
    case ${nicheScope} in
        container)
            cat  << _EOF_
$( examplesSeperatorChapter "Container Niche Examples" )
$( sysCharBoxDeploy.sh -i selectedContainerBxoPath )/sys/bin/$(G_myNicheNameGet)
_EOF_

            nicheExamplesFile="$(dirname $(dirname ${G_myFullName}))/examples/$(G_myNicheNameGet)"
            if [ -e "${nicheExamplesFile}" ] ; then
                cat  << _EOF_
${nicheExamplesFile}
_EOF_
            fi
            ;;
        site)
            cat  << _EOF_
$( examplesSeperatorChapter "Selected Site Niche Examples" )
$(sysCharBoxDeploy.sh -i selectedSiteBxoPath)/sys/bin/$(G_myNicheNameGet)
_EOF_

            nicheExamplesFile="$(dirname $(dirname ${G_myFullName}))/examples/$(G_myNicheNameGet)"
            if [ -e "${nicheExamplesFile}" ] ; then
                cat  << _EOF_
${nicheExamplesFile}
_EOF_
            fi
            ;;
        controller)
            cat  << _EOF_
$( examplesSeperatorChapter "Selected Controller Niche Examples" )
$(vis_usgBpos_controller_bxoPath)/sys/bin/$(G_myNicheNameGet) # Niche ICM
_EOF_

            nicheExamplesFile="$(dirname $(dirname ${G_myFullName}))/examples/$(G_myNicheNameGet)"
            if [ -e "${nicheExamplesFile}" ] ; then
                cat  << _EOF_
${nicheExamplesFile}
_EOF_
            fi
            ;;
        usageEnvs)
            cat  << _EOF_
$( examplesSeperatorChapter "Selected Usage Niche Examples" )
$(vis_usgBposUsageEnvs_bisosDev_bxoPath)/sys/bin/$(G_myNicheNameGet) # Niche ICM
_EOF_

            nicheExamplesFile="$(dirname $(dirname ${G_myFullName}))/examples/$(G_myNicheNameGet)"
            if [ -e "${nicheExamplesFile}" ] ; then
                cat  << _EOF_
${nicheExamplesFile}
_EOF_
            fi
            ;;
        *)
            EH_problem "Unimplemented yet -- nicheScope=${nicheScope}"
            ;;
    esac
    
    
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
