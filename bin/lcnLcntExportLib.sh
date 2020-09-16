#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"


ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntExportLib.sh,v 1.10 2019-07-29 23:40:41 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntBuilds/fullUsagePanel-en.org::Xref-][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
** TODO New Fields To Be Added -- lcntName  articleForm
   SCHEDULED: <2019-07-18 Thu>
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

# . ${opBinBase}/opAcctLib.sh
# . ${opBinBase}/opDoAtAsLib.sh
# . ${opBinBase}/lpParams.libSh
# . ${opBinBase}/lpReRunAs.libSh

# . ${opBinBase}/lcnObjectTree.libSh
# . ${opBinBase}/lcnLcntLib.sh

lcntExportInfoDir="curExport"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_exportsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_exportsDirsList {
    find ./LCNT-INFO/Exports/ -type d -print | egrep -v './LCNT-INFO/Exports/$' | grep -v CVS
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_enabledExportsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_enabledExportsDirsList {
    EH_assert [[ $# -eq 0 ]]
    #
    # NOTYET, use  lcntExportInfoPrep to get enabledList
    #
    local inFile="./LCNT-INFO/Exports/enabledList"
    local enabledDirsList=""
    local each=""
    
    if [ -f "${inFile}" ] ; then
	enabledDirsList=$( cat "${inFile}" )
	for each in ${enabledDirsList}; do
	    echo "./LCNT-INFO/Exports/${each}"
	done
	lpReturn 0
    else
	EH_problem "Missing ${inFile}"
	lpReturn 1
    fi
}


function gitLocalBaseGet {
    EH_assert [[ $# -eq 1 ]]
    local gitType=$1

    local gitLocalBase=""

    case "${gitType}" in
	github)
	    gitLocalBase="/bisos/git/bxRepos/bxlcnt/results"
	    ;;
	bitbucket)
	    gitLocalBase="/bisos/git/bxRepos/bxlcnt/results-TO-BE-Overwritten"		
	    ;;
	*)
	    EH_problem "Unknown gitType: ${gitType}"
	    ;;
    esac
    echo ${gitLocalBase}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntExportInfoGens    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExportInfoGens {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Creates starting point directories.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lcntInfoPrep ${cntntRawHome}
    lcntPathAnalyze ${cntntRawHome}
    
    local lcntInfoPath="./${lcntInfoDir}"
    local lcntExportCommonInfoBasePath="${lcntInfoPath}/Exports"

    if [ ! -d "${lcntExportCommonInfoBasePath}" ] ; then
	opDo mkdir "${lcntExportCommonInfoBasePath}"
    fi

    function fvNameValueCommonSet {
	EH_assert [[ $# -eq 2 ]]
	local fvName=$1
	local fvValue=$2
	local fvNamePath="${lcntExportCommonInfoBasePath}/${fvName}"
	
	if [[ ! -s "${fvNamePath}" ]]; then
	    echo "${fvValue}" > "${fvNamePath}"
	else
	    ANT_cooked "Exists"
	fi
    }

    opDo fvNameValueCommonSet "enabledList" "bxGithub"

    function fvNameValueSpecificSet {
	EH_assert [[ $# -eq 3 ]]
	local exportDirPath=$1
	local fvName=$2
	local fvValue=$3
	local fvNamePath="${exportDirPath}/${fvName}"
	
	if [[ ! -s "${fvNamePath}" ]]; then
	    echo "${fvValue}" > "${fvNamePath}"
	else
	    ANT_cooked "Exists"
	fi
    }

    function buildSpecsForExportGet {
	EH_assert [[ $# -eq 1 ]]
	local exportType=$1

	local buildsDirList=$( vis_buildsDirsList )
	local applicableBuildSpecs=""

	case "${exportType}" in
	    ploneProc)
		applicableBuildSpecs="${applicableBuildSpecs} $( echo ${buildsDirList} | xargs -n 1 | grep 8.5x11 )"
		applicableBuildSpecs="${applicableBuildSpecs} $( echo ${buildsDirList} | xargs -n 1 | grep html )"
		;;
	    web)
		applicableBuildSpecs="${applicableBuildSpecs} $( echo ${buildsDirList} | xargs -n 1 | grep reveal )"		
		;;
	    git)
		applicableBuildSpecs="${applicableBuildSpecs} $( echo ${buildsDirList} | xargs -n 1 | grep 8.5x11 )"
		applicableBuildSpecs="${applicableBuildSpecs} $( echo ${buildsDirList} | xargs -n 1 | grep presPdf )"		
		;;
	    *)
		EH_problem "Unknown exportType: ${exportType}"
		;;
	esac
	echo ${applicableBuildSpecs}
    }

    local ploneProc_export_hasRun=false
    function ploneProc_export {
	EH_assert [[ $# -eq 0 ]]

	if [ ${ploneProc_export_hasRun} = false ] ; then ploneProc_export_hasRun=true; else  return;  fi

	local exportDirName="ploneProc"
	local exportDirPath="${lcntExportCommonInfoBasePath}/${exportDirName}"	

	if [ ! -d "${exportDirPath}" ] ; then
	    opDo mkdir "${exportDirPath}"
	fi

	opDo fvNameValueSpecificSet ${exportDirPath} "exportSpecName" "${exportDirName}"
	opDo fvNameValueSpecificSet ${exportDirPath} "exportMethod" "ploneProc"	
	opDo fvNameValueSpecificSet ${exportDirPath} "buildSpecs"  "$( buildSpecsForExportGet ploneProc )"
    }

    local webApache_export_hasRun=false
    function webApache_export {
	EH_assert [[ $# -eq 0 ]]

	# Made idempotent
	if [ ${webApache_export_hasRun} = false ] ; then webApache_export_hasRun=true; else  return;  fi
	
	local exportDirName="webApache"
	local exportDirPath="${lcntExportCommonInfoBasePath}/${exportDirName}"	

	if [ ! -d "${exportDirPath}" ] ; then
	    opDo mkdir "${exportDirPath}"
	fi

	opDo fvNameValueSpecificSet ${exportDirPath} "exportSpecName" "${exportDirName}"
	opDo fvNameValueSpecificSet ${exportDirPath} "exportMethod" "web"
	opDo fvNameValueSpecificSet ${exportDirPath} "buildSpecs"  "$( buildSpecsForExportGet web )"
    }

    local bxGithub_export_hasRun=false    
    function bxGithub_export {
	EH_assert [[ $# -eq 0 ]]

	# Made idempotent
	if [ ${bxGithub_export_hasRun} = false ] ; then bxGithub_export_hasRun=true; else  return;  fi
	
	local exportDirName="bxGithub"
	local exportDirPath="${lcntExportCommonInfoBasePath}/${exportDirName}"	

	if [ ! -d "${exportDirPath}" ] ; then
	    opDo mkdir "${exportDirPath}"
	fi

	opDo fvNameValueSpecificSet ${exportDirPath} "exportSpecName" "${exportDirName}"
	opDo fvNameValueSpecificSet ${exportDirPath} "exportMethod" "git"
	opDo fvNameValueSpecificSet ${exportDirPath} "buildSpecs"  "$( buildSpecsForExportGet git )"	
	opDo fvNameValueSpecificSet ${exportDirPath} "gitLocalBase" "$( gitLocalBaseGet github )"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteAccessMethod"  "ssh"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUri"  "NA"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUserId"  "NA"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUserCredentials"  "NA"					
    }

    local bxBitbucket_export_hasRun=false    
    function bxBitbucket_export {
	EH_assert [[ $# -eq 0 ]]

	# Made idempotent
	if [ ${bxBitbucket_export_hasRun} = false ] ; then bxBitbucket_export_hasRun=true; else  return;  fi

	local exportDirName="bitbucket"
	local exportDirPath="${lcntExportCommonInfoBasePath}/${exportDirName}"	

	if [ ! -d "${exportDirPath}" ] ; then
	    opDo mkdir "${exportDirPath}"
	fi

	opDo fvNameValueSpecificSet ${exportDirPath} "exportSpecName" "${exportDirName}"
	opDo fvNameValueSpecificSet ${exportDirPath} "exportMethod" "git"
	#
	# NOTYET, ./LCNT-INFO/Builds/presPdf
	#
	opDo fvNameValueSpecificSet ${exportDirPath} "buildSpecs"  "$( buildSpecsForExportGet git)"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitLocalBase" "$( gitLocalBaseGet bitbucket )"	
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteAccessMethod"  "ssh"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUri"  "NA"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUserId"  "NA"
	opDo fvNameValueSpecificSet ${exportDirPath} "gitRemoteUserCredentials"  "NA"					
    }
    

    local eachModel=""

    for eachModel in ${lcnt_docSrcList} ; do
	case ${eachModel} in
	    "articleEnFa")
		opDo ploneProc_export
		opDo bxGithub_export
		opDo bxBitbucket_export		
		;;
	    "presentationEnFa")
		opDo webApache_export
		opDo bxGithub_export
		opDo bxBitbucket_export		
		;;
	    "presArtEnFa")
		opDo ploneProc_export
		opDo bxGithub_export
		opDo bxBitbucket_export		
		;;
	    *)
		EH_problem "Missing Model"
		;;
	esac
    done

    lpReturn
}	




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntExportInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntExportInfoReport {
  EH_assert [[ $# -gt 0 ]]

  #EH_assert [[ "${inListLcntNu}_" != "MANDATORY_" ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      #FN_fileSafeKeep ${outFile}

      EH_assert [ -f  ${inListLcntNu} ]
      opDo goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi
    opDo getLcntNuBase ${oneDocEntry}
    typeset this_cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${this_cntntRawHome}
    lcntInfoReport
  done
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lcntExportInfoPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntExportInfoPrep {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local lcntExportInfoPath="$1"
    
    #cntInfoPrep ${cntntRawHome}
    #cntPathAnalyze ${cntntRawHome}

    
    lcntExport_exportSpecName=$( fvValueRead "${lcntExportInfoPath}/exportSpecName" )
    lcntExport_exportMethod=$( fvValueRead "${lcntExportInfoPath}/exportMethod" )    
    lcntExport_buildSpecs=$( fvValuesListRead "${lcntExportInfoPath}/buildSpecs" )
    lcntExport_gitLocalBase=$( fvValueRead "${lcntExportInfoPath}/gitLocalBase" )
    lcntExport_gitRemoteUri=$( fvValueRead "${lcntExportInfoPath}/gitRemoteUri" )
    lcntExport_gitRemoteAccessMethod=$( fvValueRead "${lcntExportInfoPath}/gitRemoteAccessMethod" )
    lcntExport_gitRemoteUserId=$( fvValueRead "${lcntExportInfoPath}/gitRemoteUserId" )
    lcntExport_gitRemoteUserCredentials=$( fvValueRead "${lcntExportInfoPath}/gitRemoteUserCredentials" )                    
  
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lcntExportsBaseFVsPrep  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function lcntExportsBaseFVsPrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local lcntExportsBasePath="./LCNT-INFO/Exports"

    lcntExport_enabledList=$( fvValueRead "${lcntExportsBasePath}/enabledList" )    
}



function vis_lcntExportInfoReport {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local lcntExportInfoPath="$1"

    opDo lcntExportInfoPrep ${lcntExportInfoPath}

    echo "lcntExport_exportSpecName=${lcntExport_exportSpecName}"
    echo "lcntExport_buildSpecs=${lcntExport_buildSpecs}"    
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
