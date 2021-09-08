#!/bin/bash

IimBriefDescription="Seed For Creating And Processing Of BXT Objects"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedBxtCommon.sh,v 1.6 2017-12-14 04:49:46 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /opt/public/osmt/bin/seedBxtCommon.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(org-cycle)][| ]]  [Notes]       :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
** Starting point was plone3
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  [Xrefs]       :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Primary Panel :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxRefModel/bxSrf/fullUsagePanel-en.org::bxt][BISOS Bxt Panel Xref]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  [Info]        :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
Tree processor, node and leaves.
For a leaf:

======= Full Actions =========
-i fullUpdate  = fullLocUpdate + dnsLiveUpdate
-i fullLocUpdate  = dnsLocUpdate + a2BindingUpdate + srFullUpdate
======= DNS Actions =========
-i dnsLocUpdate
-i dnsLiveUpdate
====== Binding Actions =========
-i a2BindingStdout ...
====== Service Realization Actions =========
-i initialTemplate
%%%%%%%%%%%%%%%%%%%%%%%%%%
Have a2BindingProc.sh  take at least 3 args virDom, capability, srId
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


# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/lcnObjectTree.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh
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

# . ${opBinBase}/lpCurrents.libSh

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Examples]    :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i doTheWork
_EOF_
}

function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
---  Documentation / How-To / Information ---
${G_myName} ${extraInfo}  -i describe
${G_myName} ${extraInfo}  -i howTo
${G_myName} ${extraInfo}  -i bystarAcctPathInfo 
${G_myName} ${extraInfo}  -i bystarAcctPathInfo bystarSiteFqdn
${G_myName} ${extraInfo}  -i objectLocalInfo
--- Recurse Dirs ---
${G_myName} ${extraInfo}  -i treeRecurse bystarAcctPathInfo
find  . -type f -print | grep commonProc.sh | bx-dblock -h -v -n showRun -i dblockUpdateFiles
${G_myName} ${extraInfo}  -i treeRecurse startObjectUpdateUnder
${G_myName} ${extraInfo}  -i treeRecurse fullUpdate    # objectLocalPrep + objectExport
${G_myName} ${extraInfo}  -i treeRecurse objectPrepAndUpdate 
${G_myName} ${extraInfo}  -i treeRecurse objectValidate
${G_myName} ${extraInfo}  -i treeRecurse fullClean
--- FULL MANIPULATORS ---
${G_myName} ${extraInfo}  -i fullUpdate
${G_myName} ${extraInfo}  -i fullClean
${G_myName} ${extraInfo}  -i clean
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
${G_myName} ${extraInfo} -i startObjectGen folder example1
${G_myName} ${extraInfo} -i startObjectUpdateInCwd
${G_myName} ${extraInfo} -i startObjectGen custom dirName
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
${G_myName} ${extraInfo} -i emacsClientFiles pageTitle content.html seeAlso.info subDirs.info
bx-dblock   ${extraInfo} -i dblockUpdateFiles commonProc.sh
${G_myName} ${extraInfo} -i startObjectGenExamples
--- LOCAL PREPS ---
${G_myName} ${extraInfo} -i objectLocalInfo
${G_myName} ${extraInfo} -i objectLocalPrep
${G_myName} ${extraInfo} -i objectLocalClean
${G_myName} ${extraInfo} -i objectLocalFullClean
--- PLONE SITE - Object Update (From Local Do To Remote) ---
${G_myName} ${extraInfo} -i objectPrepAndUpdate  # LocalPrep + objectUpdate
${G_myName} ${extraInfo} -i objectUpdate         # just update, not surroundings
${G_myName} ${extraInfo} -i objectDispositions   # setup the surroundings
${G_myName} ${extraInfo} -i objectPrepAndExport  # LocalPrep + objectExport
${G_myName} ${extraInfo} -i objectExport         # = Update + Surroundings + pubState
${G_myName} ${extraInfo} -i objectImport         # Bring over from remote to local
${G_myName} ${extraInfo} -i objectValidate       # Run lintlink (weblint tools) 
--- DEVELOPMENT MODE ---
${G_myName} ${extraInfo} -i objectFeaturesExamples
${G_myName} ${extraInfo} -i treeFacilitiesExamples
${G_myName} ${extraInfo} -i topLevelInitialSetups
${G_myName} ${extraInfo} -i devTools
_EOF_

