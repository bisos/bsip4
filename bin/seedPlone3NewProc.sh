#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file

typeset RcsId="$Id: seedPlone3NewProc.sh,v 1.2 2018-06-07 01:31:57 lsipusr Exp $"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal. 

# }}} DBLOCK-top-of-file
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/seedPlone3NewProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ Describe/Help/Info

function vis_describe {
    cat  << _EOF_

* MB: [2012-09-12 Wed] STATUS:
** There is overlap between seedPlone3NewProc.sh and seedPlone3Proc.sh
** seedPlone3Proc.sh should invoke facilities in seedPlone3NewProc.sh for transition
** After transition seedPlone3NewProc.sh, should be purely _tree_ based.

* MB: [2012-09-12 Wed] TODO: 
**  vis_effectiveSitePages becomes opDo vis_effectiveLeaves
**  vis_effectiveSiteFolders becomes opDo vis_effectiveNodes
**  All of DirsRecurse becomes TreeRecurse

For Full Documentation ad Orientation and Model See 
Section:
   seedPlone3ProcNew.sh Internal Description, Orientation and Model
In:
   /libre/ByStar/InitialTemplates/activeDocs/blee/bystarContinuum/ploneProc/fullUsagePanel-en.org


_EOF_
}

# }}}

# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/lcnObjectTree.libSh

. ${opBinBase}/lcaPlone3.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh
# ./bystarHereAcct.libSh
. ${opBinBase}/bystarHereAcct.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/mmaLib.sh
. ${opBinBase}/mmaQmailLib.sh
. ${opBinBase}/mmaDnsLib.sh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/lpCurrents.libSh

# PRE parameters

function G_postParamHook {
     return 0
}

# }}}

# {{{ Examples


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
find  . -type f -print | grep plone3Proc.sh | bx-dblock -h -v -n showRun -i dblockUpdateFiles
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
bx-dblock   ${extraInfo} -i dblockUpdateFiles plone3Proc.sh
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


function vis_objectFeaturesExamples {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

cat  << _EOF_
--- Setup Object Features (From Local Do To Remote) ---
${G_myName} ${extraInfo} -i setupLayoutLeftPortlets
${G_myName} ${extraInfo} -i setupLayoutRightPortlets
${G_myName} ${extraInfo} -i setupExcludeFromNavigation
${G_myName} ${extraInfo} -i setupPubState
${G_myName} ${extraInfo} -i performLayoutLeftPortlets all
${G_myName} ${extraInfo} -i performLayoutRightPortlets all
${G_myName} ${extraInfo} -i performExcludeFromNavigation present
${G_myName} ${extraInfo} -i performPubState retract
${G_myName} ${extraInfo} -i performPubState publish
${G_myName} ${extraInfo} -i localLayoutLeftPortlets all
${G_myName} ${extraInfo} -i localLayoutRightPortlets all
${G_myName} ${extraInfo} -i localExcludeFromNavigation present
${G_myName} ${extraInfo} -i localPubState retract
_EOF_

}


function vis_startObjectGenExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: Menu for Starting New Objects
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

cat  << _EOF_
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
**** auxNode ****
${G_myName} ${extraInfo} -i startObjectGen auxNode auxNodeName
**** auxLeaf ****
${G_myName} ${extraInfo} -i startObjectGen auxLeaf auxLeafName
**** Folder ****
${G_myName} ${extraInfo} -i startObjectGen folder folderName   # Creates folderName directory and index dir
${G_myName} ${extraInfo} -i pageToPageLcntConvert           # in index_html convert to page lcnt
**** Page -- Should be run in directory for page ****
${G_myName} ${extraInfo} -i startObjectGen page pageName
**** PageLcnt -- Should be run in directory for page ****
${G_myName} ${extraInfo} -i startObjectGen pageLcnt pageName
${G_myName} ${extraInfo} -i pageToPageLcntConvert
**** Redirector (page as link) -- Has Limitations, can not be named with upper case ****
${G_myName} ${extraInfo} -i startObjectGen redirector  "srcAllLowerCaseLinkName" "dstLink"
**** FolderRedirector (Folder That Redirects -- Can Be Named)  ****
${G_myName} ${extraInfo} -i startObjectGen folderRedirector srcFolder dstFolder # Creates folderLinkName directory
**** files and rawFiles ****
${G_myName} ${extraInfo} -i startObjectGen files pushSet
${G_myName} ${extraInfo} -i startObjectGen rawFiles htmlSlides
**** Custom ****
${G_myName} ${extraInfo} -i startObjectGen custom dirName
**** Galleria ****
buePhotoManage.sh -p album=xxx -p bystarUid=xxx -i prepxxx
**** General ****
${G_myName} ${extraInfo} -i emacsClientFiles pageTitle content.html seeAlso.info subDirs.info
${G_myName} ${extraInfo} -i dblockUpdateFile plone3Proc.sh
**** Transition Facilities ****
${G_myName} ${extraInfo} -i startObjectUpdateInCwd  # Auto Detect
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
_EOF_

}




function vis_devTools {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

cat  << _EOF_
--- FOR DEVELOPERS  ---
---  INFORMATION  ---
${G_myName} ${extraInfo}  -i bystarAcctPathInfo
--- Recurse Dirs ---
tidy -- Verify and Correct HTML input -- NOTYET
${G_myName} ${extraInfo}  -e "linklint" -i dirsRecurse pagesVerify all
${G_myName} ${extraInfo}  -i dirsRecurse bystarAcctPathInfo
--- LOCAL CREATIONS -- INITIAL Pages/Folders/CONTENT ---
${G_myName} ${extraInfo} -e "created index_html/content skeleton" -i initialIndexContentGen
tidy content.html > contentTidy.html
${G_myName} ${extraInfo} -e "creates the plobeProc.sh" -i ploneProcGen
--- LOCAL UPDATES ---
${G_myName} ${extraInfo} -i subFoldersHtmlGen
${G_myName} ${extraInfo} -i seeAlsoHtmlGen
--- fvSet File Variable Set ---
${G_myName} ${extraInfo} -i fvSet contentProcessing  none   #  none | std | lcnt
${G_myName} ${extraInfo} -i fvGet contentProcessing
--- PLONE SITE - Folder Create ---
${G_myName} ${extraInfo} -i folderFullCreate
--- Setup Object Features (From Local Do To Remote) ---
${G_myName} ${extraInfo} -i setupLayoutLeftPortlets
${G_myName} ${extraInfo} -i setupLayoutRightPortlets
${G_myName} ${extraInfo} -i setupExcludeFromNavigation
--- PLONE SITE - Page Update ---
${G_myName} ${extraInfo} -e "Runs linklint on the page" -i pagesVerify all
--- Transition -- Conversion ---
gnuhtml2latex -H content.html
--- LOCAL LISTINGS ---
${G_myName} ${extraInfo} -i effectiveSitePages
${G_myName} ${extraInfo} -i effectiveSiteFolders
${G_myName} ${extraInfo} -i listFoldersHere .
${G_myName} ${extraInfo} -i listPagesHere .
${G_myName} ${extraInfo} -i isFolderHere .
${G_myName} ${extraInfo} -i isPageHere .
_EOF_
}


function topProcessorExamples {
    bystarAcctPathAnalyze $( pwd )    # Setsup bystarUid, bystarUidHome ...
cat  << _EOF_
--- Top Processor Examples ---
${G_myName} ${extraInfo} -i reBuildInitialFullUpdate   # initialBaseSetup + initialUpdateAll
${G_myName} ${extraInfo} -i reBuildFullUpdate          # reBuildBaseSetup + reBuildUpdateAll
${G_myName} ${extraInfo} -i reBuildBaseSetup           # Make the symlinks and baseAssembles for .gened
${G_myName} ${extraInfo} -i reBuildInitialUpdateAll    # Generate the ploneSite from scratch
${G_myName} ${extraInfo} -i reBuildUpdateAll           # Generate ALL of the ploneSite from scratch
---
${G_myName} ${extraInfo} -i reBuildUpdateHomePlus      # Rebuilds Home and homeSlider and mob
${G_myName} ${extraInfo} -i reBuildUpdateSiteSpecific  # Rebuilds What is Site Specific
${G_myName} ${extraInfo} -i reBuildUpdateCommonTop     # Rebuilds Top Common Part
${G_myName} ${extraInfo} -i reBuildUpdateCommonBottom  # Rebuilds Bottom Common Part
${G_myName} ${extraInfo} -i reBuildUpdateCommonAll     # Rebuilds What is Site Specific
---
${G_myName} ${extraInfo} -i initialLibrary             # Does lcntList Upload first
--- Clean For VC Upload (export, update) ---
${G_myName} ${extraInfo} -i cleanForVcUpload    # Delete symlinks and remove .gened
--- Version Control ---
${G_myName} ${extraInfo} -i vcUpdate
---- Initial Templates Development ----
diff ./plone3Proc.sh  /libre/ByStar/InitialTemplates/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/plone3Proc.sh.start 
cp ./plone3Proc.sh  /libre/ByStar/InitialTemplates/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/plone3Proc.sh.start 
cp /libre/ByStar/InitialTemplates/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/plone3Proc.sh.start  ./plone3Proc.sh  
_EOF_
 return
}



noArgsHook() {
  vis_examples
}

# }}}

# {{{ HowTo

function vis_howTo {
  cat  << _EOF_

See: /libre/ByStar/InitialTemplates/activeDocs/blee/bystarContinuum/ploneProc/fullUsagePanel-en.org

_EOF_
}
# }}}

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


# {{{ Global Parameters


# NOTYET, should this be renamed to pageType
typeset -A webContentTypeEnum=([link]=link [html]=html)
typeset    webContentTypeFileName="contentType"

# NOTYET, webLayoutLeftPortletsEnum and poLeftPortletPresenceEnum need to be made consistent

typeset -A webLayoutLeftPortletsEnum=([none]=none [all]=all [default]=all)
typeset    webLayoutLeftPortletsFileName="layoutLeftPortlets"

typeset -A webLayoutRightPortletsEnum=([none]=none [all]=all [default]=none)
typeset    webLayoutRightPortletsFileName="layoutRightPortlets"

# }}}

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

# {{{ Object Definition (auxNode)

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
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisAuxNode in $* ; do
	cd ${here}
	EH_retOnFail
	#pwd
	if [[ -d ${thisAuxNode} ]] ; then
	    EH_problem "${thisAuxNode} Already exists"
	    return 1
	else 
	    opDo mkdir ${thisAuxNode}
	fi
	opDo cd ${thisAuxNode}

	opDo vis_auxNode_method_startUpdate
    done

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

    bystarAcctPathAnalyze ${cwd}

    vis_nodeThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[auxNode]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
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
    bystarAcctPathAnalyze ${here}

    opDo vis_auxNode_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}


