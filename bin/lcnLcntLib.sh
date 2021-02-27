#!/bin/bash
#!/bin/bash

typeset RcsId="$Id: lcnLcntLib.sh,v 1.8 2019-11-21 08:13:59 lsipusr Exp $"

lcntInfoDir="LCNT-INFO"
dirsList=""
lcntUnInfo=""

lcntNuBaseList="/lcnt/outputs/all/lists/nuBaseDir"


function isDirsProcessor {
  #set -x
  if [ "${dirsList}_" == "_" ] ; then
    return 1
  else 
    return 0
  fi
}


lcntFilesList=(
 "author1"
 "date"
 "description"
 "mainTitle"
 "organization"
 "lcntNu"
 "lcntName"
 "shortTitle"
 "subTitle"
 "subSubTitle"
 "type"
 "url"
 "version"
 "contentOrigin"
 "pubCategory"
 "contentSrcFormat"
 "docGroup"
 "lcntQualifier"
 "pubDestUrls"
 "pubFormats"
 "docSrcList"
 "docSrcProcessor"
 "docSrcLangs"
 "docSrcForms"
 "presSrcFile"
 "presArtSrcFile"
 "artSrcFile"
 "articleForm"
 "accessPageInclusion"
 "accessPageDoc" 
 "seeAlso"
 "promotionScore"
 "importanceScore"
)