cat  << _EOF_
--- Object Specific Examples ---
_EOF_
vis_objectExamplesMenu 2> /dev/null

hookRun "examplesHookPost"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  startExamples :: Start Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_startObjectGenExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: Menu for Starting New Objects
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

cat  << _EOF_
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
**** node ****
${G_myName} ${extraInfo} -i startObjectGen node
**** leaf ****
${G_myName} ${extraInfo} -i startObjectGen leaf
**** auxNode ****
${G_myName} ${extraInfo} -i startObjectGen auxNode
${G_myName} ${extraInfo} -i underBaseRunCommand . ${G_myName} ${extraInfo} -i startObjectGen auxNode
**** auxLeaf ****
${G_myName} ${extraInfo} -i startObjectGen auxLeaf
**** ignore ****
${G_myName} ${extraInfo} -i startObjectGen ignore
**** General ****
${G_myName} ${extraInfo} -i emacsClientFiles pageTitle content.html seeAlso.info subDirs.info
${G_myName} ${extraInfo} -i dblockUpdateFile commonProc.sh
**** Transition Facilities ****
${G_myName} ${extraInfo} -i startObjectUpdateInCwd  # Auto Detect
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
_EOF_
}


noArgsHook() {
  vis_examples
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Interactively Invokable Functions (IIF)*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Object IIFs   :: vis_notApplicable_method_XXX  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_notApplicable_method_pubState {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notApplicable_method_dispositions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notApplicable_method_export {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notImplemented_method_pubState {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notImplemented_method_dispositions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notImplemented_method_export {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}


function vis_notImplemented_method_prePrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}


function vis_notImplemented_method_prep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: node (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_node=(
    [startGen]=vis_node_method_startGen
    [startUpdate]=vis_node_method_startUpdate
    [varsPrep]=vis_node_method_varsPrep
    [info]=vis_node_method_info
    [prePrep]=vis_node_method_prePrep
    [prep]=vis_node_method_prep
    [update]=vis_node_method_update
    [export]=vis_node_method_export
    [clean]=vis_node_method_clean
    [fullUpdate]=vis_node_method_fullUpdate
    [fullClean]=vis_node_method_fullClean
    [pubState]=vis_node_method_pubState
    [dispositions]=vis_node_method_dispositions
    [examplesMenu]=vis_node_method_examplesMenu
    [validate]=vis_node_method_validate
)

function vis_node_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial nodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_node_method_startUpdate

    lpReturn
}

function vis_node_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_nodeThereTag ${cwd} "commonProc.sh"

    if [ -f commonProc.sh ] ; then
        ANT_raw "commonProc.sh  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/commonProcNode.sh commonProc.sh
        opDo bx-dblock -i dblockUpdateFiles commonProc.sh
        opDo chmod 775 commonProc.sh
    fi

    if [ -f Panle.org ] ; then
        ANT_raw "commonPanel.org  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/PanelNode.org commonPanel.org
        opDo bx-dblock -i dblockUpdateFiles commonPanel.org
        opDo chmod 664 commonPanel.org
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[node]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}

function vis_node_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_node_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_node_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


function vis_node_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a node on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    #bystarAcctPathAnalyze ${here}

    echo "Nothing To Clean in ${here} for node"
    
    lpReturn
}



function vis_node_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a node on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    #bystarAcctPathAnalyze ${here}

    echo "Nothing To Clean in ${here} for node"
    
    lpReturn
}


function vis_node_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a node on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_node_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a node on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_node_method_update

    opDo vis_node_method_dispositions
   
    lpReturn
}


function vis_node_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a node  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_node_method_varsPrep
}


function vis_node_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a node  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    opDo vis_node_method_varsPrep
}