function vis_auxNode_method_pubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}


# }}}

# {{{ Object Definition (auxLeaf)

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
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisAuxNode in $* ; do
	cd ${here}
	EH_retOnFail
	#pwd
	if [[ -d ${thisAuxNode} ]] ; then
	    EH_problem "${thisAuxNode} Already exists"
	    return 1
	else 
	    opDo mkdir ${thisAuxNode}
	fi
	opDo cd ${thisAuxNode}

	opDo vis_auxLeaf_method_startUpdate
    done

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

    bystarAcctPathAnalyze ${cwd}

    vis_leafThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[auxLeaf]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
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
    bystarAcctPathAnalyze ${here}

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

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

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

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}


function vis_auxLeaf_method_pubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}

# }}}

# {{{ Object Definition (folder)

typeset -A object_folder=(
    [startGen]=vis_folder_method_startGen
    [startUpdate]=vis_folder_method_startUpdate
    [varsPrep]=vis_folder_method_varsPrep
    [info]=vis_folder_method_info
    [prePrep]=vis_folder_method_prePrep
    [prep]=vis_folder_method_prep
    [update]=vis_folder_method_update
    [export]=vis_folder_method_export
    [clean]=vis_folder_method_clean
    [fullUpdate]=vis_folder_method_fullUpdate
    [fullClean]=vis_folder_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_folder_method_dispositions
    [examplesMenu]=vis_folder_method_examplesMenu
    [validate]=vis_folder_method_validate
)

function vis_folder_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial folders for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisFolder in $* ; do
	cd ${here}
	EH_retOnFail
	#pwd
	if [[ -d ${thisFolder} ]] ; then
	    EH_problem "${thisFolder} Already exists"
	    return 1
	else 
	    opDo mkdir ${thisFolder}
	fi
	opDo cd ${thisFolder}

	opDo vis_page_method_startGen index_html

	opDo cd ${here}/${thisFolder}

	opDo vis_folder_method_startUpdate
    done

    lpReturn
}

function vis_folder_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    vis_nodeThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[folder]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
    fi

    if [ -f ${poPubStateFileName} ] ; then
	ANT_raw "${poPubStateFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${poPubStateEnum[default]}" \> ${poPubStateFileName}
    fi

    if [ -f ${poExcludeFromNavFileName} ] ; then
	ANT_raw "${poExcludeFromNavFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${poExcludeFromNavEnum[default]}" \> ${poExcludeFromNavFileName}
    fi

    if [ -f folderTitle ] ; then
	ANT_raw "folderTitle Already exists -- Doing Nothing"
    else
	opDo eval echo "$( STR_toTitleCaseWords ${contentEndPath} )" \> folderTitle
    fi

    if [ -f siteFolder ] ; then
	ANT_raw "siteFolder Already exists -- Doing Nothing"
    else
	if [ "${plonePath}" = "/" ] ; then
	    opDo eval echo "/${contentEndPath}" \> siteFolder
	else
	    opDo eval echo "${plonePath}/${contentEndPath}" \> siteFolder
	fi
    fi

    lpReturn
}

function vis_folder_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # First read from index_html vars, then perhaps overwrite.

    if [[ -d index_html ]] ; then
	opDo lpSilentPushd index_html
	opDo vis_page_method_varsPrep
	opDo lpSilentPopd
    else
	EH_problem "Missing ${thisFile} -- skipped"
    fi

    if [ -f excludeFromNav ] ; then
	fv_excludeFromNav=$( cat excludeFromNav) 
    else
	fv_excludeFromNav="false"
    fi

    if [ -f pubState ] ; then
	fv_pubState=$( cat pubState) 
    else
	fv_pubState="publish"
    fi

    if [ -f folderTitle ] ; then
	fv_folderTitleEnc="$( uriEncode.sh $( cat folderTitle) )"
    else
	fv_folderTitleEnc="$( uriEncode.sh ${pageTitle} )"
    fi

    if [ -f siteFolder ] ; then
	fv_siteFolder=$( cat siteFolder ) 
	plonePath=${fv_siteFolder}
    fi

    lpReturn
}

function vis_folder_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_folder_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_folder_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    if [[ -d index_html ]] ; then
	opDo vis_folder_method_varsPrep

	#opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderCreate
	opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${fv_folderTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderCreate
    else
	EH_problem "Missing ${thisFile} -- skipped"
    fi
    
    lpReturn
}

function vis_folder_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_folder_method_update

    opDo vis_folder_method_dispositions
   
    lpReturn
}




function vis_folder_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a folder  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_folder_method_varsPrep

    if [ ! -z "${fv_siteFolder}" ] ; then
	plonePath=${fv_siteFolder}
    fi

    opDo setupExcludeFromNavigationWork

    opDo vis_folder_method_pubState

    #opDo vis_setupPubState
}

function vis_folder_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_folder_method_varsPrep > /dev/null
    
    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"
}

function vis_folder_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    ANT_cooked "folder=${here} -- See its index_html"
}


function vis_folder_method_pubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_folder_method_varsPrep

    if [ ! -z "${fv_siteFolder}" ] ; then
	plonePath=${fv_siteFolder}
    fi

    if [ -z "${fv_pubState}" ] ; then
	EH_problem "Missing pubState -- Ignored - No Action Taken"
	lpReturn 101
    fi

    opDo bystarPlone3Commands.sh -h -v -n showRun -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -i folderState ${fv_pubState}
}


# }}}

# {{{ Object Definition (page)

typeset -A object_page=(
    [startGen]=vis_page_method_startGen
    [startUpdate]=vis_page_method_startUpdate
    [varsPrep]=vis_page_method_varsPrep
    [info]=vis_page_method_info
    [prePrep]=vis_page_method_prePrep
    [prep]=vis_page_method_prep
    [update]=vis_page_method_update
    [export]=vis_page_method_export
    [clean]=vis_page_method_clean
    [fullUpdate]=vis_page_method_fullUpdate
    [fullClean]=vis_page_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_page_method_dispositions
    [examplesMenu]=vis_page_method_examplesMenu
    [validate]=vis_page_method_validate
)

function vis_page_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate initial pages at \$1 for each named in REST.
Generate initial pages for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisPage in $* ; do
	opDo cd ${here}
	if [[ -d ${thisPage} ]] ; then
	    EH_problem "${thisPage} Already exists"
	else 
	    opDo mkdir ${thisPage}
	fi
	opDo cd ${thisPage}

	opDo vis_page_method_startUpdate

	opDo pwd
	opDo ls -l 
    done

    lpReturn
}

function vis_page_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[page]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
    fi

    
    if [ -f pageTitle ] ; then
      ANT_raw "pageTitle  Already exists -- Doing Nothing"
    else
      if [ "${thisPage}_" == "index_html_" ] ; then
	echo ${contentEndPath} > pageTitle
      else
	opDo eval echo ${thisPage} \>  pageTitle
      fi
    fi

    if [ -f pageDescription ] ; then
      ANT_raw "pageDescription  Already exists -- Doing Nothing"
    else
      opDo eval echo "" \> pageDescription
    fi

    if [ -f ${poPubStateFileName} ] ; then
	ANT_raw "${poPubStateFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${poPubStateEnum[default]}" \> ${poPubStateFileName}
    fi

    if [ -f ${poExcludeFromNavFileName} ] ; then
	ANT_raw "${poExcludeFromNavFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${poExcludeFromNavEnum[default]}" \> ${poExcludeFromNavFileName}
    fi

    if [ -f ${webLayoutLeftPortletsFileName} ] ; then
	ANT_raw "${webLayoutLeftPortletsFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${webLayoutLeftPortletsEnum[default]}" \> ${webLayoutLeftPortletsFileName}
    fi

    if [ -f ${webLayoutRightPortletsFileName} ] ; then
	ANT_raw "${webLayoutRightPortletsFileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${webLayoutRightPortletsEnum[default]}" \> ${webLayoutRightPortletsFileName}
    fi

    if [ -f contentType ] ; then
	ANT_raw "contentType Already exists -- Doing Nothing"
    else
	opDo eval echo "html" \> contentType
    fi

    if [ -f contentProcessing ] ; then
	ANT_raw "contentProcessing Already exists -- Doing Nothing"
    else
	opDo eval echo "std" \> contentProcessing
    fi

    if [ -f content.html ] ; then
	ANT_raw "pageDescription  Already exists -- Doing Nothing"
    else
	if [ "${thisPage}_" == "index_html_" ] ; then
	    vis_initialIndexContentGen ${here} > content.html
	else
	    vis_initialPageContentGen ${here} > content.html
	fi
    fi

    lpReturn
}

function vis_page_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    if [ -f contentType ] ; then
	pageContentType=`cat contentType`
    else
	EH_problem "Missing contentType"
	pageContentType="html"
    fi

    pageName=${contentEndPath}

    if [ -f pageTitle ] ; then
      #pageTitle=`sed -e 's/ /+/g' pageTitle`
	pageTitleEnc=$( uriEncode.sh $( cat pageTitle) )
    else
      pageTitleEnc=${pageName}
    fi

    if [ -f pageDescription ] ; then
      #pageDescription=`sed -e 's/ /+/g' pageDescription`
	pageDescriptionEnc=$( uriEncode.sh $( cat pageDescription) )
    else
	pageDescriptionEnc=""
    fi

    if [ ! -f content.html ] ; then
	ANT_raw "Missing content.html -- skipped"
	# EH_problem ??
    fi

    if [ -f contentPlus.html ] ; then 
	pageContentFileName="contentPlus.html"
    else
	pageContentFileName="content.html"
    fi

    if [ -f layoutLeftPortlets ] ; then
	fv_layoutLeftPortlets=$( cat layoutLeftPortlets) 
    else
	fv_layoutLeftPortlets="all"
    fi

    if [ -f layoutRightPortlets ] ; then
	fv_layoutRightPortlets=$( cat layoutRightPortlets) 
    else
	fv_layoutRightPortlets="all"
    fi

    if [ -f excludeFromNav ] ; then
	fv_excludeFromNav=$( cat excludeFromNav) 
    else
	fv_excludeFromNav="false"
    fi

    if [ -f pubState ] ; then
	fv_pubState=$( cat pubState) 
    else
	fv_pubState="publish"
    fi

    if [ -f contentProcessing ] ; then
	fv_contentProcessing=$( cat contentProcessing) 
    else
	fv_contentProcessing="std"
    fi

    # NOTYET -- To Be Verified

    if [ -f ../siteFolder ] ; then
	fv_siteFolder=$( cat ../siteFolder ) 
	plonePath=${fv_siteFolder}
    fi

    lpReturn
}


