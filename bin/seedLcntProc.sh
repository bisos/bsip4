#!/bin/bash

IcmBriefDescription="Seed For Processing LCNT."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedLcntProc.sh,v 1.51 2020-03-02 17:25:47 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/seedLcntProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || TODOs     ::  Status, Notes, Todos    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_


** TODO [#A] Capture as template and include in begin and start. etc.
   SCHEDULED: <2019-07-25 Thu>
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntModel/fullUsagePanel-en.org::seedLcntProc.sh][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Imports   ::  Prefaces (Imports/Libraries)    [[elisp:(org-cycle)][| ]]
_CommentEnd_

# NOTYET unbound var
lcnt_docSrcList=""
lcnt_lcntNu=""
lcnt_shortTitle=""


. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/lcnLcntLib.sh
. ${opBinBase}/lcnLcntBuildLib.sh
. ${opBinBase}/lcnLcntExportLib.sh


# PRE parameters

baseDir=""

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || G-        ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
  TM_trace 9 "G_postParamHook"


  isDirsProcessor || lcntInfoPrep `pwd`

  # Runs customesed hooks here for all actions.
  vis_buildPre
  
  lcntProcType=regular

  docsList=""

  destUrls=""

  ### Auto Selections Below ###

  docsList=""
  typeset thisDoc
  for thisDoc in ${lcnt_docSrcList} ; do
    docsList="${docsList} ${thisDoc}.${lcnt_contentSrcFormat}"
  done
  #echo ${docsList}

  if  ! isDirsProcessor  ; then 
      lcntNuBaseVerifyAndFix `pwd`
      case ${lcnt_contentSrcFormat} in
	  "odp")
	      formatsStr="genHtml+pdf"
	      docPublishLine=""
	      typeset thisDoc
	      for thisDoc in ${lcnt_docSrcList} ; do
		  docPublishLine="${docPublishLine} ${thisDoc}:${formatsStr}"
	      done
	      ;;
	  "ttytex")
	   #formatsStr="html+pdf+ps"
	      formatsStr="${lcnt_pubFormats}"
	      docPublishLine=""
	      typeset thisDoc
	      for thisDoc in ${lcnt_docSrcList} ; do
		  docPublishLine="${docPublishLine} ${thisDoc}:${formatsStr}"
	      done
	      ;;
	  "pdf"|"tar")
	      doNothing
	      ;;
	  *)
	      EH_problem "${lcnt_contentSrcFormat} -- Unexpected"
	      return
	      ;;
      esac
  fi

  #bueAcctCurrent=$( bueAcctCurrent.sh -i currentAssociatedShow )
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  noArgsHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function noArgsHook {
    local args="$@"
    local eachArg=""

    if [ -z "${args}" ] ; then
	vis_groupingExamples
    fi

    for eachArg in ${args} ; do
	case ${eachArg} in
	    common|seed)
		visLibExamplesOutput ${G_myName} ${extraInfo}
		;;
	    build)         # Build, release, export
		vis_buildExamples
		;;
	    maintenance|maintain)	    
		vis_maintenanceExamples
		;;
	    convert)	    
		vis_convertExamples
		;;
	    "export")         # Build, release, export
		vis_exportExamples
		;;
	    examples)         # Build, release, export
		vis_examples
		;;
	    refresh|config|init|renew)   # initial dblock, LCNT-INFO editing
		vis_configExamples
		;;
	    dev)           # build and clean-up and 
		vis_devExamples
		;;
	    mm)            # Multi-Media
		vis_buildExamples
		;;
	    *)
		EH_problem "unknown examples grouping -- arg: ${eachArg}"
		#vis_examples		
	esac
    done
    hookRun "examplesHookPost"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] Example Groups                          :: /* Grouping Of Examples */ |
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_groupingExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_groupingExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

 cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Groupings Based Examples" )