function vis_node_method_pubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: leaf (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_leaf=(
    [startGen]=vis_leaf_method_startGen
    [startUpdate]=vis_leaf_method_startUpdate
    [varsPrep]=vis_leaf_method_varsPrep
    [info]=vis_leaf_method_info
    [prePrep]=vis_leaf_method_prePrep
    [prep]=vis_leaf_method_prep
    [update]=vis_leaf_method_update
    [export]=vis_leaf_method_export
    [clean]=vis_leaf_method_clean
    [fullUpdate]=vis_leaf_method_fullUpdate
    [fullClean]=vis_leaf_method_fullClean
    [pubState]=vis_leaf_method_pubState
    [dispositions]=vis_leaf_method_dispositions
    [examplesMenu]=vis_leaf_method_examplesMenu
    [validate]=vis_leaf_method_validate
)

function vis_leaf_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial leafs for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo vis_leaf_method_startUpdate

    lpReturn
}

function vis_leaf_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "commonProc.sh"

    if [ -f commonProc.sh ] ; then
        ANT_raw "commonProc.sh  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonProc.sh commonProc.sh
        opDo bx-dblock -i dblockUpdateFiles commonProc.sh
        opDo chmod 775 commonProc.sh
    fi

    if [ -f commonPanle.org ] ; then
        ANT_raw "commonPanel.org  Already exists -- Doing Nothing"
    else
        # NOTYET, AuxNode should become AuxLeaf
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonPanel.org commonPanel.org
        opDo bx-dblock -i dblockUpdateFiles commonPanel.org
        opDo chmod 664 commonPanel.org
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[auxNode]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}

function vis_leaf_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_leaf_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_leaf_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_leaf_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a leaf on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_leaf_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a leaf on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_leaf_method_update

    opDo vis_leaf_method_dispositions
   
    lpReturn
}


function vis_leaf_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a leaf  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    opDo vis_leaf_method_varsPrep
}

function vis_leaf_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_leaf_method_varsPrep
}

function vis_leaf_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_leaf_method_varsPrep

}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: auxNode (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_auxNode=(
    [startGen]=vis_auxNode_method_startGen
    [startUpdate]=vis_auxNode_method_startUpdate
    [varsPrep]=vis_auxNode_method_varsPrep
    [info]=vis_auxNode_method_info
    [prePrep]=vis_auxNode_method_prePrep
    [prep]=vis_auxNode_method_prep
    [update]=vis_auxNode_method_update
    [export]=vis_auxNode_method_export
    [clean]=vis_auxNode_method_clean
    [fullUpdate]=vis_auxNode_method_fullUpdate
    [fullClean]=vis_auxNode_method_fullClean
    [pubState]=vis_auxNode_method_pubState
    [dispositions]=vis_auxNode_method_dispositions
    [examplesMenu]=vis_auxNode_method_examplesMenu
    [validate]=vis_auxNode_method_validate
)

function vis_auxNode_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial auxNodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_auxNode_method_startUpdate

    lpReturn
}

function vis_auxNode_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_bxtThereTag ${cwd} auxNode "commonProc.sh"

    if [ -f commonProc.sh ] ; then
        ANT_raw "commonProc.sh  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonProc.sh commonProc.sh
        opDo bx-dblock -i dblockUpdateFiles commonProc.sh
        opDo chmod 775 commonProc.sh
    fi

    if [ -f commonPanel.org ] ; then
        ANT_raw "commonPanel.org  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonPanel.org commonPanel.org
        opDo bx-dblock -i dblockUpdateFiles commonPanel.org
        opDo chmod 664 commonPanel.org
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[data]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}

function vis_auxNode_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_auxNode_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_auxNode_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


function vis_auxNode_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    #bystarAcctPathAnalyze ${here}

    echo "Nothing To Clean in ${here} for auxNode"
    
    lpReturn
}



function vis_auxNode_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    #bystarAcctPathAnalyze ${here}

    echo "Nothing To Clean in ${here} for auxNode"
    
    lpReturn
}