function vis_page_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_page_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_page_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_page_method_prep_basic

    lpReturn
}

function vis_page_method_prep_basic {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_page_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_page_method_varsPrep

    FN_fileRmIfThere ./contentPlus.html

    pageContentFileName="content.html"

    if [ -f subDirs.html ] ; then 
      #htmlcat -o contentPlus subDirs.html content
      cat  subDirs.html > contentPlus.html
      pageContentFileName="contentPlus.html"
    fi

    if [ -f seeAlso.html ] ; then
      #htmlcat -o contentPlus seeAlso.html content
      if [ -f contentPlus.html ] ; then
	cat  seeAlso.html content.html >> contentPlus.html
      else
	cat  seeAlso.html content.html > contentPlus.html
      fi
      pageContentFileName="contentPlus.html"
    else
      if [ -f contentPlus.html ] ; then
	opDo eval "cat  content.html >> contentPlus.html"
        pageContentFileName="contentPlus.html"
       else
	  pageContentFileName="content.html"
       fi
    fi

    if [ -f contentPlus.html ] ; then
	opDo eval "tidy -utf8 contentPlus.html > contentPlus.tidy 2> /dev/null"
	opDo mv contentPlus.tidy contentPlus.html
    fi
    
    lpReturn
}


function vis_page_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
From Current Directory.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_page_method_varsPrep

    case "${fv_contentProcessing}" in
	"none")
            ANV_cooked "contentProcessing=${fv_contentProcessing} -- Processing Skipped"
	    lpReturn
	    ;;
	"std"|"lcnt")
	    doNothing
	    ;;
	*)
	    EH_problem "Unexpected contentProcessing=${fv_contentProcessing} -- Processing Skipped"
	    lpReturn 1
	    ;;
    esac


#    typeset thisSiteFolder=$( FN_dirsPart ${plonePath} )

    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -p sitePage="${pageName}" -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -p inputFile="${pageContentFileName}" -i pageUploadHtmlAndPublish

    # NOTYET, do all the portlet Adjustments
}

function vis_page_method_publish {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_page_method_varsPrep

    case "${fv_contentProcessing}" in
	"none")
            ANV_cooked "contentProcessing=${fv_contentProcessing} -- Processing Skipped"
	    lpReturn
	    ;;
	"std"|"lcnt")
	    doNothing
	    ;;
	*)
	    EH_problem "Unexpected contentProcessing=${fv_contentProcessing} -- Processing Skipped"
	    lpReturn 1
	    ;;
    esac

    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -p sitePage="${pageName}" -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -p inputFile="${pageContentFileName}" -i pageUploadHtmlAndPublish
}


function vis_page_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_page_method_update

    opDo vis_page_method_dispositions
   
    lpReturn
}



function vis_page_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a page we expect to have: layoutLeftPortlets layoutRightPortlets pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_page_method_varsPrep

    opDo setupLayoutLeftPortletsWork

    opDo setupLayoutRightPortletsWork

    opDo setupExcludeFromNavigationWork

    #opDo vis_setupPubState
}

function vis_page_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_page_method_varsPrep

    printf "${G_myName} ${extraInfo} -i pageToPageLcntConvert\n"
    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}

function vis_page_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    vis_page_method_varsPrep

    bystarHereAnalyzeAcct  2> /dev/null
    bystarHereAnalyzeAcctBagp 2> /dev/null

    ploneSiteFqdn=${cp_acctMainBaseDomain}

    typeset dateTag=$( DATE_nowTag )

    opDo linklint -quiet -http -error -host ${ploneSiteFqdn} -limit 10000 -out ${here}/linklint.errors.${dateTag} ${plonePath}
}


function vis_page_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo FN_fileRmIfThere ./linklint.errors.20[0-9]*
    opDo FN_fileRmIfThere ./contentBody.html.[0-9]*
    opDo FN_fileRmIfThere ./contentPre.bib.[0-9]*

    # Delete Later
    # if [ "$( echo contentBody.html.[0-9]* )" = "contentBody.html.[0-9]*" ] ; then
    # 	ANT_raw "Skipped: Nothing to Clean"
    # else 
    # 	opDo /bin/rm contentBody.html.[0-9]*
    # fi
}

function vis_page_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_page_method_clean
 
}


# }}}

# {{{ Object Definition (pageLcnt)

typeset -A object_pageLcnt=(
    [startGen]=vis_pageLcnt_method_startGen
    [startUpdate]=vis_pageLcnt_method_startUpdate
    [varsPrep]=vis_pageLcnt_method_varsPrep
    [info]=vis_pageLcnt_method_info
    [prePrep]=vis_pageLcnt_method_prePrep
    [prep]=vis_pageLcnt_method_prep
    [update]=vis_pageLcnt_method_update
    [export]=vis_pageLcnt_method_export
    [clean]=vis_pageLcnt_method_clean
    [fullUpdate]=vis_pageLcnt_method_fullUpdate
    [fullClean]=vis_pageLcnt_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_pageLcnt_method_dispositions
    [examplesMenu]=vis_pageLcnt_method_examplesMenu
    [validate]=vis_pageLcnt_method_validate
)

function vis_pageLcnt_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate initial pages at \$1 for each named in REST.
Generate initial pages for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    opDo vis_page_method_startGen "$@"

    # Then do a page to pageLcnt

    lpReturn
}

function vis_pageLcnt_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    opDo vis_page_method_startUpdate "$@"
}

function vis_pageLcnt_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    opDo vis_page_method_varsPrep "$@"
}


function vis_pageLcnt_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    opDo vis_page_method_info  "$@"
}

function vis_pageLcnt_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_pageLcnt_method_prep_basic
should be called after content.html is in place.
_EOF_
    }

    opDo vis_pageLcnt_method_prep_basic  "$@"
}

function vis_pageLcnt_method_prep_basic {
    G_funcEntry
    function describeF {  cat  << _EOF_
When this function is overloaded in ploneProc.sh, then vis_pageLcnt_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_page_method_varsPrep

    opDo hookRun "buildHookPre"


    # contentPlus.html is auto generated and safe to delete.
    FN_fileRmIfThere ./contentPlus.html

    opDo lpPushd ./webPageLcnt
    opDo lcntProc.sh -i build webpage.ttytex
    opDo lpPopd

    # opDo lpPushd ./webPageLcnt
    # opDo lcntProc.sh  -i  buildPre
    # opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs webpage.ttytex
    # opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs webpage.ttytex
    # opDo lpPopd

    # 
    processedContent="./webPageLcnt/heveaHtml-webpage/index.html"

    if [ ! -s "${processedContent}" ] ; then 
	EH_problem "Missing ${processedContent}"
	lpReturn 101
    fi

    thisOutFile="./contentBody.html"

    opDo cp ${processedContent} ${thisOutFile}
    
    opDo elispFilterHtml.sh -i deTitle ${thisOutFile}

    if [ -s ./contentPreface.html ] ; then
	contentPreface="./contentPreface.html"
    else
	contentPreface=""
    fi

    local contentAfterBody=""

    if [ -s ./contentAfterBody.html ] ; then
	contentAfterBody="./contentAfterBody.html"
    else
	contentAfterBody=""
    fi

    
    if [ -z "${ContentsReplacement}" ] ; then
	#opDo eval "htmlcat  ${contentPreface} ${thisOutFile} ${contentAfterBody} > ./content.html"
	opDo eval "cat  ${contentPreface} ${thisOutFile} ${contentAfterBody} > ./content.html"
    else
	opDo eval "cat  ${contentPreface} ${thisOutFile} ${contentAfterBody} | sed  's:--SEC ANCHOR --.Contents./H2:--SEC ANCHOR -->${ContentsReplacement}</H2:' > ./content.html"
    fi


    opDo vis_page_method_prep_basic  "$@"

    inBaseDirDo  ./pushFiles plone3Proc.sh  -i  fullUpdate
    
}


function vis_pageLcnt_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    opDo vis_page_method_update  "$@"
}

function vis_pageLcnt_method_publish {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    opDo vis_page_method_publish  "$@"
}


function vis_pageLcnt_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    opDo vis_page_method_export "$@"

    lpReturn
}



function vis_pageLcnt_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    opDo vis_page_method_dispositions "$@"
}

function vis_pageLcnt_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_pageLcnt_method_varsPrep

    printf "${G_myName} ${extraInfo} -i pageLcntToPageConvert\n"
    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}

function vis_pageLcnt_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_page_method_validate
}



function vis_pageLcnt_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo  ./webPageLcnt lcntProc.sh  -i  fullClean

    opDo vis_page_method_clean
}

function vis_pageLcnt_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_pageLcnt_method_clean

    opDo vis_page_method_fullClean
}


function vis_pageToPageLcntConvert {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    typeset objectType=$( cat ./objectType )

    case ${objectType} in
	"page")
	    doNothing
	    ;;
	"pageLcnt")
	    EH_problem "objectType=${objectType} -- Previously Processed -- Processing Skipped"
	    lpReturn 1
	    ;;
	*)
	    EH_problem "Unexpected objectType=${objectType} -- Processing Skipped"
	    lpReturn 1
	    ;;
    esac

    opDo eval "echo pageLcnt > ./objectType"

    if [ -d "${here}/webPageLcnt" ] ; then
	EH_problem "Directory ${here}/webPageLcnt Exists -- Processing Skipped"
	lpReturn 101
    fi

    opDoExit mkdir "${here}/webPageLcnt"

    lpSilentPushd ${here}/webPageLcnt
    opDo lcnLcntGens.sh -n showRun -p cntntRawHome=. -p srcForms="webpage" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
    lpSilentPopd

    lpSilentPushd ${here}
    opDo plone3Proc.sh -v -n showRun -i startObjectGen files pushFiles
    # NOTYET, pushFiles/plone3Proc.sh is a better place to do these initiations
    opDo eval "plone3Proc.sh -v -n showRun  -i bystarAcctPathInfo  plonePath > ./pushFiles/siteFolder"
    #opDo eval "echo ../webPageLcnt/webpage.pdf > ./pushFiles/filesList"
    opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/galleriaBase/pushFiles/plone3Proc.sh  ./pushFiles/plone3Proc.sh
    lpSilentPopd

    lpReturn
}

