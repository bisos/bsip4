#!/bin/bash

IcmBriefDescription="Starter Facility For Creating Panels -- BxPanles, Notes"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: startOrgPanel.sh,v 1.5 2020-09-01 02:10:50 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedFtoCommon.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedFtoCommon.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/startOrgPanel.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedFtoCommon.sh -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# /opt/public/osmt/bin/lcnObjectTree.libSh
. ${opBinBase}/lcnObjectTree.libSh

# PRE parameters

baseDir=""
maintain=""


function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    #vis_startObjectGenExamples

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_

  # vis_ftoCommonExamples
  
  cat  << _EOF_
$( examplesSeperatorChapter "Common File Tree Object Examples" )
${G_myName} ${extraInfo} -i ftoCommonExamples
$( examplesSeperatorChapter "Start Blee Node Panel Base" )
${G_myName} ${extraInfo} -i bleePanelBase node . 
$( examplesSeperatorChapter "Start Blee Leaf" )
${G_myName} ${extraInfo} -i bleePanelBase leaf . 
$( examplesSeperatorChapter "Start Blee AuxNode" )
${G_myName} ${extraInfo} -i bleePanelBase auxNode . 
( examplesSeperatorChapter "Update Blee Node or Leaf Panel Base" )
${G_myName} ${extraInfo} -i bleePanelBaseUpdate . 
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Commands*
_CommentEnd_

function vis_bleePanelBaseUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local baseDir="$1"

    if [ ! -f "${baseDir}/_tree_" ] ; then
	EH_problem "Missing ${baseDir}/_tree_  -- Processing Skipped"
	lpReturn
    fi
    
    local treeItem=$( cat "${baseDir}/_tree_")
	 
    case ${treeItem} in
	"node")
	    if [ -d "${baseDir}/_nodeBase_" ] ; then
		lpDo vis_bleePanelBase ${treeItem} ${baseDir}		
	    else
		if vis_in_nodeBase_ ; then
		    ANT_raw "In _nodeBase_ -- Updating Skipped"
		else
		    EH_problem "Not in _nodeBase_ and there is no _nodeBase_ here"
		fi
	    fi
	    ;;
	"auxNode")
	    EH_problem ""
	    ;;
	"leaf")
	    lpDo vis_bleePanelBase ${treeItem} ${baseDir}
	    ;;
	"auxLeaf")
	    EH_problem ""
	    ;;
	"ignore")
	    doNothing
	    ;;
	*)
	    EH_problem ""
	    ;;		
    esac
}