function vis_auxNode_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_auxNode_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_auxNode_method_update

    opDo vis_auxNode_method_dispositions
   
    lpReturn
}


function vis_auxNode_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_auxNode_method_varsPrep
}


function vis_auxNode_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    opDo vis_auxNode_method_varsPrep
}


function vis_auxNode_method_pubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: auxLeaf (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_auxLeaf=(
    [startGen]=vis_auxLeaf_method_startGen
    [startUpdate]=vis_auxLeaf_method_startUpdate
    [varsPrep]=vis_auxLeaf_method_varsPrep
    [info]=vis_auxLeaf_method_info
    [prePrep]=vis_auxLeaf_method_prePrep
    [prep]=vis_auxLeaf_method_prep
    [update]=vis_auxLeaf_method_update
    [export]=vis_auxLeaf_method_export
    [clean]=vis_auxLeaf_method_clean
    [fullUpdate]=vis_auxLeaf_method_fullUpdate
    [fullClean]=vis_auxLeaf_method_fullClean
    [pubState]=vis_auxLeaf_method_pubState
    [dispositions]=vis_auxLeaf_method_dispositions
    [examplesMenu]=vis_auxLeaf_method_examplesMenu
    [validate]=vis_auxLeaf_method_validate
)

function vis_auxLeaf_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial auxLeafs for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo vis_auxLeaf_method_startUpdate

    lpReturn
}

function vis_auxLeaf_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "commonProc.sh"

    if [ -f commonProc.sh ] ; then
        ANT_raw "commonProc.sh  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonProc.sh commonProc.sh
        opDo bx-dblock -i dblockUpdateFiles commonProc.sh
        opDo chmod 775 commonProc.sh
    fi

    if [ -f Panle.org ] ; then
        ANT_raw "commonPanel.org  Already exists -- Doing Nothing"
    else
        # NOTYET, AuxNode should become AuxLeaf
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonPanel.org commonPanel.org
        opDo bx-dblock -i dblockUpdateFiles commonPanel.org
        opDo chmod 664 commonPanel.org
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[auxNode]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}

function vis_auxLeaf_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_auxLeaf_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_auxLeaf_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_auxLeaf_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxLeaf on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_auxLeaf_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxLeaf on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_auxLeaf_method_update

    opDo vis_auxLeaf_method_dispositions
   
    lpReturn
}


function vis_auxLeaf_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxLeaf  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    opDo vis_auxLeaf_method_varsPrep
}

function vis_auxLeaf_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_auxLeaf_method_varsPrep
}

function vis_auxLeaf_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_auxLeaf_method_varsPrep

}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common Object :: ignore (Object and iifs) [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A object_ignore=(
    [startGen]=vis_ignore_method_startGen
    [startUpdate]=vis_ignore_method_startUpdate
    [varsPrep]=vis_ignore_method_varsPrep
    [info]=vis_ignore_method_info
    [prePrep]=vis_ignore_method_prePrep
    [prep]=vis_ignore_method_prep
    [update]=vis_ignore_method_update
    [export]=vis_ignore_method_export
    [clean]=vis_ignore_method_clean
    [fullUpdate]=vis_ignore_method_fullUpdate
    [fullClean]=vis_ignore_method_fullClean
    [pubState]=vis_ignore_method_pubState
    [dispositions]=vis_ignore_method_dispositions
    [examplesMenu]=vis_ignore_method_examplesMenu
    [validate]=vis_ignore_method_validate
)

function vis_ignore_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial ignores for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo vis_ignore_method_startUpdate

    lpReturn
}

function vis_ignore_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "commonProc.sh"

    if [ -f commonProc.sh ] ; then
        ANT_raw "commonProc.sh  Already exists -- Doing Nothing"
    else
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonProc.sh commonProc.sh
        opDo bx-dblock -i dblockUpdateFiles commonProc.sh
        opDo chmod 775 commonProc.sh
    fi

    if [ -f Panle.org ] ; then
        ANT_raw "commonPanel.org  Already exists -- Doing Nothing"
    else
        # NOTYET, AuxNode should become AuxLeaf
        opDo cp /libre/ByStar/InitialTemplates/bxt/starts/bxtProc/auxNode/commonPanel.org commonPanel.org
        opDo bx-dblock -i dblockUpdateFiles commonPanel.org
        opDo chmod 664 commonPanel.org
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        ANT_raw "${commonObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${commonObjectTypeEnum[auxNode]}
        opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
    fi

    lpReturn
}