function vis_pageLcntToPageConvert {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    typeset objectType=$( cat ./objectType )

    case ${objectType} in
	"pageLcnt")
	    doNothing
	    ;;
	"page")
	    EH_problem "objectType=${objectType} -- Previously Processed -- Processing Skipped"
	    lpReturn 1
	    ;;
	*)
	    EH_problem "Unexpected objectType=${objectType} -- Processing Skipped"
	    lpReturn 1
	    ;;
    esac

    opDo eval "echo page > ./objectType"

    if [ -d "${here}/webPageLcnt" ] ; then
	FN_dirSafeKeep "${here}/webPageLcnt"
    else
	EH_problem "Missing Directory ${here}/webPageLcnt Exists -- Unexpected"
	lpReturn 101
    fi

    lpReturn
}




# }}}


# {{{ Object Definition (files)

typeset -A object_files=(
    [startGen]=vis_files_method_startGen
    [startUpdate]=vis_files_method_startUpdate
    [varsPrep]=vis_files_method_varsPrep
    [info]=vis_files_method_info
    [prePrep]=vis_files_method_prePrep
    [prep]=vis_files_method_prep
    [update]=vis_files_method_update
    [export]=vis_files_method_export
    [clean]=vis_files_method_clean
    [fullUpdate]=vis_files_method_fullUpdate
    [fullClean]=vis_files_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_files_method_disposition
    [examplesMenu]=vis_files_method_examplesMenu
    [validate]=vis_files_method_validate
)

function vis_files_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate initial pages at \$1 for each named in REST.
Generate initial pages for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisPage in $* ; do
	opDo cd ${here}
	if [[ -d ${thisPage} ]] ; then
	    EH_problem "${thisPage} Already exists"
	else 
	    opDo mkdir ${thisPage}
	fi
	opDo cd ${thisPage}

	opDo vis_files_method_startUpdate

	opDo pwd
	opDo ls -l 
    done

    lpReturn
}

function vis_files_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[files]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
    fi

    opDo cp ../siteFolder .

    opDo touch "filesList"

    lpReturn
}

function vis_files_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    if [ -f ./siteFolder ] ; then
	fv_siteFolder=$( cat ./siteFolder) 
	plonePath=${fv_siteFolder}
    elif  [ -f ../siteFolder ] ; then
	fv_siteFolder=$( cat ../siteFolder ) 
	plonePath=${fv_siteFolder}
    else
	EH_problem "Missing siteFolder"
	lpReturn 101
    fi

    lpReturn
}


function vis_files_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_files_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_files_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_files_method_prep_basic

    lpReturn
}

function vis_files_method_prep_basic {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_files_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_files_method_varsPrep

    lpReturn
}


function vis_files_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
From Current Directory.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep

    if [ ! -f ./filesList ] ; then
	EH_problem "Missing ${here}/filesList"
	lpReturn 101
    fi

    opDo vis_filesListUpload ./filesList

}

function vis_filesListUpload {
    G_funcEntry
    function describeF {  cat  << _EOF_
From Current Directory.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset thisFilesList="$1"
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep

    if [ ! -f "${thisFilesList}" ] ; then
	EH_problem "Missing ${thisFilesList}"
	lpReturn 101
    fi

    fv_thisFilesList=$( cat ${thisFilesList} )

    if [ -z "${fv_thisFilesList}" ] ; then
	EH_problem "Empty ${thisFilesList} -- Skipped"
	lpReturn 
    fi

    for thisFile in ${fv_thisFilesList} ; do
	opDo bystarPlone3Features.sh -p bystarUid=${bystarUid} -i uploadFileToFolder "${thisFile}" "${fv_siteFolder}"
    done
}



function vis_files_method_publish {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep

    opDo vis_files_method_update
}


function vis_files_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_files_method_update

    opDo vis_files_method_dispositions
   
    lpReturn
}



function vis_files_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a page we expect to have: layoutLeftPortlets layoutRightPortlets pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep
}

function vis_files_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep

    printf "${G_myName} ${extraInfo} -i filesListUpload ./moreFilesList\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}

function vis_files_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_files_method_varsPrep

    printf "${G_myName} ${extraInfo} -i filesListUpload ./moreFilesList\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}


# }}}

# {{{ Object Definition (rawFiles)

typeset -A object_rawFiles=(
    [startGen]=vis_rawFiles_method_startGen
    [startUpdate]=vis_rawFiles_method_startUpdate
    [varsPrep]=vis_rawFiles_method_varsPrep
    [info]=vis_rawFiles_method_info
    [prePrep]=vis_rawFiles_method_prePrep
    [prep]=vis_rawFiles_method_prep
    [update]=vis_rawFiles_method_update
    [export]=vis_rawFiles_method_export
    [clean]=vis_rawFiles_method_clean
    [fullUpdate]=vis_rawFiles_method_fullUpdate
    [fullClean]=vis_rawFiles_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_rawFiles_method_dispositions
    [examplesMenu]=vis_rawFiles_method_examplesMenu
    [validate]=vis_rawFiles_method_validate
)

function vis_rawFiles_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate initial pages at \$1 for each named in REST.
Generate initial pages for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
  
    for thisPage in $* ; do
	opDo cd ${here}
	if [[ -d ${thisPage} ]] ; then
	    EH_problem "${thisPage} Already exists"
	else 
	    opDo mkdir ${thisPage}
	fi
	opDo cd ${thisPage}

	opDo vis_rawFiles_method_startUpdate

	opDo pwd
	opDo ls -l 
    done

    lpReturn
}

function vis_rawFiles_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage:
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "plone3Proc.sh"

    bystarAcctPathAnalyze ${cwd}

    albumName=$( vis_galleriaAlbumNameGet )
    if [ -z "${albumName}" ] ; then
	EH_problem "Missing albumName"
    else
	albumName="noAlbum"
    fi

    echo album=${albumName} bystarUid=${bystarUid}


    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[rawFiles]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
    fi

    FN_fileSafeKeep  copyMethod
    opDo eval echo ssh \> copyMethod

    FN_fileSafeKeep  destDir
    opDo eval echo /plone/albumDesc/${albumName} \> destDir

    # NOTYET, use acctDomain facilities
    FN_fileSafeKeep  destHost
    opDo eval echo localhost \> destHost

    opDo touch "rawFilesList"

    lpReturn
}

function vis_rawFiles_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    lpReturn
}


function vis_rawFiles_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_rawFiles_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_rawFiles_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_rawFiles_method_prep_basic

    lpReturn
}

function vis_rawFiles_method_prep_basic {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
When this function is overloaded in ploneProc.sh, then vis_rawFiles_method_prep_basic
should be called after content.html is in place.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_rawFiles_method_varsPrep


    lpReturn
}


