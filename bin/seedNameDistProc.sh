#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file

typeset RcsId="$Id: seedNameDistProc.sh,v 1.3 2018-06-07 01:31:57 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/seedNameDistProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

# {{{ Describe/Help/Info

function vis_describe {
    cat  << _EOF_
*      ================  DESCRIPTION
** Used for both 
***      - Names Maintenance 
***      - Dist Maintenance 
** Mailings operates in combination with Names and Distributions
*      ================  Primary Modules
**  /opt/public/osmt/bin/seedMailingProc.sh
**  /opt/public/osmt/bin/seedNameDistProc.sh
*      ================  Related Modules
**  /opt/public/osmt/bin/bystarMailingStart.sh
**  /opt/public/osmt/bin/bystarDistStart.sh
*      ================  Notable Libraries
*      ================  For Full Documentation ad Orientation and Model See  
** [[elisp:(find-file "/bisos/apps/defaults/activeDocs/blee/mailCompose/mailings/fullUsagePanel-en.org")][This Activity]]
** [[elisp:(find-file "/bisos/apps/defaults/activeDocs/blee/mailCompose/mailings/devStableAgenda.org")][Stable Dev Agenda]]
** [[elisp:(blee:find-file "/bisos/apps/defaults/activeDocs/blee/mailCompose/mailings/devUnStableAgenda.org")][UnStable Dev Agenda]]
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

#. ${opBinBase}/bystarMailing.libSh
#. ${opBinBase}/bystarNameDist.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh
# ./bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh


. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh


# /opt/public/osmt/bin/bystarInfoBase.libSh 
# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/lpCurrents.libSh

###
###   #### 2023 Additions
###

. ${opBinBase}/bleeLib.sh
. ${lcntBinBase}/lcnLcntMailingLib.sh


# PRE parameters

function G_postParamHook {
     return 0
}

# }}}



# {{{ Describe

function vis_describeLocalNdo {
    cat  << _EOF_
Name Distribution Object (ndo) Definitions
_EOF_
}

# }}}

# {{{ Mailing Object (ndo)Definitions

typeset    ndoObjectTypeFileName="objectType"
typeset -A ndoObjectTypeEnum=(
    [nativeNode]=nativeNode
    [auxNode]=auxNode
    [auxLeaf]=auxLeaf
    [basic]=basic
    [namesList]=namesList
    [distribution]=distribution
    [custom]=custom
)

# Name Distribution Object File Parameters

typeset    ndoExcludeFromAutoloadFileName="excludeFromAutoload"
typeset -A ndoExcludeFromAutoloadEnum=(
    [true]=true
    [false]=false
    [default]=true
)

# }}}

includeList=""
excludeList=""
namesBaseDir="/bxo/usg/bystar/bpos/usageEnvs/fullUse/names"
distKeepBaseDir="${namesBaseDir}/DistKeep"

startsBaseDir="/bisos/apps/defaults/nameDist/starts"

# {{{ Examples


function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

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
find  . -type f -print | egrep 'nameDistProc.sh$' | bx-dblock -h -v -n showRun -i dblockUpdateFiles
${G_myName} ${extraInfo}  -i treeRecurse startObjectUpdateUnder
${G_myName} ${extraInfo}  -i treeRecurse fullUpdate
${G_myName} ${extraInfo}  -i treeRecurse objectAutoLoad
${G_myName} ${extraInfo}  -i treeRecurse objectValidate
${G_myName} ${extraInfo}  -i treeRecurse clean
${G_myName} ${extraInfo}  -i treeRecurse fullClean
--- FULL MANIPULATORS ---
${G_myName} ${extraInfo}  -i fullUpdate
${G_myName} ${extraInfo}  -i fullClean
${G_myName} ${extraInfo}  -i clean
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
${G_myName} ${extraInfo} -i startObjectGen dist
${G_myName} ${extraInfo} -i startObjectGen name
${G_myName} ${extraInfo} -i startObjectUpdateInCwd
${G_myName} ${extraInfo} -i emacsClientFiles content.mail 
bx-dblock   ${extraInfo} -i dblockUpdateFiles nameDistProc.sh content.mail
${G_myName} ${extraInfo} -i startObjectGenExamples
--- NAME/DIST - Object Update (From Local Do To Remote) ---
${G_myName} ${extraInfo} -i objectUpdate         # Update Htmls
${G_myName} ${extraInfo} -i objectExecute        # Execute this mailing with blank To:
${G_myName} ${extraInfo} -i objectValidate       # Run lintlink (weblint tools) 
_EOF_

    typeset cwd=$( pwd -P )
    typeset procFileName=""

    # bystarAcctPathAnalyze ${cwd}

    # NOTYET -- TEMPORARY

    local procBaseName="names"

    case ${procBaseName} in
        "names")
            vis_examplesName
#             cat  << _EOF_
# --- DISTRIBUTIONS PROCESSING ---
# ${G_myName} ${extraInfo} -i examplesDistribution
# _EOF_
            vis_examplesDistribution
            ;;
        "mailings"|"mailing")
            vis_examplesDistribution
            cat  << _EOF_
--- NamesList PROCESSING ---
${G_myName} ${extraInfo} -i examplesName
_EOF_
            ;;
        *)
            EH_problem "Unexpected procBaseName=${procBaseName} -- Processing Skipped"
            lpReturn 1
            ;;
    esac

    vis_examplesDevelopment

cat  << _EOF_
--- Object Specific Examples ---
_EOF_
vis_objectExamplesMenu 2> /dev/null

hookRun "examplesHookPost"
}

function vis_examplesDevelopment {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

 cat  << _EOF_
--- DEVELOPMENT MODE ---
${G_myName} ${extraInfo} -i objectFeaturesExamples
${G_myName} ${extraInfo} -i treeFacilitiesExamples
${G_myName} ${extraInfo} -i topLevelInitialSetups
${G_myName} ${extraInfo} -i devTools
${G_myName} ${extraInfo} -i initialTemplatesDevelopment
_EOF_
}