function readmeOutput {
 cat  << _EOF_
file: /libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntModel/fullUsagePanel-en.org ::lcntInfo-fvDesc
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  fvValueRead    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fvValueRead {
    EH_assert [[ $# -eq 1 ]]
    local fvNamePath=$1
    local fvValue=""
	
    if [ -f "${fvNamePath}" ] ; then
	fvValue=$( head -1 "${fvNamePath}" )
    else
	fvValue=""
    fi
    echo ${fvValue}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  fvValuesListRead    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fvValuesListRead {
    EH_assert [[ $# -eq 1 ]]
    local fvNamePath=$1
    local fvValuesList=""
    
    if [ -f "${fvNamePath}" ] ; then
	fvValuesList=$( cat "${fvNamePath}" )
    else
	fvValuesList=""
    fi
    echo ${fvValuesList}
}




function vis_lcntInfoReport {
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



function lcntInfoPrep {
#set -x
  isDirsProcessor && return $?

  if [ "${lcntUnInfo}_" == "TRUE_" ] ; then return 101; fi

  baseDir=${1}

  lcntPathAnalyze ${1}

  lcntInfoPath=${baseDir}/${lcntInfoDir}

  # /usr/devenv/doc/lcnt/record/neda/byStar/0705151-SPUG/LCNT-INFO/contentSrcFormat
  # ./LCNT-INFO/date
  #set -x
  #set -A lcnt_author
  Array lcnt_author
  author_count=`ls ${lcntInfoPath}/author[0-9] | wc -l`
  for (( i=1;i<=${author_count};i++ )) ; do
    typeset authorContainRegistry=`grep REGISTRY ${lcntInfoPath}/author${i}`
    if [[ "${authorContainRegistry}_" != "_" ]] ; then
      content_author[$i]="`cat ${lcntInfoPath}/author${i}`"
      lcnt_author[$i]="/lcnt/${content_author[$i]}"
      lcnt_author_name[$i]="`cat ${lcnt_author[$i]}/Name`"
      lcnt_author_url[$i]="`cat ${lcnt_author[$i]}/Url`"
      if [ -f "${lcnt_author[$i]}/Lang" ] ; then
         lcnt_author_lang[$i]="`cat ${lcnt_author[$i]}/Lang`"
      else
         lcnt_author_lang[$i]="en"
      fi
    else
      lcnt_author[$i]="`cat ${lcntInfoPath}/author${i}`"
      lcnt_author_name[$i]="${lcnt_author[$i]}"
      lcnt_author_url[$i]=""
      if [ -f "${lcnt_author[$i]}/Lang" ] ; then
         lcnt_author_lang[$i]="`cat ${lcnt_author[$i]}/Lang`"
      else
         lcnt_author_lang[$i]="en"
      fi
    fi
  done

  lcnt_date=`cat ${lcntInfoPath}/date`
  lcnt_description="`cat ${lcntInfoPath}/description`"
  lcnt_mainTitle="`cat ${lcntInfoPath}/mainTitle`"

  typeset orgContainRegistry=`grep REGISTRY ${lcntInfoPath}/organization`
  if [[ "${orgContainRegistry}_" != "_" ]] ; then
    content_organization="`cat ${lcntInfoPath}/organization`"
    lcnt_organization="/lcnt/${content_organization}"
  else
    lcnt_organization="`cat ${lcntInfoPath}/organization`"
  fi

  lcnt_lcntNu=`cat ${lcntInfoPath}/lcntNu`

  lcnt_lcntName=$( fvValueRead "${lcntInfoPath}/lcntName" )
  
  lcnt_shortTitle=`cat ${lcntInfoPath}/shortTitle`
  lcnt_subTitle=`cat ${lcntInfoPath}/subTitle`
  lcnt_subSubTitle=`cat ${lcntInfoPath}/subSubTitle`
  lcnt_type=`cat ${lcntInfoPath}/type`
  lcnt_url=`cat ${lcntInfoPath}/url`
  lcnt_version=`cat ${lcntInfoPath}/version`
  lcnt_contentOrigin=`cat ${lcntInfoPath}/contentOrigin`

  if [ -f ${lcntInfoPath}/promotionScore ] ; then
      lcnt_promotionScore=$( cat ${lcntInfoPath}/promotionScore )
  else
      lcnt_promotionScore=""
  fi

  if [ -f ${lcntInfoPath}/importanceScore ] ; then
      lcnt_importanceScore=$( cat ${lcntInfoPath}/importanceScore )
  else
      lcnt_importanceScore=""
  fi


  if [ -f ${lcntInfoPath}/seeAlso ] ; then
      lcnt_seeAlso=$( cat ${lcntInfoPath}/seeAlso )
  else
      lcnt_seeAlso=""
  fi

  if [ -f ${lcntInfoPath}/docSrcForms ] ; then
      lcnt_docSrcForms=$( cat ${lcntInfoPath}/docSrcForms )
  else
      lcnt_docSrcForms=""
  fi

  lcnt_articleForm=$( fvValueRead "${lcntInfoPath}/articleForm" )
  

  if [ -f ${lcntInfoPath}/docSrcLangs ] ; then
      lcnt_docSrcLangs=$( cat ${lcntInfoPath}/docSrcLangs )
  else
      lcnt_docSrcLangs=""
  fi

  if [ -f ${lcntInfoPath}/docSrcProcessor ] ; then
      lcnt_docSrcProcessor=$( cat ${lcntInfoPath}/docSrcProcessor )
  else
      lcnt_docSrcProcessor=""
  fi

  if [ -f ${lcntInfoPath}/bystarUid ] ; then
      lcnt_bystarUid=$( cat ${lcntInfoPath}/bystarUid )
  else
      lcnt_bystarUid=""
  fi

  lcnt_pubCategory=`cat ${lcntInfoPath}/pubCategory`
  lcnt_contentSrcFormat=`cat ${lcntInfoPath}/contentSrcFormat`
  lcnt_docGroup=`cat ${lcntInfoPath}/docGroup`
  lcnt_lcntQualifier=`cat ${lcntInfoPath}/lcntQualifier`
  lcnt_docSrcList=`cat ${lcntInfoPath}/docSrcList`
  lcnt_one_docSrcList=`head -1 ${lcntInfoPath}/docSrcList`
  #lcnt_mainDocSrcName=`cat ${lcntInfoPath}/mainDocSrcName`
  #lcnt_summaryDocSrcName=`cat ${lcntInfoPath}/summaryDocSrcName`
  lcnt_pubDestUrls=`cat ${lcntInfoPath}/pubDestUrls`

  if [ -f ${lcntInfoPath}/pubDestBxUids ] ; then
      lcnt_pubDestBxUids=$( cat ${lcntInfoPath}/pubDestBxUids ) 
  else
      lcnt_pubDestBxUids=${lcnt_bystarUid}
  fi

  rightSide=`cat ${lcntInfoPath}/pubFormats`

  lcnt_pubFormats=""
  while [ "${rightSide}X" != "X" ] ; do
    leftSide=`Plus_leftSide ${rightSide}`
    lcnt_pubFormats="${lcnt_pubFormats} ${leftSide}"
    if [ "${leftSide}X" == "${rightSide}X" ] ; then
      break
    fi
    rightSide=`Plus_rightSide ${rightSide}`
  done

  if [[ -f ${lcntInfoPath}/accessPageInclusion ]] ; then
    lcnt_accessPageInclusion=`cat ${lcntInfoPath}/accessPageInclusion`
  else
    lcnt_accessPageInclusion=""
  fi

  if [[ -f ${lcntInfoPath}/accessPageDoc ]] ; then
    lcnt_accessPageDoc=`cat ${lcntInfoPath}/accessPageDoc`
  else
    lcnt_accessPageDoc=""
  fi

  if [[ -f ${lcntInfoPath}/presSrcFile ]] ; then
    lcnt_presSrcFile=`cat ${lcntInfoPath}/presSrcFile`
  else
    lcnt_presSrcFile=""
  fi
  
  if [[ -f ${lcntInfoPath}/presArtSrcFile ]] ; then
    lcnt_presArtSrcFile=`cat ${lcntInfoPath}/presArtSrcFile`
  else
    lcnt_presArtSrcFile=""
  fi
  
  if [[ -f ${lcntInfoPath}/artSrcFile ]] ; then
    lcnt_artSrcFile=`cat ${lcntInfoPath}/artSrcFile`
  else
    lcnt_artSrcFile=""
  fi
  
  # NOW Drive all needed vars

  lcnt_tag="LCNT_${lcnt_lcntNu}"

  lcnt_one_pubDestUrls=`head -1 ${lcntInfoPath}/pubDestUrls`
  
  lcnt_docSrcPrimary=$( head -1 ${lcntInfoPath}/docSrcList )


  if [[ -f ${lcntInfoPath}/destPath7 ]] ; then
      docModulePath="/content/`cat ${lcntInfoPath}/destPath1`/`cat ${lcntInfoPath}/destPath2`/`cat ${lcntInfoPath}/destPath3`/`cat ${lcntInfoPath}/destPath4`/`cat ${lcntInfoPath}/destPath5`/`cat ${lcntInfoPath}/destPath6`/`cat ${lcntInfoPath}/destPath7`"
      docModuleExportPath="/rsync/lcnt/`cat ${lcntInfoPath}/destPath4`/`cat ${lcntInfoPath}/destPath5`/`cat ${lcntInfoPath}/destPath6`/`cat ${lcntInfoPath}/destPath7`"
  else
      docModulePath="/content/`cat ${lcntInfoPath}/destPath1`/`cat ${lcntInfoPath}/destPath2`/`cat ${lcntInfoPath}/destPath3`/`cat ${lcntInfoPath}/destPath4`/`cat ${lcntInfoPath}/destPath5`/`cat ${lcntInfoPath}/destPath6`"
      docModuleExportPath="/rsync/lcnt/`cat ${lcntInfoPath}/destPath4`/`cat ${lcntInfoPath}/destPath5`/`cat ${lcntInfoPath}/destPath6`"
  fi

}

function lcntInfoReport {

  echo "lcntInfoDir=${lcntInfoDir}"

  echo "lcntInfoPath=${lcntInfoPath}"

  echo "lcnt_author1=${lcnt_author[1]}"
  echo "lcnt_date=${lcnt_date}"
  echo "lcnt_description=${lcnt_description}"
  echo "lcnt_mainTitle=${lcnt_mainTitle}"
  echo "lcnt_organization=${lcnt_organization}"
  echo "lcnt_lcntNu=${lcnt_lcntNu}"
  echo "lcnt_shortTitle=${lcnt_shortTitle}"
  echo "lcnt_subTitle=${lcnt_subTitle}"
  echo "lcnt_subSubTitle=${lcnt_subSubTitle}"
  echo "lcnt_type=${lcnt_type}"
  echo "lcnt_url=${lcnt_url}"
  echo "lcnt_version=${lcnt_version}"
  echo "lcnt_contentOrigin=${lcnt_contentOrigin}"

  echo "lcnt_pubCategory=${lcnt_pubCategory}"
  echo "lcnt_contentSrcFormat=${lcnt_contentSrcFormat}"
  echo "lcnt_docGroup=${lcnt_docGroup}"
  echo "lcnt_lcntQualifier=${lcnt_lcntQualifier}"
  echo "lcnt_pubDestUrls=${lcnt_pubDestUrls}"

  # NOW Drive all needed vars

  echo "lcnt_tag=${lcnt_tag}"

  echo "lcnt_one_pubDestUrls=${lcnt_one_pubDestUrls}"
  echo "lcnt_docSrcPrimary=${lcnt_docSrcPrimary}"
  echo "lcnt_docSrcForms=${lcnt_docSrcForms}"
  echo "lcnt_docSrcLangs=${lcnt_docSrcLangs}"
  echo "lcnt_docSrcProcessor=${lcnt_docSrcProcessor}"
  echo "lcnt_pubFormats=${lcnt_pubFormats}"  
  echo "docModulePath=${docModulePath}"
  echo "docModuleExportPath=${docModuleExportPath}"

}


function lcnLcntPre {
  if [[ "${cntntRawHome}_" == "._" ]] ; then
    cntntRawHome=`pwd`
  fi
}


function lcntPathAnalyze {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This is somewhat tricky.  
There are two sets of assumed hierarchies that we traverse.

One is: /lcnt/lgpc/bystar/permanent/xxx
The other is ~ea-59070/bx/lcnt/lgpc/permanent/xxx

The intial piece is first stripped up until /lcnt.
After that, the two are different in that  between 
lgpc and permanent there could be a bystar or not.

Se we need to take care of that.
_EOF_
    }

  baseDir=$1

  cd $baseDir
  baseDir=`pwd`

  typeset lcntBaseFound="FALSE"
  lcntBaseDir="/"

  pathToArray ${baseDir}

  set ${pathArray[@]}

  for thisElem in ${pathArray[@]} ; do
    lcntBaseDir="${lcntBaseDir}${thisElem}/"
    shift
    if [[ "${thisElem}_" == "lcnt_" ]] ; then
      lcntBaseFound="TRUE"
      break
    elif [[ "${thisElem}_" == "info_" ]] ; then
      lcntBaseFound="TRUE"
      break
    fi
  done

  if [[ "${lcntBaseFound}_" != "TRUE_" ]] ; then 
    return 1
  fi

  #echo ${lcntBaseDir}
  # ASSERT that things are deep enough

  lcntAttrGenPub=$1  # One of: lgcc, lgpc, lpxc, sw

  case ${lcntAttrGenPub} in 
    "lgcc"|"lgpc"|"lpxc"|"sw")
	 doNothing
	 ;;
    "externalLimited"|"externalConfidential"|"externalLibre"|"externalPublic"|"mohsenConfidential")
	 doNothing
	 ;;
    *)
       EH_problem "Unknown lcntAttrGenPub: ${lcntAttrGenPub}"
       return 1
       ;;
  esac

  lcntAttrSource=$2   # One of: mohsen, neda, payk.  In the case of repub (/info), one of: finance, politics, technology

  if [[ -d ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO ]] ; then
   if [[ -f ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/lcntSourceInfo.sh ]] ; then
     . ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/lcntSourceInfo.sh
   else
     EH_problem ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/lcntSourceInfo.sh
   fi
  elif [[ -d ${lcntBaseDir}${lcntAttrGenPub}/SOURCE-INFO ]] ; then
      lcntAttrSource=""
   if [[ -f ${lcntBaseDir}${lcntAttrGenPub}/SOURCE-INFO/lcntSourceInfo.sh ]] ; then
     . ${lcntBaseDir}${lcntAttrGenPub}/SOURCE-INFO/lcntSourceInfo.sh
   else
     EH_problem ${lcntBaseDir}${lcntAttrGenPub}/SOURCE-INFO/lcntSourceInfo.sh
   fi
 else
   EH_problem ${lcntBaseDir}${lcntAttrGenPub}/SOURCE-INFO
 fi

 if [[ "${pathArray[0]}_" == "info_" ]] ; then
    lcntAttrPermanence=repub
 elif [[ "${pathArray[1]}_" == "sw_" ]] ; then
    lcntAttrPermanence=sw
 else
   lcntAttrPermanence=$3  # one of draft, permanent, record, repub

   case ${lcntAttrPermanence} in 
     "draft"|"permanent"|"record"|"repub")
					   doNothing
					   ;;
     *)
	lcntAttrPermanence=$2
	case ${lcntAttrPermanence} in 
	    "draft"|"permanent"|"record"|"repub")
		doNothing
		;;
	    *)
		EH_problem "Unknown lcntAttrPermanence: ${lcntAttrPermanence}"
		return 1
		;;
	esac
	;;
   esac
 fi

 lcntAttrGroup=${4:-}

 shift; shift; shift; shift
 # rest all together becomes
 if [ -z "$*" ] ; then
     lcntAttrHomeRelBase=${lcntAttrGroup}
 else
     lcntAttrHomeRelBase=$*
 fi

}

