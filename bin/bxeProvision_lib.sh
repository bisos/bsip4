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
    
    #visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_
}


function vis_examplesApplyProvisioners {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    local secTitle=$1
    local provisioningScope=$2
    local paramsDetail=$3
    
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

    function examplesRegReqCreate {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i regReqStdout
${G_myName} ${extraInfo} ${bxeParamsMini} -i regReqFileName
${G_myName} ${extraInfo} ${bxeParamsMini} -i regReqFileCreate
${G_myName} -f ${extraInfo} ${bxeParamsMini} -i regReqFileCreate  # forceMode
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i regReqStdout
${G_myName} ${extraInfo} ${bxeParamsFull} -i regReqFileName
${G_myName} ${extraInfo} ${bxeParamsFull} -i regReqFileCreate
${G_myName} -f ${extraInfo} ${bxeParamsFull} -i regReqFileCreate  # forceMode
_EOF_
	fi
    }

    function examplesBxReg {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i startToBxReg
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i startToBxReg
_EOF_
	fi
    }

    function examplesPrivReg {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i startToPrivReg
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i startToPrivReg
_EOF_
	fi
    }

    function examplesBxeDescStash {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i startToBxeDescStash
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i startToBxeDescStash
_EOF_
	fi
    }

    function examplesBxRealize {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i startToBxRealize
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i startToBxRealize
_EOF_
	fi
    }

    function examplesPrivRealize {
	EH_assert [[ $# -le 2 ]]
	EH_assert [[ $# -gt 0 ]]

	local paramsDetail=$1

	if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderEssentials
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsMini} -i startToPrivRealize
_EOF_
	fi
	if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
	    if [ $# -eq 2 ] ; then
		sectionHeaderFull
	    fi

	    cat  << _EOF_
${G_myName} ${extraInfo} ${bxeParamsFull} -i startToPrivRealize
_EOF_
	fi
    }
    
    
    case "${provisioningScope}" in
	regReqCreate)
	    examplesRegReqCreate "${paramsDetail}" "${secTitle}"
	    ;;
	startToBxReg)
	    examplesBxReg "${paramsDetail}" "${secTitle}"
	    ;;
	startToPrivReg)
	    examplesPrivReg "${paramsDetail}" "${secTitle}"
	    ;;
	startToBxeDescStash)
	    examplesBxeDescStash "${paramsDetail}" "${secTitle}"
	    ;;
	startToBxRealize)
	    examplesBxRealize "${paramsDetail}" "${secTitle}"
	    ;;
	startToPrivRealize)
	    examplesPrivRealize "${paramsDetail}" "${secTitle}"
	    ;;
	all)
	    if [ "${paramsDetail}" == "essentials" ] || [ "${paramsDetail}" == "all" ] ; then
		sectionHeaderEssentials

		examplesRegReqCreate "essentials"
		if [ "${bxeKind}" == "real" ] ; then
		    examplesBxReg "essentials"
		fi
		examplesPrivReg "essentials"
		examplesBxeDescStash "essentials"
		if [ "${bxeKind}" == "real" ] ; then		
		    examplesBxRealize "essentials"
		fi
		examplesPrivRealize "essentials"
	    fi
	    if [ "${paramsDetail}" == "full" ] || [ "${paramsDetail}" == "all" ] ; then
		
		sectionHeaderFull
	    
		examplesRegReqCreate "full"
		if [ "${bxeKind}" == "real" ] ; then
		    examplesBxReg "full"
		fi
		examplesPrivReg "full"
		examplesBxeDescStash "full"
		if [ "${bxeKind}" == "real" ] ; then		
		    examplesBxRealize "full"
		fi
		examplesPrivRealize "full"
	    fi
	    ;;
	*)
	    EH_problem "Bad provisioningScope -- ${provisioningScope}"
	    lpReturn 101
	    ;;
    esac
}


