#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"


ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntBuildLib.sh,v 1.10 2019-11-21 08:13:58 lsipusr Exp $"
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

lcntBuildInfoDir="curBuild"


lcntBuildInfoFilesList=(
    "results"
    "buildName"
    "paperSize" 
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_buildsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_buildsDirsList {
    EH_assert [[ $# -eq 0 ]]
    find ./LCNT-INFO/Builds/ -type d -print | egrep -v './LCNT-INFO/Builds/$' | grep -v CVS
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_enabledBuildsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_enabledBuildsDirsList {
    EH_assert [[ $# -eq 0 ]]
    #
    # NOTYET, use  lcntBuildInfoPrep to get enabledList
    #
    local inFile="./LCNT-INFO/Builds/enabledList"
    local enabledDirsList=""
    local each=""
    
    if [ -f "${inFile}" ] ; then
	enabledDirsList=$( cat "${inFile}" )
	for each in ${enabledDirsList}; do
	    echo "./LCNT-INFO/Builds/${each}"
	done
	lpReturn 0
    else
	EH_problem "Missing ${inFile}"
	lpReturn 1
    fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntBuildInfoGens    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildInfoGens {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
lcntModels:: oneOf: article, pres, pres+presArt, presArt, article+pres+presArt
articleForm:: oneOf: article, book, artBook (Parts become Chapters)
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lcntInfoPrep ${cntntRawHome}
    lcntPathAnalyze ${cntntRawHome}
    
    local lcntInfoPath="./${lcntInfoDir}"

    local articleSrcFile=$( lcnLcntInfo.sh  -p cntntRawHome=${cntntRawHome} -i get artSrcFile )
    local presentationSrcFile=$( lcnLcntInfo.sh  -p cntntRawHome=${cntntRawHome} -i get presSrcFile )    
    local presArtSrcFile=$( lcnLcntInfo.sh  -p cntntRawHome=${cntntRawHome} -i get presArtSrcFile )    

    local lcntBuildCommonInfoBasePath="${lcntInfoPath}/Builds"

    read -r -a lcntAttrHomeArray <<< "$lcntAttrHomeRelBase"

    echo ${lcntAttrHomeArray}
    
    local lcntName=${lcntAttrHomeArray[-1]}  # TODO -- lcntName needs to become a fv in LCNT_INFO

    if [ ! -d "${lcntBuildCommonInfoBasePath}" ] ; then
	opDo mkdir "${lcntBuildCommonInfoBasePath}"
    fi

    function fvNameValueCommonSet {
	EH_assert [[ $# -eq 2 ]]
	local fvName=$1
	local fvValue=$2
	local fvNamePath="${lcntBuildCommonInfoBasePath}/${fvName}"
	
	if [[ ! -s "${fvNamePath}" ]]; then
	    echo "${fvValue}" > "${fvNamePath}"
	else
	    ANT_cooked "Exists"
	fi
    }

    function getEnabledList {
	EH_assert [[ $# -eq 0 ]]
	local eachDocModel=""
	local enabledList=""

	for eachModel in ${lcnt_docSrcList} ; do
	    case ${eachModel} in
		"articleEnFa"|"articleFaEn"|"main")
		    enabledList="${enabledList} art-8.5x11"
		    ;;
		"presentationEnFa"|"presentationFaEn")
		    enabledList="${enabledList} presPdf"
		    ;;
		"presArtEnFa"|"presArtFaEn")
		    enabledList="${enabledList} presArt-8.5x11"
		    ;;
		*)
		    EH_problem "Missing docModel: ${eachModel}"
		    ;;
	    esac
	done
	echo ${enabledList}
    }
    
    opDo fvNameValueCommonSet "enabledList" "$( getEnabledList )"

    opDo fvNameValueCommonSet "resultsBaseDir" "./Results"
    opDo fvNameValueCommonSet "releaseBaseDir" "./Release"        

    function fvNameValueSpecificSet {
	EH_assert [[ $# -eq 3 ]]
	local buildDirPath=$1
	local fvName=$2
	local fvValue=$3
	local fvNamePath="${buildDirPath}/${fvName}"
	
	if [[ ! -s "${fvNamePath}" ]]; then
	    echo "${fvValue}" > "${fvNamePath}"
	else
	    ANT_cooked "Exists"
	fi
    }

    function buildNameGet {
	EH_assert [[ $# -eq 2 ]]
	local buildDirName=$1
	local lcntName=$2

	if [ "${buildDirName}" == "presPdf" ] ; then
	    buildDirName="pres"
	fi
	
	local thisBuildName="${lcntName}-${buildDirName}"

	echo "${thisBuildName}"
	
    }

    
    function art_8.5x11_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="art-8.5x11"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function art_a4_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="art-a4"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "a4"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }


    function art_6x9_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="art-6x9"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"		
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "6x9"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function art_17.5x23.5_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="art-17.5x23.5"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"			
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "17.5x23.5"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }
    


    function book_8.5x11_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="book-8.5x11"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"				
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function book_a4_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="book-a4"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "a4"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }


    function book_6x9_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="book-6x9"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "6x9"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function book_17.5x23.5_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="book-17.5x23.5"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "17.5x23.5"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }
    
    
    function presPdf_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="presPdf"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"	

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${presentationSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }
    

    function html_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="html"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "html"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function presReveal_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="pres-reveal"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${presentationSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "html"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function presArt_8.5x11_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="presArt-8.5x11"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${presArtSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function presArt_a4_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="presArt-a4"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${presArtSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "a4"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function presArt_html_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="presArt-html"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${presArtSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "html"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }
    

    
    function odt_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="odt"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    function markdown_build {
	EH_assert [[ $# -eq 0 ]]

	local buildDirName="markdown"
	local buildDirPath="${lcntBuildCommonInfoBasePath}/${buildDirName}"		

	if [ ! -d "${buildDirPath}" ] ; then
	    opDo mkdir "${buildDirPath}"
	fi

	opDo fvNameValueSpecificSet ${buildDirPath} "buildDocClass" "article"
	opDo fvNameValueSpecificSet ${buildDirPath} "buildName" "$( buildNameGet ${buildDirName} ${lcntName} )"	
	opDo fvNameValueSpecificSet ${buildDirPath} "docSrc"  "${articleSrcFile}"
	opDo fvNameValueSpecificSet ${buildDirPath} "paperSize" "8.5x11"
	opDo fvNameValueSpecificSet ${buildDirPath} "results" "pdf"
	opDo fvNameValueSpecificSet ${buildDirPath} "sides" "2"	
    }

    local eachModel=""

    for eachModel in ${lcnt_docSrcList} ; do
	case ${eachModel} in
	    "articleEnFa"|"articleFaEn"|"main")
		# Based on articleForm choose Book or Article
		opDo art_8.5x11_build
		opDo art_a4_build
		opDo art_6x9_build
		opDo art_17.5x23.5_build						
		opDo html_build
		opDo odt_build
		opDo markdown_build		
		;;
	    "presentationEnFa"|"presentationFaEn")
		opDo presPdf_build
		opDo presReveal_build
		;;
	    "presArtEnFa"|"presArtFaEn")
		opDo presArt_8.5x11_build
		opDo presArt_a4_build
		opDo presArt_html_build
		;;
	    *)
		EH_problem "Missing docModel: ${eachModel}"
		;;
	esac
    done
    

    lpReturn
}	




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntBuildInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBuildInfoReport {
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
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  lcntBuildInfoPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntBuildInfoPrep {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local lcntBuildInfoPath="$1"

    if [ -f "${lcntBuildInfoPath}/results" ] ; then
	lcntBuild_results=$( head -1 "${lcntBuildInfoPath}/results" )
    else
	lcntBuild_results=""
    fi

    rightSide=${lcntBuild_results}

    lcntBuild_resultsList=""
    while [ "${rightSide}" != "" ] ; do
	leftSide=`Plus_leftSide ${rightSide}`
	lcntBuild_resultsList="${lcntBuild_resultsList} ${leftSide}"
	if [ "${leftSide}" == "${rightSide}" ] ; then
	    break
	fi
	rightSide=`Plus_rightSide ${rightSide}`
    done

    if [ -f "${lcntBuildInfoPath}/buildName" ] ; then
	lcntBuild_buildName=$( head -1 "${lcntBuildInfoPath}/buildName" )
    else
	lcntBuild_buildName=""
    fi

    if [ -f "${lcntBuildInfoPath}/docSrc" ] ; then
	lcntBuild_docSrc=$( head -1 "${lcntBuildInfoPath}/docSrc" )
    else
	lcntBuild_docSrc=""
    fi

    if [ -f "${lcntBuildInfoPath}/buildDocClass" ] ; then
	lcntBuild_buildDocClass=$( head -1 "${lcntBuildInfoPath}/buildDocClass" )
    else
	lcntBuild_buildDocClass=""
    fi

    if [ -f "${lcntBuildInfoPath}/paperSize" ] ; then
	lcntBuild_paperSize=$( head -1 "${lcntBuildInfoPath}/paperSize" )
    else
	lcntBuild_paperSize=""
    fi

    if [ -f "${lcntBuildInfoPath}/sides" ] ; then
	lcntBuild_sides=$( head -1 "${lcntBuildInfoPath}/sides" )
    else
	lcntBuild_sides=""
    fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  lcntBuildsBaseFVsPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntBuildsBaseFVsPrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local lcntBuildsBasePath="./LCNT-INFO/Builds"  

    if [ -f "${lcntBuildsBasePath}/enabledList" ] ; then
	lcntBuild_enabledList=$( head -1 "${lcntBuildsBasePath}/enabledList" )
    else
	lcntBuild_enabledList=""
    fi

    if [ -f "${lcntBuildsBasePath}/resultsBaseDir" ] ; then
	lcntBuild_resultsBaseDir=$( head -1 "${lcntBuildsBasePath}/resultsBaseDir" )
    else
	lcntBuild_resultsBaseDir=""
    fi

    if [ -f "${lcntBuildsBasePath}/releaseBaseDir" ] ; then
	lcntBuild_releaseBaseDir=$( head -1 "${lcntBuildsBasePath}/releaseBaseDir" )
    else
	lcntBuild_releaseBaseDir=""
    fi

    if [ -f "${lcntBuildsBasePath}/releaseEnabledList" ] ; then
	lcntBuild_releaseEnabledList=$( head -1 "${lcntBuildsBasePath}/releaseEnabledList" )
    else
	lcntBuild_releaseEnabledList=""
    fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  lcntInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntInfoReport {

  echo "lcntInfoDir=${lcntInfoDir}"


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
