#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeProvision_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeProvision_lib :: Loading Library -- /bisos/bsip/bin/bxeProvision_lib.sh"
else
    TM_trace 7 "bxeProvision_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeProvision_lib.sh" ; return
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


function vis_examplesHeader {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_
}


function vis_examplesApplyProvisioners {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local secTitle=$1
    local provisioningScope=$2
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    function sectionHeaderEssentials {
	    cat  << _EOF_
$( examplesSeperatorSection "${secTitle} -- With Essential Params" )
_EOF_
    }

    function sectionHeaderFull {
	    cat  << _EOF_
$( examplesSeperatorSection "${secTitle} -- With Full Params" )
_EOF_
    }

    function examplesCreateMini {
	EH_assert [[ $# -lt 2 ]]

	if [ $# -eq 1 ] ; then
	    sectionHeaderEssentials
	fi

	cat  << _EOF_
${G_myName} ${extraInfo} ${bystarParamsMini} -i BarcStdout
${G_myName} ${extraInfo} ${bystarParamsMini} -i BarcFileCreate
_EOF_
    }

    function examplesCreateFull {
	EH_assert [[ $# -lt 2 ]]

	if [ $# -eq 1 ] ; then
	    sectionHeaderFull
	fi

	cat  << _EOF_
${G_myName} ${extraInfo} ${bystarParamsFull} -i BarcStdout
${G_myName} ${extraInfo} ${bystarParamsFull} -i BarcFileCreate
_EOF_
    }


    function examplesBxRegMini {
	EH_assert [[ $# -lt 2 ]]

	if [ $# -eq 1 ] ; then
	    sectionHeaderEssentials	    
	fi

	cat  << _EOF_
${G_myName} ${extraInfo} ${bystarParamsMini} -i bxReg
_EOF_
    }

    function examplesBxRegFull {
	EH_assert [[ $# -lt 2 ]]

	if [ $# -eq 1 ] ; then
	    sectionHeaderFull	    
	fi

	cat  << _EOF_
${G_myName} ${extraInfo} ${bystarParamsFull} -i bxReg
_EOF_
    }
    
    
    case "${provisioningScope}" in
	create)
	    examplesCreateMini "$1"
	    examplesCreateFull "$1"	    
	    ;;
	bxReg)
	    examplesBxRegMini "$1"
	    examplesBxRegFull "$1"	    
	    ;;
	selfReg)
	    examplesCreateMini "$1"
	    examplesCreateFull "$1"	    
	    ;;
	bxRealize)
	    examplesCreateMini "$1"
	    examplesCreateFull "$1"	    
	    ;;
	selfRealize)
	    examplesCreateMini "$1"
	    examplesCreateFull "$1"	    
	    ;;
	all)
	    sectionHeaderEssentials

	    examplesCreateMini
	    examplesBxRegMini

	    sectionHeaderFull
	    
	    examplesCreateFull
	    examplesBxRegFull
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac
}



function vis_examplesBxAE {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    local bxeType="all"
    local provisioningScope="all"

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
    else
	EH_Problem "Expected 0,1,2 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Autonomous Information Entity" )
_EOF_
	
    case "${bxeType}" in
	indiv)
	    vis_examplesBxAutonomousIndiv
	    vis_examplesApplyProvisioners "ByStar Autonomous Individual Entity" ${provisioningScope} 
	    ;;
	corp)
	    vis_examplesBxAutonomousCorp
	    vis_examplesApplyProvisioners "ByStar Autonomous Corporate Entity" ${provisioningScope}
	    ;;
	sys)
	    vis_examplesBxAutonomousSys
	    vis_examplesApplyProvisioners "ByStar Autonomous System Entity" ${provisioningScope}
	    ;;
	all)
	    vis_examplesBxAutonomousIndiv
	    vis_examplesApplyProvisioners "ByStar Autonomous Individual Entity" ${provisioningScope} 
	    vis_examplesBxAutonomousCorp
	    vis_examplesApplyProvisioners "ByStar Autonomous Corporate Entity" ${provisioningScope}
	    vis_examplesBxAutonomousSys
	    vis_examplesApplyProvisioners "ByStar Autonomous System Entity" ${provisioningScope}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
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
