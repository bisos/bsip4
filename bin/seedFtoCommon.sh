#!/bin/bash

IcmBriefDescription="Seed For Creating And Processing Of File Tree Objects"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedFtoCommon.sh,v 1.9 2020-08-23 18:21:24 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/seedFtoCommon.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
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
*  [[elisp:(org-cycle)][| ]]  [Notes]       :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
** Starting point was plone3
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  [Xrefs]       :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Primary Panel :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxRefModel/bxSrf/fullUsagePanel-en.org::bxt][BISOS Bxt Panel Xref]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  [Info]        :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

See ./lcnObjectTree.libSh for definitions of node, leaf, auxNode, auxLeaf and ignore.

seedFtoCommon accomplishes the following:

 - Cretae _tree_. _treeProc_, _ojectType_
 - Create commonProc.sh and commonProc.org
 - Allow for treeReurse to be started from commonProc.sh

_EOF_
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Imports, Options and Examples Specifications*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Imports]     :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/opAcctLib.sh
#. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/lcnObjectTree.libSh

# . ${opBinBase}/bystarHook.libSh

# ./bxo_lib.sh
# . ${opBinBase}/bpo_lib.sh
# ./bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh

. ${opBinBase}/distHook.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bystarCentralAcct.libSh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/fileVariable.libSh

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Examples]    :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {

    #typeset extraInfo=""
    typeset extraInfo="-v -n showRun"

    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName}

    vis_ftoCommonExamples    

    hookRun "examplesHookPost"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ftoCommonExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_ftoCommonExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: Menu for Starting New Objects
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    local objProc=$(vis_fvGet _treeProc_)

cat  << _EOF_
$( examplesSeperatorChapter "FTO Actions on node/auxNode/ignore" )
find . -type f -print | egrep 'ftoProc.sh$' | xargs bx-dblock -h -v -n showRun -i dblockUpdateFiles
$( examplesSeperatorSection "Create or Update or Remove node/auxNode/ignore" )
${G_myName} ${extraInfo} -i startFtoUpdate leaf
${G_myName} ${extraInfo} -i startFtoUpdate node
${G_myName} ${extraInfo} -i startFtoUpdate auxNode
${G_myName} ${extraInfo} -i underBaseRunCommand . bxtStartCommon.sh  -i startObjectGen auxNode
${G_myName} ${extraInfo} -i startFtoUpdate auxLeaf
${G_myName} ${extraInfo} -i startFtoUpdate ignore
${G_myName} ${extraInfo} -i startFtoRemove
$( examplesSeperatorSection "FTO Information node/auxNode/ignore" )
${G_myName} ${extraInfo} -i infoFto
${G_myName} ${extraInfo} -i ftoWalkRunCmnd ${G_myName} -i infoFto
${G_myName} ${extraInfo} -i gitStatusReport
${G_myName} ${extraInfo} -i treeRecurse infoFto
${G_myName} ${extraInfo} -i treeRecurse gitStatusReport 
${G_myName} ${extraInfo} -i treeRecurse gitStatusReport 2> /dev/null | grep GIT-DIGEST
${G_myName} ${extraInfo} -i treeRecurse gitStatusReport 2> /dev/null | grep GIT-DIGEST | grep CHANGED
${G_myName} ${extraInfo} -i treeRecurse gitReposList 2> /dev/null | egrep '^GitRepo'
${G_myName} ${extraInfo} -i treeRecurse gitReposList 2> /dev/null | egrep '^GitRepo' | cut -d ':' -f 2 | xargs -L 1 bash -c 'cd "$0" && pwd && git status'
${G_myName} ${extraInfo} -i treeRecurse runFunc vis_infoFto
$( examplesSeperatorSection "Walk Objects" )
${G_myName} ${extraInfo} -i treeRecurse runFunc cat _tree_
${G_myName} ${extraInfo} -i ftoWalkRunCmnd cat _tree_
$( examplesSeperatorChapter "General" )
echo ${G_myName} ${extraInfo} -i emacsClientFiles fileToConfigure
${G_myName} ${extraInfo} -i dblockUpdateFile commonProc.sh
$( examplesSeperatorChapter "Transition Facilities" )
${G_myName} ${extraInfo} -i startObjectUpdateInCwd  # Auto Detect
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
${G_myName} ${extraInfo} -i cvsToGitInit
$( examplesSeperatorChapter "Abstract ftoWalkRunCmnd objProc.sh (${objProc}) -i stdActions" )
${objProc} -i ftoProcExamples
_EOF_
}