function vis_examplesName {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

 cat  << _EOF_
--- NAMES LIST CREATION ---
cp /acct/employee/lsipusr/BUE/names/examplesAndTests/tests.names .
--- NAMES PROCESSING ---
${G_myName} ${extraInfo} -i namesOutputListWith vis_distHereNames          # List Of Files To Include and Exclude
${G_myName} ${extraInfo} -i namesOutputListWith vis_examplesAndTests
${G_myName} ${extraInfo} -i namesOutputToFilesWith tag1 vis_distHereNames  # \$1=includeExcludeTag, \$2+=listFunc
${G_myName} ${extraInfo} -i namesResultFor tag1                            # After namesOutputToFilesWith tag1 vis_examplesAndTests
${G_myName} ${extraInfo} -i namesOutputToFilesWithAndResult tag1 vis_distHereNames  # namesOutputToFilesWith + namesResultFor
${G_myName} ${extraInfo} -i namesOutputToFilesWithAndResult tag1 vis_examplesAndTests  # namesOutputToFilesWith + namesResultFor
_EOF_
}


function vis_examplesDistribution {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

 cat  << _EOF_
--- DISTRIBUTIONS PROCESSING ---
${G_myName} ${extraInfo} -i distNamesOutputToFileWith vis_distHereNames  # = namesOutputToFilesWith dist vis_examplesAndTests
${G_myName} ${extraInfo} -i namesOutputListWith vis_examplesAndTests
${G_myName} ${extraInfo} -i mailingNamesGet                            # Look through preceding ".." and locate first mailingName
${G_myName} ${extraInfo} -i logsToNames                               # Based on mailingNameGet
${G_myName} ${extraInfo} -i distNextBatch                             # After distNamesGenWith + logsToNames = namesResultFor dist
${G_myName} ${extraInfo} -i distPrepWith vis_distHereNames            # distNamesOutputWith + logsToNames + distNextBatch  = namesOutputToFilesWithAndResult dist vis_examplesAndTests
${G_myName} ${extraInfo} -i bbdbNamesInput  ./dist-result.names       # Visit File and run bbdb-names-input -- after (server-start)
${G_myName} ${extraInfo} -i namesResultFor dist                       # After namesOutputToFilesWith tag1 vis_examplesAndTests
${G_myName} ${extraInfo} -i namesOutputToFilesWithAndResult dist vis_distHereNames
${G_myName} ${extraInfo} -i namesOutputToFilesWithAndResult tag1 vis_examplesAndTests  # namesOutputToFilesWith + namesResultFor
--------- 2023 Revisions -----------
${G_myName} ${extraInfo} -i fileVarsUpdate
${G_myName} ${extraInfo} -i resultNamesAsAddrRecipsAndSelect
${G_myName} ${extraInfo} -i mtdtSelectRecips $(ls *-recips.el | head -1)
${G_myName} ${extraInfo} -i mtdtSelectMailing
_EOF_
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
**** nativeNode ****
${G_myName} ${extraInfo} -i startObjectGen nativeNode path
${G_myName} ${extraInfo} -i startObjectGen nativeNode .
**** auxNode ****
${G_myName} ${extraInfo} -i startObjectGen auxNode path
${G_myName} ${extraInfo} -i startObjectGen auxNode .
**** auxLeaf ****
${G_myName} ${extraInfo} -i startObjectGen auxLeaf path
${G_myName} ${extraInfo} -i startObjectGen auxLeaf .
**** basic ****
${G_myName} ${extraInfo} -i startObjectGen basic path 
${G_myName} ${extraInfo} -i startObjectGen basic .
**** text ****
${G_myName} ${extraInfo} -i startObjectGen namesList path 
${G_myName} ${extraInfo} -i startObjectGen namesList .
**** html ****
${G_myName} ${extraInfo} -i startObjectGen distribution path
${G_myName} ${extraInfo} -i startObjectGen distribution .
**** Custom ****
${G_myName} ${extraInfo} -i startObjectGen custom path
${G_myName} ${extraInfo} -i startObjectGen custom .
**** General ****
${G_myName} ${extraInfo} -i emacsClientFiles pageTitle content.html seeAlso.info subDirs.info
${G_myName} ${extraInfo} -i dblockUpdateFile nameDistProc.sh
**** Transition Facilities ****
${G_myName} ${extraInfo} -i startObjectUpdateInCwd  # Auto Detect
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
_EOF_

}


function vis_initialTemplatesDevelopment {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  typeset thisProcFile="./nameDistProc.sh"
  typeset initialTemplateProcFile="/bisos/apps/defaults/nameDist/starts/nameDistProc.sh"

cat  << _EOF_
---- Initial Templates Development ----
diff ${thisProcFile} ${initialTemplateProcFile}
cp ${thisProcFile} ${initialTemplateProcFile}
cp ${initialTemplateProcFile} ${thisProcFile} 
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
--- Clean For VC Upload (load, update) ---
${G_myName} ${extraInfo} -i cleanForVcUpload    # Delete symlinks and remove .gened
--- Version Control ---
${G_myName} ${extraInfo} -i vcUpdate
---- Initial Templates Development ----
diff ./nameDistProc.sh  /bisos/apps/defaults/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/nameDistProc.sh.start
cp ./nameDistProc.sh  /bisos/apps/defaults/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/nameDistProc.sh.start
cp /bisos/apps/defaults/lcaPlone/NewInitialContentTree/Base/Poly/DEFAULT/nameDistProc.sh.start  ./nameDistProc.sh
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

TODO
See: /bisos/apps/defaults/activeDocs/blee/bystarContinuum/ploneProc/fullUsagePanel-en.org

_EOF_
}
# }}}

# {{{ Misc

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

function vis_procFileNameGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    typeset procFileName=""

    bystarAcctPathAnalyze ${cwd}

    case ${procBaseName} in
        "names")
            procFileName="nameProc.sh"
            ;;
        "mailings")
            procFileName="distProc.sh"
            ;;
        "mailing")
            procFileName="distProc.sh"
            ;;
        *)
            EH_problem "Unexpected procBaseName=${procBaseName} -- Processing Skipped"
            lpReturn 1
            ;;
    esac

    echo ${procFileName}
    
    lpReturn
}




# {{{ Global Parameters

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

function vis_notApplicable_method_execute {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF
    lpReturn
}