function vis_examplesBxRealEntity {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    bxeKind="real"    

    local bxeType="all"
    local provisioningScope="all"
    local paramsDetail="all"

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
	paramsDetail="all"	
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
	paramsDetail="all"		
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="all"			
    elif [ $# -eq 3 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="$3"			
    else
	EH_Problem "Expected 0,1,2or3 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Real Information Entity" )
_EOF_
	
    case "${bxeType}" in
	individual)
	    vis_examplesBxRealIndiv
	    vis_examplesApplyProvisioners "ByStar Real Individual Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	corp)
	    vis_examplesBxRealCorp
	    vis_examplesApplyProvisioners "ByStar Real Corporate Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	system)
	    vis_examplesBxRealSys
	    vis_examplesApplyProvisioners "ByStar Real System Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxRealSysTest
	    vis_examplesApplyProvisioners "ByStar Real System Test Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	all)
	    vis_examplesBxRealIndiv
	    vis_examplesApplyProvisioners "ByStar Real Individual Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxRealCorp
	    vis_examplesApplyProvisioners "ByStar Real Corporate Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxRealSys
	    vis_examplesApplyProvisioners "ByStar Real System Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxRealSysTest
	    vis_examplesApplyProvisioners "ByStar Real System Test Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac

}

function vis_examplesBxInfoEntity {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    bxeKind="info"

    local bxeType="all"
    local provisioningScope="all"
    local paramsDetail="all"

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
	paramsDetail="all"	
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
	paramsDetail="all"		
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="all"			
    elif [ $# -eq 3 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="$3"			
    else
	EH_Problem "Expected 0,1,2or3 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Information Entity" )
_EOF_
	
    case "${bxeType}" in
	registrar)	
	    vis_examplesBxInfoRegistrar
	    vis_examplesApplyProvisioners "ByStar Registrar Information Entity" ${provisioningScope} ${paramsDetail} 
	    ;;
	site)
	    vis_examplesBxInfoSite
	    vis_examplesApplyProvisioners "ByStar Site Information Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	aais)
	    vis_examplesBxInfoAais
	    vis_examplesApplyProvisioners "Asserted Autonomy Internet Service" ${provisioningScope} ${paramsDetail}
	    ;;
	scs)
	    vis_examplesBxInfoScs
	    vis_examplesApplyProvisioners "Self Contained Internet Service" ${provisioningScope} ${paramsDetail}
	    ;;
	sysChar)
	    vis_examplesBxInfoSysChar
	    vis_examplesApplyProvisioners "ByStar System Characteristics Information Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	usgAcct)
	    vis_examplesBxInfoUsage
	    vis_examplesApplyProvisioners "ByStar Usage Acct Information Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	usage)
	    vis_examplesBxInfoUsage
	    vis_examplesApplyProvisioners "ByStar Usage Environment Information Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	project)
	    vis_examplesBxInfoProject
	    vis_examplesApplyProvisioners "ByStar Project Information Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	virtGuest)
	    vis_examplesBxInfoVirtGuest
	    vis_examplesApplyProvisioners "ByStar Virtual Guest Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	all)	
	    vis_examplesBxInfoRegistrar
	    vis_examplesApplyProvisioners "ByStar Registrar Information Entity" ${provisioningScope} ${paramsDetail} 
	    vis_examplesBxInfoSite
	    vis_examplesApplyProvisioners "ByStar Site Information Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoAais
	    vis_examplesApplyProvisioners "Asserted Autonomy Internet Service" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoScs
	    vis_examplesApplyProvisioners "Self Contained Internet Service" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoSysChar
	    vis_examplesApplyProvisioners "ByStar System Characteristics Information Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoUsgAcct
	    vis_examplesApplyProvisioners "ByStar Usage Account Information Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoUsage
	    vis_examplesApplyProvisioners "ByStar Usage Environment Information Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoProject
	    vis_examplesApplyProvisioners "ByStar Project Information Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxInfoVirtGuest
	    vis_examplesApplyProvisioners "ByStar Virtual Guest Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac

}