function vis_bleePanelBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local fileTreeItem="$1"
    local baseDir="$2"

    local panelFileName="fullUsagePanel-en.org"
    # local sisterPanelsFileName="./sisterPanels.org"

    local nodeBaseDirName="_nodeBase_"

    function commonFeatures {
	EH_assert [[ $# -eq 1 ]]
	local dstBaseDir=$1
	if [ ! -f "${dstBaseDir}/foldDesc" ] ; then
	    opDo touch "${dstBaseDir}/foldDesc"
	fi
	if [ ! -f "${dstBaseDir}/destDesc" ] ; then
	    opDo touch "${dstBaseDir}/destDesc"
	fi
	if [ ! -f "${dstBaseDir}/bleePanelProc.sh" ] ; then
	    opDo cp /bisos/apps/defaults/update/bleePanel/start/bleePanelProc.sh ${dstBaseDir}/bleePanelProc.sh
	fi
    }	
	    

    if [ ! -d ${baseDir} ] ; then
	opDo mkdir -p ${baseDir}
    fi
    
    case "${fileTreeItem}" in
	"leaf")
	    inBaseDirDo ${baseDir} vis_startFtoUpdate leaf
	    
	    inBaseDirDo ${baseDir} vis_objectTypeOverwrite "blee.org.fto.leaf"
	    lpDo eval echo "bleePanelProc.sh" \> ${baseDir}/_treeProc_	    
	    inBaseDirDo ${baseDir} rm Panel.org

	    if [ -f "${baseDir}/${panelFileName}" ] ; then
		ANT_raw "${baseDir}/${panelFileName} in place -- untouched"
	    else		
		inBaseDirDo ${baseDir} touch ${panelFileName}

		bleeclient -h -v -n showRun -i run -- --eval \
		"(progn (interactive) (find-file \"${baseDir}/${panelFileName}\") (yas--expand-or-visit-from-menu 'bx-org-mode-begin \"Blee Leaf Panel\") (save-buffer) (kill-buffer))"
	    
		inBaseDirDo ${baseDir} bx-dblock -i dblockUpdateFiles ${panelFileName}
	    fi

	    lpDo commonFeatures ${baseDir}
	    ;;

	"node")
	    inBaseDirDo ${baseDir} vis_startFtoUpdate node
	    
	    inBaseDirDo ${baseDir} vis_objectTypeOverwrite "blee.org.fto.node"
	    lpDo eval echo "bleePanelProc.sh" \> ${baseDir}/_treeProc_	    	    
	    inBaseDirDo ${baseDir} rm Panel.org

	    # if [ -f "${baseDir}/${sisterPanelsFileName}" ] ; then
	    # 	ANT_raw "${baseDir}/${sisterPanelsFileName} in place -- untouched"
	    # else
	    # 	inBaseDirDo ${baseDir} touch ${sisterPanelsFileName}

	    # 	bleeclient -h -v -n showRun -i run -- --eval \
	    #    "(progn (interactive) (find-file \"${baseDir}/${sisterPanelsFileName}\") (yas--expand-or-visit-from-menu 'bx-org-mode-begin \"Blee Sister Panels\") (save-buffer) (kill-buffer))"
	    
	    # 	inBaseDirDo ${baseDir} bx-dblock -i dblockUpdateFiles ${sisterPanelsFileName}
	    # fi

	    if [ ! -f "${baseDir}/bleePanelProc.sh" ] ; then
		opDo cp /bisos/apps/defaults/update/bleePanel/start/bleePanelProc.sh ${baseDir}/bleePanelProc.sh
	    fi

	    if [ ! -d "${nodeBaseDirName}" ] ; then
		inBaseDirDo ${baseDir} mkdir "${nodeBaseDirName}"
	    else
		ANT_raw "${nodeBaseDirName} exists but is being updated."
	    fi
		
	    inBaseDirDo ${baseDir}/${nodeBaseDirName} vis_startFtoUpdate node
	    
	    inBaseDirDo ${baseDir}/${nodeBaseDirName} vis_objectTypeOverwrite "blee.org.fto.node"
	    lpDo eval echo "bleePanelProc.sh" \> ${baseDir}/_treeProc_	    	    
	    inBaseDirDo ${baseDir}/${nodeBaseDirName} rm Panel.org	    
	    
	    if [ -f "${baseDir}/${nodeBaseDirName}/${panelFileName}" ] ; then
		ANT_raw "${baseDir}/${nodeBaseDirName}/${panelFileName} in place -- untouched"
	    else
		inBaseDirDo ${baseDir}/${nodeBaseDirName} touch ${panelFileName}
		
		bleeclient -h -v -n showRun -i run -- --eval \
			   "(progn (interactive) (find-file \"${baseDir}/${nodeBaseDirName}/${panelFileName}\") (yas--expand-or-visit-from-menu 'bx-org-mode-begin \"Blee Node Panel\") (save-buffer) (kill-buffer))"
	    
		inBaseDirDo ${baseDir}/${nodeBaseDirName} bx-dblock -i dblockUpdateFiles ${panelFileName}
	    fi

	    lpDo commonFeatures ${baseDir}/${nodeBaseDirName}
	    
	    if [ -L "${baseDir}/${panelFileName}" ] ; then	    
		opDo rm "${baseDir}/${panelFileName}"
	    fi
	    ;;
	
	"auxNode")
	    inBaseDirDo ${baseDir} vis_startFtoUpdate auxNode
	    inBaseDirDo ${baseDir} vis_objectTypeOverwrite "blee.org.fto.auxNode"
	    #opDo ftoProc.sh -v -n showRun -i pkgedPanelPreps
	    ;;
	
	*)
	    EH_problem "Unknown ${iimType}"
	    lpReturn
    esac

    local cleanupList=$( inBaseDirDo ${baseDir} rm *~ )

    if [ ! -z "${cleanupList}" ] ; then
	opDo rm "${cleanupList}"
    fi

    ANT_raw "${baseDir}/${panelFileName} -- is ready to be developed"

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