function vis_notApplicable_method_load {
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

# }}}

# {{{ Object Definition (nativeNode)

typeset -A object_nativeNode=(
    [startGen]=vis_nativeNode_method_startGen
    [startUpdate]=vis_nativeNode_method_startUpdate
    [varsPrep]=vis_nativeNode_method_varsPrep
    [info]=vis_nativeNode_method_info
    [prePrep]=vis_nativeNode_method_prePrep
    [prep]=vis_nativeNode_method_prep
    [update]=vis_nativeNode_method_update
    [clean]=vis_nativeNode_method_clean
    [fullUpdate]=vis_nativeNode_method_fullUpdate
    [fullClean]=vis_nativeNode_method_fullClean
    [pubState]=vis_nativeNode_method_pubState
    [examplesMenu]=vis_nativeNode_method_examplesMenu
    [validate]=vis_nativeNode_method_validate
)

function vis_nativeNode_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial nativeNodes for each named in \$*
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    # $@ ignored
      
    opDo vis_nativeNode_method_startUpdate
 
    lpReturn
}

function commonStartFiles_startUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    typeset procFileName=""
    typeset notesFileName=""

    bystarAcctPathAnalyze ${cwd}

    case ${procBaseName} in
        "names")
            procFileName="nameProc.sh"
            notesFileName="nameNotes.org"
            ;;
        "mailings"|"mailing")
            procFileName="distProc.sh"
            notesFileName="distNotes.org"
            ;;
        *)
            EH_problem "Unexpected procBaseName=${procBaseName} -- Processing Skipped"
            lpReturn 1
            ;;
    esac
    
    if [ -f ${procFileName} ] ; then
        ANT_raw "${procFileName}  Already exists"
        FN_fileSafeKeep ${procFileName}
    fi
    opDo cp /bisos/apps/defaults/nameDist/starts/${procFileName}  ${procFileName}
    opDo vis_dblockUpdateFile ${procFileName}
    opDo chmod 775 ${procFileName}


    if [ -f Notes.org ] ; then
        ANT_raw "Notes.org  Already exists -- Doing Nothing"
    else
        opDo cp /bisos/apps/defaults/nameDist/starts/${notesFileName} Notes.org
        opDo vis_dblockUpdateFile Notes.org
    fi

    lpReturn
}


function vis_nativeNode_method_startUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    vis_nodeThereTag ${cwd} $( vis_procFileNameGet )

    opDo commonStartFiles_startUpdate

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_raw "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[nativeNode]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    lpReturn
}

function vis_nativeNode_method_varsPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_nativeNode_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_nativeNode_method_prep {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_nativeNode_method_update {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a nativeNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
    
    lpReturn
}

function vis_nativeNode_method_load {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a nativeNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_nativeNode_method_update

    opDo vis_nativeNode_method_execute
   
    lpReturn
}


function vis_nativeNode_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a nativeNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_nativeNode_method_varsPrep

    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${procPath}\n"

}


function vis_nativeNode_method_clean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    doNothing
}

function vis_nativeNode_method_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    doNothing
}

# }}}

# {{{ Object Definition (auxNode)

typeset -A object_auxNode=(
    [startGen]=vis_auxNode_method_startGen
    [startUpdate]=vis_auxNode_method_startUpdate
    [varsPrep]=vis_auxNode_method_varsPrep
    [info]=vis_auxNode_method_info
    [prePrep]=vis_auxNode_method_prePrep
    [prep]=vis_auxNode_method_prep
    [update]=vis_auxNode_method_update
    [clean]=vis_auxNode_method_clean
    [fullUpdate]=vis_auxNode_method_fullUpdate
    [fullClean]=vis_auxNode_method_fullClean
    [pubState]=vis_auxNode_method_pubState
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

    # $@ ignored
      
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

    bystarAcctPathAnalyze ${cwd}

    vis_nodeThereTag ${cwd} $( vis_procFileNameGet )

    opDo commonStartFiles_startUpdate

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_raw "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[auxNode]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
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

function vis_auxNode_method_load {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxNode on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_auxNode_method_update

    opDo vis_auxNode_method_execute
   
    lpReturn
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

    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${procPath}\n"

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
    [load]=vis_auxLeaf_method_load
    [clean]=vis_auxLeaf_method_clean
    [fullUpdate]=vis_auxLeaf_method_fullUpdate
    [fullClean]=vis_auxLeaf_method_fullClean
    [pubState]=vis_auxLeaf_method_pubState
    [execute]=vis_auxLeaf_method_execute
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

    # $@ ignored

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

    bystarAcctPathAnalyze ${cwd}

    vis_leafThereTag ${cwd} "nameDistProc.sh"

    opDo commonStartFiles_startUpdate

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_raw "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[auxLeaf]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
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

function vis_auxLeaf_method_load {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a auxLeaf on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    opDo vis_auxLeaf_method_update

    opDo vis_auxLeaf_method_execute
   
    lpReturn
}


function vis_auxLeaf_method_execute {
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
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${procPath}\n"

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
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${procPath}\n"

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

# {{{ Object Definition (basic)

typeset -A object_basic=(
    [startGen]=vis_basic_method_startGen
    [startUpdate]=vis_basic_method_startUpdate
    [varsPrep]=vis_basic_method_varsPrep
    [info]=vis_basic_method_info
    [prePrep]=vis_basic_method_prePrep
    [prep]=vis_basic_method_prep
    [update]=vis_basic_method_update
    [load]=vis_basic_method_load
    [clean]=vis_basic_method_clean
    [fullUpdate]=vis_basic_method_fullUpdate
    [fullClean]=vis_basic_method_fullClean
    [pubState]=vis_basic_method_pubState
    [execute]=vis_basic_method_execute
    [examplesMenu]=vis_basic_method_examplesMenu
    [validate]=vis_basic_method_validate
)

function vis_basic_method_startGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate/Start initial folders for each named in \$*
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    typeset thisMailingName=$1
  
    opDo vis_basic_method_startUpdate ${thisMailingName}

    lpReturn
}

function vis_basic_method_startUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    typeset thisMailingName="$1"

    vis_leafThereTag ${cwd} $( vis_procFileNameGet )

    opDo commonStartFiles_startUpdate

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_cooked "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[basic]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    # Now with everything in place in the mailingBaseDir generate the mailing lisp code.

    opDo vis_basic_method_prep

    lpReturn
}



function vis_basic_method_varsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Read in file variables in this base directory.
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    if [ -f excludeFromAutoload ] ; then
        fv_excludeFromAutoload=$( cat excludeFromAutoload ) 
    else
        fv_excludeFromAutoload="true"
    fi

    lpReturn
}