function vis_examplesBxServiceEntity {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    bxeKind="svc"    

    local bxeType="all"
    local provisioningScope="all"
    local paramsDetail="all"

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
	paramsDetail="all"	
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
	paramsDetail="all"		
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="all"			
    elif [ $# -eq 3 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="$3"			
    else
	EH_problem "Expected 0,1,2or3 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Service Entity" )
_EOF_
	
    case "${bxeType}" in
	byname)
	    vis_examplesBxSvcByname
	    vis_examplesApplyProvisioners "ByStar ByName Service Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	bysmb)
	    vis_examplesBxSvcBysmb
	    vis_examplesApplyProvisioners "ByStar BySmb Service Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	all)
	    vis_examplesBxSvcByname
	    vis_examplesApplyProvisioners "ByStar ByName Service Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxSvcBysmb	    
	    vis_examplesApplyProvisioners "ByStar BySmb Service Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac

}


function vis_examplesBxContainerEntity {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    bxeKind="svc"    

    local bxeType="all"
    local provisioningScope="all"
    local paramsDetail="all"

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
	paramsDetail="all"	
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
	paramsDetail="all"		
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="all"			
    elif [ $# -eq 3 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="$3"			
    else
	EH_problem "Expected 0,1,2or3 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Container Entity" )
_EOF_
	
    case "${bxeType}" in
	vmHost)
	    vis_examplesBxContainerVmHost
	    vis_examplesApplyProvisioners "ByStar VmHost Container Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	exposed)
	    vis_examplesBxContainerExposed
	    vis_examplesApplyProvisioners "ByStar Exposed Container Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	perimeter)
	    vis_examplesBxContainerPerimeter
	    vis_examplesApplyProvisioners "ByStar Perimeter Container Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	intra)
	    vis_examplesBxContainerIntra
	    vis_examplesApplyProvisioners "ByStar Intra Container Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	usage)
	    vis_examplesBxContainerUsage
	    vis_examplesApplyProvisioners "ByStar Usage Container Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	dev)
	    vis_examplesBxContainerDev
	    vis_examplesApplyProvisioners "ByStar Dev Container Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	android)
	    vis_examplesBxContainerAndroid
	    vis_examplesApplyProvisioners "ByStar Android Container Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	all)	
	    vis_examplesBxContainerVmHost
	    vis_examplesApplyProvisioners "ByStar VmHost Container Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxContainerExposed
	    vis_examplesApplyProvisioners "ByStar Exposed Container Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxContainerPerimeter
	    vis_examplesApplyProvisioners "ByStar Perimeter Container Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxContainerIntra
	    vis_examplesApplyProvisioners "ByStar Intra Container Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxContainerUsage
	    vis_examplesApplyProvisioners "ByStar Usage Container Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxContainerDev
	    vis_examplesApplyProvisioners "ByStar Dev Container Entity" ${provisioningScope} ${paramsDetail}
	    vis_examplesBxContainerAndroid
	    vis_examplesApplyProvisioners "ByStar Android Container Entity" ${provisioningScope} ${paramsDetail}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac

}