function vis_rawFiles_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
From Current Directory.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_rawFiles_method_varsPrep

    if [ ! -f ./rawFilesList ] ; then
	EH_problem "Missing ${here}/fileList"
	lpReturn 101
    fi

    fv_rawFilesList=$( cat ./rawFilesList )

    if [ -z "${fv_rawFilesList}" ] ; then
	EH_problem "Empty ./rawFilesList -- Skipped"
	lpReturn 
    fi

    fv_copyMethod=$( cat ./copyMethod )
    fv_destHost=$( cat ./destHost )
    fv_destDir=$( cat ./destDir )

    if [ -z "${fv_destDir}" ] ; then
	EH_problem "Empty ./destDir -- Skipped"
	lpReturn 
    fi

    case "${fv_copyMethod}" in
	""|"native")

	    # for thisFile in ${fv_rawFilesList} ; do
	    # 	opDo echo cp ${thisFile} ${fv_destDir}
	    # done

	    opDo mkdir -p ${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}

	    opDo cp ${fv_rawFilesList} ${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}
	    ;;

	"ssh")
	    if [ -z "${fv_destHost}" ] ; then
		EH_problem "Empty ./destHost -- Skipped"
		lpReturn 
	    fi

	    opDoComplain sudo -u lsipusr ssh lsipusr@${fv_destHost} mkdir -p  ${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}

	    #opDoComplain sudo -u lsipusr scp -q ${fv_rawFilesList}  ${fv_destHost}:${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}
	    opDoComplain sudo -u lsipusr scp -q ${fv_rawFilesList}  ${fv_destHost}:${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}

	    opDoComplain sudo -u lsipusr ssh lsipusr@${fv_destHost} ls -lR  ${bystarAcctBase}/lcaApache2/web/htdocs${fv_destDir}

	    ;;

	"rawNative")

	    # for thisFile in ${fv_rawFilesList} ; do
	    # 	opDo echo cp ${thisFile} ${fv_destDir}
	    # done

	    opDo mkdir -p ${fv_destDir}

	    opDo cp ${fv_rawFilesList} ${fv_destDir}
	    opDo ls -ldt ${fv_destDir}/*
	    ;;


	"rawSsh")
	    if [ -z "${fv_destHost}" ] ; then
		EH_problem "Empty ./destHost -- Skipped"
		lpReturn 
	    fi

	    opDoComplain sudo -u lsipusr ssh lsipusr@${fv_destHost} mkdir -p  ${fv_destDir}

	    opDoComplain sudo -u lsipusr scp -q ${fv_rawFilesList}  ${fv_destHost}:${fv_destDir}

	    opDoComplain sudo -u lsipusr ssh lsipusr@${fv_destHost} ls -lR  ${fv_destDir}

	    ;;


	*)
	    EH_problem "Unexpected copyMethod=${fv_copyMethod} -- Processing Skipped"
	    lpReturn 1
	    ;;
    esac
    
    lpReturn
}

function vis_rawFiles_method_publish {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    ANV_cooked "Not Applicable"
}


function vis_rawFiles_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    ANV_cooked "Not Applicable"

    lpReturn
}

function vis_rawFiles_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a page we expect to have: layoutLeftPortlets layoutRightPortlets pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    ANT_raw "Not Applicable"
}

function vis_rawFiles_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_rawFiles_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}

function vis_rawFiles_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_rawFiles_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}



function vis_rawFiles_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    ANT_raw "Not Applicable -- No Action Taken"
}


function vis_rawFiles_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    ANT_raw "Not Applicable -- No Action Taken"
}


# }}}

# {{{ Object Definition (redirector)

typeset -A object_redirector=(
    [startGen]=vis_redirector_method_startGen
    [startUpdate]=vis_redirector_method_startUpdate
    [varsPrep]=vis_redirector_method_varsPrep
    [info]=vis_redirector_method_info
    [prePrep]=vis_redirector_method_prePrep
    [prep]=vis_redirector_method_prep
    [update]=vis_redirector_method_update
    [export]=vis_redirector_method_export
    [clean]=vis_redirector_method_clean
    [fullUpdate]=vis_redirector_method_fullUpdate
    [fullClean]=vis_redirector_method_fullClean
    [examplesMenu]=vis_redirector_method_examplesMenu
    [validate]=vis_redirector_method_validate
)


function vis_redirector_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Generate initial links at \$1 pointing to \$2
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset linkSrcPage=$1
    typeset linkDst=$2

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    if [[ -d ${linkSrcPage} ]] ; then
	EH_problem "${linkSrcPage} Already exists"
    else 
	opDo mkdir ${linkSrcPage}
    fi
    opDo cd ${linkSrcPage}

    opDo vis_redirector_method_startUpdate

    opDo pwd
    opDo ls -l 

    lpReturn
}

function vis_redirector_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "plone3Proc.sh"

    if [ -f plone3Proc.sh ] ; then
	ANT_raw "plone3Proc.sh  Already exists -- Doing Nothing"
    else
	opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
	opDo vis_dblockUpdateFile plone3Proc.sh
	opDo chmod 775 plone3Proc.sh
    fi

    if [ -f ${poObjectTypeFileName} ] ; then
	ANT_raw "${poObjectTypeFileName}  Already exists -- Doing Nothing"
    else
	thisObjectType=${poObjectTypeEnum[redirector]}
	opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
    fi

    fileName="linkSrcFolder"
    if [ -f ${fileName} ] ; then
	ANT_raw "${fileName} Already exists -- Doing Nothing"
    else
	if [ -f ../siteFolder ] ; then 
	   opDo eval cat ../siteFolder \> ${fileName} 
	else
	    opDo eval echo "${plonePath}" \> ${fileName}
	fi
    fi
    
    fileName="linkSrcPage"
    if [ -f ${fileName} ] ; then
	ANT_raw "${fileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${linkSrcPage}" \> ${fileName}
    fi
    
    fileName="linkDstUrl"
    if [ -f ${fileName} ] ; then
	ANT_raw "${fileName} Already exists -- Doing Nothing"
    else
	opDo eval echo "${linkDst}" \> ${fileName}
    fi


    lpReturn
}

function vis_redirector_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    fileName="linkSrcFolder"
    if [ -f ${fileName} ] ; then
	fileNameContent=$( cat ${fileName} )
	eval fv_${fileName}=${fileNameContent}
    else
	EH_problem "Missing File: ${cwd}/${fileName}"
    fi

    fileName="linkSrcPage"
    if [ -f ${fileName} ] ; then
	fileNameContent=$( cat ${fileName} )
	eval fv_${fileName}=${fileNameContent}
    else
	EH_problem "Missing File: ${cwd}/${fileName}"
    fi

    fileName="linkDstUrl"
    if [ -f ${fileName} ] ; then
	fileNameContent=$( cat ${fileName} )
	eval fv_${fileName}=${fileNameContent}
    else
	EH_problem "Missing File: ${cwd}/${fileName}"
    fi

    lpReturn
}


function vis_redirector_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo pageName="${pageName}"
    echo pageTitleEnc="${pageTitleEnc}"
    echo pageDescriptionEnc="${pageDescriptionEnc}" 
    echo pageContentFileName="${pageContentFileName}"

    echo

    fileName="linkSrcFolder"
    eval echo fv_${fileName}=\${fv_${fileName}}

    fileName="linkSrcPage"
    eval echo fv_${fileName}=\${fv_${fileName}}

    fileName="linkDstUrl"
    eval echo fv_${fileName}=\${fv_${fileName}}

    lpReturn
}

function vis_redirector_method_updateOld {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }

  if [ $#  -eq 0 ] ; then 
    targetPages=$( vis_effectiveSitePages )
  elif [ "$1_" == "all_" ] ; then 
    targetPages=$( vis_effectiveSitePages )
  else
    targetPages=$*
  fi
    
  typeset here=$( pwd )

  bystarAcctPathAnalyze ${here}

  for thisPage in ${targetPages} ; do
      opDo cd ${here}
      if [[ -d ${thisPage} ]] ; then
	  opDo prepObjectVarsThere ${thisPage} 2> /dev/null
	  # NOTYET prep needs to become objectType aware and not require content as mandatory for link
	  #EH_retOnFail

	  opDo cd ${here}/${thisPage}

	  prepObjectVarsInCwd "${poObjectTypeEnum[redirector]}"

	  opDo echo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${fv_linkSrcFolder}" -p sitePage="${fv_linkSrcPage}" -p title="RedirectingTo${fv_linkDstUrl}"  -p description="" -p linkDest="${fv_linkDstUrl}" -i linkAddAndPublish
	  EH_retOnFail
      else
	  EH_problem "Missing ${thisPage} -- skipped"
      fi
  done
}

function vis_redirector_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }

    typeset here=$( pwd )

    opDo bystarAcctPathAnalyze ${here}

    
    cd ${here}
    
    #opDo prepObjectVarsInCwd "${poObjectTypeEnum[redirector]}"
    opDo prepObjectVarsInCwd

    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${fv_linkSrcFolder}" -p sitePage="${fv_linkSrcPage}" -p title="RedirectingTo${fv_linkDstUrl}"  -p description="" -p linkDest="${fv_linkDstUrl}" -i linkAddAndPublish
    EH_retOnFail
}


function vis_redirector_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_redirector_method_update

    opDo vis_redirector_method_dispositions
   
    lpReturn
}


function vis_redirector_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    ANT_raw "NOTYET"
   
    lpReturn
}


function vis_redirector_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_redirector_method_varsPrep
}


function vis_redirector_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_redirector_method_varsPrep
}



# }}}

# {{{ Object Definition (folderFolderRedirector)

typeset -A object_folderRedirector=(
    [startGen]=vis_folderRedirector_method_startGen
    [startUpdate]=vis_folderRedirector_method_startUpdate
    [varsPrep]=vis_folderRedirector_method_varsPrep
    [info]=vis_folderRedirector_method_info
    [prePrep]=vis_notImplemented_method_prePrep  #  vis_folderRedirector_method_prePrep
    [prep]=vis_notImplemented_method_prep     # vis_folderRedirector_method_prep
    [update]=vis_folderRedirector_method_update
    [export]=vis_folderRedirector_method_export
    [clean]=vis_folderRedirector_method_clean
    [fullUpdate]=vis_folderRedirector_method_fullUpdate
    [fullClean]=vis_folderRedirector_method_fullClean
    [pubState]=vis_folder_method_pubState
    [dispositions]=vis_folder_method_dispositions
    [examplesMenu]=vis_folder_method_examplesMenu
    [validate]=vis_folder_method_validate
)


function vis_folderRedirector_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create Folder at \$1 - generate initial links from \$1 to \$2
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset srcFolderName=$1
    typeset linkDst=$2

    # No Need to Generate index HTML.
    # 1) Create Folder 
    # 2) Create Link

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    if [[ -d ${srcFolderName} ]] ; then
	EH_problem "${srcFolderName} Already exists"
	return 1
    else 
	opDo mkdir ${srcFolderName}
    fi
    opDo cd ${srcFolderName}

    opDo vis_redirector_method_startGen index_html "${linkDst}"

    opDo cd ${here}/${srcFolderName}

    opDo vis_folderRedirector_method_startUpdate

    lpReturn
}

function vis_folderRedirector_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_folder_method_startUpdate

    thisObjectType=${poObjectTypeEnum[folderRedirector]}
    opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"

    fileName="./index_html/linkSrcFolder"
    if [ -f siteFolder ] ; then 
	opDo eval cat ./siteFolder \> ${fileName} 
    fi
     
    lpReturn
}

function vis_folderRedirector_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -f excludeFromNav ] ; then
	fv_excludeFromNav=$( cat excludeFromNav) 
    else
	fv_excludeFromNav="false"
    fi

    if [ -f pubState ] ; then
	fv_pubState=$( cat pubState) 
    else
	fv_pubState="publish"
    fi

    if [ -f folderTitle ] ; then
	fv_folderTitleEnc="$( uriEncode.sh $( cat folderTitle) )"
    else
	fv_folderTitleEnc="$( uriEncode.sh ${pageTitle} )"
    fi

    if [ -f siteFolder ] ; then
	fv_siteFolder=$( cat siteFolder ) 
	plonePath=${fv_siteFolder}
    fi

    lpReturn
}


function vis_folderRedirector_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo pageName="${pageName}"
    echo pageTitleEnc="${pageTitleEnc}"
    echo pageDescriptionEnc="${pageDescriptionEnc}" 
    echo pageContentFileName="${pageContentFileName}"

    echo

    fileName="linkSrcFolder"
    eval echo fv_${fileName}=\${fv_${fileName}}

    fileName="linkSrcPage"
    eval echo fv_${fileName}=\${fv_${fileName}}

    fileName="linkDstUrl"
    eval echo fv_${fileName}=\${fv_${fileName}}

    lpReturn
}

function vis_folderRedirector_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }

    typeset here=$( pwd )
    opDo bystarAcctPathAnalyze ${here}

    if [[ -d index_html ]] ; then
	opDo vis_folder_method_varsPrep

	#opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderCreate
	opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${fv_folderTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderCreate
    else
	EH_problem "Missing ${thisFile} -- skipped"
    fi

    lpReturn
}


function vis_folderRedirector_method_export {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_folderRedirector_method_update

    opDo vis_folderRedirector_method_dispositions
   
    lpReturn
}


function vis_folderRedirector_method_dispositions {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    ANT_raw "NOTYET"
   
    lpReturn
}


function vis_folderRedirector_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_folderRedirector_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}

function vis_folderRedirector_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_folderRedirector_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${plonePath}\n"

}




# }}}

# {{{ Object Definition (custom)

typeset -A object_custom=(
    [startGen]=vis_custom_method_startGen
    [startUpdate]=vis_custom_method_startUpdate
    [varsPrep]=vis_custom_method_varsPrep
    [info]=vis_custom_method_info
    [prePrep]=vis_custom_method_prePrep
    [prep]=vis_custom_method_prep
    [update]=vis_custom_method_update
    [export]=vis_custom_method_export
    [clean]=vis_custom_method_clean
    [fullUpdate]=vis_custom_method_fullUpdate
    [fullClean]=vis_custom_method_fullClean
)

function vis_custom_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
Generate initial links at \$1 for each named in REST.
\$1: is "there" -- location where initial links should be created.
shift - \$*: is list of links to create initial environment for.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    describeF
}

function vis_custom_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
}

function vis_custom_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
}


function vis_custom_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
}

function vis_custom_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
}

# }}}

# {{{ PathAnalyze

function bystarAcctPathAnalyze {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This is a temporary fix -- bystarAcctPathAnalyzeDo should be revisited.
_EOF_
    }

    typeset here=$( pwd )

    pushd ${here} > /dev/null
    bystarAcctPathAnalyzeDo "$@"
    popd > /dev/null
}


function bystarAcctPathAnalyzeDo {
#set -x
 baseDir=$1

 cd $baseDir
 baseDir=`pwd`

 pathToArray ${baseDir}

 set ${pathArray[@]}

 integer count=0
 integer acctBaseIndex=0
 relPath=""
 plonePath="NIL"
 for thisElem in ${pathArray[@]} ; do
   if [[ "${thisElem}_" == "ContentTree_" || 
         "${thisElem}_" == "Banners_" || 
         "${thisElem}_" == "InitialContentTree_" ||
         "${thisElem}_" == "CommonFeatures_" ||
         "${thisElem}_" == "plone3Regen_" ||
         "${thisElem}_" == "ploneExtract_" ||
         "${thisElem}_" == "wgetRegen_" ||
         "${thisElem}_" == "SiteStyle_" || 
         "${thisElem}_" == "InitialSiteStyle_" ||
	 "${thisElem}_" == "InitialBanners_"  ]] ; then
     acctBaseIndex=${count}
     #echo ${relPath}
     bystarAcctBase=`FN_dirsPart ${relPath}`
     bystarUid=$( FN_nonDirsPart ${bystarAcctBase} )
     plonePath="TRUE"
   fi
   #echo ${thisElem}
   #echo ${count}
   count=`expr $count + 1`
   relPath="${relPath}/${thisElem}"
   if [[ ${plonePath}_ != "NIL_" ]] ; then
    if [[ ${plonePath}_ == "TRUE_" ]] ; then
      plonePath=""
    else
      # if [ "${thisElem}_" == "index_html_" ] ; then 
      # 	  doNothing
      #elif [ "${thisElem}_" != "Home_" ] ; then 
      if [ "${thisElem}_" != "Home_" ] ; then 
	  plonePath="${plonePath}/${thisElem}"
      fi
    fi
   fi
    #echo ${relPath}
 done

 plonePath=$( FN_dirsPart ${plonePath} )
    
 contentEndPath=${pathArray[${#pathArray[@]}-1]}

 
 if [ -f ${bystarAcctBase}/NSP/bystarUid ] ; then
    bystarUid=$( cat ${bystarAcctBase}/NSP/bystarUid )

    bystarPasswd=`cat ${bystarAcctBase}/NSP/bystarPasswd`
    bystarAcctType=`cat ${bystarAcctBase}/NSP/bystarAcctType`

    bystarSiteFqdn=`cat ${bystarAcctBase}/plone/siteFqdn`

 elif [ -f ${bystarAcctBase}/BAGP/acctUid:dr ] ; then
    bystarUid=$( cat ${bystarAcctBase}/BAGP/acctUid:dr )

    fileParamsLoadVarsFromBaseDir  ${bystarAcctBase}/BAGP

    bystarServiceSupportHookParamsSet ${cp_ServiceType} ${cp_ServiceSupportType}

    function acctBasePasswdGet {
	# DUPLICATES bystarAcctAdmin.sh should stay in sync
        # bystarPasswd=$( bystarAcctAdmin.sh -p bystarUid="${bystarUid}" -i acctPasswdGet )
	EH_assert [[ $# -eq 0 ]]

	thisKey=$( STR_toLower ${cp_ServiceType} )
        #ANT_raw decryptedPasswd=$(  echo ${cp_currentPasswd}  | gcipher -C Vigenere -k ${thisKey} - )
	decryptedPasswd=$(  echo ${cp_currentPasswd}  | gcipher -C Vigenere -k ${thisKey} - )

	echo ${decryptedPasswd}
    }

    #bystarPasswd=$( bystarDevelopers.sh -p bystarUid="${bystarUid}" -i acctPasswdGet )
    bystarPasswd=$( acctBasePasswdGet )
    #bystarAcctType=${cp_acctPrefix}
    RbaeDriveParams
    # This is temporary -- NOTYET, IMPORTANT/URGENT to fix 090219
    bystarSiteFqdn=${acctPloneBaseDomain}
 else
    EH_problem "Bad Config: ${bystarAcctBase}"

 fi
}

function vis_bystarAcctPathInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    bystarAcctPathAnalyze $( pwd )

    if [ $#  -eq 1 ] ; then 
	typeset thisParam=$1
	
	eval echo '$'${thisParam}
    else
	echo contentEndPath=${contentEndPath}
	if [ "${plonePath}_" == "_" ] ; then
	    echo plonePath="/ -- ROOT"
	else
	    echo plonePath=${plonePath}
	fi
	echo bystarAcctBase=${bystarAcctBase}
	echo bystarUid=${bystarUid}
	echo bystarPasswd=${bystarPasswd}
	echo bystarAcctType=${bystarAcctType}

	echo bystarSiteFqdn=${bystarSiteFqdn}
    fi
}

# }}}

# {{{ prepThisAndThat


#
# 
#


function vis_subFoldersHtmlGen {
  #EH_assert [[ $# -eq 0 ]]

  # Outputs to index_html/subDirs.html

  if [ ! -d index_html ] ; then
    EH_problem "Missing index_html"
    return 1
  fi

  typeset empty
  empty=TRUE

  for thisOne in $( vis_effectiveSiteFolders ) ; do
    # thre could be spaces or \n in there
    empty=FALSE
  done
  
  if [ "${empty}_" == "TRUE_" ] ; then
    ANT_raw "No SubDirs, Skipped"
    return 1
  fi

  typeset here=`pwd`
  bystarAcctPathAnalyze ${here}
  
 
  function foldersHtmlHead {
 cat   << _EOF_
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<div id="tabs">
<b>Sub Topics:</b>
  <ul>
_EOF_
  }

  function foldersHtmlTail {
 cat   << _EOF_
  </ul>
</div><br><br><br
</BODY>
</HTML>
_EOF_
  }


  function subFoldersHtmlEmit {
    foldersHtmlHead


    for thisFolder in $( vis_effectiveSiteFolders ) ; do
    
      typeset thisTitle=`cat ${thisFolder}/index_html/pageTitle`
      typeset thisDescription=`cat ${thisFolder}/index_html/pageDescription`
    
      if [ "${thisDescription}_" = "_" ] ; then
	thisDescription=${thisTitle}
      fi

      cat   << _EOF_
   <li><a href="${thisFolder}" title="${thisTitle}"><span>${thisDescription}</span></a></li>
_EOF_

    done

    foldersHtmlTail
   }

   if [ -d index_html ] ; then
     subFoldersHtmlEmit > index_html/subDirs.html
   else
     EH_problem "Missing index_html directory"
     return 1
   fi

   opDo ls -l index_html/subDirs.html
}

function vis_seeAlsoHtmlGen {

  # Outputs to index_html/seeAlso.html


  typeset here=`pwd`
  bystarAcctPathAnalyze ${here}
 
  function seeAlsoHtmlHead {
##<p></p><div id="tabsC">
    cat   << _EOF_
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<div id="tabsC">
<b>See also:</b>
  <ul>
_EOF_
  }

  function seeAlsoHtmlTail {
    cat   << _EOF_
  </ul>
</div><br>
</BODY>
</HTML>
_EOF_
  }

  function seeAlsoHtmlEmit {
    thisPage=$1

    seeAlsoHtmlHead

    if [ -s ./seeAlso.info ] ; then
	cat  ./seeAlso.info |
	while read thisLine ; do

	    thisTitle=`echo ${thisLine} | cut -d '&' -f 1`
	    thisDescription=`echo ${thisLine} | cut -d '&' -f 2`
	    thisUrl=`echo ${thisLine} | cut -d '&' -f 3`
	  
	    if [ "${thisDescription}_" = "_" ] ; then
		thisDescription=${thisTitle}
	    fi

	    cat   << _EOF_
  <li><a href="${thisUrl}" title="${thisTitle}"><span>${thisDescription}</span></a></li>
_EOF_

	done
    else
	EH_problem "Missing ./seeAlso.info -- Skipped"
    fi
    
    seeAlsoHtmlTail
  }
  


  ANT_raw seeAlsoHtmlEmit . output ./seeAlso.html
  seeAlsoHtmlEmit . > ./seeAlso.html
  opDo ls -l ./seeAlso.html

}


# }}}

# {{{ Object Method Dispatchers


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

    bystarAcctPathAnalyze ${here}

    thisObjectType=$1
    shift
    #opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"

    # Validate specified objectType
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
	EH_problem "Invalid objectType=${thisObjectType}"
	lpReturn
    fi
    
    startGenFunc=$( eval echo '$'{object_${thisObjectType}[startGen]} )

    opDo ${startGenFunc} ${@}

    lpReturn
}




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

	if [ -f ${poObjectTypeFileName} ] ; then
	    currentObjectType=$( cat ${poObjectTypeFileName} )
	    if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
		EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
		EH_retOnFail
	    fi
	else
	    opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
	fi
    else
	if [ -f ${poObjectTypeFileName} ] ; then
	    thisObjectType=$( cat ${poObjectTypeFileName} )
	else
	    thisObjectType=$( vis_objectTypeInCwdGuess )
	    opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
	fi
    fi

    startUpdateFunc=$( eval echo '$'{object_${thisObjectType}[startUpdate]} )

    opDo ${startUpdateFunc} 

    #opDo vis_plone3ProcUpgrade

    lpReturn

}

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

    typeset thisObjectType=${poObjectTypeEnum[page]}

    # NOTYET -- Try to better determine
    if [ -d  "index_html" ] ; then
	thisObjectType=${poObjectTypeEnum[folder]}
    fi

    echo ${thisObjectType}

    lpReturn
}


function vis_plone3ProcRenew {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
Keep the old one. Bring over the new starting point and dblock expand.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    FN_fileSafeKeep  plone3Proc.sh

    opDo cp /libre/ByStar/InitialTemplates/lcaPlone/Starts/plone3NewProc.sh plone3Proc.sh
    opDo vis_dblockUpdateFile plone3Proc.sh
    opDo chmod 775 plone3Proc.sh
}

function vis_plone3ProcUpgrade {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
Primarily a transitional facility for vis_plone3ProcRenew.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if grep "seedPlone3NewProc.sh" ./plone3Proc.sh ; then
	ANT_raw "Skipped: ./plone3Proc.sh is already based on seedPlone3NewProc.sh."
    else
	opDo vis_plone3ProcRenew
    fi
}


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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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

    prepObjectVarsInCwd "${poObjectTypeEnum[page]}"
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

	if [ -f ${poObjectTypeFileName} ] ; then
	    currentObjectType=$( cat ${poObjectTypeFileName} )
	    if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
		EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
		EH_retOnFail
	    fi
	fi
    else
	if [ -f ${poObjectTypeFileName} ] ; then
	    thisObjectType=$( cat ${poObjectTypeFileName} )
	else
	    EH_problem "Missing ${poObjectTypeFileName}"
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

	if [ -f ${poObjectTypeFileName} ] ; then
	    currentObjectType=$( cat ${poObjectTypeFileName} )
	    if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
		EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
		EH_retOnFail
	    fi
	else
	    opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
	fi
    else
	if [ -f ${poObjectTypeFileName} ] ; then
	    thisObjectType=$( cat ${poObjectTypeFileName} )
	else
	    # NOTYET -- Try to better determine
	    thisObjectType=${poObjectTypeEnum[page]}
	    opDo eval echo "${thisObjectType}" \> "${poObjectTypeFileName}"
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
    thisEnumObjectType="${poObjectTypeEnum[${thisObjectType}]}"
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


function vis_initialPageContentGen {

  hookRun "buildHookPre"

  bystarAcctPathAnalyze `pwd`
  

  #initialFile=index_initial.html

  case ${contentEndPath} in 
    "Resume")
	      cat   << _EOF_
   My Resume ;;; Is This and That
_EOF_
         ;;
      *)
	cat  << _EOF_
<html>
<head>
<title>${pageName}</title>
</head>
<body>

<p>
Non Specific Initial Page Content. To be edited.

</body>
</html>
_EOF_
	 ;;
    esac
}


function vis_initialIndexContentGen {

  hookRun "buildHookPre"

  bystarAcctPathAnalyze `pwd`
  

  #initialFile=index_initial.html

  case ${contentEndPath} in 
    "Resume")
	      cat   << _EOF_
   My Resume ;;; Is This and That
_EOF_
         ;;
      *)
	cat  << _EOF_
<html>
<head>
<title>${pageName}</title>
</head>
<body>

<p>
Non Specific Initial Index Content. To be edited.

</body>
</html>
_EOF_
	 ;;
    esac
}

# }}}

# {{{ Full Operations

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

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    hookRun "cleanHook"

    cleanFunc=$( eval echo '$'{object_${thisObjectType}[clean]} )

    opDo ${cleanFunc} 
}



# }}}

# {{{ Misc1

#
# NOTYET, To Be Absorbed
#

function contentFilePrep {  return; }
function contentFilePrepHook {  contentFilePrep $*; }


function vis_pagesClean {
  if [ $#  -eq 0 ] ; then 
    targetPages=$( vis_effectiveSitePages )
  elif [ "$1_" == "all_" ] ; then 
    targetPages=$( vis_effectiveSitePages )
  else
    targetPages=$*
  fi

    
  typeset here=`pwd`

  bystarAcctPathAnalyze ${here}

  #pwd
  #ls -l

  for thisPage in ${targetPages} ; do
    opDo cd ${here}
    if [[ -d ${thisPage} ]] ; then
      opDo FN_fileRmIfThere ./${thisPage}/content.[0-9]*
      opDo FN_fileRmIfThere ./pubSite.lcntNu.[0-9]*
      opDo FN_fileRmIfThere ./pubPrimarySite.lcntNu.[0-9]*
      opDo FN_fileRmIfThere ./semantic.cache
      hookRun "fullCleanHook" ${thisPage}
    else
      EH_problem "Missing ${thisPage} -- skipped"
    fi
  done
}

function cleanPost {   return; }
function fullCleanHook {  cleanPost $*; }

function vis_pagesVerify {
  if [ $#  -eq 0 ] ; then 
    targetPages=$( vis_effectiveSitePages )
  elif [ "$1_" == "all_" ] ; then 
    targetPages=$( vis_effectiveSitePages )
  else
    targetPages=$*
  fi

    
  typeset here=`pwd`

  bystarAcctPathAnalyze ${here}

  ploneSiteFqdn=${bystarSiteFqdn}

  for thisPage in ${targetPages} ; do
    echo "############ Web Lint Check http://${ploneSiteFqdn}${plonePath}/${thisPage} ###########"
    opDo linklint -quiet -http -error -host ${ploneSiteFqdn} -limit 10000 -out /tmp/linklint.${thisPage}.error$$.txt ${plonePath}/${thisPage}
    print "To see detailed errors:"
    print "cat /tmp/linklint.${thisPage}.error$$.txt"
    echo "  "
  done

}

# }}}

# {{{ Setup Object Features (Current Object in CWD)


function vis_setupLayoutLeftPortlets {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    prepObjectVarsInCwd

    opDo setupLayoutLeftPortletsWork
    
}

function setupLayoutLeftPortletsWork {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    if [ "${fv_layoutLeftPortlets}" == "${webLayoutLeftPortletsEnum[none]}" ] ; then
	portletStatus="${poLeftPortletPresenceEnum[absent]}"
    elif [ "${fv_layoutLeftPortlets}" == "${webLayoutLeftPortletsEnum[all]}" ] ; then
	portletStatus="${poLeftPortletPresenceEnum[present]}"
    else
	EH_problem "Bad fv_layoutLeftPortlets -- ${fv_layoutLeftPortlets}"
    fi

    if [[ "${portletStatus}_" == "present_" ]] ; then
	opDo bystarPlone3Portlets.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -i ploneManagePortletsLeft ${portletStatus}
    elif [[ "${portletStatus}_" == "absent_" ]] ; then
	opDo bystarPlone3Portlets.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -i ploneManagePortletsLeft ${portletStatus}
    else
	EH_problem "Bad portletStatus -- ${portletStatus}"
	EH_retOnFail
    fi
}


function vis_setupLayoutRightPortlets {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    prepObjectVarsInCwd

    opDo setupLayoutRightPortletsWork
}


function setupLayoutRightPortletsWork {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ "${fv_layoutRightPortlets}" == "${webLayoutRightPortletsEnum[none]}" ] ; then
	portletStatus="absent"
    elif [ "${fv_layoutRightPortlets}" == "${webLayoutRightPortletsEnum[all]}" ] ; then
	portletStatus="present"
    else
	EH_problem "Bad fv_layoutRightPortlets -- ${fv_layoutRightPortlets}"
    fi

    if [[ "${portletStatus}_" == "present_" ]] ; then
	opDo bystarPlone3Portlets.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -i ploneManagePortletsRight ${portletStatus}
    elif [[ "${portletStatus}_" == "absent_" ]] ; then
	opDo bystarPlone3Portlets.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}" -i ploneManagePortletsRight ${portletStatus}
    else
	EH_problem "Bad portletStatus -- ${portletStatus}"
	EH_retOnFail
    fi
}


function vis_setupExcludeFromNavigation {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    prepObjectVarsInCwd
    EH_retOnFail
    
    opDo setupExcludeFromNavigationWork

    lpReturn
}


function setupExcludeFromNavigationWork {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    if [ "${fv_excludeFromNav}" == "true" ] ; then
	ANT_raw "TODO  true excludeFromNav for ${thisPage}"
	opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderExcludeFromNav true
            #bystarPlone3Commands.sh -h -v -n showRun -p bystarUid=ea-59002 -p siteFolder="Gallery"  -p title="images"  -p description="images" -i folderExcludeFromNav false
    elif [ "${fv_excludeFromNav}" == "false" ] ; then
	ANT_raw "NOT excludeFromNav for ${thisPage} -- Reason=false"
	opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${plonePath}"  -p title="${pageTitleEnc}"  -p description="${pageDescriptionEnc}" -i folderExcludeFromNav false
    else
	ANT_raw "NOT excludeFromNav for ${thisPage} -- excludeFromNav=${fv_excludeFromNav}"
    fi

    lpReturn
}



function vis_setupPubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    prepObjectVarsInCwd
    EH_retOnFail

    typeset pubState=${fv_pubState}

    # NOTYET, make the following lines become  Error based on Invalid arrayName[name]
    # EH_verifyAssocArray  arrayName  arrayTag ; EH_retOnFail 
    if [ -z "${poPubStateEnum[${pubState}]}" ] ; then
	EH_problem "Invalid pubState=$1"
	lpReturn
    fi
 
    pubStateFunc=$( eval echo '$'{object_${thisObjectType}[pubState]} )

    # EH_assertSoftly
    [ ! -z "${pubStateFunc}" ] ; EH_retOnFail

    opDo ${pubStateFunc} "${poPubStateEnum[${pubState}]}"

    lpReturn

}

function vis_performPubState {
    G_funcEntry
    function describeF {  cat  << _EOF_
Specified by $1
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset pubState=$1

    if [ -z "${poPubStateEnum[${pubState}]}" ] ; then
	EH_problem "Invalid pubState=$1"
	lpReturn
    fi

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    prepObjectVarsInCwd
    EH_retOnFail
 
    pubStateFunc=$( eval echo '$'{object_${thisObjectType}[pubState]} )

    ANT_raw "pubStateFunc=${pubStateFunc}"

    [ ! -z "${pubStateFunc}" ] ; EH_retOnFail

    opDo ${pubStateFunc} "${@}"

    lpReturn
}


# }}}

# {{{ lcnPlone3Gens.sh Specific Functions

function vis_emacsClientFiles {
    EH_assert [[ $# -gt 0 ]]

    typeset thisOne=""

    for thisOne in ${*} ; do
	#( emacsclient -e "(find-file \"LCNT-INFO/${thisOne}\")"  & 	wait $! )
	emacsclient "${thisOne}"
    done
}


function vis_dblockUpdateFile {  # NOTYET, to be obsoleted by bx-dblock -i dblockUpdateFiles
    EH_assert [[ $# -gt 0 ]]

    typeset thisOne=""

    for thisOne in ${*} ; do
	emacsclient -e "(org-dblock-update-file-bx \"${thisOne}\")"
    done
}


# }}}

# {{{ InitialStylesSetup

function vis_linkToCommonFeatures {
  EH_assert [[ $# -eq 0 ]]

  opDo ln -s ../CommonFeatures/AboutThisWebsite .
}


function vis_linkToInitialSiteStyle {
  EH_assert [[ $# -eq 0 ]]

  opDo ln -s /libre/ByStar/InitialTemplates/lcaPlone/InitialSiteStyle .
}



# }}}


# {{{ Junk Yard


#declare -A ZafarRizbi; ZafarRizbi[First]=Zafar; ZafarRizbi[Last]=Rizbi;

#    if [[ $# -eq 0 ]] ; then
#	firstName=$( eval echo '$'{$bystarName[First]} )
#	lastName=$( eval echo '$'{$bystarName[Last]} )
#   else	firstName=$( eval echo '$'{$1[First]} )
#	lastName=$( eval echo '$'{$1[Last]} )
#   fi


function vis_redirectPloneNative {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
$1 BaseFolder -- $2 BasePage  -- $3 DestTarget
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    bystarAcctPathAnalyze $( pwd )

    typeset srcFolder=$1
    typeset srcPage=$2
    typeset dstUrl=$3
 
    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${srcFolder}"  -p title="RedirectingTo${dstUrl}"  -p description="" -i folderCreate
    EH_retOnFail

    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="${srcFolder}" -p sitePage="${srcPage}" -p title="RedirectingTo${dstUrl}"  -p description="" -p linkDest="${dstUrl}" -i linkAddAndPublish
    EH_retOnFail

    lpReturn
}


# }}}

# {{{ EffectiveSite Pages/Folders

function vis_effectiveSitePages {
  EH_assert [[ $# -eq 0 ]]

  opDo vis_effectiveLeaves
}


function vis_effectiveSiteFolders {
  EH_assert [[ $# -eq 0 ]]

  opDo vis_effectiveNodes
}

# }}}

# {{{ Absolute Path Generators

function vis_initialFolderThere {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
\$1: is "there" -- location where initial pages should be created.
shift - \$*: is list of pages to create initial environment for.
_EOF_
    }

    EH_assert [[ $# -eq 2 ]]

    typeset here=$1
    typeset thisFolder=$2

    bystarAcctPathAnalyze ${here}
 
    opDoExit  pushd ${here}
    
    if [[ -d ${thisFolder} ]] ; then
	EH_problem "${thisFolder} Already exists"
	lpReturn 101
    fi

    opDo vis_startObjectGen folder ${thisFolder}

    opDo popd
}

function vis_initialPageThere {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate initial pages at \$1 for each named in REST.
\$1: is "there" -- location where initial pages should be created.
shift - \$*: is list of pages to create initial environment for.
_EOF_
    }

#set -x
    EH_assert [[ $# -eq 2 ]]

    typeset here=$1
    typeset thisPage=$2

    bystarAcctPathAnalyze ${here}
  
    opDoExit  pushd ${here}
 
    if [[ -d ${thisPage} ]] ; then
      EH_problem "${thisPage} Already exists"
      lpReturn 101
    fi

    vis_startObjectGen page ${thisPage}
    
    opDo popd
}

# }}}

function vis_bluegriffon {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo bluegriffon file://${here}/content.html

    lpReturn
}


#
# Top Level Processors
#


function vis_reBuildInitialFullUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_reBuildBaseSetup

    opDo vis_reBuildInitialUpdateAll
}



function vis_reBuildFullUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_reBuildBaseSetup

    opDo vis_reBuildUpdateAll
}


function vis_reBuildBaseSetup {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    bystarAcctPathAnalyze $( pwd ) 

    opDo bystarPlone3Initial.sh -h -v -n showRun -p bystarUid=${bystarUid} -i linkToInitialContentTree

    opDo bystarPlone3Initial.sh -h -v -n showRun -p bystarUid=${bystarUid} -i baseAssembleContentTreeBody 
}


function vis_reBuildInitialUpdateAll {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_rebuildModeSet "initialBuilding"

    opDo vis_reBuildUpdateAll
 
    opDo vis_rebuildModeSet "built"
}



function vis_reBuildUpdateAll {
    G_funcEntry
    function describeF {  cat  << _EOF_
Update means, do to remote the latest local.
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo vis_reBuildUpdateHomePlus

    opDo vis_reBuildUpdateCommonTop

    opDo vis_reBuildUpdateSiteSpecific

    opDo vis_reBuildUpdateCommonBottom
}

function vis_reBuildUpdateHomePlus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    vis_inPloneBaseDirAccordinglyDo ${here}/galleria plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo  ${here}/homeSlider  ./plone3Proc.sh -v -n showRun  -i reBuildFullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/Home plone3Proc.sh -v -n showRun  -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/mob plone3Proc.sh -v -n showRun  -i treeRecurse fullUpdate

    lpReturn
}


function vis_reBuildUpdateCommonAll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_reBuildUpdateCommonTop

    opDo vis_reBuildUpdateCommonBottom

    lpReturn
}

function vis_reBuildUpdateCommonTop {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    # ./images.common
    vis_inPloneBaseDirAccordinglyDo ${here}/images plone3Proc.sh -i initialUpdateAll

    # ./contentImages
    vis_inPloneBaseDirAccordinglyDo ${here}/contentImages plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/contact plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/siteSearch plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/bystarSearch plone3Proc.sh -i treeRecurse fullUpdate

    lpReturn
}

function vis_reBuildUpdateCommonBottom {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    # ./library.common
    vis_inPloneBaseDirAccordinglyDo ${here}/library plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/pgp plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/aboutThisWebsite plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/help plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/siteControl plone3Proc.sh -i treeRecurse fullUpdate

    lpReturn
}


function vis_reBuildUpdateSiteSpecific {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
The order is important. We want to make sure that we get
the desired order in the left navigation.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    vis_inPloneBaseDirAccordinglyDo ${here}/projects plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/participate plone3Proc.sh -i treeRecurse fullUpdate

    vis_inPloneBaseDirAccordinglyDo ${here}/announcements plone3Proc.sh -i treeRecurse fullUpdate

    lpReturn
}



function vis_initialLibrary {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
1) Run ./lcntLists/plone3Proc.sh  -- 2) Run vis_lcntExcludeFromNav -- 3) Run ./library.Common/plone3Proc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    bystarAcctPathAnalyze ${here}

    vis_inPloneBaseDirAccordinglyDo ${here}/lcntLists plone3Proc.sh -i initialUpdateAll
    #opDo bystarLcntProc.sh -h -v -n showRun -p bystarUid=${bystarUid} -i plone3Upload PLPC-100101 PLPC-110001 PLPC-110020
 
    opDo bystarPlone3Initial.sh -h -v -n showRun -p bystarUid=${bystarUid} -i lcntExcludeFromNavExport

    vis_inPloneBaseDirAccordinglyDo ${here}/library plone3Proc.sh -i initialUpdateAll

    lpReturn
}


function vis_cleanForVcUpload {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo plone3Proc.sh.gened -i cleanForVcExport

    opDo plone3Proc.sh -v -n showRun  -i treeRecurse fullClean

    lpReturn
}





#
#  JUNKYARD
#


function vis_examplesOld {

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
${G_myName} ${extraInfo}  -i objectInfo
lcnPlone3Start.sh
--- Recurse Dirs ---
${G_myName} ${extraInfo}  -i dirsRecurse bystarAcctPathInfo
${G_myName} ${extraInfo}  -i dirsRecurse startObjectUpdateUnder
${G_myName} ${extraInfo}  -i dirsRecurse fullUpdate
${G_myName} ${extraInfo}  -i dirsRecurse folderFullCreate
${G_myName} ${extraInfo}  -i dirsRecurse pagesUpdate all
${G_myName} ${extraInfo}  -i dirsRecurse pagesClean all
--- FULL MANIPULATORS ---
${G_myName} ${extraInfo}  -i  fullUpdate
${G_myName} ${extraInfo}  -i  fullClean
--- LOCAL GENERATIONS/CREATIONS -- INITIAL Pages/Folders/CONTENT ---
${G_myName} ${extraInfo} -i initialFolders Example Example/SubOne Example/SubTwo
${G_myName} ${extraInfo} -i startObjectUpdateInCwd
${G_myName} ${extraInfo} -i examplesInitialGens
--- LOCAL UPDATES ---
${G_myName} ${extraInfo} -i  fullPrep
${G_myName} ${extraInfo} -i contentFilePrep index_html
${G_myName} ${extraInfo} -i contentFilePrep all
${G_myName} ${extraInfo} -i pagesClean all
--- Setup Object Features (From Local Do To Remote) ---
${G_myName} ${extraInfo} -i setupLayoutLeftPortlets
${G_myName} ${extraInfo} -i setupLayoutRightPortlets
${G_myName} ${extraInfo} -i setupExcludeFromNavigation
--- PLONE SITE - Folder Create ---
${G_myName} ${extraInfo} -i folderFullCreate
--- PLONE SITE - Page Update ---
${G_myName} ${extraInfo} -i pagesUpdate index_html
${G_myName} ${extraInfo} -i linksUpdate .
${G_myName} ${extraInfo} -e "update = fullPrep + publish" -i pagesUpdate all
${G_myName} ${extraInfo} -e "just publish" -i pagesPublish index_html
${G_myName} ${extraInfo} -e "Runs linklint on the page" -i pagesVerify all
--- Object Processors ---
${G_myName} ${extraInfo} -i objectUpdate
--- Common ByStar Features ---
${G_myName} ${extraInfo} -e "" -i CommonFeaturesVcGet
--- LCNT Inclusion ----
${G_myName} ${extraInfo} -e "" -i lcntFullUploadLists
${G_myName} ${extraInfo} -e "" -i lcntListsInitialize
--- DEVELOPMENT MODE ---
${G_myName} ${extraInfo} -i devTools
_EOF_

hookRun "examplesHookPost"
}


function vis_examplesInitialGensOld {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

cat  << _EOF_
--- Initial Generations/creations (LOCAL)  ---
${G_myName} ${extraInfo} -i initialLinks content
${G_myName} ${extraInfo} -i initialLinksThere . content
_EOF_

}


function vis_topLevelInitialSetupsOld {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

cat  << _EOF_
--- Top Level Initial Setups (LOCAL)  ---
${G_myName} ${extraInfo} -i linkToInitialSiteStyle
_EOF_

}




####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: shellscript-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