function vis_basic_method_info {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_basic_method_prep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Asuumes that the mailing base dir has been set up.
Creates lisp file for it.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}
 
    opDo vis_basic_method_varsPrep


    lpReturn
}

function vis_basic_method_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
#Processes mailing information. Updates content.mail
Load the lisp file.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}
 
    ANT_cooked "Not Applicable -- No Action Taken"

    lpReturn
}

function vis_basic_method_load {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    if [ -f ${here}/custom-mailing.el ] ; then
        opDo emacsclient -e "(load-file \"${here}/custom-mailing.el\")"
    elif [ -f ${here}/generated-mailing.el ] ; then
        opDo emacsclient -e "(load-file \"${here}/generated-mailing.el\")"
    else
        EH_problem "Missing custom-mailing.el or generated-mailing.el"
    fi
    
    lpReturn
}




function vis_basic_method_execute {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a folder  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_basic_method_varsPrep

    if [[ "${G_forceMode}_" == "force_" ]] ; then
        opDo emacsclient -e "(mbatch-from-base-to-to \"${here}\")"
    else
        opDo emacsclient -e "(msend-from-base-to-blank \"${here}\")"
    fi
}

function vis_basic_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_basic_method_varsPrep > /dev/null
    
    printf "bluegriffon file://${here}/content.html\n"
    printf "bystarUid=${bystarUid} objectType=$( cat objectType )  http://${bystarSiteFqdn}${procPath}\n"
}

function vis_basic_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )

    ANT_cooked "folder=${here} -- See its index_html"
}


function vis_basic_method_clean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    vis_basic_method_varsPrep

    ANT_raw "===== ##### Cleaning: ${here} ##### ====="

    opDo FN_safeKeepsClean generated-mailing.el
}

function vis_basic_method_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_basic_method_clean
}


# }}}

# {{{ Object Definition (namesList)

typeset -A object_namesList=(
    [startGen]=vis_namesList_method_startGen
    [startUpdate]=vis_namesList_method_startUpdate
    [varsPrep]=vis_namesList_method_varsPrep
    [info]=vis_namesList_method_info
    [prePrep]=vis_namesList_method_prePrep
    [prep]=vis_namesList_method_prep
    [update]=vis_namesList_method_update
    [load]=vis_namesList_method_load
    [clean]=vis_namesList_method_clean
    [fullUpdate]=vis_namesList_method_fullUpdate
    [fullClean]=vis_namesList_method_fullClean
    [pubState]=vis_namesList_method_pubState
    [execute]=vis_namesList_method_execute
    [examplesMenu]=vis_namesList_method_examplesMenu
    [validate]=vis_namesList_method_validate
)

function vis_namesList_method_startGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_cooked "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[namesList]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    opDo vis_namesList_method_startUpdate "$@"

    lpReturn
}

function vis_namesList_method_startUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    opDo vis_basic_method_startUpdate "$@"

    lpReturn
}


function vis_namesList_method_varsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_varsPrep "$@"

    lpReturn
}

function vis_namesList_method_info {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_info  "$@"
}

function vis_namesList_method_prep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_namesList_method_prep_basic  "$@"
}

function vis_namesList_method_prep_basic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_basic_method_prep

    lpReturn
}


function vis_namesList_method_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_mailContentUpdate ./content.mail
}

function vis_namesList_method_load {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_load "$@"

    lpReturn
}

function vis_namesList_method_execute {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_execute "$@"
}

function vis_namesList_method_examplesMenu {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_namesList_method_varsPrep

    printf "bystarUid=${bystarUid} objectType=$( cat objectType )\n"

}

function vis_namesList_method_validate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}



function vis_namesList_method_clean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_basic_method_clean
}

function vis_namesList_method_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_namesList_method_clean
}


# }}}

# {{{ Object Definition (distribution)

typeset -A object_distribution=(
    [startGen]=vis_distribution_method_startGen
    [startUpdate]=vis_distribution_method_startUpdate
    [varsPrep]=vis_distribution_method_varsPrep
    [info]=vis_distribution_method_info
    [prePrep]=vis_distribution_method_prePrep
    [prep]=vis_distribution_method_prep
    [update]=vis_distribution_method_update
    [load]=vis_distribution_method_load
    [clean]=vis_distribution_method_clean
    [fullUpdate]=vis_distribution_method_fullUpdate
    [fullClean]=vis_distribution_method_fullClean
    [execute]=vis_distribution_method_execute
    [examplesMenu]=vis_distribution_method_examplesMenu
    [validate]=vis_distribution_method_validate
)

function vis_distribution_method_startGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_cooked "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[distribution]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    opDo vis_distribution_method_startUpdate "$@"

    lpReturn
}

function vis_distribution_method_startUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    opDo vis_basic_method_startUpdate "$@"

    # if [ -f mailBodyStart.distribution ] ; then
    #   ANT_cooked "mailBodyStart.distribution  Already exists -- Doing Nothing"
    # else
    #   opDo cp /bisos/apps/defaults/mailing/starts/mailBodyStart-en.distribution ./mailBodyStart.distribution
    # fi

    # if [ -f dblockProcess.el ] ; then
    #   ANT_cooked "dblockProcess.el  Already exists -- Doing Nothing"
    # else
    #   opDo cp /bisos/apps/defaults/mailing/starts/dblockProcess.el ./dblockProcess.el
    # fi

    lpReturn
}


function vis_distribution_method_varsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_varsPrep "$@"

    lpReturn
}

function vis_distribution_method_info {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_info  "$@"
}

function vis_distribution_method_prep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_distribution_method_prep_basic  "$@"
}

function vis_distribution_method_prep_basic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_basic_method_prep

    lpReturn
}


function vis_distribution_method_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_mailContentUpdate ./content.mail
}

function vis_distribution_method_load {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_load "$@"

    lpReturn
}

function vis_distribution_method_execute {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_execute "$@"
}

function vis_distribution_method_examplesMenu {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_distribution_method_varsPrep

    printf "bystarUid=${bystarUid} objectType=$( cat objectType )\n"

}

function vis_distribution_method_validate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
}