function getLcntNuBase {

  EH_assert [[ $# -eq 1 ]]

  typeset oneEntry="$1"
  opDo grep -i ${oneEntry} ${lcntNuBaseList}
  typeset isInList=`grep -i ${oneEntry} ${lcntNuBaseList} | head -1`
  if [[ -n ${isInList} ]] ; then
    #lcntNu=`echo ${isInList} | cut -d ": " -f1`
    #cntntRawHome=`echo ${isInList} | cut -d ": " -f2`
    lcntNu=`echo ${isInList} | cut -d ":" -f1`
    cntntRawHome=`echo ${isInList} | cut -d ":" -f2`
  else
    EH_problem "${oneEntry} is not on the list"
    return 101
  fi
  return 0
}

function goThroughList {
  EH_assert [[ $# -eq 2 ]]

  thisList="$1"
  thisFuncName="$2"

  #
  # NOTE CO-PROCESS FAILURE WITH BASH (KSH93 Worked Just Fine)
  # So We read  it into a var and then 
  # process. Need to perhaps worry about scalability.
  #
  
  #cat ${thisList} |
  #while read this_line ; do

  #$coproc { cat  ${thisList};  }
  #while read -u  ${COPROC[0]} this_line ; do

#set -x

  varedThisList=$( cat ${thisList} )

  echo ${varedThisList}

  typeset this
  typeset first
  typeset second
  typeset gotFirst="false"
  for this in ${varedThisList} ; do
      if [ "${gotFirst}" == "false" ] ;  then
	  first=${this}
	  gotFirst="true"
	  continue;
      else
	  second=${this}
	  gotFirst="false"

	  #ANT_raw "goThroughList -- read ${first} ${second}"
          #typeset thisLcntNu=`echo ${this_line} | cut -d ":" -f1`
	  thisLcntNu=$( echo ${first} | cut -d ":" -f1 )
	  ${G_myName} -p bystarUid=${bystarUid} -p urlFormat=${urlFormat}  -p inListLcntNu=${thisList} -p outFile=${outFile} -i ${thisFuncName} ${thisLcntNu}
	  ANT_raw "goThroughList -- processed ${first} ${second}"
      fi
  done
}

function lcntNuBaseVerifyAndFix {
  EH_assert [[ $# -eq 1 ]]

  typeset hereDir="$1"

   if [ ! -f ${lcntNuBaseList} ] ; then
       EH_problem "Missing ${lcntNuBaseList}, re-build it first"
       opDo touch ${lcntNuBaseList}
    return 101
  fi

  hereLcntLine=$( ${opBinBase}/lcnLcntOutputs.sh  -p cntntRawHome=${hereDir} -i lcntNuStdout )

  if [[ -z "${hereLcntLine}" ]] ; then
    EH_problem "Missing content ${hereDir}"
    return 101
  fi

  if [[ "${hereLcntLine}" == "00000" ]] ; then
      return 0
  fi

  typeset isInList=$( grep -i "${hereLcntLine}" ${lcntNuBaseList} )
  if [[ -z "${isInList}" ]] ; then
    echo "${hereLcntLine}" >> ${lcntNuBaseList}
    ANT_raw "${hereLcntLine} was added to ${lcntNuBaseList}"
  fi
    
  return 0
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_determineSrcType  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_determineSrcType {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Puts type on stdout. -- Type is one of "article", "presentation", "presArt" or ""

** TODO NOTYET A more relaibale way of doing this can be: 
		    if egrep 'documentclass.*beamer' ${this_docSrcList}.ttytex ; then
			ANT_raw "Skipping: obtainPLPCFiles of ${this_docSrcList}"

_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local cntntRawHome="$1"
    local lcntSrcFileName="$2"
    local lcntSrcType=""
    
    case ${lcntSrcFileName} in

	"article"|"articleEnFa"|"articleFaEn")
	    lcntSrcType="article"
	    ;;

	"mailLcnt")
	    lcntSrcType="article"
	    ;;
	
	"presentation"|"presentationEnFa"|"presentationFaEn")
	    lcntSrcType="presentation"
	    ;;
	
	"presArt"|"presArtEnFa"|"presArtFaEn"|"artPres"|"artPresEnFa"|"presArtFaEn")
	    lcntSrcType="presArt"
	    ;;
	
	*)
	    EH_problem "UnKnown Type: ${lcntSrcFileName}"
	    ;;
    esac

    echo ${lcntSrcType}

    lpReturn
}	