noArgsHook() {
  vis_examples
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *FTO Class Definitions*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /anyTreeItem_method/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_anyTreeItem_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_anyTreeItem_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local treeItem="$1"

    opDo FN_fileRmIfThere _tree_
    opDo FN_fileRmIfThere _treeProc_
    opDo FN_fileRmIfThere commonProc.sh
    opDo FN_fileRmIfThere commonPanel.org
    opDo FN_fileRmIfThere ftoProc.sh
    opDo FN_fileRmIfThere ftoProc-Panel.org
    opDo rm -r ./var/ftoProc.sh
    opDo FN_fileRmIfThere _objectType_    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_anyTreeItem_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_anyTreeItem_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local treeItem="$1"    

    opDo pwd
    opDo ls -l _tree_  _treeProc_ commonProc.sh commonPanel.org  _objectType_
    opDo egrep '^.*$' _objectType_ _tree_ _treeProc_

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_anyTreeItem_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_anyTreeItem_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local treeItem="$1"
    local ftpProcFile="ftoProc.sh"
    local mainPanelFile="Panel.org"

    if [ -f ${ftpProcFile} ] ; then
        ANT_raw "${ftpProcFile}  Already exists -- Doing Nothing"
    else
        case ${treeItem} in
            "node"|"auxNode")
                opDo cp /bisos/apps/defaults/update/fto/start/commonProc/anyFtoItem/ftoProcNode.sh ${ftpProcFile}
                ;;
            "leaf"|"auxLeaf")
                opDo cp /bisos/apps/defaults/update/fto/start/commonProc/anyFtoItem/ftoProcLeaf.sh ${ftpProcFile}
                ;;
            "ignore")
                doNothing
                ;;
            *)
                EH_problem ""
                ;;              
        esac

        #
        # 20181116 -- MB -- Should pkgedPanelPreps be optional?
        #
        
        #opDo ${ftpProcFile} -v -n showRun -i pkgedPanelPreps
        
        opDo bx-dblock -i dblockUpdateFiles ${ftpProcFile}
        opDo chmod 775 ${ftpProcFile}
    fi

    if [ -f ${mainPanelFile} ] ; then
        ANT_raw "${mainPanelFile}  Already exists -- Doing Nothing"
    else
        case ${treeItem} in
            "node"|"auxNode")
                opDo cp /bisos/apps/defaults/update/fto/start/commonProc/anyFtoItem/mainPanel.org ${mainPanelFile}              
                ;;
            "leaf"|"auxLeaf")
                opDo cp /bisos/apps/defaults/update/fto/start/commonProc/anyFtoItem/mainPanel.org ${mainPanelFile}                              
                ;;
            "ignore")
                doNothing
                ;;
            *)
                EH_problem ""
                ;;              
        esac
        opDo bx-dblock -i dblockUpdateFiles ${mainPanelFile}
        opDo chmod 664 ${mainPanelFile}
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[${treeItem}]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn

}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /node/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_node=(
    [startUpdate]=vis_node_method_startUpdate
    [startRemove]=vis_node_method_startRemove    
    [info]=vis_node_method_info
    [runObjectsFunc]=vis_node_method_runObjectsFunc
)



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_node_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_node_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    opDo vis_ftoThereTag ${cwd} "node" "ftoProc.sh"

    opDo vis_anyTreeItem_method_startUpdate "node"    
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_node_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_node_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial nodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_startRemove "node"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_node_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_node_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_info "node"


    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_node_method_runObjectsFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_node_method_runObjectsFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /leaf/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_leaf=(
    [startUpdate]=vis_leaf_method_startUpdate
    [startRemove]=vis_leaf_method_startRemove    
    [info]=vis_leaf_method_info
    [runObjectsFunc]=vis_leaf_method_runObjectsFunc
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_leaf_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_leaf_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_ftoThereTag ${cwd} "leaf" "ftoProc.sh"

    opDo vis_anyTreeItem_method_startUpdate "leaf"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_leaf_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_leaf_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial nodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_startRemove "leaf"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_leaf_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_leaf_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_info "leaf"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_leaf_runObjectsFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_leaf_runObjectsFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /auxNode/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_auxNode=(
    [startUpdate]=vis_auxNode_method_startUpdate
    [startRemove]=vis_auxNode_method_startRemove    
    [info]=vis_auxNode_method_info
    [runObjectsFunc]=vis_auxNode_method_runObjectsFunc
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxNode_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxNode_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_ftoThereTag ${cwd} "auxNode" "ftoProc.sh"

    opDo vis_anyTreeItem_method_startUpdate "auxNode"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxNode_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxNode_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial auxNodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    opDo vis_anyTreeItem_method_startRemove "auxNode"
    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxNode_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxNode_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_info "auxNode"

    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxNode_method_runObjectsFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxNode_method_runObjectsFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ANT_raw "auxNode -- runObjectsFunc of $@ skipped"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /auxLeaf/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_auxLeaf=(
    [startUpdate]=vis_auxLeaf_method_startUpdate
    [startRemove]=vis_auxLeaf_method_startRemove    
    [info]=vis_auxLeaf_method_info
    [runObjectsFunc]=vis_auxLeaf_method_runObjectsFunc
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxLeaf_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxLeaf_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "ftoProc.sh"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxLeaf_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxLeaf_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial auxLeafs for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    opDo vis_anyTreeItem_method_startRemove "auxLeaf"   
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxLeaf_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxLeaf_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_info "auxLeaf"
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_auxLeaf_method_runObjectsFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_auxLeaf_method_runObjectsFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: /ignore/ (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_ignore=(
    [startUpdate]=vis_ignore_method_startUpdate
    [startRemove]=vis_ignore_method_startRemove    
    [info]=vis_ignore_method_info
    [runObjectsFunc]=vis_ignore_method_runObjectsFunc
)



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ignore_method_startUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_ignore_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "ftoProc.sh"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ignore_method_startRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_ignore_method_startRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_ignore_method_startUpdate "ignore"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ignore_method_info    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_ignore_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_anyTreeItem_method_info "ignore"    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ignore_method_runObjectsFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_ignore_method_runObjectsFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] /#############/ [[elisp:(delete-other-windows)][(1)]] Object Dispatchers :: *Tree Object Processors*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_anyTreeItemProcessor    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_anyTreeItemProcessor {
    G_funcEntry
    function describeF {  cat  << _EOF_
** \$1 is actionName -- one of commonObjectTypeEnum
** \$2 is treeObjectType -- one of node, leaf, auxNode, etc
_EOF_
    }

    EH_assert [[ $# -ge 2 ]]

    local actionName=$1
    shift

    local thisObjectType=$1
    shift
    
    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=${thisObjectType}"
        lpReturn
    fi

    runFunc=$( eval echo '$'{object_${thisObjectType}[${actionName}]} )

    if [ -z "${runFunc}" ] ; then
        EH_problem "Missing processor function -- thisObjectType=${thisObjectType} action=${actionName}"
    fi

    opDo ${runFunc} ${@}

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startFtoUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startFtoUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate object info  and file-var-parameters in current working directory.
\$1 is objectType. REST are parameters that apply to objectType.
_EOF_
    }

    EH_assert [[ $# -ge 1 ]]

    opDo vis_anyTreeItemProcessor "startUpdate" $@

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startFtoUpdateInCwd    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startFtoUpdateInCwd {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate file-var-parameters in current working directory.
\$1 (optional) is objectType. If no \$1 then objectType is determined from content of cwd.
Primarily a transitional facility.
_EOF_
    }

    EH_assert [[ $# -le 1 ]]

    typeset here=.

    #bystarAcctPathAnalyze ${here}

    if [ $# -eq 1 ] ; then
        thisObjectType=$1

        if [ -f ${commonObjectTypeFileName} ] ; then
            currentObjectType=$( cat ${commonObjectTypeFileName} )
            if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
                EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
                EH_retOnFail
            fi
        else
            opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
        fi
    else
        if [ -f ${commonObjectTypeFileName} ] ; then
            thisObjectType=$( cat ${commonObjectTypeFileName} )
        else
            thisObjectType=$( vis_objectTypeInCwdGuess )
            opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
        fi
    fi
    
    opDo vis_anyTreeItemProcessor "startUpdate" $@
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startFtoRemove    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startFtoRemove {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate object info  and file-var-parameters in current working directory.
\$1 is objectType. REST are parameters that apply to objectType.
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    thisObjectType=$( cat ./_tree_)

    if [ -z "${thisObjectType}" ] ; then
        thisObjectType="auxNode"
    fi

    opDo vis_anyTreeItemProcessor "startRemove" "${thisObjectType}"
  
    lpReturn
}


function vis_objectTypeOverwrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]


    if [ -f ${commonObjectTypeFileName} ] ; then
        opDo eval echo "${1}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_objectRunFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_objectRunFunc {
     G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Based on objectType update from local to remote.
_EOF_
    }
    EH_assert [[ $# -ge 1 ]]

    opDo vis_anyTreeItemProcessor "runObjectsFunc" $@

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_infoFto    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_infoFto {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType 
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]

    local thisObjectType=$( cat ./_tree_)

    if [ -z "${thisObjectType}" ] ; then
        thisObjectType="auxNode"
    fi

    opDo vis_anyTreeItemProcessor "info" "${thisObjectType}" $@

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_cvsToGitInit    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_cvsToGitInit {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo ./dev pypiProc.sh -v -n showRun -i distClean

    lpDo lcaCvsAdmin.sh -h -v -n showRun -i cvsedRecurseDeCvsThere .

    grep -v 'Related BxPanels   ::' Panel.org  > Panel.new

    lpDo mv Panel.new Panel.org

    lpDo rm -r -f fptb

    lpDo cp /bisos/apps/defaults/begin/templates/moded/git/gitignore/emacs+py .gitignore

    lpDo cp /bisos/apps/defaults/begin/templates/moded/git/gitattributes/py .gitattributes    
    
    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitStatusReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitStatusReport {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType 
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]

    local thisObjectType=$( cat ./_tree_)

    if [ -z "${thisObjectType}" ] ; then
        thisObjectType="auxNode"
    fi

    local here=$(pwd)
    local curRepoRoot=""
    local globalCurRepoRoot="_NONE_"
    local remoteHostName=""
    local remoteGitPath=""    
    local remoteGitName=""
    local exitCode=0

    if [ -f /tmp/globalCurRepoRoot ] ; then
        globalCurRepoRoot=$(cat /tmp/globalCurRepoRoot)
    else
        globalCurRepoRoot=""
    fi

    function gitDigest {    
        EH_assert [[ $# -eq 1 ]]

        local exitCode=$1

        if [ "${exitCode}" = "1" ] ; then
            # grep for Changes was empty
            echo  "GIT-DIGEST:current: ${here} ::${remoteHostName}:${remoteGitPath}"
        else
            echo  "GIT-DIGEST:-CHANGED-: ${here} ::${remoteHostName}:${remoteGitPath}"      
        fi

    }

    curRepoRoot=$( git rev-parse --show-toplevel 2> /dev/null )

    if [ "${curRepoRoot}" == "${globalCurRepoRoot}" ] ; then
        # Already dealt with
        # lpDo echo "Same Value ${curRepoRoot}"
        lpReturn
    else
        # So, this is new

        #
        # Get repoName at origin
        #

        remoteHostName=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i hostname | cut -d '=' -f 2 )
        remoteGitPath=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i path | cut -d '=' -f 2 )
        remoteGitName=$( basename "${remoteGitPath}" )  

        if [ "${remoteGitName}" == "base" ] ; then
            #git status --untracked-files=no | grep -i Changes > /dev/null
            git status  --porcelain | egrep -v '/$' > /dev/null     
            exitCode=$?
            gitDigest "${exitCode}"
        elif [ "${remoteGitName}" == "bxReposBase" ] ; then
            git status  --porcelain | egrep -v '/$' > /dev/null     
            exitCode=$?
            gitDigest "${exitCode}"
        else
            #git status | grep -i Changes > /dev/null
            if [ -z "$(git status --porcelain)" ] ; then
                exitCode=1
            else
                exitCode=0
            fi
            gitDigest "${exitCode}"
        fi

        globalCurRepoRoot=${curRepoRoot}
        echo "${globalCurRepoRoot}" > /tmp/globalCurRepoRoot    
    fi


    #opDo echo Starting point for "${thisObjectType}" in ${here} with $@

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gitReposList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gitReposList {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType 
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]

    local thisObjectType=$( cat ./_tree_)

    if [ -z "${thisObjectType}" ] ; then
        thisObjectType="auxNode"
    fi

    local here=$(pwd)
    local curRepoRoot=""
    local globalCurRepoRoot="_NONE_"
    local remoteHostName=""
    local remoteGitPath=""    
    local remoteGitName=""
    local exitCode=0

    if [ -f /tmp/globalCurRepoRoot ] ; then
        globalCurRepoRoot=$(cat /tmp/globalCurRepoRoot)
    else
        globalCurRepoRoot=""
    fi

    function gitDigest {    
        EH_assert [[ $# -eq 0 ]]

        echo  "GitRepo:${here}:${remoteHostName}:${remoteGitPath}"
    }

    curRepoRoot=$( git rev-parse --show-toplevel 2> /dev/null )

    if [ "${curRepoRoot}" == "${globalCurRepoRoot}" ] ; then
        # Already dealt with
        # lpDo echo "Same Value ${curRepoRoot}"
        lpReturn
    else
        # So, this is new

        #
        # Get repoName at origin
        #

        remoteHostName=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i hostname | cut -d '=' -f 2 )
        remoteGitPath=$( git remote show origin | grep 'Fetch URL' | cut -d ':' -f 2-100 | xargs uriParseStdout.py | grep -i path | cut -d '=' -f 2 )
        remoteGitName=$( basename "${remoteGitPath}" )

        gitDigest

        globalCurRepoRoot=${curRepoRoot}
        echo "${globalCurRepoRoot}" > /tmp/globalCurRepoRoot    
    fi


    #opDo echo Starting point for "${thisObjectType}" in ${here} with $@

    lpReturn
}


function vis_updateUnderFilesTo {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local updateToFile="$1"        
    local underFilesName="$2"

    if [ ! -f "${updateToFile}" ] ; then
        EH_problem "Bad Usage Missing ${updateToFile}"
        lpReturn
    fi

    local underFilesList=$(find . -type f -print | egrep "/${underFilesName}"'$')

    for each in ${underFilesList} ; do
        opDo cp ${updateToFile} ${each} 
        opDo bx-dblock -i dblockUpdateFile ${each}
    done

    lpReturn
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  /Full Actions/
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: fullUpdate, fullClean [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Common/Generic Facilities -- Library Candidates*
_CommentEnd_


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Unused Facilities -- Temporary Junk Yard*
_CommentEnd_



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