function vis_distribution_method_clean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    vis_distribution_method_varsPrep

    ANT_raw "===== ##### Cleaning: ${here} ##### ====="

    opDo FN_safeKeepsClean  dist-include.names
    opDo FN_safeKeepsClean  dist-exclude.names
    opDo FN_safeKeepsClean  dist-nextBatch.names
    opDo FN_safeKeepsClean  dist-result.names
    opDo FN_safeKeepsClean  dist-sentLog.names
}

function vis_distribution_method_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_distribution_method_clean
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
    [load]=vis_custom_method_load
    [clean]=vis_custom_method_clean
    [fullUpdate]=vis_custom_method_fullUpdate
    [fullClean]=vis_custom_method_fullClean
)

function vis_custom_method_startGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
First set the objectType, then do the update based on basicUpdate.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_cooked "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[custom]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    opDo vis_custom_method_startUpdate "$@"

    lpReturn
}

function vis_custom_method_startUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    typeset thisMailingName="$1"

    vis_leafThereTag ${cwd} $( vis_procFileNameGet )

    opDo commonStartFiles_startUpdate

    if [ -f ${ndoObjectTypeFileName} ] ; then
        ANT_cooked "${ndoObjectTypeFileName}  Already exists -- Doing Nothing"
    else
        thisObjectType=${ndoObjectTypeEnum[basic]}
        opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
    fi

    if [ -f ${moMailingNameFileName} ] ; then
        ANT_cooked "${moMailingNameFileName} Already exists -- Doing Nothing"
    else
        if [ "${thisMailingName}" == "path" ] ; then
            opDo eval echo "${procNamePath}" \> ${moMailingNameFileName}
        else
            opDo eval echo "${thisMailingName}" \> ${moMailingNameFileName}
        fi
    fi

    if [ -f ${moExcludeFromAutoloadFileName} ] ; then
        ANT_cooked "${moExcludeFromAutoloadFileName} Already exists -- Doing Nothing"
    else
        opDo eval echo "${moExcludeFromAutoloadEnum[default]}" \> ${moExcludeFromAutoloadFileName}
    fi

    if [ -f ${moContentMailFileName} ] ; then
        ANT_cooked "${moContentMailFileName} Already exists -- Doing Nothing"
    else
        opDo vis_mailContent_startGen
    fi

    destFilePath=${cwd}/custom-mailing.el

    FN_fileSafeKeep ${destFilePath}

    cat  > ${destFilePath}  << _EOF_
;;;
;;; RCS: \$Id
;;;
;;; Blank starting point custom mailing.
;;;
;;; This is a Machine Generated File through: ${G_myName} vis_basic_method_prep
;;; based on: ${templateFile}
;;;
_EOF_


    opDo ls -ld ${destFilePath}


    lpReturn
}

function vis_custom_method_varsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    vis_basic_method_varsPrep "$@"

    lpReturn
}


function vis_custom_method_info {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_info  "$@"
}

function vis_custom_method_prep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_custom_method_prep_basic  "$@"
}

function vis_custom_method_prep_basic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )
    bystarAcctPathAnalyze ${cwd}

    opDo vis_basic_method_prep

    lpReturn
}


function vis_custom_method_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_mailContentUpdate ./content.mail
}

function vis_custom_method_publish {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    opDo doNothing
}


function vis_custom_method_load {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_load "$@"

    lpReturn
}



function vis_custom_method_execute {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_basic_method_execute "$@"
}

function vis_custom_method_examplesMenu {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    typeset here=$( pwd )
    bystarAcctPathAnalyze ${here}

    opDo vis_custom_method_varsPrep

    printf "bystarUid=${bystarUid} objectType=$( cat objectType )\n"

}

function vis_custom_method_validate {
    G_funcEntry
    function describeF {  cat  << _EOF_
For a auxNode  pubState excludeFromNav
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_page_method_validate
}



function vis_custom_method_clean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_basic_method_clean
    inBaseDirDo  ./mailLcnt lcntProc.sh  -i  fullClean
}

function vis_custom_method_fullClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_custom_method_clean
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
 baseDir=$( pwd -P )

 pathToArray ${baseDir}

 set ${pathArray[@]}

 integer count=0
 integer acctBaseIndex=0
 relPath=""
 procPath="NIL"
 for thisElem in ${pathArray[@]} ; do
   if [[ "${thisElem}_" == "Mailings_" || 
         "${thisElem}_" == "mailings_" ||
         "${thisElem}_" == "names_"    ||
         "${thisElem}_" == "mailing_" ||               
         "${thisElem}_" == "Mailing_"  ]] ; then
       procBaseName="${thisElem}"
     acctBaseIndex=${count}
     #echo ${relPath} Got IT
     bystarAcctBase=`FN_dirsPart ${relPath}`
     #echo bystarAcctBase=${bystarAcctBase}
     bystarUid=$( FN_nonDirsPart ${bystarAcctBase} )
     procPath="TRUE"
   fi
   #echo ${thisElem}
   #echo ${count}
   count=`expr $count + 1`
   relPath="${relPath}/${thisElem}"
   if [[ ${procPath}_ != "NIL_" ]] ; then
    if [[ ${procPath}_ == "TRUE_" ]] ; then
      procPath=""
      procNamePath=""
    else
      # if [ "${thisElem}_" == "index_html_" ] ; then 
      #           doNothing
      #elif [ "${thisElem}_" != "Home_" ] ; then 
      if [ "${thisElem}_" != "Home_" ] ; then 
          procPath="${procPath}/${thisElem}"
          if [ -z ${procNamePath} ] ; then
              procNamePath="${thisElem}"
          else
              procNamePath="${procNamePath}-${thisElem}"
          fi
      fi
    fi
   fi
    #echo ${relPath}
 done

 procPath=$( FN_dirsPart ${procPath} )

 #echo procPath=${procPath}
    
 procEndPath=${pathArray[${#pathArray[@]}-1]}

 #echo procEndPath=${procEndPath}
 
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
    ANT_raw "Not the old  bystarAcctBase, ${bystarAcctBase} -- Faking Default"
    bystarSiteFqdn="default"
    bystarPasswd="default"
    bystarUid="default"
    bystarAcctType="default"
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
        echo procEndPath=${procEndPath}
        if [ "${procPath}_" == "_" ] ; then
            echo procPath="/ -- ROOT"
        else
            echo procPath=${procPath}
        fi

        if [ "${procNamePath}_" == "_" ] ; then
            echo procNamePath="/ -- ROOT"
        else
            echo procNamePath=${procNamePath}
        fi

        echo procBaseName=${procBaseName}

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
    #opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"

    # Validate specified objectType
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
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

        if [ -f ${ndoObjectTypeFileName} ] ; then
            currentObjectType=$( cat ${ndoObjectTypeFileName} )
            if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
                EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
                EH_retOnFail
            fi
        else
            opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
        fi
    else
        if [ -f ${ndoObjectTypeFileName} ] ; then
            thisObjectType=$( cat ${ndoObjectTypeFileName} )
        else
            thisObjectType=$( vis_objectTypeInCwdGuess )
            opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
        fi
    fi

    startUpdateFunc=$( eval echo '$'{object_${thisObjectType}[startUpdate]} )

    opDo ${startUpdateFunc} path

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

    typeset thisObjectType=${ndoObjectTypeEnum[nativeNode]}

    # NOTYET -- Try to better determine

    echo ${thisObjectType}

    lpReturn
}


function vis_mailingProcRenew {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    FN_fileSafeKeep  nameDistProc.sh

    opDo cp /bisos/apps/defaults/nameDist/starts/nameDistProc.sh nameDistProc.sh
    opDo vis_dblockUpdateFile nameDistProc.sh
    opDo chmod 775 nameDistProc.sh
}

function vis_objectLoadAndExecute {
     G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Based on objectType update from local to remote.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_objectLoad

    opDo vis_objectExecute

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
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[update]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}

function vis_objectExecute {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType Load from local to remote.
Load usually means Update+Surrounding/Priv
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[execute]} )

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
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
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
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[validate]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}