lcntNu=${lcnt_lcntNu}  -- shortTitle="${lcnt_shortTitle}"
$( examplesSeperatorChapter "Seed Based Common Features" )
${G_myName} seed                # describe, visit, gotoPanel
$( examplesSeperatorChapter "Old Traditional Examples" )
${G_myName} examples
$( examplesSeperatorChapter "Configurations -- Initial Setup -- Refresh" )
${G_myName} config              # Initialize, Configure, Refresh/Renew, Select Current
$( examplesSeperatorChapter "Templates Maintenance And Conversions" )
${G_myName} maintain            # Stay in sync with lcntProc.sh, xxEnFa.ttytex and bodyXx.tex
${G_myName} convert             # Convert to and from LaTeX
$( examplesSeperatorChapter "Full Actions" )
${G_myName} full
$( examplesSeperatorChapter "Recurse Based On FTOs" )
${G_myName} recurse
$( examplesSeperatorChapter "Multi-Media Setup" )
${G_myName} mm
$( examplesSeperatorSection "Audio" )
${G_myName} audio
$( examplesSeperatorChapter "Develop" )
${G_myName} dev                # Review warning logs, cleanup, step-by-step builds, debug
${G_myName} ${extraInfo}  -i fullClean
$( examplesSeperatorChapter "Build" )
${G_myName} build              # build, build+view, build+release
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur
$( examplesSeperatorChapter "Export After Building" )
${G_myName} export            
_EOF_

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {

  typeset extraInfo="-v -n showRun"
  #typeset extraInfo=""
  typeset oneDoc=`echo ${docsList} | cut -d ' ' -f 1 `
  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
  bystarUid=${lcnt_bystarUid}
  #typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
  #typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`


  # NOTE WELL buildPre is done when you run examples
  vis_buildPre

  # NOTYET, TODO, needs to be modernized based on
  # the following:
  #visLibExamplesOutput ${G_myName} 
  #$( examplesSeperatorTopLabel "${G_myName}" )
  #$( examplesSeperatorChapter "Chapter Title" )
  #$( examplesSeperatorSection "Section Title" )


 cat  << _EOF_
EXAMPLES:
${visLibExamples}
${G_myName} ${extraInfo}  -i help
--- Info lcntNu To Stdout (dirsRecurse for global database) ---
${G_myName} ${extraInfo}  -i lcntNuOut
${G_myName} ${extraInfo}  -i dirsRecurse lcntNuOut
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i lcntInfoReport
--- Initialize / Re-Initial Content Parameters ---
${G_myName} ${extraInfo} -i editLcntInfo mainTitle shortTitle subTitle subSubTitle description
_EOF_
dblockExpandLines
 cat  << _EOF_
--- Recurse Dirs (Local) ---
${G_myName} ${extraInfo}  -i dirsRecurse fullClean
${G_myName} ${extraInfo}  -i dirsRecurse fullRefresh
${G_myName} ${extraInfo}  -i dirsRecurse dblockUpdateFile
${G_myName} ${extraInfo}  -i dirsRecurse fullBuild
${G_myName} ${extraInfo}  -i dirsRecurse localContentPrep
${G_myName} ${extraInfo}  -i dirsRecurse fullUpdate
${G_myName} ${extraInfo}  -i dirsRecurse "runFunc lcnLcntGens.sh -n showRun -p cntntRawHome=. -i lcntInfoRenew"
${G_myName} ${extraInfo}  -i dirsRecurse "runFunc lcnLcntGens.sh -n showRun -p cntntRawHome=. -i lcntInfoRenewCustomize"
--- Plone3 dirsRecurse (Publish / External) ---
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i dirsRecurse plone3ContentPublish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i dirsRecurse plone3AccessPagePublish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i dirsRecurse plone3Publish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i dirsRecurse plone3FullPublish
--- Plone2.5 dirsRecurse (Publish / External) ---
${G_myName} ${extraInfo}  -i dirsRecurse fullPublish
${G_myName} ${extraInfo}  -i dirsRecurse plone3PublishDestUrls
--- FULL MANIPLATORS (Local) ---
${G_myName} ${extraInfo} -i  lcntPrep
${G_myName} ${extraInfo} -i  fullBuild   # Builds/Process all formats
${G_myName} ${extraInfo} -i  fullUpdate  # fullBuild + localContentPrep
${G_myName} ${extraInfo} -i  fullFast
lcnLcntGens.sh -n showRun -i lcntNodeRefresh # Updates lcntProc.sh and _tree_ info
${G_myName} ${extraInfo} -i  fullRefresh # Updates data in LcntDir to latest templates
lcnLcntGens.sh -n showRun -p cntntRawHome=. -p srcForms="" -p srcLangs="" -i lcntBaseConfigMulti # Updates .ttytex files to latest templates
${G_myName} ${extraInfo} -i  fullClean   # Restores LcntDir to CVS state
--- Documents List ---
${G_myName} ${extraInfo} -i  docsList
${G_myName} ${extraInfo} -i  figuresList     # png files from beamerExternalExtensions.py for rsyncUpload
${G_myName} ${extraInfo} -i  \$( lcntProc.sh -i  docsList | head -1 )
${G_myName} ${extraInfo} -i getPresentationSrcFile .
${G_myName} ${extraInfo} -i getArticleSrcFile .
${G_myName} ${extraInfo} -i getPresArtSrcFile .
--- Videoed Frames Recording And Delivery ---
${G_myName} ${extraInfo} -i dispositionTypePrep oneSlideDispose   # For pdf printing
${G_myName} ${extraInfo} -i dispositionTypePrep slidesDispose     # For Recording
${G_myName} ${extraInfo} -i dispositionTypePrep videoedDispose   # For reveal.js Final delivery
${G_myName} ${extraInfo} -i frameBody labelAsFileName.tex   # 
---
_EOF_
docsListBuildLines
cat  << _EOF_
--- SPECIFIC DOC MANIPULATORS ---
${G_myName} ${extraInfo} -i  buildPre
_EOF_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  contentProcMenu    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function contentProcMenu {
  isDirsProcessor && return $?

 docsListCmdLines

 local plpdCategory="plpc"
 typeset plpdNu=`cat ./LCNT-INFO/lcntNu`

 extraInfo="-v -n showRun"

cat  << _EOF_
--- ReadyRoom Processing (local /content eupdates) ---
${G_myName} ${extraInfo} -i  localContentPrep # Generate accessPage ... + Copy results of fullBuild to /content
lcnLcntOutputs.sh ${extraInfo} -i readyRoomCleanDir  "${plpdCategory}-${plpdNu}"
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i plone3ContentPublish  # Publish From ReadyRoom
--- WEB PUBLISH DOCUMENT ---
${G_myName} ${extraInfo} -i webUpload
${G_myName} ${extraInfo} -i webPublish
--- WEB Plone3 PUBLISH DOCUMENT ---
${G_myName} ${extraInfo} -i plone3UpdateAndPublishDestBxUids
${G_myName} ${extraInfo} -i plone3PublishDestBxUids
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i plone3Publish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i plone3AccessPagePublish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i plone3FullPublish  # localContentPrep + plone3Publish
-----
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i accessPageBxoGen
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i apachePublish
${G_myName} ${extraInfo} -p bystarUid=${bystarUid} -i plone3ApacheFullPublish
--- FULL SERVICE ---
${G_myName} ${extraInfo} -i fullPublish
${G_myName} ${extraInfo} -i fullVerify
$( examplesSeperatorChapter "mmDoc and mmUnite Preps" )
${G_myName} ${extraInfo} -i mmDocPrep      # Prepare LCNT's environment (symlinks setup)
${G_myName} ${extraInfo} -i mmUniteStart   # Auto Generate Audio/Video Inputs
${G_myName} ${extraInfo} -i mmUnitePrep    # Auto Generate Audio/Video Inputs
${G_myName} ${extraInfo} -i mmUniteGens    # Auto Generate Audio/Video Inputs
${G_myName} ${extraInfo} -i mmUniteClean   # Clean Auto Generated Audio/Video Inputs
--- DEVELOPMENT MODE ---
${G_myName} ${extraInfo} -i startDisposition
${G_myName} ${extraInfo} -i devExamples
${G_myName} ${extraInfo} -i word2latexWithPandoc articleEnFa
${G_myName} ${extraInfo} -i latex2word articleEnFa
(setq LaTeX-command "lcntProc.sh  -i  fullBuild")
--- Writers Work Bench (diction, style) ---
${G_myName} ${extraInfo} -i writersWorkBechExamples
$( examplesSeperatorChapter "Local Build Results Release" )
$( ls -l ./curBuild )
${G_myName} ${extraInfo} -i lcntBuildInfo
$( vis_lcntBuildDefaultCommand )
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild all
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild dev
${G_myName} ${extraInfo} -i lcntBuildExamples
$( examplesSeperatorChapter "Export -- Build And Export" )
$( ls -l ./curExport )
${G_myName} ${extraInfo} -i lcntExportInfo
${G_myName} ${extraInfo} -i lcntExport all
${G_myName} ${extraInfo} -i lcntExport cur
${G_myName} ${extraInfo} -i lcntExportExamples
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuildAndExport all
${G_myName} ${extraInfo} -p extent="build+release -i lcntBuildAndExport cur
${G_myName} ${extraInfo} -i lcntBuildExportExamples
$( examplesSeperatorChapter "Presentation / Disposition Processing" )
./presProc.sh   # NOTYET, Figure This Out
$( examplesSeperatorChapter "Initial Templates Development" )
${G_myName} ${extraInfo} -i templatesDevelopment
${G_myName} ${extraInfo} -i lcntProcDevelopment
_EOF_
}
  
  contentProcMenu

  reActivateExample

  hookRun "examplesHookPost"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  reActivateExample    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function reActivateExample {
    if ( lcntGetActivation > /dev/null 2> /dev/null ) ; then
	lpReturn
    fi

cat  << _EOF_
---- Re-Activate (Currently Deactivated) ----
echo "activated" > ./LCNT-INFO/activation
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_devExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_devExamples {
 typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
 typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

cat  << _EOF_
--- Step By Step for Developers  ---
lcnLcntUpload.sh -n showRun -i obtainFiles "${plpdCategory}-${plpdNu}"
lcnLcntOutputs.sh -n showRun -i accessPageGen "${plpdCategory}-${plpdNu}"
--- Temp, Obsoleted or Junk ---
${G_myName} ${extraInfo}  -i dirsRecurse lcntDirsProcClean
--- Verifications ---
grep 'Latex Warning' articleEnFa.log
--- BIBIO OUTPUT ---
${G_myName} ${extraInfo}  -i dirsRecurse bibOut
${G_myName} ${extraInfo}  -i lcntNuUpdate
${G_myName} ${extraInfo} -i dirsRecurse bibOutPerLcnt
--- Activation Control ---
echo "activated" > ./LCNT-INFO/activation
echo "deactivated" > ./LCNT-INFO/activation
echo "doNotPublish" > ./LCNT-INFO/activation
echo "private" > ./LCNT-INFO/activation
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  writersWorkBenchExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function writersWorkBenchExamples {

cat  << _EOF_
NOTYET
_EOF_
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_maintenanceExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_maintenanceExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    
    extraInfo="-v -n showRun"

    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Maintenance Activity Groupings -- Remain In Sync With Current Templates" )
$( examplesSeperatorChapter ".ttytex Maintenance" )
${G_myName} ${extraInfo}  -i templatesDevelopment
$( examplesSeperatorChapter "lcntproc.sh Maintenance" )
${G_myName} ${extraInfo}  -i lcntProcDevelopment
_EOF_
    
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_convertExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_convertExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    
    extraInfo="-v -n showRun"

    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Convert To And From LaTeX" )
$( examplesSeperatorChapter "To LaTeX Converters" )
${G_myName} ${extraInfo}  -i word2latexWithPandoc fileBaseName   # expects a .docx
${G_myName} ${extraInfo}  -i word2latexWithHtml fileBaseName     # expects a .html
$( examplesSeperatorChapter "From LaTeX Converters" )
${G_myName} ${extraInfo}  -i latex2word articleEnFa  # Using pandoc --  expects a .ttytex
${G_myName} ${extraInfo}  -i latex2markdown articleEnFa   # Using pandoc --  expects a .ttytex
_EOF_
    
    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_configExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_configExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    
    local extraInfo="-v -n showRun"

    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Refresh Activity Groupings" )
$( examplesSeperatorChapter "Adjust Doc Srcs" )
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i adjustDocSrcs pres       # NOTYET, edit docSrcList, edit artSrcFile, etc
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i adjustDocSrcs art        # NOTYET, move articleEnFa.ttytex and bodyArtxx
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i adjustDocSrcs art+pres   # NOTYET 
$( examplesSeperatorChapter "Refresh/Renew LCNT-INFO base to latest" )
${G_myName} ${extraInfo}  -p cntntRawHome=. -i lcntInfoFullRenew    # Includes all of below
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i lcntInfoRenew        # Modernizes LCNT-INFO -- harmless -- non-intrusive
${G_myName} ${extraInfo}  -p cntntRawHome=. -i lcntBuildInfoGens    # Adds LCNT-INFO/Builds
${G_myName} ${extraInfo}  -p cntntRawHome=. -i lcntExportInfoGens   # Adds LCNT-INFO/Exports
$( examplesSeperatorTopLabel "${G_myName} :: Config Activity Groupings" )
$( examplesSeperatorChapter "Config LCNT-INFO Base to latest" )
$( examplesSeperatorSection "Info lcntNu To Stdout" )
${G_myName} ${extraInfo}  -i lcntNuOut   # $( ${G_myName} -i lcntNuOut )
lcnLcntGens.sh -n showRun -p cntntRawHome=. -i lcntInfoReport
$( examplesSeperatorSection "Initialize / Re-Initial Content Parameters" )
${G_myName} ${extraInfo} -i editLcntInfo mainTitle shortTitle subTitle subSubTitle description
_EOF_

    dblockExpandLines
    cat  << _EOF_
$( examplesSeperatorChapter "curBuild Points To: -- Set it to:" )
$( ls -l ./curBuild )
$( examplesSeperatorSection "lcntBuild Set Current" )
$( listLcntBuildSetCur )
$( examplesSeperatorSection "lcntExport Set Current" )
$( listLcntExportSetCur )
_EOF_
    
    lpReturn
}


function listLcntBuildCommands {
    EH_assert [[ $# -eq 1 ]]
    local specifiedExtent=$1
    local inFilesList=""
    local inFile=""
    #inFilesList=$( vis_enabledBuildsDirsList )
    inFilesList=$( vis_buildsDirsList )
    for inFile in ${inFilesList}; do
	echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntBuild ${inFile}
    done
}

function listLcntBuildCommands {
    EH_assert [[ $# -eq 1 ]]
    local specifiedExtent=$1
    local inFilesList=""
    local inFile=""
    
    #inFilesList=$( vis_enabledBuildsDirsList )
    inFilesList=$( vis_buildsDirsList )
    for inFile in ${inFilesList}; do
	echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntBuild ${inFile}
    done
}


function listLcntBuildSetCur {
    local inFilesList=""
    local inFile=""
    #inFilesList=$( vis_enabledBuildsDirsList )
    inFilesList=$( vis_buildsDirsList )
    for inFile in ${inFilesList}; do
	echo ${G_myName} ${extraInfo} -i lcntBuildSetCur ${inFile}
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_buildExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    local extraInfo="-v -n showRun"
    local inFilesList=""
    local inFile=""

   
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Build Activity Groupings" )
$( examplesSeperatorChapter "Build+View Available buildSpecs" )
$( listLcntBuildCommands build+view )
$( examplesSeperatorChapter "Build+Release Available buildSpecs" )
$( listLcntBuildCommands build+release )
$( examplesSeperatorChapter "curBuild Points To: -- Set it to:" )
$( ls -l ./curBuild )
$( examplesSeperatorSection "lcntBuild Set Current" )
$( listLcntBuildSetCur )
$( examplesSeperatorChapter "Running lcntBuild to just build" )
${G_myName} ${extraInfo} -p extent="build" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Running lcntBuild And View" )
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Running lcntBuild And Release" )
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Build Info" )
${G_myName} ${extraInfo} -i lcntBuildInfo
ls -l ./curBuild; grep . ./curBuild/*
cat ./LCNT-INFO/Builds/enabledList
find  ./LCNT-INFO/Builds -type f -print | grep -v '~' | xargs grep .
$( examplesSeperatorChapter "Export Info" )
${G_myName} ${extraInfo} -i lcntExportInfo
ls -l ./curExport; grep . ./curExport/*
cat ./LCNT-INFO/Exports/enabledList
find  ./LCNT-INFO/Exports -type f -print | grep -v '~' | xargs grep .
_EOF_
    
    lpReturn
}


function listLcntExportSetCur {
    local inFilesList=""
    local inFile=""
    #inFilesList=$( vis_enabledExportsDirsList )
    inFilesList=$( vis_exportsDirsList )
    if [ -z "${inFilesList}" ] ; then
	EH_problem "Missing results from vis_exportsDirsList -- consider running lcnLcntGens.sh -i lcntExportInfoGens"
	lpReturn
    fi
    for inFile in ${inFilesList}; do
	echo ${G_myName} ${extraInfo} -i lcntExportSetCur ${inFile}
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_exportExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_exportExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    extraInfo="-v -n showRun"
    local inFilesList=""
    local inFile=""

    function listLcntBuildCommands {
	EH_assert [[ $# -eq 1 ]]
	local specifiedExtent=$1
	#inFilesList=$( vis_enabledBuildsDirsList )
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntBuild ${inFile}
	done
    }

    function listLcntBuildSetCur {
	#inFilesList=$( vis_enabledBuildsDirsList )
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -i lcntBuildSetCur ${inFile}
	done
    }

    
    function listLcntExportCommands {
	EH_assert [[ $# -eq 1 ]]
	local specifiedExtent=$1
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntExport ${inFile}
	done
    }

    function listLcntExportSetCur {
	#inFilesList=$( vis_enabledExportsDirsList )
	inFilesList=$( vis_exportsDirsList )
	if [ -z "${inFilesList}" ] ; then
	    EH_problem "Missing results from vis_exportsDirsList -- consider running lcnLcntGens.sh -i lcntExportInfoGens"
	    lpReturn
	fi
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -i lcntExportSetCur ${inFile}
	done
    }

    
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Export Activity Groupings" )
$( examplesSeperatorChapter "curBuild/curExport Points To: -- Set it to:" )
$( ls -l ./curBuild )
$( ls -l ./curExport )
$( examplesSeperatorSection "lcntBuild Set Current" )
$( listLcntBuildSetCur )
$( examplesSeperatorSection "lcntExport Set Current" )
$( listLcntExportSetCur )
$( examplesSeperatorChapter "Running lcntBuild And View" )
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Running lcntBuild And Release" )
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Running lcntExport And Release" )
${G_myName} ${extraInfo} -i lcntExport all          # Using enabled list
${G_myName} ${extraInfo} -i lcntExport cur
$( examplesSeperatorChapter "Running Build+Release+Export" )
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuildAndExport all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuildAndExport cur
$( examplesSeperatorChapter "Build Info" )
${G_myName} ${extraInfo} -i lcntBuildInfo
ls -l ./curBuild; grep . ./curBuild/*
cat ./LCNT-INFO/Builds/enabledList
find  ./LCNT-INFO/Builds -type f -print | grep -v '~' | xargs grep .
$( examplesSeperatorChapter "Export Info" )
${G_myName} ${extraInfo} -i lcntExportInfo
ls -l ./curExport; grep . ./curExport/*
cat ./LCNT-INFO/Exports/enabledList
find  ./LCNT-INFO/Exports -type f -print | grep -v '~' | xargs grep .
_EOF_
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* Module Common Facilities */ |
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  g_myInit    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function g_myInit {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset retVal=0

    lcntGetActivation > /dev/null
    retVal=$?

    lpReturn ${retVal}
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntInfoFullRenew    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoFullRenew {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${cntntRawHome}" ] ; then
	cntntRawHome=.
    fi

    opDo lcnLcntGens.sh -n showRun -p cntntRawHome="${cntntRawHome}" -i lcntInfoRenew 

    opDo vis_lcntBuildInfoGens

    opDo vis_lcntExportInfoGens

    if [ -d ./LCNT-INFO/Builds/art-8.5x11 ] ; then
	opDo vis_lcntBuildSetCur ./LCNT-INFO/Builds/art-8.5x11
    elif [ -d ./LCNT-INFO/Builds/presPdf ] ; then	
	opDo vis_lcntBuildSetCur ./LCNT-INFO/Builds/presPdf
    else
	EH_problem "Missing  presPdf or art-8.5x11 in ./LCNT-INFO/Builds"
    fi

    opDo vis_lcntExportSetCur ./LCNT-INFO/Exports/ploneProc       
    
    lpReturn
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_dblockApplicableFiles    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_dblockApplicableFiles {
  vis_prep
  typeset thisOne=""

  typeset expectedFiles="
memoEn.ttytex
memoEnFa.ttytex
memoFaEn.ttytex
articleEn.ttytex
articleEnFa.ttytex
articleFaEn.ttytex
presentationEn.ttytex
presentationEnFa.ttytex
presentationFaEn.ttytex
presArtEnFa.ttytex
artPresBodyEn.tex
artPresBodyEnFa.tex
artPresBodyFaEn.tex
articleBodyEnFa.tex
"

  for thisOne in ${expectedFiles} ; do
      if [ -f ${thisOne} ] ; then
	  echo "${thisOne}"
      fi
  done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lcntIsPublishable    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntIsPublishable {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset retVal=0
    typeset activation

    activation=$( lcntGetActivation )

    if [ "${activation}" == "private" -o "${activation}" == "doNotPublish" ] ; then
	ANT_raw "LCNT IS NOT PUBLISHABLE: ${G_myName}:${G_thisFunc}:$LINENO"
	retVal=1
    fi

    lpReturn ${retVal}
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lcntIsPrivate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntIsPrivate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset retVal=0
    typeset activation

    activation=$( lcntGetActivation )

    if [ "${activation}" == "private" ] ; then
	ANT_raw "LCNT IS PRIVATE (NOT PUBLISHABLE): ${G_myName}:${G_thisFunc}:$LINENO"
	retVal=1
    fi

    lpReturn ${retVal}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lcntGetActivation    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntGetActivation {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset retVal=0

    if [ -f "./LCNT-INFO/activation" ] ; then
	typeset activation=$( cat ./LCNT-INFO/activation )
	case ${activation} in
	    "deactivated")       # Don't do anything
		ANT_raw "DeActivated: ${G_myName}:${G_thisFunc}:$LINENO"
		retVal=1
		;;
	    "activated")
		retVal=0
		;;
	    "doNotPublish")       # Don't push to website
		retVal=0
		;;
	    "private")            # Only Build. Don't copy to ReadyRoom
		retVal=0
		;;
	    *)
		EH_problem "Unexpected Value: activation=${activation}"
		activation="bad"
		retVal=101
		;;
	esac
    else
	activation="activated"
	retVal=0
    fi

    echo "${activation}"

    lpReturn ${retVal}
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_dispositionTypePrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_dispositionTypePrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local dispositionType="$1"

    opDo FN_dirCreatePathIfNotThere ./Control/dblocks.el

    case ${dispositionType} in 
      "oneSlideDispose")    # For pdf printing
	   doNothing
	   ;;
      
      "slidesDispose")      # For Recording 
	  doNothing
	  ;;

      "videoedDispose")     # For Reveal.js final publication
	  doNothing
	  ;;

      *)
	  EH_problem "Bad Disposition Type -- ${dispositionType}"
	  ;;
    esac

    echo "(setq bx:dblock:lcnt:slidesDisposition \"${dispositionType}\")" > bx:dblock:lcnt:slidesDisposition.el

    local filesList=$( beamerExternalExtensions.py -i latexInputFilesList $(vis_docsList) )

    local grepResults=""
    for each in ${filesList} ; do
	grepResults=$( grep videoed-begin ${each} )
	if [ -z "${grepResults}" ] ; then
	    continue
	fi
	opDo vis_dblockUpdateFile ${each}
    done
    
    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_frameBody    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_frameBody {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local inFilesList=$@

    #opDo FN_dirCreatePathIfNotThere ./frameBody

    local eachFile
    for eachFile in ${inFilesList}; do
	if [ ! -f "./frameBody-${eachFile}" ] ; then
	    opDo touch "./frameBody-${eachFile}"
	fi
    done
    
    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  dblockExpandLines    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function dblockExpandLines {
  vis_prep
  typeset thisOne=""

#${G_myName} ${extraInfo} -i dblockUpdateFile articleEn.ttytex presentationEn.ttytex artPresBodyEn.tex 

  typeset foundFiles=$(echo $( vis_dblockApplicableFiles ))

  ANT_raw "--- Dblock Expand/Update Files ---"
  ANT_raw "${G_myName} -i dblockApplicableFiles"
  #if [ ! -z "${foundFiles}" ] ; then
      ANT_raw "${G_myName} -i dblockUpdateFile ${foundFiles}"
  #fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  docsListBuildLines    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function docsListBuildLines {
  vis_prep
  typeset thisOne=""

  isDirsProcessor && return $?

  for thisOne in ${docsList} ; do
    case ${thisOne##*.} in 
      "ttytex")
	  ANT_raw "${G_myName} ${extraInfo} -i build  ${thisOne}"
	  ;;
      "fm5")
	  doNothing
	  ;;
      *)
	 return 1
	 ;;
    esac
  done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  docsListCmdLines    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function docsListCmdLines {
  vis_prep
  typeset thisOne=""

  for thisOne in ${docsList} ; do
    case ${thisOne##*.} in 
      "ttytex")
	  #ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=ps -i buildDocs  ${thisOne}"
	  ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=pdf -i buildDocs  ${thisOne}"
	  #ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=tex4ht -i buildDocs  ${thisOne}"
	  #ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=onehtml -i buildDocs  ${thisOne}"
	  ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=heveaHtml -i buildDocs  ${thisOne}"
	  ANT_raw "lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=all -i buildDocs  ${thisOne}"
	  ;;
      *)
	 return 1
	 ;;
    esac
  done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_dirsRecurse    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_dirsRecurse {

  typeset thisOne=""
  typeset currentDir=`pwd`

  if [ "${bystarUid}_" == "_" ] ; then 
      dashPs=""
  else
      dashPs="-p bystarUid=${bystarUid}"
  fi

  if [ "${dirsList}_" == "_" ] ; then 
    ANT_raw "#### ${currentDir}/${thisOne} ####"
    opDoComplain ${G_myName} -n showRun ${dashPs} -i "$@"
  fi



  for thisOne in ${dirsList} ; do
    opDoComplain cd ${currentDir}/${thisOne} || return
    #ANT_raw "#### ${currentDir}/${thisOne} ####"
    #opDoComplain ${G_myName} -n showRun -i "$@"

    opDoComplain ${G_myName} -n showRun ${dashPs} -i dirsRecurse "$@"
  
  done
}

#
# Generic Manipulators
#
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildPre {
    g_myInit ; retIfFail 2> /dev/null
  hookRun "buildHookPre"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_build    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_build {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    extent="build"

    opDo vis_buildFullPreview
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildObsoleted    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildObsoleted {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    g_myInit ; retIfFail 2> /dev/null

    hookRun "buildHookPre"

  case ${lcnt_docSrcProcessor} in 
   "latex"|"")
           attachList="${lcnt_pubFormats}"
	   ;;
   "xelatex")
           attachList="pdf heveaHtml"
	  ;;
      *)
	 return 1
	 ;;
    esac

  for thisOne in ${@} ; do
    case ${thisOne##*.} in 
      "ttytex")
          for thisFormat in ${attachList} ; do
	    if [ "${thisFormat}_" == "html_" ] ; then
		thisFormat="tex4ht"
	    fi
	    if [ "${thisFormat}" == "heveaHtml" ] ; then
		if egrep 'documentclass.*beamer' ${thisOne} ; then
		    ANT_raw "Skipping: lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=${thisFormat} -i buildDocs  ${thisOne}"
		else
		    opDoComplain lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=${thisFormat} -i buildDocs  ${thisOne}
		fi
	    else
		opDoComplain lcnLcntInputProc.sh -p inFormat=${lcnt_docSrcProcessor} -p outputs=${thisFormat} -i buildDocs  ${thisOne}
	    fi
	  done
	  ;;
      "fm5")
	  opDoComplain lcnLcntInputProc.sh -p currentBase=`pwd` -p outputs=all -i buildDocs  ${thisOne}
	  ;;
      *)
	 return 1
	 ;;
    esac
  done

  hookRun "buildHookPost"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_prep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_prep {

    g_myInit ; retIfFail 2> /dev/null

if [[ "${lcntProcType}_" != "regular_" ]] ; then
  if [[ ! -L figures ]] ; then
    ln -s ../figures .
  fi

  if [[ ! -L seedDesc ]] ; then
    ln -s ../osmt/seedDesc .
  fi
fi
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_isPresentation    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_isPresentation {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset thisOne=$1

    typeset thisPrefix=$( FN_prefix ${thisOne} )
    typeset thisExtension=$( FN_extension ${thisOne} )
	
    typeset cmndResult=$( echo ${thisOne} | egrep 'pres' )
    if [ -z ${cmndResult} ] ; then 
	lpReturn 101
    else
	lpReturn 0
    fi
}


#
# Full Manipulators
#

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullUpdate {
    g_myInit ; retIfFail 2> /dev/null
    vis_fullBuild
    vis_localContentPrep
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_docsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_docsList {
    g_myInit ; retIfFail 2> /dev/null

    vis_prep
    typeset thisOne=""

    for thisOne in ${docsList} ; do
	opDo echo  ${thisOne}
	
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullBuild    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullBuild {
    g_myInit ; retIfFail 2> /dev/null
    hookRun "fullUpdateHookPre"

    if [[ "${lcnt_contentSrcFormat}_" == "pdf_" ]] ; then
      ANT_raw "Nothing to build."
      return
    fi

    vis_prep
    typeset thisOne=""

    for thisOne in ${docsList} ; do
	vis_build ${thisOne}
	
    done
    hookRun "fullUpdateHookPost"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullFast    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullFast {
    g_myInit ; retIfFail 2> /dev/null
  vis_prep
  typeset thisOne=""

  for thisOne in ${docsList} ; do
    case ${thisOne##*.} in 
      "ttytex")
	  opDoComplain lcnLcntInputProc.sh -p outputs=pdf -i buildDocs  ${thisOne}
	  ;;
      "fm5")
	  opDoComplain lcnLcntInputProc.sh -p currentBase=`pwd` -p outputs=pdf -i buildDocs  ${thisOne}
	  ;;
      *)
	 return 1
	 ;;
    esac
  done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullClean {
    g_myInit ; retIfFail 2> /dev/null
    #set -x

    isDirsProcessor && return $?

    typeset thisOne=""

    hookRun "fullCleanHookPre"
    if [[ -L figures ]] ; then
	/bin/rm figures
    fi

    if [[ -L tables ]] ; then
	/bin/rm tables
    fi

    if [[ -L seedDesc ]] ; then
	/bin/rm seedDesc
    fi

    for thisOne in ${docsList} ; do
	case ${thisOne##*.} in 
	    "ttytex")
		opDoComplain lcnLcntInputProc.sh -p cleanType=realclean -i clean ${thisOne}
		opDo FN_dirDeleteIfThere ./revealJsBase
		opDo FN_dirDeleteIfThere ./auto
		;;
	    "odp")
		ANT_raw "Skipping cleaning for .odp"
		;;
	    *)
		EH_problem "${thisOne}: Unknown Type"
		return 1
		;;
	esac
    done

    if [ -x ./presDispose.sh ] ; then
	opDo ./presDispose.sh -i fullClean
    fi

    #opDo lcnLcntGens.sh -n showRun -p cntntRawHome=`pwd` -i lcntEntryClean

    hookRun "fullCleanHookPost"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullRefresh    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullRefresh {
    g_myInit ; retIfFail 2> /dev/null

    isDirsProcessor && return $?

    opDo FN_fileSafeMove ./lcntProc.sh ./lcntProc.sh.$(DATE_nowTag)
    
    opDo lcnLcntGens.sh -n showRun -p cntntRawHome=`pwd` -i lcntRefresh
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  buildPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function buildPre {
  #if [[ ! -d tables ]] ; then ln -s ../Q1-2007-BusPlan/tables tables; fi
  return
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  buildPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function buildPost {
  return
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  cleanPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function cleanPost {
  if [[ -L tables ]] ; then /bin/rm tables; fi
  return
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  buildHookPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function buildHookPre {   buildPre; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  buildHookPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function buildHookPost {   buildPost; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  fullUpdateHookPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fullUpdateHookPre { buildPre; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  fullUpdateHookPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fullUpdateHookPost {   buildPost; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  fullCleanHookPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fullCleanHookPost {

 opDo cleanPost

 typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
 FN_fileRmIfThere  "./mmaCntntPkgItems.LCNT-${plpdNu}"
 FN_fileRmIfThere  "./mmaCntntPkgItems.LCNT-${plpdNu}"*

 FN_fileRmIfThere  "./accessPage.html"

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcnLcntInputPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcnLcntInputPre {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: No Action 
_EOF_
    }

    g_myInit ; retIfFail 2> /dev/null


    describeF 
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcnLcntInputPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcnLcntInputPost {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: No Action 
_EOF_
    }
    g_myInit ; retIfFail 2> /dev/null

    describeF 
    lpReturn
}


#set -x

# NOTYET, auto set this based on docType


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullPublish {
    g_myInit ; retIfFail 2> /dev/null

  isDirsProcessor && return $?

 typeset plpdNu=`cat ./LCNT-INFO/lcntNu`

 opDo ${G_myName} ${extraInfo} -i fullUpdate
 
 opDo vis_webUpload
 opDo vis_webPublish

 opDo lcnLcntGens.sh -n showRun -p cntntRawHome=`pwd` -i lcntEntryGens
 
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullVerify    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullVerify {
    g_myInit ; retIfFail 2> /dev/null

  isDirsProcessor && return $?

 typeset plpdNu=`cat ./LCNT-INFO/lcntNu`

 opDo grep 'undefined' *.log
 
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_webUpload    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_webUpload {
    g_myInit ; retIfFail 2> /dev/null

    lcntIsPrivate ; retIfFail 2> /dev/null

    lcntIsPublishable ; retIfFail 2> /dev/null

    typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
    typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

    opDo lcnLcntUpload.sh -n showRun -i obtainFiles "${plpdCategory}-${plpdNu}"
    opDo lcnLcntOutputs.sh -n showRun -i accessPageGen "${plpdCategory}-${plpdNu}"
    opDo lcnLcntOutputs.sh -n showRun -i inListDotBibOut "${plpdCategory}-${plpdNu}"
    opDo lcnLcntUpload.sh -n showRun -i remoteUpload "${plpdCategory}-${plpdNu}"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_localContentPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_localContentPrep {
    g_myInit ; retIfFail 2> /dev/null

    lcntIsPublishable ; retIfFail 2> /dev/null

    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]

    typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
    typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

    opDo lcnLcntOutputs.sh -n showRun -i readyRoomCleanDir  "${plpdCategory}-${plpdNu}"

    opDo lcnLcntUpload.sh -n showRun -i obtainFiles "${plpdCategory}-${plpdNu}"
    opDo lcnLcntOutputs.sh -n showRun -i accessPageGen "${plpdCategory}-${plpdNu}"    # Output goes to ReadyRoom
    opDo lcnLcntOutputs.sh -n showRun -i inListDotBibOut "${plpdCategory}-${plpdNu}"  # Output goes to ReadyRoom
    #opDo lcnLcntUpload.sh -n showRun -i remoteUpload "${plpdCategory}-${plpdNu}"
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_webPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_webPublish {
    g_myInit ; retIfFail 2> /dev/null

  isDirsProcessor && return $?

  typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
  typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

  opDo lcnLcntUpload.sh -n showRun -i ploneSync "${plpdCategory}-${plpdNu}"
  opDo lcnLcntGens.sh ${extraInfo} -p cntntRawHome=. -i accessPagePublish
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3UpdateAndPublishDestBxUids    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3UpdateAndPublishDestBxUids {
    g_myInit ; retIfFail 2> /dev/null

  isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]

    opDo vis_fullUpdate
    opDo vis_plone3PublishDestBxUids
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3PublishDestBxUids    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3PublishDestBxUids {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]

  typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
  typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

  opDo bystarLcntUpload.sh  -i plone3SyncDestBxUids "${plpdCategory}-${plpdNu}"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3PublishDestUrls    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3PublishDestUrls {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]

  typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
  typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

  opDo bystarLcntUpload.sh  -i plone3SyncDestUrls "${plpdCategory}-${plpdNu}"

  #opDo lcnLcntUpload.sh -n showRun -i plone3Sync "${plpdCategory}-${plpdNu}"
  #opDo lcnLcntGens.sh ${extraInfo} -p cntntRawHome=. -i accessPagePublish
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3ContentPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3ContentPublish {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    #bystarAcctParamsPrep

    #siteFqdn="www.${bystarDomFormTld}"


  typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
  typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

  # NOTYET, change it to cntntRawHome=.
  #opDo bystarLcntUpload.sh -p bystarUid=${bystarUid} -i plone3Sync "${plpdCategory}-${plpdNu}"
  opDo bystarLcntUpload.sh -p bystarUid=${bystarUid} -p cntntRawHome=. -i plone3Sync

  #opDo lcnLcntGens.sh ${extraInfo} -p cntntRawHome=. -i accessPagePublish
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3AccessPagePublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3AccessPagePublish {
    g_myInit ; retIfFail 2> /dev/null
    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi
  
    opDo bystarLcntUpload.sh ${extraInfo} -p bystarUid=${bystarUid} -p cntntRawHome=. -i plone3AccessPagePublish
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3Publish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3Publish {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi
    

 opDo vis_plone3ContentPublish
 opDo vis_plone3AccessPagePublish

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  hereBxAcctExists    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function hereBxAcctExists {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if bystarAcctInfo.sh -i acctHereShortInfo "${bystarUid}" 2> /dev/null 1> /dev/null ; then
	return 0
    else
	EH_problem "Missing Acct ${bystarUid}"
	return 1
    fi
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_accessPageBxoGen    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_accessPageBxoGen {
    g_myInit ; retIfFail 2> /dev/null
    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi

    typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
    typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`
    
    opDo lcnLcntOutputs.sh -n showRun -p bystarUid=${bystarUid} -i accessPageBxoGen "${plpdCategory}-${plpdNu}"    # Output goes to ReadyRoom
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3ApacheFullPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3ApacheFullPublish {
    g_myInit ; retIfFail 2> /dev/null
    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi

    typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
    typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`
    
    opDo ${G_myName} ${extraInfo} -i fullUpdate

    opDo lcnLcntUpload.sh -n showRun -i obtainExportFiles "${plpdCategory}-${plpdNu}"

    opDo bystarLcntUpload.sh -p bystarUid=${bystarUid} -i rsyncUpload "${plpdCategory}-${plpdNu}"    

    opDo vis_localContentPrep
    
    opDo lcnLcntOutputs.sh -n showRun -p bystarUid=${bystarUid} -i accessPageBxoGen "${plpdCategory}-${plpdNu}"    # Output goes to ReadyRoom

    opDo vis_plone3Publish
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3FullPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3FullPublish {
    g_myInit ; retIfFail 2> /dev/null
    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi
    
    opDo ${G_myName} ${extraInfo} -i fullUpdate
 
    opDo vis_localContentPrep
    opDo vis_plone3Publish

    #opDo lcnLcntGens.sh -n showRun -p cntntRawHome=`pwd` -i lcntEntryGens
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_apachePublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_apachePublish {
    g_myInit ; retIfFail 2> /dev/null
    isDirsProcessor && return $?

    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    typeset plpdNu=`cat ./LCNT-INFO/lcntNu`
    typeset plpdCategory=`cat ./LCNT-INFO/pubCategory`

    if ! hereBxAcctExists ; then
	EH_problem "Skipping Publication -- Create BxO=${bystarUid} first"
	lpReturn 1
    fi

    opDo ${G_myName} ${extraInfo} -i fullUpdate

    opDo lcnLcntUpload.sh -n showRun -i obtainExportFiles "${plpdCategory}-${plpdNu}"

    opDo bystarLcntUpload.sh -p bystarUid=${bystarUid} -i rsyncUpload "${plpdCategory}-${plpdNu}"    

    #opDo lcnLcntOutputs.sh -n showRun -p bystarUid=${bystarUid} -i accessPageBxoGen "${plpdCategory}-${plpdNu}"    # Output goes to ReadyRoom
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bibOut    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bibOut {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

  EH_assert [[ -f lcntProc.sh ]]
  opDoComplain lcnLcntOutputs.sh -p cntntRawHome=. -i bibItemStdout
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntDirsProcClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntDirsProcClean {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor || return $?

  #FN_fileSafeMove lcntDirsProc.sh lcntDirsProc.sh.DeleteMe
    PN_rmIfThere -v lcntDirsProc.sh.DeleteMe
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntNuOut    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntNuOut {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

  EH_assert [[ -f lcntProc.sh ]]
  opDoComplain lcnLcntOutputs.sh -p cntntRawHome=. -i lcntNuStdout
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntNuUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntNuUpdate {
    g_myInit ; retIfFail 2> /dev/null
  typeset thisOne=""
  typeset currentDir=`pwd`

  outFile="/lcnt/outputs/all/lists/nuBaseDir"

  typeset dirsPart=$( FN_dirsPart ${outFile} )

  FN_dirCreatePathIfNotThere ${dirsPart}

  FN_fileSafeKeep ${outFile}

  cd /lcnt/lgpc
  ${G_myName}   -i dirsRecurse lcntNuOut > ${outFile}
  cd /info/externalLimited
  ${G_myName}   -i dirsRecurse lcntNuOut >> ${outFile}
  cd /lcnt/sw
  ${G_myName}   -i dirsRecurse lcntNuOut >> ${outFile}
  opDo ls -l ${outFile}
}

 function vis_bibOutPerLcnt {
    g_myInit ; retIfFail 2> /dev/null
  isDirsProcessor && return $?

  typeset thisOne=""
  typeset currentDir=`pwd`
  lcntInfoPrep ${currentDir}

  fileCategory=`cat ./LCNT-INFO/pubCategory`
  fileNu=`cat ./LCNT-INFO/lcntNu`
  outFile="${docModulePath}/${fileCategory}-${fileNu}.bib"
  
  EH_assert [[ -f lcntProc.sh ]]
  opDoComplain lcnLcntOutputs.sh -p cntntRawHome=. -i bibItemStdout > ${outFile}
  opDo ls -l ${outFile}

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fixDestPath    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fixDestPath {
    g_myInit ; retIfFail 2> /dev/null
   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    lcnLcntGens.sh -n showRun -p cntntRawHome=. -e "Create or Update" -i lcntRefresh
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_editLcntInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_editLcntInfo {
    g_myInit ; retIfFail 2> /dev/null
    EH_assert [[ $# -gt 0 ]]

    typeset thisOne=""

    for thisOne in ${*} ; do
	#( emacsclient -e "(find-file \"LCNT-INFO/${thisOne}\")"  & 	wait $! )
	#emacsclient "LCNT-INFO/${thisOne}"
	bleeclient "LCNT-INFO/${thisOne}"
    done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_dblockUpdateFile    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_dblockUpdateFile {
    g_myInit ; retIfFail 2> /dev/null
    if [  $# -eq  0 ] ; then
	typeset foundFiles=$( echo $( vis_dblockApplicableFiles ) )
	if [ -z "${foundFiles}" ] ; then
	    ANT_raw "No Files To Dblock Expand -- Skipped"
	    lpReturn
	fi
	opDo vis_dblockUpdateFile "${foundFiles}"
    fi

    #typeset thisOne=""

    # for thisOne in ${*} ; do
    # 	emacsclient -e "(org-dblock-update-file-bx \"${thisOne}\")"
    # done

    # Must be $* -- $@ does not work
    opDo bx-dblock -v -n showRun -i dblockUpdateFiles "$*"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcnLcntInputPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcnLcntInputPre {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    heveaHtmlBasedir=heveaHtml-${1%.*}

    if [ -z "${lcntAttrSource:-}" ] ; then
	lcntSourceTypeBaseDir="/lcnt/lgpc/bystar/permanent"
    else
	lcntSourceTypeBaseDir="${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/${lcntAttrPermanence}"
    fi

    if [[ ! -d figures ]] ; then ln -s ${lcntSourceTypeBaseDir}/common/figures figures; fi
    if [[ ! -d tables ]] ; then ln -s ${lcntSourceTypeBaseDir}/common/tables tables; fi

    if [[ ! -d ${heveaHtmlBasedir}/figures ]] ; then opDo ln -s ${lcntSourceTypeBaseDir}/common/figures ${heveaHtmlBasedir}/figures; fi
    if [[ ! -d ${heveaHtmlBasedir}/tables ]] ; then opDo ln -s ${lcntSourceTypeBaseDir}/common/tables ${heveaHtmlBasedir}/tables; fi
	
    lpReturn
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== To LaTeX Convertors
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_word2latexWithPandoc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_word2latexWithPandoc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset fileBaseName="$1"

    if [ ! -f "${fileBaseName}".docx ] ; then
	ANT_raw "Missing ${fileBaseName}.docx -- From libreoffice do a save as docx"
	lpReturn
    fi

    opDo pandoc -f docx -t latex  -o "${fileBaseName}".tex "${fileBaseName}".docx 
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_word2latexWithHtml    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_word2latexWithHtml {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset fileBaseName="$1"

    if [ ! -f "${fileBaseName}".html ] ; then
	ANT_raw "Missing ${fileBaseName}.html -- From libreoffice do an export to html first"
	lpReturn
    fi

    typeset tmpFile=$( FN_tempFile )
    
    opDo eval xmlindent "${fileBaseName}".html \> ${tmpFile}.html
    opDo gnuhtml2latex -H ${tmpFile}.html
    opDo mv ${tmpFile}.tex "${fileBaseName}".tex
    opDo /bin/rm  ${tmpFile}.html

    lpReturn
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== From LaTeX Convertors
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_latex2word    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_latex2word {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset fileBaseName="$1"

    if [ ! -f "${fileBaseName}".ttytex ] ; then
	ANT_raw "Missing ${fileBaseName}.ttytex"
	lpReturn
    fi

    opDo pandoc -f latex -t odt --default-image-extension=png -s ${fileBaseName}.ttytex -o ${fileBaseName}.odt

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_latex2markdown    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_latex2markdown {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset fileBaseName="$1"

    if [ ! -f "${fileBaseName}".ttytex ] ; then
	ANT_raw "Missing ${fileBaseName}.ttytex"
	lpReturn
    fi

    opDo pandoc -f latex -t markdown --default-image-extension=png -s ${fileBaseName}.ttytex -o ${fileBaseName}.md

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== Start Disposition PresProc Setup
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startDisposition    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_startDisposition    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startDisposition {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo cp /libre/ByStar/InitialTemplates/lcnt/dispositions/presProc.sh .

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_revealJsBasePrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_revealJsBasePrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
If G_forceMode is not selected and ./revealJsBase directory exists,
the base is assumed to be current.
Otherwise, create the base directory and create the symlinks.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [[ "${G_forceMode}" != "force" ]] ; then
	if [ -d ./revealJsBase ] ; then
	    lpReturn
	fi
    fi

    opDo FN_dirCreatePathIfNotThere ./revealJsBase

    opDo vis_outputBaseDirLinks ./revealJsBase

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_outputBaseDirLinks    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_outputBaseDirLinks {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset baseDir="$1"

    #inBaseDirDo ${baseDir} ln -s /usr/local/lib/node_modules  .
    inBaseDirDo ${baseDir} FN_fileSymlinkUpdate /rsync/node_modules ./node_modules
    inBaseDirDo ${baseDir} ln -s /pub  .
    inBaseDirDo ${baseDir} ln -s ../audio .
    inBaseDirDo ${baseDir} ln -s ../video  .
    inBaseDirDo ${baseDir} ln -s ../image  .
    inBaseDirDo ${baseDir} ln -s ../figures  .        

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_heveaRevealFixups    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_heveaRevealFixups {
  EH_assert [[ $# -eq 1 ]]
  fileBaseName=$1

  elispScriptFile="${opBinBase}/elispFilterHtml.el"

  #if [[ ! -f ${elispScriptFile} ]] ; then 
    #vis_outputScript > ${elispScriptFile}
  #fi

  inFileName="./heveaHtml-${fileBaseName}/${fileBaseName}.html"
  outFileName="./heveaHtml-${fileBaseName}/revealSlides.html"

  FN_fileRmIfThere ${outFileName}

  opDo ${opBinBase}/elispFilterHtml.sh -v -n showRun  ${extraInfo} -p el="${elispScriptFile}" -p exec=mainRevealHevea -p inFile="${inFileName}" -p outFile="${outFileName}" -i emacs ${fileBaseName}
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildFullPreview    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildFullPreview {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #g_myInit ; retIfFail 2> /dev/null
    hookRun "fullUpdateHookPre"

    if [[ "${lcnt_contentSrcFormat}_" == "pdf_" ]] ; then
      ANT_raw "Nothing to build."
      return
    fi

    vis_prep
    typeset thisOne=""

    for thisOne in ${docsList} ; do
	#vis_build ${thisOne}
	opDo vis_buildHtmlPreview ${thisOne}
	opDo vis_buildPdfPreview ${thisOne}	
    done
    
    hookRun "fullUpdateHookPost"
   
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildHtmlPreview    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildHtmlPreview {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Perhaps build html results and perhaps preview html results 
-p extent=build || extent=view || extent=build+view  (DEFAULT=build+view)
if \$# eq 0 then apply to lcntProc.sh -i  docsList | head -1
if \$# gt 0 then do for each of \$@
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    typeset inFilesList=$@

    if [ -z "${extent}" ] ; then
	extent="build+view"
    fi

    if [ $# -eq 0 ] ; then
	inFilesList=$( lcntProc.sh -i  docsList )
    fi

    if [ $# -eq 1 ] ; then
	typeset lcntDocsList=$( lcntProc.sh -i  docsList )
	typeset isInList=$( echo "${lcntDocsList}" | grep -i "${1}" )
	if [[ -z "${isInList}" ]] ; then
	    ANT_raw "Specified inFile ($1) not in ${lcntDocsList} -- Applying To ALL"
	    inFilesList=${lcntDocsList}
	fi
    fi

    opDo lcntProc.sh -i buildPre

    typeset inFilePrefix
    typeset thisExtension

    for inFile in ${inFilesList}; do
	inFilePrefix=$( FN_prefix ${inFile} )
	#thisExtension=$( FN_extension ${inFile} )	

	if [ "${extent}" == "build" -o "${extent}" == "build+view" ] ; then
	    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs ${inFile}

	    if [ "${inFile}" == "$(vis_getPresentationSrcFile .)" ] ; then
		opDo vis_heveaRevealFixups ${inFilePrefix}

		opDo vis_revealJsBasePrep

		typeset  heveaBase="./heveaHtml-${inFilePrefix}"
		
		outFileName="./heveaHtml-${fileBaseName}/revealSlides.html"

		opDo cp ${heveaBase}/revealSlides.html ./revealJsBase

		typeset imagesList=$( ls ${heveaBase}/*.png )

		if [ ! -z "${imagesList}" ] ; then
		    opDo cp ${imagesList} ./revealJsBase
		fi
		
		opDo cp /libre/ByStar/InitialTemplates/web/revealJs/begin/contentStart.html  ./revealJsBase/${inFilePrefix}.html

		opDo bx-dblock -h -v -n showRun -i dblockUpdateFiles  ./revealJsBase/${inFilePrefix}.html
	    fi
	fi
	
	if [ "${extent}" == "view" -o "${extent}" == "build+view" ] ; then
	    
	    if [ "${inFile}" == "$(vis_getPresentationSrcFile .)" ] ; then	    
		if [ -s  ./heveaHtml-${inFilePrefix}/index.html ] ; then
		    opDo echo eoe-browser ./heveaHtml-${inFilePrefix}/index.html
		else
		    EH_problem "Missing ./heveaHtml-${inFilePrefix}/index.html"
		fi
	    
		if [ -s  ./revealJsBase/${inFilePrefix}.html ] ; then
		    opDo eoe-browser ./revealJsBase/${inFilePrefix}.html 
		else
		    EH_problem "Missing ./revealJsBase/${inFilePrefix}.html "
		fi
	    else
		if [ -s  ./heveaHtml-${inFilePrefix}/index.html ] ; then
		    opDo eoe-browser ./heveaHtml-${inFilePrefix}/index.html
		else
		    EH_problem "Missing ./heveaHtml-${inFilePrefix}/index.html"
		fi
	    fi		
	fi
    done

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildPdfPreview    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildPdfPreview {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Perhaps build pdf results and perhaps preview pdf results 
-p extent=build || extent=view || extent=build+view  (DEFAULT=build+view)
if \$# eq 0 then apply to lcntProc.sh -i  docsList | head -1
if \$# gt 0 then do for each of \$@
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    typeset inFilesList=$@

    if [ -z "${extent}" ] ; then
	extent="build+view"
    fi

    if [ $# -eq 0 ] ; then
	inFilesList=$( lcntProc.sh -i  docsList )
    fi

    if [ $# -eq 1 ] ; then
	typeset lcntDocsList=$( lcntProc.sh -i  docsList )
	typeset isInList=$( echo "${lcntDocsList}" | grep -i "${1}" )
	if [[ -z "${isInList}" ]] ; then
	    ANT_raw "Specified inFile ($1) not in ${lcntDocsList} -- Applying To ALL"
	    inFilesList=${lcntDocsList}
	fi
    fi
    
    opDo lcntProc.sh -i buildPre

    typeset thisPrefix
    typeset thisExtension

    for inFile in ${inFilesList}; do
	thisPrefix=$( FN_prefix ${inFile} )
	#thisExtension=$( FN_extension ${inFile} )	

	if [ "${extent}" == "build" -o "${extent}" == "build+view" ] ; then
	    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs ${inFile}
	fi
	if [ "${extent}" == "view" -o "${extent}" == "build+view" ] ; then
	    if [ -s  ./${thisPrefix}.pdf ] ; then    
		opDo acroread ./${thisPrefix}.pdf &
	    else
		EH_problem "Missing ./${thisPrefix}.pdf"
	    fi
	fi
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_getPresArtSrcFile    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getPresArtSrcFile {
    G_funcEntry
    function describeF {  cat  << _EOF_
NOTYET, READ presSrcFile and artSrcFile
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset baseDir=$1

    typeset presFileName=""

    presFileName=$( lcnLcntInfo.sh  -p cntntRawHome=. -i get presArtSrcFile )

    echo ${presFileName}
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_getPresentationSrcFile    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getPresentationSrcFile {
    G_funcEntry
    function describeF {  cat  << _EOF_
NOTYET, READ presSrcFile and artSrcFile
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset baseDir=$1

    typeset presFileName=""

    presFileName=$( lcnLcntInfo.sh  -p cntntRawHome=. -i get presSrcFile )    
	
    if [ -z "${presFileName}" ] ; then
	typeset docSrcForms=$(lcnLcntInfo.sh -p cntntRawHome=${baseDir} -i get docSrcForms)

	if [ "${docSrcForms}" == "pres+art" ] ; then
	    presFileName=$( lcnLcntInfo.sh  -p cntntRawHome=. -i get docSrcList | head -1 )
	    echo ${presFileName}.ttytex	    
	elif [ "${docSrcForms}" == "art+pres" ] ; then
	    presFileName=$( lcnLcntInfo.sh  -p cntntRawHome=. -i get docSrcList | head -2 | tail -1 )
	    echo ${presFileName}.ttytex	    
	elif [ "${docSrcForms}" == "art" ] ; then
	    echo ""    	    
	else
	    EH_problem "${docSrcForms}"
	    echo ""
	fi
    else
	typeset thisPrefix=$( FN_prefix ${presFileName} )
	typeset thisExtension=$( FN_extension ${presFileName} )

	if [ -z "${thisExtension}" ] ; then
	    echo ${presFileName}.ttytex
	else
	    echo ${presFileName}
	fi
    fi
    
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_getArticleSrcFile    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getArticleSrcFile {
    G_funcEntry
    function describeF {  cat  << _EOF_
NOTYET, READ presSrcFile and artSrcFile
_EOF_
		       }

    EH_assert [[ $# -eq 1 ]]    
    
    typeset baseDir=$1
    typeset articleFileName=""


    articleFileName=$( lcnLcntInfo.sh  -p cntntRawHome=${baseDir} -i get artSrcFile )    
	
    if [ -z "${artFileName}" ] ; then
	typeset docSrcForms=$(lcnLcntInfo.sh -p cntntRawHome=${baseDir} -i get docSrcForms)

	if [ "${docSrcForms}" == "art+pres" ] ; then
	    articleFileName=$( lcnLcntInfo.sh  -p cntntRawHome=${baseDir} -i get docSrcList | head -1 )
	elif [ "${docSrcForms}" == "pres+art" ] ; then
	    articleFileName=$( lcnLcntInfo.sh  -p cntntRawHome=${baseDir} -i get docSrcList | head -2 | tail -1 )
	else
	    EH_problem ""
	fi
    fi
    echo ${articleFileName}.ttytex
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presProcStart    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presProcStart {
    G_funcEntry
    function describeF {  cat  << _EOF_
Obsoleted By vis_mmUniteStart
_EOF_
		       }

    describeF
    lpReturn

    if [[ "${G_forceMode}" != "force" ]] ; then
	if [ -f ./presDispose.sh ] ; then
	    ANT_raw "./presDispose.sh alread in place -- Update Skipped"	
	else
	    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/presProc.leaf.sh ./presDispose.sh
	    opDo vis_dblockUpdateFile ./presDispose.sh
	fi
	if [ -f ./PresPanel.org ] ; then
	    ANT_raw "./PresPanel.org alread in place -- Update Skipped"	
	else
	    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPresPanel.org ./PresPanel.org
	    opDo vis_dblockUpdateFile ./PresPanel.org
	fi
    else
	opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/presProc.leaf.sh ./presDispose.sh
	opDo vis_dblockUpdateFile ./presDispose.sh
	
	opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPresPanel.org ./PresPanel.org
	opDo vis_dblockUpdateFile ./PresPanel.org
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmDocPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mmDocPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
Do everything that is necessary to set up for mmDoc to be processable.
It should be repeatable.
_EOF_
    }

    opDo vis_bxtPanel

    opDo ln -s /pub ./pub

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcnLcntInputPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_figuresList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_figuresList {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    local docsList=$(vis_docsList)
    local latexFigsList=""

    latexFigsList=$( beamerExternalExtensions.py -i latexInputFilesList ${docsList}  2> /dev/null | xargs -n 1  | grep figures )

    #echo ${latexFigsList}

    local each
    local pngFile
    for each in ${latexFigsList} ; do
	typeset thisPrefix=$( FN_prefix ${each} )
	typeset thisExtension=$( FN_extension ${each} )
	typeset dirsPart=$( FN_dirsPart ${each} )

	if [ ! -f "${each}" ] ; then
	    EH_problem "Missing Latex Figure: ${each}"
	    continue
	fi

	pngFile="${dirsPart}/${thisPrefix}.png"

	if [ ! -f "${pngFile}" ] ; then
	    EH_problem "Missing PngFile: ${pngFile}"
	    continue
	fi

	echo $(readlink -f "${pngFile}")
    done
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmUniteStart    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mmUniteStart {
    G_funcEntry
    function describeF {  cat  << _EOF_
Obsoletes vis_presProcStart
_EOF_
    }

    if [[ "${G_forceMode}" != "force" ]] ; then
	if [ -f ./mmUnite.sh ] ; then
	    ANT_raw "./mmUnite.sh alread in place -- Update Skipped"	
	else
	    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUnite.leaf.sh ./mmUnite.sh
	    opDo vis_dblockUpdateFile ./mmUnite.sh
	fi
	if [ -f ./MmUnitePanel.org ] ; then
	    ANT_raw "./MmUnitePanel.org alread in place -- Update Skipped"	
	else
	    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org ./MmUnitePanel.org
	    opDo vis_dblockUpdateFile ./MmUnitePanel.org
	fi
    else
	opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUnite.leaf.sh ./mmUnite.sh
	opDo vis_dblockUpdateFile ./mmUnite.sh
	
	opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org ./MmUnitePanel.org
	opDo vis_dblockUpdateFile ./MmUnitePanel.org
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmUnitePrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mmUnitePrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create the Mm Unite Environment
_EOF_
		       }

    if [ ! -f mmUnite.sh ] ; then
	opDo vis_mmUniteStart
    fi

    opDo ./mmUnite.sh -v -n showRun -i screenCastingFullUpdate

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmUniteGens    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mmUniteGens {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create the Mm Unite Environment
_EOF_
		       }

    if [ -f mmUnite.sh ] ; then
	opDo ./mmUnite.sh -v -n showRun -i screenCastingGens
    else
	EH_problem "Missing mmUnite.sh -- Re-Run mmUniteGens after mmUnitePrep"
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmUnitePrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mmUniteClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mmUniteClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
Create the Mm Unite Environment
_EOF_
    }

    if [ -f mmUnite.sh ] ; then
	./mmUnite.sh -v -n showRun -i screenCastingFullClean
    else
	echo  "Missing mmUnite.sh -- Skipped"
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* Build -- Results -- Release */ |
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_buildResultsRelease  *To-Be-Obsoleted*  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildResultsRelease {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
org-line: To-Be_Obsolted
Perhaps build pdf and html results and perhaps release the results
-p extent=build || extent=release || extent=build+release  (DEFAULT=build+release)
if \$# eq 0 then apply to lcntProc.sh -i  docsList
if \$# gt 0 then do for each of \$@
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]

    typeset inFilesList=$@

    if [ -z "${extent}" ] ; then
	extent="build+release"
    fi

    if [ $# -eq 0 ] ; then
	#typeset thisOne=$( lcntProc.sh -i  docsList | head -1 )
	typeset thisOne=$( lcntProc.sh -i  docsList )	
	inFilesList=${thisOne}
    fi

    typeset thisPrefix
    typeset thisExtension

    typeset thisExtent=${extent}

    for inFile in ${inFilesList}; do
	thisPrefix=$( FN_prefix ${inFile} )

	if [ "${extent}" == "build" -o "${extent}" == "build+release" ] ; then
	    extent="build"
	    opDo vis_buildPdfPreview ${inFile}
	    opDo vis_buildHtmlPreview ${inFile}
	    extent=${thisExtent}
	else
	    EH_problem "Build Phase Is Being Skipped -- extent=${extent}"
	fi
	if [ "${extent}" == "release" -o "${extent}" == "build+release" ] ; then
	    opDo vis_resultsRelease ${inFile}
	else
	    EH_problem "Release Phase Is Being Skipped -- extent=${extent}"
	fi
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_resultsRelease   *To-Be-Obsoleted*  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_resultsRelease {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
When -p tag=date, results will be date tagged.
if \$# eq 0 then apply to lcntProc.sh -i  docsList
if \$# gt 0 then do for each of \$@
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    typeset inFilesList=$@

    typeset tagPostfix=""

    if [ "${tag}" == "date" ] ; then
	tagPostfix="-"$( date +%Y%m%d%H%M%S )
    fi

    
    if [ $# -eq 0 ] ; then
	typeset thisOne=$( lcntProc.sh -i  docsList )	
	inFilesList=${thisOne}
    fi

    typeset thisPrefix
    typeset thisExtension

    if [ ! -d ./rel ] ; then
	opDo mkdir -p ./rel
    fi
    
    for inFile in ${inFilesList}; do
	thisPrefix=$( FN_prefix ${inFile} )

	if [ -s  ./${thisPrefix}.pdf ] ; then
	    opDo cp ./${thisPrefix}.pdf ./rel/${thisPrefix}${tagPostfix}.pdf	    
	else
	    EH_problem "Missing ./${thisPrefix}.pdf -- Release Skipped"
	fi

	if [ -s  ./heveaHtml-${thisPrefix}/index.html ] ; then
	    opDo mkdir -p ./rel/${thisPrefix}${tagPostfix}-html   
	    opDo cp -r -p ./heveaHtml-${thisPrefix}/*  ./rel/${thisPrefix}${tagPostfix}-html
	
	    opDo /opt/public/osmt/bin/elispFilterHtml.sh -v -n showRun  -i deTitleCompletely ./rel/${thisPrefix}${tagPostfix}-html/index.html
	else
	    EH_problem "Missing ./heveaHtml-${thisPrefix}/index.html -- Release Skipped"
	fi
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntBuildInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo  ls -l ./curBuild
    opDo cat ./LCNT-INFO/Builds/enabledList
    ls -ld ./LCNT-INFO/Builds/*

    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntBuild    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuild {
    G_funcEntry
    function describeF {  cat  << _EOF_
Add extent -- just build or build and release.
Get articleEnFa.ttytex name from curBuild.
-p extent=build || extent=release || extent=build+release  (DEFAULT=build+release)
-p extent=build || extent=view || extent=build+view  (DEFAULT=build+view)
-p extent=name
_EOF_
		       }

    EH_assert [[ $# -gt 0 ]]
    
    local inFilesList=$@
    local inFile=""
    local eachResult=""
    local lcntNu=$( cat ./LCNT-INFO/lcntNu )
    local lcntVersion=$( cat ./LCNT-INFO/version )

    local resultsFileDest=""
    local releaseFileDest=""

    local resultsPathDest=""
    local releasePathDest=""

    local dateTag=$( DATE_nowTag )

    local htmlIndexFile=""

    if [ -z "${extent}" ] ; then
	extent="build"
    fi

    if [ "$1" == "all" ] ; then
	inFilesList=$( vis_enabledBuildsDirsList )
    fi

    if [ "$1" == "cur" ] ; then
	inFilesList="cur"
    fi

    if [ "$1" == "dev" ] ; then
	inFilesList="dev"
    fi

    opDo lcntBuildsBaseFVsPrep

    local extentList=$( echo ${extent} | sed -e 's/+/ /g')

    if LIST_isIn "release" "${extentList}"  ; then
	if [ -z "${lcntBuild_releaseBaseDir}" ] ; then
	    EH_problem "Missing lcntBuild_releaseBaseDir"
	    lpReturn 101
	fi
	#opDoComplain FN_dirCreatePathIfNotThere "${lcntBuild_releaseBaseDir}"
	opDo FN_dirCreatePathIfNotThere "${lcntBuild_releaseBaseDir}"	
    fi

    #opDoComplain FN_dirCreatePathIfNotThere ./Results
    opDo FN_dirCreatePathIfNotThere ./Results

    function resultsDestinationPath {
	EH_assert [[ $# -eq 1 ]]
	local resultType="$1"
	
	case ${resultType} in
	    "pdf")
		echo ${lcntBuild_resultsBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.${resultType}
		;;
	    "odt")
		echo ${lcntBuild_resultsBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.${resultType}
		;;
	    "markdown")
		echo ${lcntBuild_resultsBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.md
		;;
	    "html")
		echo ${lcntBuild_resultsBaseDir}/c-${lcntNu}-${lcntBuild_buildName}-${resultType}
		;;
	    *)
		EH_problem "Unknown ${eachResult}"
		lpReturn
	esac
    }

    function releaseDestinationPath {
	EH_assert [[ $# -eq 1 ]]
	local resultType="$1"
	
	case ${resultType} in
	    "pdf")
	        #echo ${lcntBuild_releaseBaseDir}/c-${lcntNu}-${lcntBuild_buildName}-${lcntVersion}.${resultType}
		echo ${lcntBuild_releaseBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.${resultType}
		;;
	    "odt")
		echo ${lcntBuild_releaseBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.${resultType}
		;;
	    "markdown")
		echo ${lcntBuild_releaseBaseDir}/c-${lcntNu}-${lcntBuild_buildName}.md
		;;
	    "html")
		echo ${lcntBuild_releaseBaseDir}/c-${lcntNu}-${lcntBuild_buildName}-${resultType}
		;;
	    *)
		EH_problem "Unknown ${eachResult}"
		lpReturn
	esac
    }

    for inFile in ${inFilesList}; do
	#opDo ls -l ${inFile}
	#
	# 1) Update symlink for curBuild
	if [ "${inFile}" == "cur" ] ; then
	    inFile=./curBuild
	fi
	if [ "${inFile}" == "dev" ] ; then
	    inFile=./curBuild
	fi

	#
	# curBuild is now properly set. We can use it.
	#
	
	# Read in curBuild params
	opDo lcntBuildInfoPrep "${inFile}"

	local docSrcPrefix=$(  FN_prefix ${lcntBuild_docSrc} )
	local docSrcExtension=$( FN_extension ${lcntBuild_docSrc} )
	
	# 2) Runing dblock on all needed files -- For Dev we don't dblocks update
	if [ "${1}" != "dev" ] ; then
	    if ! LIST_isIn "name" "${extentList}"  ; then		    
		opDo vis_dblockUpdateFile ${lcntBuild_docSrc}
	    fi
	    # NOTYET, also do other files that need to be dblocked.
	fi
	
	# 3) for all of build forms, build results
	for eachResult in ${lcntBuild_resultsList}; do
	    case ${eachResult} in
		"pdf")
		    resultsFileDest=$( resultsDestinationPath pdf )
		    if LIST_isIn "name" "${extentList}"  ; then		    
			echo "${resultsFileDest}"
			continue
		    fi
		    if LIST_isIn "build" "${extentList}"  ; then		    
			opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs  ${lcntBuild_docSrc}
			opDo mv ${docSrcPrefix}.pdf ${resultsFileDest}
		    fi
		    if LIST_isIn "view" "${extentList}"  ; then
			opDo acroread ${resultsFileDest} &
		    else
			# When view was not specified, we still want the run line
			if LIST_isIn "build" "${extentList}"  ; then		    					    
		    	    echo acroread ${resultsFileDest}
			fi
		    fi
		    
		    releaseDestinationPath=$( releaseDestinationPath pdf )		    		    
		    if LIST_isIn "release" "${extentList}"  ; then
			if [ -f ${resultsFileDest} ] ; then
			    # If the version exists, also date tag it.
			    opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
			    opDo ls -l ${releaseDestinationPath}
			    opDo FN_fileSymlinkUpdate ${releaseDestinationPath} $( FN_nonDirsPart ${releaseDestinationPath} )		    
			else
			    if LIST_isIn "build" "${extentList}"  ; then		    					    
				opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs  ${lcntBuild_docSrc}
				opDo mv ${docSrcPrefix}.pdf ${resultsFileDest}
				
				opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
				opDo ls -l ${releaseDestinationPath}
				opDo FN_fileSymlinkUpdate ${releaseDestinationPath} $( FN_nonDirsPart ${releaseDestinationPath} )
			    else
				EH_problem "Missing  Results/c-${lcntNu}-${lcntBuild_buildName}.pdf"
				lpReturn
			    fi
			fi
		    fi
		    ;;
		"html")
		    resultsPathDest=$( resultsDestinationPath html )

		    if LIST_isIn "build" "${extentList}"  ; then		    
			opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs  ${lcntBuild_docSrc}
			if [ -d "${resultsPathDest}" ] ; then
			    opDo mv "${resultsPathDest}" "${resultsPathDest}"-${dateTag}
			fi
			opDo mv heveaHtml-${docSrcPrefix} "${resultsPathDest}"
		    fi

		    htmlIndexFile="${resultsPathDest}/index.html"

		    if LIST_isIn "view" "${extentList}"  ; then
			if [ "${lcntBuild_docSrc}" == "$(vis_getPresentationSrcFile .)" ] ; then	    
	    		    if [ -s ${htmlIndexFile} ] ; then
	    			opDo echo eoe-browser ${htmlIndexFile}
	    		    else
	    			EH_problem "Missing ${htmlIndexFile}"
	    		    fi
	    
	    		    if [ -s  ./revealJsBase/${inFilePrefix}.html ] ; then
	    			opDo eoe-browser ./revealJsBase/${inFilePrefix}.html 
	    		    else
	    			EH_problem "Missing ./revealJsBase/${inFilePrefix}.html "
	    		    fi
			else
	    		    if [ -s ${htmlIndexFile} ] ; then
	    			opDo eoe-browser ${htmlIndexFile}
	    		    else
	    			EH_problem "Missing ${htmlIndexFile}"
	    		    fi
			fi		
		    else
			# When view was not specified, we still want the run line
			if LIST_isIn "build" "${extentList}"  ; then		    					    
		    	    echo eoe-browser ${htmlIndexFile}
			fi
		    fi
		    
		    
		    if LIST_isIn "release" "${extentList}"  ; then
			#releaseDestinationPath=$( releaseDestinationPath html )
			
			if [ -d ${resultsPathDest} ] ; then
			    # If the version exists, also date tag it.
			    opDo cp -r -p ${resultsPathDest}  ${lcntBuild_releaseBaseDir}
			    opDo ls -ld  ${lcntBuild_releaseBaseDir}
			else
			    if LIST_isIn "build" "${extentList}"  ; then
				opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs  ${lcntBuild_docSrc}
				if [ -d "${resultsPathDest}" ] ; then
				    opDo mv "${resultsPathDest}" "${resultsPathDest}"-${dateTag}
				fi
				opDo mv heveaHtml-${docSrcPrefix} "${resultsPathDest}"
				opDo cp -r -p ${resultsPathDest}  ${lcntBuild_releaseBaseDir}
				opDo ls -ld  ${lcntBuild_releaseBaseDir}
			    else
				EH_problem "Missing ${resultsPathDest}"
				lpReturn
			    fi
			fi
		    fi
		    ;;
		"odt")
		    resultsFileDest=$( resultsDestinationPath odt )		    
		    if LIST_isIn "build" "${extentList}"  ; then		    
			opDo vis_latex2word  ${docSrcPrefix}
			opDo mv ${docSrcPrefix}.odt ${resultsFileDest}
		    fi
		    if LIST_isIn "view" "${extentList}"  ; then
			opDo libreoffice ${resultsFileDest}
		    else
			# When view was not specified, we still want the run line
			if LIST_isIn "build" "${extentList}"  ; then		    					    
		    	    echo libreoffice ${resultsFileDest}
			fi
		    fi
		    
		    releaseDestinationPath=$( releaseDestinationPath odt )		    		    
		    if LIST_isIn "release" "${extentList}"  ; then
			if [ -f ${resultsFileDest} ] ; then
			    # If the version exists, also date tag it.
			    opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
			    opDo ls -l ${releaseDestinationPath}
			else
			    if LIST_isIn "build" "${extentList}"  ; then		    					    
				opDo vis_latex2word  ${docSrcPrefix}
				opDo mv ${docSrcPrefix}.odt ${resultsFileDest}

				opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
				opDo ls -l ${releaseDestinationPath}
			    else
				EH_problem "Missing  ${resultsPathDest}"
				lpReturn
			    fi
			fi
		    fi
		    ;;
		"markdown")
		    resultsFileDest=$( resultsDestinationPath markdown )		    
		    if LIST_isIn "build" "${extentList}"  ; then		    
			opDo vis_latex2markdown  ${docSrcPrefix}
			opDo mv ${docSrcPrefix}.md ${resultsFileDest}
		    fi
		    if LIST_isIn "view" "${extentList}"  ; then
			opDo ls -l ${resultsFileDest}
		    else
			# When view was not specified, we still want the run line
			if LIST_isIn "build" "${extentList}"  ; then		    					    
		    	    echo ls -l ${resultsFileDest}
			fi
		    fi
		    
		    releaseDestinationPath=$( releaseDestinationPath markdown )		    		    
		    if LIST_isIn "release" "${extentList}"  ; then
			if [ -f ${resultsFileDest} ] ; then
			    # If the version exists, also date tag it.
			    opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
			    opDo ls -l ${releaseDestinationPath}
			else
			    if LIST_isIn "build" "${extentList}"  ; then		    					    
				opDo vis_latex2markdown  ${docSrcPrefix}
				opDo mv ${docSrcPrefix}.md ${resultsFileDest}

				opDo cp -p ${resultsFileDest} ${releaseDestinationPath}
				opDo ls -l ${releaseDestinationPath}
			    else
				EH_problem "Missing  ${resultsPathDest}"
				lpReturn
			    fi
			fi
		    fi
		    ;;
		*)
		    EH_problem "Unknown ${eachResult}"
		    lpReturn
	    esac
	done
    done

    #
    # 4) Create accessPages for both html and md
    #
    if LIST_isIn "release" "${extentList}"  ; then
	opDo lcnLcntOutputs.sh -n showRun -p outFile=./${lcntBuild_releaseBaseDir}/accessPage.html -i accessPageGen "PLPC-${lcnt_lcntNu}"
	opDo lcnLcntOutputs.sh -n showRun -p outFile=./${lcntBuild_releaseBaseDir}/accessPage.md -i accessPageGen_md "PLPC-${lcnt_lcntNu}"
	opDo lcnLcntOutputs.sh -n showRun -p outFile=./${lcntBuild_releaseBaseDir}/PLPC-${lcnt_lcntNu}.bib -i inListDotBibOut "PLPC-${lcnt_lcntNu}"		
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntBuildSetCur    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildSetCur {
    G_funcEntry
    function describeF {  cat  << _EOF_

_EOF_
		       }

    EH_assert [[ $# -eq 1 ]]
    local inFile="$1"

    opDo FN_fileSymlinkUpdate "${inFile}" ./curBuild

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntBuildExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    extraInfo="-v -n showRun"
    local inFilesList=""
    local inFile=""

    function listLcntBuildCommands {
	EH_assert [[ $# -eq 1 ]]
	local specifiedExtent=$1
	#inFilesList=$( vis_enabledBuildsDirsList )
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntBuild ${inFile}
	done
    }

    function listLcntBuildSetCur {
	#inFilesList=$( vis_enabledBuildsDirsList )
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -i lcntBuildSetCur ${inFile}
	done
    }

    
    cat  << _EOF_
=====================================
$( examplesSeperatorChapter "Old buildResultsRelease" )
${G_myName} ${extraInfo} -i resultsRelease
${G_myName} ${extraInfo} -i buildResultsRelease
$( examplesSeperatorChapter "curBuild Points To: -- Set it to:" )
$( ls -l ./curBuild )
$( listLcntBuildSetCur )
$( examplesSeperatorChapter "Running lcntBuild And View" )
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Running lcntBuild And Release" )
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild all          # Using enabled list
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild cur          # Runs dblock
${G_myName} ${extraInfo} -p extent="build+release" -i lcntBuild dev          # Does not run dblock
$( examplesSeperatorChapter "Build Info" )
${G_myName} ${extraInfo} -i lcntBuildInfo
ls -l ./curBuild
cat ./LCNT-INFO/Builds/enabledList
ls -ld ./LCNT-INFO/Builds/*
_EOF_
    # $( listLcntBuildCommands build+release )
    # $( listLcntBuildCommands build+view )
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntBuildDefaultCommand    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildDefaultCommand {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    extraInfo="-v -n showRun"
    local inFilesList=""
    local inFile=""
    local defaultFile=""

    inFilesList=$( vis_enabledBuildsDirsList )
    for inFile in ${inFilesList}; do
	defaultFile=$( echo ${inFile} | grep 8.5x11 )
	if [ ! -z "${defaultFile}" ] ; then 
	    echo ${G_myName} ${extraInfo} -i lcntBuild ${defaultFile}
	fi
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* Exports */ |
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntExportInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExportInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo  ls -l ./curExport
    opDo cat ./LCNT-INFO/Exports/enabledList
    ls -ld ./LCNT-INFO/Exports/*

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntExport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExport {
    G_funcEntry
    function describeF {  cat  << _EOF_
** TODO Should we have extent
-p extent=build || extent=release || extent=build+release  (DEFAULT=build+release)
-p extent=build || extent=view || extent=build+view  (DEFAULT=build+view)
_EOF_
		       }

    EH_assert [[ $# -gt 0 ]]

    if [ -z "${cntntRawHome}" ] ; then
	cntntRawHome="."
    fi
    lcntInfoPrep ${cntntRawHome}
    
    local inFilesList=$@
    local inFile=""
    local eachResult=""
    local lcntNu=${lcnt_lcntNu}
    local lcntVersion=${lcnt_version}
    
    local resultsFileDest=""
    local releaseFileDest=""

    local resultsPathDest=""
    local releasePathDest=""

    local dateTag=$( DATE_nowTag )

    if [ "$1" == "all" ] ; then
	inFilesList=$( vis_enabledExportsDirsList )
    fi

    if [ "$1" == "cur" ] ; then
	inFilesList="cur"
    fi

    lcntInfoPrep ${cntntRawHome}

    opDo lcntBuildsBaseFVsPrep

    function gitLocalBasePathObtain {
	EH_assert [[ $# -eq 0 ]]
	local gitLocalBasePath=""

	gitLocalBasePath="${lcntExport_gitLocalBase}/${lcnt_pubCategory}/${lcnt_lcntNu}"

	if [ ! -d "${gitLocalBasePath}" ] ; then
	    opDo mkdir -p "${gitLocalBasePath}"
	fi
	
	echo ${gitLocalBasePath}
    }

    function methodExportGit {
	EH_assert [[ $# -eq 0 ]]
	local builtResultBase=""
	local here=$(pwd)
	local eachPath=""
	local gitDest=""

	opDo lcntBuildsBaseFVsPrep	

	gitDest=$( gitLocalBasePathObtain )
	
	for eachBuildSpec in ${lcntExport_buildSpecs}; do
	    opDo lcntBuildInfoPrep  ${eachBuildSpec}
		
	    opDoRet pushd "${lcntBuild_releaseBaseDir}"

	    for eachPath in $(ls | grep -v CVS) ; do
		if [ -d "${eachPath}" ] ; then
		    opDo cp -r ${eachPath} ${gitDest}
		elif [ -f "${eachPath}" ] ; then
		    if [ "${eachPath}" == "accessPage.html" ] ; then
			continue
		    elif [ "${eachPath}" == "accessPage.md" ] ; then
			opDo cp ${eachPath} ${gitDest}/readme.md
			inBaseDirDo ${gitDest} git add ${gitDest}/readme.md
		    fi
	       	    opDo cp ${eachPath} ${gitDest}
		fi
		inBaseDirDo ${gitDest} git add ${gitDest}/$( FN_nonDirsPart ${eachPath} )
	    done
	    
	    opDo popd
	    
	done
	
	inBaseDirDo ${gitDest} git commit -m triggered_by_lcntProc.sh_exports    # use _ instead of ' '
	inBaseDirDo ${gitDest} git push
    }
    
    
    for inFile in ${inFilesList}; do

	# 1) Update symlink for curExport
	if [ "${inFile}" == "cur" ] ; then
	    inFile=./curExport
	fi

	#
	# curExport is now properly set. We can use it.
	#
	
	# Read in curExport params
	opDo lcntExportInfoPrep "${inFile}"

	#opDo vis_lcntExportInfoReport "${inFile}"

	# 2) Based on lcntExport_exportSpecName for each do the export based on method
	
	case ${lcntExport_exportMethod} in
	    "ploneProc")
		methodExportPloneProc
		;;
	    "git")
		methodExportGit
		;;
	    *)
		EH_problem "Unknown exportMethod ${lcntExport_exportMethod}"
		lpReturn
	esac
	
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntExportSetCur    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExportSetCur {
    G_funcEntry
    function describeF {  cat  << _EOF_

_EOF_
		       }

    EH_assert [[ $# -eq 1 ]]
    local inFile="$1"

    opDo FN_fileSymlinkUpdate "${inFile}" ./curExport

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntExportExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExportExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    extraInfo="-v -n showRun"
    local inFilesList=""
    local inFile=""

    function listLcntExportCommands {
	EH_assert [[ $# -eq 1 ]]
	local specifiedExtent=$1
	inFilesList=$( vis_buildsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -p extent=${specifiedExtent} -i lcntExport ${inFile}
	done
    }

    function listLcntExportSetCur {
	#inFilesList=$( vis_enabledExportsDirsList )
	inFilesList=$( vis_exportsDirsList )
	for inFile in ${inFilesList}; do
	    echo ${G_myName} ${extraInfo} -i lcntExportSetCur ${inFile}
	done
    }

    
    cat  << _EOF_
=====================================
$( examplesSeperatorChapter "curBuild Points To: -- Set it to:" )
$( ls -l ./curExport )
$( listLcntExportSetCur )
$( examplesSeperatorChapter "Running lcntExport And Release" )
${G_myName} ${extraInfo} -i lcntExport all          # Using enabled list
${G_myName} ${extraInfo} -i lcntExport cur          # 
$( examplesSeperatorChapter "Export Info" )
${G_myName} ${extraInfo} -i lcntExportInfo
ls -l ./curExport
cat ./LCNT-INFO/Exports/enabledList
ls -ld ./LCNT-INFO/Exports/*
_EOF_
    # $( listLcntExportCommands build+release )
    # $( listLcntExportCommands build+view )
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* Build -- Release -- Exports */ |
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntBuildAndExport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildAndExport {
    G_funcEntry
    function describeF {  cat  << _EOF_
** TODO Should we have extent
-p extent=build || extent=release || extent=build+release  (DEFAULT=build+release)
-p extent=build || extent=view || extent=build+view  (DEFAULT=build+view)
_EOF_
		       }

    EH_assert [[ $# -gt 0 ]]

    if [ -z "${cntntRawHome}" ] ; then
	cntntRawHome="."
    fi
    lcntInfoPrep ${cntntRawHome}
    
    local inFilesList=$@

    extent="build+release"

    opDo vis_lcntBuild "${inFilesList}"

    opDo vis_lcntExport "${inFilesList}"
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* Templates Development */ |
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntProcDevelopment    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntProcDevelopment {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }
    cat  << _EOF_
=====================================
---- EnFa - lcntProc.sh -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
diff ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
cp   ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh ./lcntProc.sh
---- EnFa - Panel.org -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
diff ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
cp   ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org ./Panel.org 
_EOF_

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }


    function isObject_mailLcnt_P {
	grep -q mailLcnt _objectType_
	return $?
    }

    function mailLcntPreps {
	if [ ! -d "./mailing" ] ; then
	    opDo mkdir ./mailing
	    inBaseDirDo ./mailing bxtStartMailing.sh -v -n showRun -i startObjectGen lcntHtml path
	else
	    ANT_raw "./mailing in place -- Creation Skipped"
	fi

	if [ ! -f ./headSectionInsert.html ] ; then
	    opDo cp /libre/ByStar/InitialTemplates/mailing/starts/headSectionInsert.html .
	fi
    }

    function perhasAddMailLcnt {
	if [ ! -f ./mailLcnt.ttytex ] ; then
	    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/mailing00-mainEnFa.ttytex.begin ./mailLcnt.ttytex
	    opDo echo "mailLcnt" >> ./LCNT-INFO/docSrcList
	fi
    }

    if isObject_mailLcnt_P ; then
	opDo mailLcntPreps
	opDo perhasAddMailLcnt
    fi
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_templatesDevelopment    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_templatesDevelopment {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
		       }

    if [ ! -d ./LCNT-INFO/templates ] ; then
	vis_templatesDevelopmentPreModern
	return
    fi

    local filesList=$( inBaseDirDo ./LCNT-INFO/templates ls | grep -v CVS  )

    for each in ${filesList} ; do
	cat  << _EOF_
$( examplesSeperatorSubSection "${each}" )	
bx-dblock -i diffBlankedFiles ./${each} $(cat ./LCNT-INFO/templates/${each} )
diff ./${each} $(cat ./LCNT-INFO/templates/${each} )
cp ./${each} $(cat ./LCNT-INFO/templates/${each} )
cp $(cat ./LCNT-INFO/templates/${each} ) ./${each} 
_EOF_
    done
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] ====== /* OBSOLETED */ |
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_templatesDevelopmentPreModern    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_templatesDevelopmentPreModern {
    cat  << _EOF_
=====================================
---- EnFa - articleEnFa.ttytex -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./articleEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/artPresFrontEnFa.ttytex.start
diff ./articleEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/artPresFrontEnFa.ttytex.start
cp ./articleEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/artPresFrontEnFa.ttytex.start
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/artPresFrontEnFa.ttytex.start ./articleEnFa.ttytex 
---- EnFa - presentationEnFa.ttytex -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./presentationEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtFrontEnFa.ttytex.start
diff ./presentationEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtFrontEnFa.ttytex.start
cp ./presentationEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtFrontEnFa.ttytex.start
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtFrontEnFa.ttytex.start ./presentationEnFa.ttytex
---- EnFa - presArtEnFa.ttytex -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./presArtEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtMainEnFa.ttytex.begin
diff ./presArtEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtMainEnFa.ttytex.begin
cp ./presArtEnFa.ttytex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtMainEnFa.ttytex.begin
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/presArtMainEnFa.ttytex.begin ./presArtEnFa.ttytex 
=====================================
---- EnFa - bodyArticleEnFa.tex -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./bodyArticleEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyArticleEnFa.tex.begin
diff ./bodyArticleEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyArticleEnFa.tex.begin
cp ./bodyArticleEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyArticleEnFa.tex.begin
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyArticleEnFa.tex.begin ./bodyArticleEnFa.tex 
---- EnFa - bodyPresArtEnFa.tex -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./bodyPresArtEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyPresArtEnFa.tex.begin
diff ./bodyPresArtEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyPresArtEnFa.tex.begin
cp ./bodyPresArtEnFa.tex /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyPresArtEnFa.tex.begin
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/latex/bodyPresArtEnFa.tex.begin ./bodyPresArtEnFa.tex
=====================================
---- EnFa - lcntProc.sh -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
diff ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
cp   ./lcntProc.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh ./lcntProc.sh
---- EnFa - Panel.org -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
diff ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
cp   ./Panel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginPanel.org ./Panel.org 
$( examplesSeperatorChapter "Initial Templates Development" )
${G_myName} ${extraInfo} -i templatesDevelopment
_EOF_
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