function vis_examplesBxMaterializationEntity {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    bxeKind="svc"    

    local bxeType="all"
    local provisioningScope="all"
    #local paramsDetail="all"
    local paramsDetail="essentials"    

    if [ $# -eq 0 ] ; then
	bxeType="all"
	provisioningScope="all"
	paramsDetail="all"	
    elif [ $# -eq 1 ] ; then
	vis_examplesHeader
	bxeType="$1"
	provisioningScope="all"
	paramsDetail="all"		
    elif [ $# -eq 2 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="all"			
    elif [ $# -eq 3 ] ; then
	vis_examplesHeader
    	bxeType="$1"
	provisioningScope="$2"
	paramsDetail="$3"			
    else
	EH_problem "Expected 0,1,2or3 args, got $#"
	lpReturn 101
    fi
    
    extraInfo="-h -v -n showRun"
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Bx Materialization Entity" )
_EOF_
	
    case "${bxeType}" in
	site)
	    vis_examplesBxMaterializationSite
	    vis_examplesApplyProvisioners "ByStar Site Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	nets)
	    vis_examplesBxMaterializationNets
	    vis_examplesApplyProvisioners "ByStar Nets Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	domains)
	    vis_examplesBxMaterializationDomains
	    vis_examplesApplyProvisioners "ByStar Domains Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	boxes)
	    vis_examplesBxMaterializationBoxes
	    vis_examplesApplyProvisioners "ByStar Boxes Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	containers)
	    vis_examplesBxMaterializationContainers
	    vis_examplesApplyProvisioners "ByStar Containers Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	sysChar)
	    vis_examplesBxMaterializationSysChar
	    vis_examplesApplyProvisioners "ByStar SysChar Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	aais)
	    vis_examplesBxMaterializationAais
	    vis_examplesApplyProvisioners "Asserted Autonomy Internet Service Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	scs)
	    vis_examplesBxMaterializationScs
	    vis_examplesApplyProvisioners "Self Contained Internet Service Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	all)
	    vis_examplesBxMaterializationSite
	    vis_examplesApplyProvisioners "ByStar Site Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationNets
	    vis_examplesApplyProvisioners "ByStar Nets Materialization Entity" ${provisioningScope}  ${paramsDetail}	    
	    vis_examplesBxMaterializationDomains
	    vis_examplesApplyProvisioners "ByStar Domains Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationBoxes
	    vis_examplesApplyProvisioners "ByStar Boxes Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationContainers
	    vis_examplesApplyProvisioners "ByStar Container Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationSysChar
	    vis_examplesApplyProvisioners "ByStar SysChar Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationAais
	    vis_examplesApplyProvisioners "Asserted Autonomy Internet Service Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    vis_examplesBxMaterializationScs
	    vis_examplesApplyProvisioners "Self Contained Service Materialization Entity" ${provisioningScope}  ${paramsDetail}
	    ;;
	*)
	    EH_problem "Bad bxeType -- ${bxeType}"
	    lpReturn 101
	    ;;
    esac

}


function vis_startToBxReg {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    regReqFile=$( vis_regReqFileCreate 2> /dev/null )
    
    lpDo echo NOTYET privCentralRegistrar.sh ${G_commandOptions} -p regReqFile="${regReqFile}" -i bxeDescCreate
}

function vis_startToPrivReg {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    #regReqFile=$( vis_regReqFileCreate 2> /dev/null )
    regReqFile=$( vis_regReqFileCreate )

    if [ -z "${regReqFile}" ] ; then
	EH_problem "Missing regReqFile=${regReqFile}"
	lpReturn 101
    fi
    
    lpDo registrarPrivBxe.sh ${G_commandOptions} -p regReqFile="${regReqFile}" -i bxeDescCreate
}


function vis_startToBxeDescStash {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    bxeDescFile=$( vis_startToPrivReg 2> /dev/null )
    
    lpDo bxeDescManage.sh ${G_commandOptions} -p bxeDesc="${bxeDescFile}" -i bxeDescStash
}

function vis_startToBxRealize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo "NOTYET"

    lpReturn
    
    bxeDescFile=$( vis_startToBxReg 2> /dev/null )
    
    lpDo bxeDescManage.sh ${G_commandOptions} -p bxeDesc="${bxeDescFile}" -i bxeDescStash
}

function vis_startToPrivRealize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -lt 2 ]]

    local bxoRealizationScope=""  
    
    if [ $# -eq 0 ] ; then
	bxoRealizationScope="full"
    else
	bxoRealizationScope=$1
    fi

    #local bxeDescRegFile=$( vis_startToPrivReg 2> /dev/null )
    local bxeDescRegFile=$(lpDo vis_startToPrivReg)
    
    local bxeDescFile=$(lpDo bxeDescManage.sh ${G_commandOptions} -p bxeDesc="${bxeDescRegFile}" -i bxeDescStash)

    lpDo bxeRealize.sh ${G_commandOptions} -p bxeDesc="${bxeDescFile}" -i fullRealize "${bxoRealizationScope}"
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