function vis_ignore_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_ignore_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_ignore_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_ignore_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a ignore on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_ignore_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a ignore on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_ignore_method_update

    opDo vis_ignore_method_dispositions
   
    lpReturn
}


function vis_ignore_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a ignore  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    opDo vis_ignore_method_varsPrep
}

function vis_ignore_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_ignore_method_varsPrep
}

function vis_ignore_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_ignore_method_varsPrep

}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_startObjectGen Dispatcher [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_startObjectGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate object info  and file-var-parameters in current working directory.
\$1 is objectType. REST are parameters that apply to objectType.
_EOF_
    }

    EH_assert [[ $# -ge 1 ]]

    typeset here=$( pwd )

    thisObjectType=$1
    shift
    #opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=${thisObjectType}"
        lpReturn
    fi
    
    startGenFunc=$( eval echo '$'{object_${thisObjectType}[startGen]} )

    opDo ${startGenFunc} ${@}

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_startObjectUpdateInCwd Dispatcher [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_startObjectUpdateInCwd {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate file-var-parameters in current working directory.
\$1 (optional) is objectType. If no \$1 then objectType is determined from content of cwd.
Primarily a transitional facility.
_EOF_
    }

    EH_assert [[ $# -le 1 ]]

    typeset here=.

    bystarAcctPathAnalyze ${here}

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

    startUpdateFunc=$( eval echo '$'{object_${thisObjectType}[startUpdate]} )

    opDo ${startUpdateFunc} 

    #opDo vis_plone3ProcUpgrade

    lpReturn

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List Of IIFs  :: Object Action Dispatchers [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_objectTypeInCwdGuess  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_objectTypeInCwdGuess {
     G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Try to guess what type of object is here. Used by transitional facilities.
Primarily a transitional facility.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #typeset cwd=$( pwd )
    #bystarAcctPathAnalyze ${cwd}

    typeset thisObjectType=${commonObjectTypeEnum[page]}

    # NOTYET -- Try to better determine
    if [ -d  "index_html" ] ; then
        thisObjectType=${commonObjectTypeEnum[folder]}
    fi

    echo ${thisObjectType}

    lpReturn
}


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_objectPrepAndUpdate  [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_objectPrepAndUpdate {
     G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Based on objectType update from local to remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_objectLocalPrep

    opDo vis_objectUpdate

    lpReturn
}

function vis_objectUpdate {
     G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Based on objectType update from local to remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[update]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}

function vis_objectDispositions {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType Export from local to remote.
Export usually means Update+Surrounding/Priv
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[dispositions]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}


function vis_objectExamplesMenu {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd} 

    prepObjectVarsInCwd #  > /dev/null

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[examplesMenu]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}

function vis_objectValidate {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd} 

    prepObjectVarsInCwd  > /dev/null 2> /dev/null

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[validate]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}


function vis_objectExport {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType Export from local to remote.
Export usually means Update+Surrounding/Priv
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[export]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}


function prepObjectVarsThere {
#set -x
  EH_assert [[ $# -eq 1 ]]

  thisPage=$1

  if [ -d ${thisPage} ] ; then
    pageName=${thisPage}
    opDo cd ${thisPage}

    prepObjectVarsInCwd "${commonObjectTypeEnum[page]}"
  else
    EH_problem "Missing ${thisPage} -- skipped"
    return 1
  fi

  return 0
}

function prepObjectVarsInCwd {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Read contents of cwd file-vars into shell variables. 
\$1 (optional) is objectType. If no \$1 then objectType is determined from content of cwd.
_EOF_
    }

    cwd=$( pwd )

    EH_assert [[ $# -le 1 ]]

    if [ $# -eq 1 ] ; then
        thisObjectType=$1

        if [ -f ${commonObjectTypeFileName} ] ; then
            currentObjectType=$( cat ${commonObjectTypeFileName} )
            if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
                EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
                EH_retOnFail
            fi
        fi
    else
        if [ -f ${commonObjectTypeFileName} ] ; then
            thisObjectType=$( cat ${commonObjectTypeFileName} )
        else
            EH_problem "Missing ${commonObjectTypeFileName}"
            EH_retOnFail
        fi
    fi

    varsPrepFunc=$( eval echo '$'{object_${thisObjectType}[varsPrep]} ) 

    opDo ${varsPrepFunc} "${@}" 

    lpReturn
}



function vis_objectLocalInfo {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
This function is incomplete. It needs to be developed along with the init function.
NOTYET. DoWhenNeeded.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # prepThisPage ${thisPage}
    ANT_raw "file://${here}/${thisPage}/${pageContentFileName}"

    EH_assert [[ $# -le 1 ]]

    typeset here=.

    bystarAcctPathAnalyze ${here}

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
            # NOTYET -- Try to better determine
            thisObjectType=${commonObjectTypeEnum[page]}
            opDo eval echo "${thisObjectType}" \> "${commonObjectTypeFileName}"
        fi
    fi

    infoFunc=$( eval echo '$'{object_${thisObjectType}[info]} )

    opDo ${infoFunc} "${@}"

    opDo ls -d *

    lpReturn
}


function vis_objectLocalPrep {

    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${commonObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=${thisObjectType}"
        lpReturn
    fi
    
    prepFunc=$( eval echo '$'{object_${thisObjectType}[prep]} )

    opDo ${prepFunc} "${@}"

    lpReturn
}



function vis_startObjectUpdateUnder {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Foreach in effectiveSitePages apply vis_startObjectUpdateInCwd
_EOF_
    }
    typeset thisOne=""
    typeset currentDir=$( pwd )

    # print "%%%%% ${currentDir} %%%%%"

    for thisOne in $( vis_effectiveSitePages ) ; do
        opDoComplain cd ${currentDir}/${thisOne} || continue
        print "%%%%%% ${currentDir}/${thisOne} %%%%%"
    
        opDo vis_startObjectUpdateInCwd
    done
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  /Full Actions/
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: fullUpdate, fullClean [[elisp:(org-cycle)][| ]]
_CommentEnd_



#
# Full Manipulators
#

function vis_fullUpdate {
    typeset here=$( pwd )

    opDo vis_objectLocalPrep

    opDoExit cd ${here}

    opDo vis_objectExport
}


function vis_fullClean {
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    hookRun "fullCleanHook"

    fullCleanFunc=$( eval echo '$'{object_${thisObjectType}[fullClean]} )

    opDo ${fullCleanFunc} 

}

#
# LOCAL UPDATES
#

function vis_fullPrep {
    opDo vis_contentFilePrep $*
  opDo vis_subFoldersHtmlGen $*
  opDo vis_seeAlsoHtmlGen $*
  #
  # NOTYET
}


function vis_clean {
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    #bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    hookRun "cleanHook"

    cleanFunc=$( eval echo '$'{object_${thisObjectType}[clean]} )

    opDo ${cleanFunc} 
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Common/Generic Facilities -- Library Candidates*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: fvSet, fvGet  -- File Variable [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_fvSet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    fileVarName="$1"
    fileVarValue="$2"
    
    # NOTYET, objectType and fileVarName range specific validation 

    opDo eval echo "${fileVarValue}" \> "${fileVarName}"
 
    lpReturn
}


function vis_fvGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    fileVarName="$1"

    if [ -f "${fileVarName}" ] ; then
        opDo cat "${fileVarName}"
        lpReturn 0
    else
        ANV_cooked "Missing ${fileVarName}, should become objectType specific and detect defaults"
        lpReturn 101
    fi
    
    lpReturn
}



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