function vis_objectLoad {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType Load from local to remote.
Load usually means Update+Surrounding/Priv
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi
    
    updateFunc=$( eval echo '$'{object_${thisObjectType}[load]} )

    opDo ${updateFunc} "${@}"

    lpReturn
}

function vis_objectAutoLoad {
     G_funcEntry
    function describeF {  cat  << _EOF_
Based on objectType Load from local to remote.
Load usually means Update+Surrounding/Priv
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    bystarAcctPathAnalyze ${cwd}

    prepObjectVarsInCwd

    # Validate specified objectType
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
    if [ -z "${thisEnumObjectType}" ] ; then
        EH_problem "Invalid objectType=$1"
        lpReturn
    fi

    if [  "${fv_excludeFromAutoload}" == "true" ] ; then
        ANT_raw "excludeFromAutoload=true -- Excluded -- Skipped"
    else
        if [ "${thisObjectType}" != "nativeNode" ] ; then
            updateFunc=$( eval echo '$'{object_${thisObjectType}[load]} )
            opDo ${updateFunc} "${@}"
        fi
    fi

    lpReturn
}


function prepObjectVarsThere {
#set -x
  EH_assert [[ $# -eq 1 ]]

  thisPage=$1

  if [ -d ${thisPage} ] ; then
    pageName=${thisPage}
    opDo cd ${thisPage}

    prepObjectVarsInCwd "${ndoObjectTypeEnum[page]}"
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

        if [ -f ${ndoObjectTypeFileName} ] ; then
            currentObjectType=$( cat ${ndoObjectTypeFileName} )
            if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
                EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
                EH_retOnFail
            fi
        fi
    else
        if [ -f ${ndoObjectTypeFileName} ] ; then
            thisObjectType=$( cat ${ndoObjectTypeFileName} )
        else
            EH_problem "Missing ${ndoObjectTypeFileName}"
            EH_retOnFail
        fi
    fi

    varsPrepFunc=$( eval echo '$'{object_${thisObjectType}[varsPrep]} ) 

    #opDo ${varsPrepFunc} "${@}" 
    ${varsPrepFunc} "${@}" 

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

        if [ -f ${ndoObjectTypeFileName} ] ; then
            currentObjectType=$( cat ${ndoObjectTypeFileName} )
            if [ "${thisObjectType}" != "${currentObjectType}" ] ; then
                EH_problem "objectType Mis-Match -- ${thisObjectType} != ${currentObjectType}"
                EH_retOnFail
            fi
        else
            opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
        fi
    else
        if [ -f ${ndoObjectTypeFileName} ] ; then
            thisObjectType=$( cat ${ndoObjectTypeFileName} )
        else
            # NOTYET -- Try to better determine
            thisObjectType=${ndoObjectTypeEnum[page]}
            opDo eval echo "${thisObjectType}" \> "${ndoObjectTypeFileName}"
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
    thisEnumObjectType="${ndoObjectTypeEnum[${thisObjectType}]}"
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


# }}}

# {{{ Full Operations

#
# Full Manipulators
#

function vis_fullUpdate {
    typeset here=$( pwd )

    opDo vis_objectLocalPrep

    opDoExit cd ${here}

    opDo vis_objectLoad
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

    #opDo ${cleanFunc} 
    ${cleanFunc} 
}



# }}}

# {{{ lcnPlone3Gens.sh Specific Functions

function vis_emacsClientFiles {
    EH_assert [[ $# -gt 0 ]]

    typeset thisOne=""

    for thisOne in ${*} ; do
        emacsclient "${thisOne}"
    done
}


function vis_dblockUpdateFile {  # NOTYET, to be obsoleted by bx-dblock -i dblockUpdateFiles
    EH_assert [[ $# -gt 0 ]]

    typeset thisOne=""

    for each in ${*} ; do
        lpDo bx-dblock -i dblockUpdateFiles ${each}
    done
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

# {{{ Top Level Processors

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


function vis_cleanForVcUpload {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo nameDistProc.sh.gened -i cleanForVcLoad

    opDo nameDistProc.sh -v -n showRun  -i treeRecurse fullClean

    lpReturn
}

# }}}

# {{{ To Be Absorbed


function distIncludeFileName {
  # $1 fileName
  EH_assert [[ $# -eq 1 ]]

  typeset thisNamesFile=$1
  if test -f ${thisNamesFile} ; then
    includeList="${includeList} ${thisNamesFile}"
  else
    EH_problem "missing ${thisNamesFile}"
    return 1
  fi
}


function distExcludeFileName {
  # $1 fileName
  EH_assert [[ $# -eq 1 ]]

  typeset thisNamesFile=$1
  if test -f ${thisNamesFile} ; then
    excludeList="${excludeList} ${thisNamesFile}"
  else
    EH_problem "missing ${thisNamesFile}"
    return 1
  fi
}



listNamesGlobalExcludes() {
  # /usr/devenv/doc/nedaComRecs/Names/excludeBounce.names 

  dName="${namesBaseDir}"
  if test -f ${dName}/exclude.names ; then
    excludeList="${excludeList} ${dName}/exclude.names"
  fi

  if test -f ${dName}/excludeBounce.names ; then
    excludeList="${excludeList} ${dName}/excludeBounce.names"
  fi

  #echo ${includeList} ${excludeList}
}


function includeAndExcludeLists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given includeList and excludeList
List out (to stdout) all files that are to be included and excluded.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    echo "###INCLUDE LIST:" #  ${includeList}
    if [ ! -z "${includeList}" ] ; then
        for thisOne in ${includeList} ; do
            echo ${thisOne}
        done
    else
        echo "####Empty INCLUDE LIST"
    fi

    echo "###EXCLUDE LIST:" #  ${excludeList}
    if [ ! -z "${excludeList}" ] ; then
        for thisOne in ${excludeList} ; do
            echo ${thisOne}
        done
    else
        echo "####Empty EXCLUDE LIST"
    fi
}


function outputIncludeAndExcludeListsToFiles {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given includeList and excludeList
Create ${1}-include.names ${1}-exclude.names
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    contentDistDir="."

    includeNamesFilePath=${contentDistDir}/$1-include.names
    excludeNamesFilePath=${contentDistDir}/$1-exclude.names

    FN_fileSafeKeep ${includeNamesFilePath}
    FN_fileSafeKeep ${excludeNamesFilePath}

    if [ "${includeList}" != "" ] ;  then
        for thisOne in ${includeList} ; do
            echo "###BEGIN INCLUDING -- ${thisOne}" >>  ${includeNamesFilePath}
            cat ${thisOne} >>  ${includeNamesFilePath}
            echo "###END INCLUDING -- ${thisOne}" >>  ${includeNamesFilePath}
        done
    else
        touch ${includeNamesFilePath}
    fi

    if [ "${excludeList}" != "" ] ;  then
        for thisOne in ${includeList} ; do
            echo "###BEGIN EXCLUDING -- ${thisOne}" >>  ${excludeNamesFilePath}
            cat ${thisOne} >>  ${excludeNamesFilePath}
            echo "###END EXCLUDING -- ${thisOne}" >>  ${excludeNamesFilePath}
        done
    else
        touch ${excludeNamesFilePath}
    fi
    
    opDo ls -l ${includeNamesFilePath} ${excludeNamesFilePath} 1>&2
}

function vis_namesOutputListWith {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1+=listFunc
Based on listFunc, list out files to be included or excluded.
_EOF_
    }

    typeset namesListGenCommand=""

    if [ $# -gt 0 ] ; then
        namesListGenCommand="$@"
    else
        EH_problem "Bad Number Of Args: $#"
        lpReturn 101
    fi

    if [ "${namesListGenCommand}" != "" ] ; then
        echo "Running: ${namesListGenCommand}"
        ${namesListGenCommand} 
    else
        EH_problem "Blank namesListGenCommand -- $0: skipped"
        lpReturn 101
    fi

    includeAndExcludeLists
    
    lpReturn
}


function vis_namesOutputToFilesWith {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=tag (includeExcludeTag), $2+=listFunc
Based on listFunc, create tag-include.names and tag-exclude.names
_EOF_
    }

    typeset namesListGenCommand=""

    if [ $# -gt 1 ] ; then
        outFileTag=$1
        shift
        namesListGenCommand="$@"
    else
        EH_problem "Bad NUmber Of Args: $#"
        lpReturn 101
    fi

    if [ "${namesListGenCommand}" != "" ] ; then
        echo "Running: ${namesListGenCommand}"
        ${namesListGenCommand} 
    else
        EH_problem "Blank namesListGenCommand -- $0: skipped"
        lpReturn 101
    fi

    outputIncludeAndExcludeListsToFiles ${outFileTag}
    
    lpReturn
}


function vis_namesOutputToFilesWithAndResult {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=tag (includeExcludeTag), $2+=listFunc
namesOutputToFilesWith + namesResultFor
_EOF_
    }

    opDo vis_namesOutputToFilesWith $@

    opDo vis_namesResultFor $1

    lpReturn
}



function vis_namesResultFor {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=tag (includeExcludeTag)
Assumes vis_namesOutputToFilesWith has run before and 
includeExcludeTag="$1" -- ${includeExcludeTag}-include.names ${includeExcludeTag}-exclude.names
are in place.
Combines those to produce ${includeExcludeTag}-result.names
If $1=dist, then dist-sentLog.names is assumed to be in place and is used as an exclude.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset includeExcludeTag="$1"

    distBaseDir=.  

    contentDistDir=${distBaseDir}
    contentDistKeepDir=${distKeepBaseDir}

    includeList=""
    excludeList=""

    # BEGIN includeList
    thisFile=${contentDistDir}/${includeExcludeTag}-include.names
    if test -f ${thisFile} ; then
        includeList="${includeList} ${thisFile}"
    else
        echo "Missing ${thisFile}" 1>&2
    fi
    
    thisFile=${contentDistDir}/specials-include.names 
    
    if test -f ${thisFile} ; then
        includeList="${includeList} ${thisFile}"
    else
        echo "Missing ${thisFile}" 1>&2
    fi
    # END includeList


    # BEGIN excludeList
    thisFile=${contentDistDir}/${includeExcludeTag}-exclude.names
    if test -f ${thisFile} ; then
        excludeList="${excludeList} ${thisFile}"
    else
        echo "Missing ${thisFile}"
    fi

    thisFile=${contentDistDir}/specials-exclude.names 

    if test -f ${thisFile} ; then
        excludeList="${excludeList} ${thisFile}"
    else
        echo "Missing ${thisFile}" 1>&2
    fi

    thisFile=${contentDistDir}/dist-sentLog.names
    if test -f ${thisFile} ; then
        excludeList="${excludeList} ${thisFile}"
    else
        echo "Missing ${thisFile}" 1>&2
    fi
    # END excludeList


    if [ "${includeList}" != "" ] ;  then
        #ANT_raw "Watch For case conversion -- Notyet"
        cat ${includeList} |  /usr/bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-include.sorted
    fi

    if [ "${excludeList}" != "" ] ;  then
        #ANT_raw "Watch For case conversion -- Notyet"
        ANT_raw "excludeList=${excludeList}"
        cat ${excludeList} | /usr/bin/tr   "[:upper:]" "[:lower:]" | sort | uniq > ${contentDistDir}/${dateTag}-exclude.sorted
    fi

    typeset resultFileName=${contentDistDir}/${includeExcludeTag}-result.names

    FN_fileSafeKeep ${resultFileName}

    opDo eval comm -3 -2 ${contentDistDir}/${dateTag}-include.sorted ${contentDistDir}/${dateTag}-exclude.sorted \| egrep -v '^#' \> ${resultFileName}
  
    opDo ls -l ${resultFileName} 1>&2

    #cat ${contentDistDir}/dist-nextBatch.names

    #opDo 
    /bin/rm ${contentDistDir}/${dateTag}-include.sorted ${contentDistDir}/${dateTag}-exclude.sorted
}

####
####  dist Layer On Top Of namesOutput  BIGINS
####

function vis_distPrepWith {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1+=listFunc
distNamesOutputWith + logsToNames + distNextBatch 
= namesOutputToFilesWithAndResult dist vis_examplesAndTests
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    opDoComplain vis_distNamesOutputToFileWith $@
    opDoComplain vis_logsToNames
    opDoComplain vis_distNextBatch
}

function vis_distNamesOutputToFileWith {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1+=listFunc
Based on listFunc, list out files to be included or excluded
_EOF_
    }

    vis_namesOutputToFilesWith dist $@

    lpReturn
}

function vis_mailingNamesGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -f "mailingNames.fv" ] ; then
        cat mailingNames.fv
    else
        EH_problem "Missing mailingNames.fv"
    fi

    lpReturn

    echo "OBSOLETED"
    typeset here=$( pwd -P )
    bystarAcctPathAnalyze ${here}

    typeset thisBase=$( pwd -P ) 
    typeset thisBaseName=$( FN_nonDirsPart ${thisBase} )

    while [ "${thisBaseName}" != "${procBaseName}" ] ; do
        cd ..
        thisBase=$( pwd -P ) 
        thisBaseName=$( FN_nonDirsPart ${thisBase} )

        if [ -f "./mailingName" ] ; then
            cat ./mailingName
            break
        fi
        #echo ${thisBase}
    done

    cd ${here}

    lpReturn
}



function vis_logsToNames {

    #msendLogsFile="/usr/devenv/bbdbNames/Logs/bbdb-msend.sent"
    #msendLogsFile="/acct/employee/lsipusr/BUE/mailings/logs/mailings.sent"
    msendLogsFile="/bxo/usg/bystar/bpos/usageEnvs/fullUse/blee/mailings/logs/mailings.sent"

    typeset mailingDistTag=$( vis_mailingNamesGet )

    if [ -z "${mailingDistTag}" ] ; then
        EH_problem "Missing Or Empty mailingDistTag"
        lpReturn 101
    fi

    logSentFilePath="dist-sentLog.names"
    
    opDo eval /bin/egrep '^[0-9]*:'"${mailingDistTag}" ${msendLogsFile} \> /tmp/${G_myName}.$$ 


    if [ -s /tmp/${G_myName}.$$  ] ;  then
        cat /tmp/${G_myName}.$$ | cut -d: -f4 > ${logSentFilePath}
        opDo ls -l $( pwd )/${logSentFilePath}  
        opDo wc ${logSentFilePath}      
    else
        echo "Empty Logs: ${mailingDistTag}"
    fi
    /bin/rm /tmp/${G_myName}.$$
}


function vis_distNextBatch {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    opDo vis_namesResultFor dist
}


function vis_bbdbNamesInput {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create a folder on remote.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset namesListFile=$1

    if [ -f ${namesListFile} ] ; then
        opDo emacsclient -e "(bx-bbdb-names-input-from-file \"${namesListFile}\")"
    else
        EH_problem "Missing ${namesListFile}"
    fi
    
    lpReturn
}


function vis_examplesAndTests {
    G_funcEntry
    function describeF {  cat  << _EOF_
Just used as an example.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    distIncludeFileName ~/BUE/names/examplesAndTests/examples.names
    distIncludeFileName ~/BUE/names/examplesAndTests/tests.names

    listNamesGlobalExcludes

    lpReturn
}

###
###  #########   2023 Updates  #####
###

function vis_fileVarsUpdateOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }
    local mailingFileName=$(vis_mailingFileName)
    local mailingName=$(vis_mailingNameOfFile "${mailingFileName}")

    lpDo eval echo ${mailingFileName} \> mailingFileName.fv
    lpDo eval echo ${mailingName} > mailingName.fv
}


function vis_fileVarsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }
    local mailingFileNames=$(vis_mailingFileNames)
    local mailingNames=""
    for each in ${mailingFileNames} ; do
        mailingNames=${mailingNames}$(vis_mailingNameOfFile "${each}")" "
    done

    lpDo eval echo ${mailingFileNames} \> mailingFileNames.fv
    lpDo eval echo ${mailingNames} \> mailingNames.fv
}


function vis_resultNamesAsAddrRecipsAndSelect {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }

    local thisEmacsClient=$( vis_thisEmacsClient )

    lpDo ${thisEmacsClient} -e  "(b:mtdt:names|recipsAddrConvertFileAndSelect :inFile \"./dist-result.names\")"
}

function vis_mtdtSelectRecips {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local recipsFileName="$1"
    local thisEmacsClient=$( vis_thisEmacsClient )

    lpDo ${thisEmacsClient} -e  "(b:mtdt:distr|recipsFormsFileSelect  \"${recipsFileName}\")"
}

function vis_mtdtSelectMailing {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }
    local mailingFileNames=$( cat mailingFileNames.fv )

    local thisEmacsClient=$( vis_thisEmacsClient )

    lpDo ${thisEmacsClient} -e  "(b:mtdt:derive/fromFilesAndSelect  \"${mailingFileNames}\")"
}



# }}}

# {{{ Un Used Functions -- Obsoleted
  

# }}}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: shellscript-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

