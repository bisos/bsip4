#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntOutputs.sh,v 1.8 2019-10-13 18:28:05 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/lcnLcntOutputs.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

function vis_todo {
 cat  << _EOF_

 - Sort out and cleanup deadwood in this file.
_EOF_
}

# ./lcnLcntLib.sh 
. ${opBinBase}/lcnLcntLib.sh

# PRE parameters
typeset -t doc=""
typeset -t firstRun=""
typeset -t outFile="MANDATORY"
typeset -t inFile="MANDATORY"


function G_postParamHook {
  if [[ "${doc}_" != "_" ]] ; then

   docList=""

   typeset thisDoc
   for thisDoc in ${doc} ; do
     docList="${docList} ${thisDoc}"
   done
  fi
}

function vis_examples {
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
  typeset extraInfo="-n showRun"
  #typeset lcntDocNumber=11001
  typeset repubDocNumber=00001
  typeset docBaseName=main
  typeset docType=article
  typeset docFormat1=odp
  typeset docFormat2=ttytex
  typeset repubDocName=repub-070722
  typeset one_inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir.importance"

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- INFO  ---
${G_myName} ${extraInfo} -i help
${G_myName} ${extraInfo} -i todo
--- Get Item --
${G_myName} ${extraInfo} -p cntntRawHome=. -i get authorName 1
${G_myName} ${extraInfo} -p cntntRawHome=. -i get authorUrl 1
${G_myName} ${extraInfo} -p cntntRawHome=. -i get organizationName
${G_myName} ${extraInfo} -p cntntRawHome=. -i get organizationUrl
${G_myName} ${extraInfo} -p cntntRawHome=. -i get description
${G_myName} ${extraInfo} -p cntntRawHome=. -i get docSrcForms
${G_myName} ${extraInfo} -p cntntRawHome=. -i get docSrcList
_EOF_
}

function vis_help {
 cat  << _EOF_

 SEE lcnLcntRoadmap.sh for the big picture.

_EOF_

}


function noArgsHook {
  vis_examples
}


function vis_get {
  EH_assert [[ $# -gt 0 ]]

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}


  case ${1} in
      "description")
	  echo "${lcnt_description}"
	  ;;
      "authorName")
	  echo "${lcnt_author_name[$2]}"
	  ;;
      "authorUrl")
	  echo "${lcnt_author_url[$2]}"
	  ;;
      "organization")
	  echo "${lcnt_organization}"
	  ;;
      "docSrcForms")
	  echo "${lcnt_docSrcForms}"
	  ;;
      "docSrcList")
	  echo "${lcnt_docSrcList}"
	  ;;

      *)
	  varName="lcnt_${1}"
	  if ! varIsSetPredicate ${varName} ; then
	      EH_problem "lcnt_${1} is unSet -- Unknown ${1}"
	  else
	      eval varVal=\$${varName}
	      echo ${varVal}
	  fi

	  return
  esac
}
  
