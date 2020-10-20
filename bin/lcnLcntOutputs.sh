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
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /opt/public/osmt/bin/lcnLcntOutputs.sh 
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
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || TODOs     ::  Status, Notes, Todos    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
** Turn above TODOs into a dblock with todos and agendas as hot
** TODO [#A] Capture as template and include in begin and start. etc.
   SCHEDULED: <2019-07-25 Thu>
** TODO Sort out and cleanup deadwood in this file.
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



# ./lcnLcntLib.sh 
. ${opBinBase}/lcnLcntLib.sh

# . ${opBinBase}/bystarHook.libSh

# bxo_lib.sh
. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/opAcctLib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# mmaLayer3Lib.sh 
# . ${opBinBase}/mmaLayer3Lib.sh 

# bystarDnsDomain.libSh  
# . ${opBinBase}/bystarDnsDomain.libSh

# . ${opBinBase}/bystarInfoBase.libSh



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Params    ::  typeset -t    [[elisp:(org-cycle)][| ]]
_CommentEnd_



# PRE parameters
typeset -t doc=""
typeset -t firstRun=""
typeset -t outFile="MANDATORY"
typeset -t inFile="MANDATORY"
typeset -t bystarUid="MANDATORY"
typeset -t urlFormat=""


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
  if [[ "${doc}_" != "_" ]] ; then

   docList=""

   typeset thisDoc
   for thisDoc in ${doc} ; do
     docList="${docList} ${thisDoc}"
   done
  fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_examplesTemplate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examplesTemplate {
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


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  noArgsHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function noArgsHook {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] Example Groups                          :: /* Grouping Of Examples */ |
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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
${G_myName} ${extraInfo} -i getLcntNuBaseInfo PLPC-120025
--- Initial Setup ---
${G_myName} ${extraInfo}  -i allPlpcBib
--- Bib Item ---
${G_myName} ${extraInfo} -p cntntRawHome=. -i bibItemStdout
${G_myName} ${extraInfo} -p cntntRawHome=.  -p urlFormat="url" -i bibItemStdout > ./lcnt.bib.gened
${G_myName} ${extraInfo} -p cntntRawHome=. -i bibHtmlShortStdout
${G_myName} ${extraInfo} -p cntntRawHome=. -i bibHtmlLongStdout
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntNuStdout
--- Developer ---
${G_myName} ${extraInfo} -p cntntRawHome=. -i bibDescription
--- inList / Output: .bib
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -i inListFullBibOut all
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p urlFormat="url" -i inListFullBibOut all
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i inListDotBibOut all
${G_myName} ${extraInfo}  -i inListDotBibOut PLPC-100011
${G_myName} ${extraInfo}  -i inListDotBibOut PLPC-100011 PLPC-100012
--- LcntNu FULL Processor ---
${G_myName} ${extraInfo}  -p outFile=/lcnt/outputs/all/lists/nuBaseDir -i nuBaseDirFullUpdate
${G_myName} ${extraInfo}  -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -i sortListsFullUpdate
--- LcntNu Processor ---
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=plpc       -p outFile=/lcnt/outputs/all/lists/nuBaseDir.plpc -i lcntNuSort
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=records    -p outFile=/lcnt/outputs/all/lists/nuBaseDir.records -i lcntNuSort
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=draft      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.draft -i lcntNuSort
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=repub      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.repub -i lcntNuSort
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=sw      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.sw -i lcntNuSort
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=importance -p outFile=/lcnt/outputs/all/lists/nuBaseDir.importance -i lcntNuSort
--- LcntNu Processor - HTML ---
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -p format=short -p outFile=/tmp/shortBibFormat.$$.html -i fullHtmlTable
${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir.sw -p format=short -p outFile=/tmp/shortBibFormat.$$.html -i fullHtmlTable
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -p format=long  -p outFile=/tmp/longBibFormat.$$.html -i fullHtmlTable
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -p format=short -p useThisSite=www.neda.com -p outFile=/tmp/shortBibFormat.$$.html -i fullHtmlTable
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -p format=long  -p useThisSite=www.neda.com -p outFile=/tmp/longBibFormat.$$.html -i fullHtmlTabel

${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -p format=long  -p useThisSite=www.neda.com -p outFile=/tmp/longBibFormat.$$.html -i fullHtmlTabel
--- Access Page Generation ---
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i accessPageGen all
${G_myName} ${extraInfo} -i accessPageGen PLPC-100011
${G_myName} ${extraInfo} -p outFile=./accessPage.html -i accessPageGen PLPC-100011
${G_myName} ${extraInfo} -p outFile=./accessPage.md -i accessPageGen_md PLPC-100011
${G_myName} ${extraInfo} -i accessPageGen PLPC-100011 PLPC-100012
${G_myName} ${extraInfo} -p bystarUid=ea-59009 -i accessPageBxoGen PLPC-100011
${G_myName} ${extraInfo} -p bystarUid=ea-59009 -i accessPageBxoGen PLPC-180038
${G_myName} ${extraInfo} -i readyRoomCleanDir  PLPC-120041
_EOF_
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_nuBaseDirFullUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_nuBaseDirFullUpdate {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${outFile}_" != "MANDATORY_" ]]

  typeset dirsPart=$( FN_dirsPart ${outFile} )

  opDoExit mkdir -p ${dirsPart}

  FN_fileSafeKeep ${outFile}

  opDoExit cd /lcnt/lgpc
  lcntProc.sh   -i dirsRecurse lcntNuOut > ${outFile}.$$

  opDoExit cd /lcnt/sw
  lcntProc.sh   -i dirsRecurse lcntNuOut >> ${outFile}.$$

  #opDoExit cd /lcnt/lgcc
  #lcntProc.sh   -i dirsRecurse lcntNuOut >> ${outFile}.$$

  sort ${outFile}.$$ | uniq > ${outFile}

  opDo /bin/rm ${outFile}.$$
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_sortListsFullUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_sortListsFullUpdate {

  EH_assert [[ $# -eq 0 ]]


  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=plpc       -p outFile=/lcnt/outputs/all/lists/nuBaseDir.plpc -i lcntNuSort

  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=records    -p outFile=/lcnt/outputs/all/lists/nuBaseDir.records -i lcntNuSort

  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=draft      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.draft -i lcntNuSort

  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=repub      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.repub -i lcntNuSort

  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=sw      -p outFile=/lcnt/outputs/all/lists/nuBaseDir.sw -i lcntNuSort

  ${G_myName} ${extraInfo} -p inListLcntNu=/lcnt/outputs/all/lists/nuBaseDir -p sortByCategory=importance -p outFile=/lcnt/outputs/all/lists/nuBaseDir.importance -i lcntNuSort


}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_allPlpcBib    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_allPlpcBib {
    #/lcnt/outputs/all/plpc.bib

    opDoExit cd /lcnt
    
    opDo lcntProc.sh  -i dirsRecurse bibOut > /lcnt/outputs/all/plpc.bib
    
    opDo ls -l /lcnt/outputs/all/plpc.bib
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_bibDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bibDescription {

  EH_assert [[ $# -eq 0 ]]

  #docType=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

 
  echo ${lcnt_description} | sed -e 's:":\":g'
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_bibItemStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bibItemStdout {

  EH_assert [[ $# -eq 0 ]]

  if [ -s  "./lcnt.bib" ] ; then
      opDo cat ./lcnt.bib
      lpReturn
  fi

  #docType=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}


  case ${lcnt_pubCategory} in
    "Permanent"|"LCNT"|"PLPC")
	    bibType="Permanent Libre Published Content"
       ;;
    "Records"|"RLCNT"|"record")
	    bibType="Published Libre Record"
       ;;
    "DRAFT"|"DLCNT"|"draft")
	    bibType="Draft Libre Published Content"
       ;;
    "Private")
	    bibType="Private Libre Generated Content"
       ;;
    "Repub")
	    bibType="Re-Published Content"
       ;;
    "SW")
	    bibType="Software Content"
       ;;
    *)
       EH_problem "${lcnt_pubCategory} -- Unexpected"
       return
       ;;
  esac

  typeset lcnt_authors=""
  typeset thisAuthor=""
  for (( i=1;i<=${author_count};i++ )) ; do
      if [ "${lcnt_author_lang[$i]}" = "fa" ] ; then
	  thisAuthor="\begin{fa} ${lcnt_author_name[$i]} \end{fa}"
      else
	  thisAuthor="${lcnt_author_name[$i]}"
      fi
      if [[ "${lcnt_authors}_" == "_" ]] ; then
	  lcnt_authors="${thisAuthor}"
      else
	  lcnt_authors="${lcnt_authors}, ${thisAuthor}"
      fi
  done

  set -- $(IFS="+"; echo ${lcnt_docSrcLangs})
  typeset docSrcLangsList=$*
  typeset primarySrcLang=$1


  if [ "${primarySrcLang}" = "fa" ] ; then
      bibTitle="\begin{fa} ${lcnt_mainTitle} ${lcnt_subTitle} ${lcnt_subSubTitle} \end{fa}"
  else
      bibTitle="${lcnt_mainTitle} ${lcnt_subTitle} ${lcnt_subSubTitle}"
  fi

  echo ${lcnt_description} > /tmp/descriptionFile.$$
  html2text  /tmp/descriptionFile.$$ >  /tmp/descriptionFile_text.$$
  bibAbstract=`cat /tmp/descriptionFile_text.$$ | sed -e 's:":\\\\":g'`
  /bin/rm /tmp/descriptionFile.$$ /tmp/descriptionFile_text.$$

  bibLocation=`pwd`

  bibMonth=`date -d "${lcnt_date}" +%B`
  bibYear=`date -d "${lcnt_date}" +%G`

  if [ "${urlFormat}" = "url" ] ; then
      cat  << _EOF_

@techreport{${lcnt_pubCategory}-${lcnt_lcntNu},
   author        = {" ${lcnt_authors} "},
   title         = {" ${bibTitle} "},
   type          = "${bibType}",
   number        = {"${lcnt_lcntNu}"},
   institution   = "Autonomously Self-Published",
   month         = {"${bibMonth}"},
   year          = "${bibYear}",
   note          = "\url{${lcnt_url}}",
   abstract      = "${bibAbstract}",
   location      = "${bibLocation}"
}

_EOF_

  else
      cat  << _EOF_

@techreport{${lcnt_pubCategory}-${lcnt_lcntNu},
   author        = {" ${lcnt_authors} "},
   title         = {" ${bibTitle} "},
   type          = "${bibType}",
   number        = {"${lcnt_lcntNu}"},
   institution   = "Autonomously Self-Published",
   month         = {"${bibMonth}"},
   year          = "${bibYear}",
   note          = "\htmladdnormallink{${lcnt_url}}{${lcnt_url}}",
   abstract      = "${bibAbstract}",
   location      = "${bibLocation}"
}

_EOF_

  fi

  function configTheTemplate {
    #set -x
    #opDo ls -l $1
    cat $1 | sed -e "s%@lcnt_mainTitle@%${lcnt_mainTitle}%g" \
       -e "s%@lcnt_subTitle@%${lcnt_subTitle}%g" \
       -e "s%@lcnt_subSubTitle@%${lcnt_subSubTitle}%g" \
       -e "s%@lcnt_version@%${lcnt_version}%g" \
       -e "s%@lcnt_url@%${lcnt_url}%g" \
       -e "s%@lcnt_author1@%${lcnt_author1}%g" \
       -e "s%@lcnt_date@%${lcnt_date}%g" \
       -e "s%@lcnt_organization@%${lcnt_organization}%g" \
       -e "s%@lcnt_lcntNu@%}%g" \
       -e "s%@lcnt_shortTitle@%${lcnt_shortTitle}%g" \
       -e "s%@lcnt_type@%${lcnt_type}%g" \
       -e "s%@lcnt_url@%${lcnt_one_pubDestUrls}/${lcnt_url}%g" \
       -e "s%@lcnt_contentOrigin@%${lcnt_contentOrigin}%g" \
       -e "s%@lcnt_pubCategory@%${lcnt_pubCategory}%g" \
       -e "s%@lcnt_contentSrcFormat@%${lcnt_contentSrcFormat}%g" \
       -e "s%@lcnt_docGroup@%${lcnt_docGroup}%g" \
       -e "s%@lcnt_lcntQualifier@%${lcnt_lcntQualifier}%g" \
       -e "s%@lcnt_pubDestUrls@%${lcnt_pubDestUrls}%g" \
       -e "s%@lcnt_tag@%${lcnt_tag}%g" \
       -e "s%@lcnt_one_pubDestUrls@%${lcnt_one_pubDestUrls}%g" \
       -e "s%@lcnt_%@lcnt-%g" 

       # The last s/_/- is because latex barfs at _
  }

  #configTheTemplate ${docStartTemplate} > ${docFileName}
  
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntNuStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntNuStdout {

  EH_assert [[ $# -eq 0 ]]

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  if [[ "${lcnt_lcntNu}" == "00000" ]] ; then
 cat  << _EOF_
00000
_EOF_

      return 0
  fi
  
  bibLocation=`pwd`

 cat  << _EOF_
${lcnt_pubCategory}-${lcnt_lcntNu}: ${bibLocation}
_EOF_

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_bibHtmlShortStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bibHtmlShortStdout {

  EH_assert [[ $# -eq 0 ]]

  #docType=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}<br><a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}<br>${lcnt_author_name[$i]}"
      fi
    fi
  done

  if [[ "${lcnt_organization}_" != "_" ]] ; then 
    if [[ -f ${lcnt_organization}/Name ]] ; then
      typeset organization_name=`cat ${lcnt_organization}/Name`
    else
      typeset organization_name="${lcnt_organization}"
    fi
  else
    typeset organization_name="${lcnt_authors}"
  fi

  if [[ -f ${lcnt_organization}/Url ]] ; then
    typeset organization_url=`cat ${lcnt_organization}/Url`
    typeset this_lcnt_organization="<a href="${organization_url}">${organization_name}</a>"
  else
    typeset this_lcnt_organization="${organization_name}"
  fi

  bibTitle="<center><b>${lcnt_mainTitle}</b><br>${lcnt_subTitle}<br><i>${lcnt_subSubTitle}</i></center>"
  bibMonth=`date -d "${lcnt_date}" +%b`
  bibYear=`date -d "${lcnt_date}" +%G`
  if [[ "${lcnt_pubCategory}_" == "Records_" ]] ; then
    lcnt_pubCategory_rename="RCRDS"
  else
    lcnt_pubCategory_rename="${lcnt_pubCategory}"
  fi

  if [[ "${useThisSite}_" != "_" ]] ; then
    #typeset isInList=`echo ${lcnt_pubDestUrls} | grep -i ${useThisSite}`
    #if [[ -n ${isInList} ]] ; then
      lcnt_one_pubDestUrls="${useThisSite}"
      lcnt_url="http://${useThisSite}/${lcnt_pubCategory}/${lcnt_lcntNu}"
    #fi
  else
    lcnt_url="http://${lcnt_one_pubDestUrls}/${lcnt_pubCategory}/${lcnt_lcntNu}"
  fi

#  cat  << _EOF_
# <tr>
# <td><a href="${lcnt_url}">[${lcnt_pubCategory_rename}-${lcnt_lcntNu}]</a><br>${lcnt_type}/<br>${lcnt_pubCategory_rename}</td>
# <td width="500px">${bibTitle}</td>
# <td>
# _EOF_

#
# NOTYET, Under Number after PLPC-Number, we now say Article Format.
#  The Primary format should be determined (Art, Pres, Lang)
#

 cat  << _EOF_
<tr>
<td><a href="${lcnt_url}">[${lcnt_pubCategory_rename}-${lcnt_lcntNu}]</a><br>Article<br>Globish</td>
<td width="500px">${bibTitle}</td>
<td>
_EOF_

  typeset oneFormat
  for oneFormat in ${lcnt_pubFormats} ; do
    if [[ "${oneFormat}_" == "tex4ht_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}/index.html">[html]</a><br>
_EOF_
    elif [[ "${oneFormat}_" == "heveaHtml_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}/index.html">[html]</a><br>
_EOF_
    elif [[ "${oneFormat}_" == "ps_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.ps">[ps]</a><br>
_EOF_
    elif [[ "${oneFormat}_" == "pdf_" ]] ; then
	#<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf">[pdf]</a><br>
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf">[pdf]</a><br>
_EOF_
    fi
  done

 cat  << _EOF_
</td>
<td>${lcnt_authors}</td>
<td>${this_lcnt_organization}</td>
<td>${bibMonth}<br>${bibYear}</td>

</tr>

_EOF_


}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_bibHtmlLongStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bibHtmlLongStdout {

  EH_assert [[ $# -eq 0 ]]

  #docType=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}, <a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}, ${lcnt_author_name[$i]}"
      fi
    fi
  done

  if [[ "${lcnt_organization}_" != "_" ]] ; then 
    if [[ -f ${lcnt_organization}/Name ]] ; then
      typeset organization_name=`cat ${lcnt_organization}/Name`
    else
      typeset organization_name="${lcnt_organization}"
    fi
  else
    typeset organization_name=""
  fi

  if [[ -f ${lcnt_organization}/Url ]] ; then
    typeset organization_url=`cat ${lcnt_organization}/Url`
    typeset this_lcnt_organization="<a href="${organization_url}">${organization_name}</a>"
  else
    typeset this_lcnt_organization=""
  fi

  bibTitle="${lcnt_mainTitle} ${lcnt_subTitle} ${lcnt_subSubTitle}"
  bibMonth=`date -d "${lcnt_date}" +%B`
  bibYear=`date -d "${lcnt_date}" +%G`


  if [[ "${useThisSite}_" != "_" ]] ; then
    typeset isInList=`echo ${lcnt_pubDestUrls} | grep -i ${useThisSite}`
    if [[ -n ${isInList} ]] ; then
      lcnt_one_pubDestUrls="${useThisSite}"
      lcnt_url="http://${useThisSite}/${lcnt_pubCategory}/${lcnt_lcntNu}"
    fi
  else
    lcnt_url="http://${lcnt_one_pubDestUrls}/${lcnt_pubCategory}/${lcnt_lcntNu}"
  fi

 cat  << _EOF_
<tr>
<td>
<a href="${lcnt_url}">[${lcnt_pubCategory}-${lcnt_lcntNu}]</a>. 
${lcnt_authors}. 
<i>${bibTitle}</i>. 
_EOF_

   if [[ "${this_lcnt_organization}_" != "_" ]] ; then
 cat  << _EOF_
${this_lcnt_organization}, 
_EOF_
    else
 cat  << _EOF_
&nbsp;
_EOF_
    fi

 cat  << _EOF_
${bibMonth} ${bibYear}. 
${lcnt_type}/${lcnt_pubCategory}. <br>
[&nbsp;
_EOF_


  typeset oneFormat
  for oneFormat in ${lcnt_pubFormats} ; do
    if [[ "${oneFormat}_" == "tex4ht_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}/index.html">.html</a>&nbsp; | 
_EOF_
    elif [[ "${oneFormat}_" == "heveaHtml_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}/index.html">.html</a>&nbsp; | 
_EOF_
    elif [[ "${oneFormat}_" == "ps_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.ps">.ps</a>&nbsp; | 
_EOF_
    elif [[ "${oneFormat}_" == "pdf_" ]] ; then
 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf">.pdf</a>&nbsp; |
_EOF_
    fi
  done

 cat  << _EOF_
<a href="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib">.bib</a>&nbsp; ]
<blockquote><font size="-1">
${lcnt_description}
</font></blockquote><p>
</td>
</tr>

_EOF_


}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_fullHtmlTable    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullHtmlTable {

  typeset thisOne=""
  typeset currentDir=`pwd`

  #outFile="/lcnt/outputs/all/plpc.bib.html"
  #longOutFile="/lcnt/outputs/all/plpc.longbib.html"


  case ${format} in
    "short")
	     #FN_fileSafeKeep ${outFile}
 cat  << _EOF_ > ${outFile}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>


<table border="1">
<tr>
<td style="font-weight: bold; color: red; text-align: center;">Number</td>
<td width="500px" style="font-weight: bold; color: red; text-align: center;">TITLE</td>
<td style="font-weight: bold; color: red; text-align: center;">Format</td>
<td style="font-weight: bold; color: red; text-align: center;">Authors</td>
<td style="font-weight: bold; color: red; text-align: center;">CopyLeft</td>
<td style="font-weight: bold; color: red; text-align: center;">Date</td>
</tr>

_EOF_

   typeset oneNu
   cat ${inListLcntNu} | 
   while read line ; do
     #typeset this_docNu=`echo ${line} | cut -d ': ' -f 1 `
     #typeset this_docBaseSrc=`echo ${line} | cut -d ': ' -f 2 `
     typeset this_docNu=`echo ${line} | cut -d ':' -f 1 `
     typeset this_docBaseSrc=`echo ${line} | cut -d ':' -f 2 `
     print "####### $line #######"
     if [[ -n ${useThisSite} ]] ; then
       ${G_myName} -p cntntRawHome="${this_docBaseSrc}" -p useThisSite=${useThisSite} -i bibHtmlShortStdout >> ${outFile}
     else
       ${G_myName} -p cntntRawHome="${this_docBaseSrc}" -i bibHtmlShortStdout >> ${outFile}
     fi
   done

   cat  << _EOF_ >> ${outFile}

</table>

</BODY>
</HTML>

_EOF_
    opDo ls -l ${outFile}
	     ;;
         "long")

 cat  << _EOF_ > ${outFile}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>


<table border="0">
_EOF_

   typeset oneNu
   cat ${inListLcntNu} | 
   while read line ; do
     #typeset this_docNu=`echo ${line} | cut -d ': ' -f 1 `
     #typeset this_docBaseSrc=`echo ${line} | cut -d ': ' -f 2 `
     typeset this_docNu=`echo ${line} | cut -d ':' -f 1 `
     typeset this_docBaseSrc=`echo ${line} | cut -d ':' -f 2 `
     print "####### $line #######"
     if [[ -n ${useThisSite} ]] ; then
       ${G_myName} -p cntntRawHome="${this_docBaseSrc}" -p useThisSite=${useThisSite} -i bibHtmlLongStdout >> ${outFile}
     else
       ${G_myName} -p cntntRawHome="${this_docBaseSrc}" -i bibHtmlLongStdout >> ${outFile}
     fi

   done

   cat  << _EOF_ >> ${outFile}

</table>

</BODY>
</HTML>

_EOF_

    opDo ls -l ${outFile}
		 ;;
         *)
	    EH_problem "Unknown ${format}"
	    ;;
    esac
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_inListDotBibOut    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_inListDotBibOut {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"
  typeset outputFile=""    #existed before -p outFile was added -- should be cleaned up.

  if [ "${outFile}" == "MANDATORY" ] ; then
      outFile=""
  fi

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi
    opDo getLcntNuBase ${oneDocEntry}
    typeset this_cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${this_cntntRawHome}

    print "####### Generate .bib for ${lcntNu} ##############"

    if [ -z "${outFile}" ] ; then
	outputFile="${docModulePath}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib"
    else
	outputFile="${outFile}"
    fi

    FN_dirCreatePathIfNotThere `dirname ${outputFile}`
    ${G_myName} -p cntntRawHome="${this_cntntRawHome}" -i bibItemStdout 2> /dev/null > ${outputFile}
    opDo ls -l ${outputFile}
  done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_inListFullBibOut    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_inListFullBibOut {

  EH_assert [[ $# -gt 0 ]]

  if [ "${outFile}_" == "MANDATORY_" ] ; then
      if [ "${urlFormat}" = "url" ] ; then
	  outFile="/lcnt/outputs/all/plpcUrl.bib"
      else
	  outFile="/lcnt/outputs/all/plpc.bib"
      fi
  fi

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      FN_fileSafeKeep ${outFile}

      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi
    opDo getLcntNuBase ${oneDocEntry}
    typeset this_cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${this_cntntRawHome}

    #print "####### Generate .bib for ${lcntNu} ##############"
    
    ${G_myName} -p cntntRawHome="${this_cntntRawHome}" -p urlFormat=${urlFormat} -i bibItemStdout 2> /dev/null >> ${outFile}
  done

  opDo ls -l ${outFile}
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntNuSort    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntNuSort {

  case ${sortByCategory} in 
    "plpc" | "PLPC")
       grep PLPC- ${inListLcntNu} | sort -r -o ${outFile}
       ;;
    "Records" | "records")
       grep -i records ${inListLcntNu} | sort -r -o ${outFile}
       ;;
    "Repub" | "REPUB" | "repub")
       grep -i repub ${inListLcntNu} | sort -r -o ${outFile}
       ;;
    "sw" | "SW")
       grep -i sw ${inListLcntNu} | sort -r -o ${outFile}
       ;;
    "Draft" | "DRAFT" | "draft")
       grep DRAFT ${inListLcntNu} | sort -r -o ${outFile}
       ;;
    "importance")
       opDo ${G_myName} -p inListLcntNu=${inListLcntNu} -p sortByCategory=plpc -p outFile=/tmp/outsort.plpc -i lcntNuSort
       opDo ${G_myName} -p inListLcntNu=${inListLcntNu} -p sortByCategory=records -p outFile=/tmp/outsort.records -i lcntNuSort
       #opDo ${G_myName} -p inListLcntNu=${inListLcntNu} -p sortByCategory=sw -p outFile=/tmp/outsort.sw -i lcntNuSort
       opDo ${G_myName} -p inListLcntNu=${inListLcntNu} -p sortByCategory=repub -p outFile=/tmp/outsort.repub -i lcntNuSort
       opDo ${G_myName} -p inListLcntNu=${inListLcntNu} -p sortByCategory=draft -p outFile=/tmp/outsort.draft -i lcntNuSort

       opDo cat /tmp/outsort.plpc > ${outFile}
       opDo cat /tmp/outsort.records >> ${outFile}
       #opDo cat /tmp/outsort.sw >> ${outFile}
       opDo cat /tmp/outsort.repub >> ${outFile}
       opDo cat /tmp/outsort.draft >> ${outFile}
       ;;
    *)
       EH_problem "Not a valid category: ${sortByCategory}"
       return 1
       ;;
  esac

  opDo ls -l ${outFile}
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_accessPageBxoGen    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_accessPageBxoGen {
    EH_assert [[ $# -gt 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    typeset docEntries="$@"

    typeset oneDocEntry
    for oneDocEntry in ${docEntries}; do
	if [[ "${oneDocEntry}_" == "all_" ]]; then
	    EH_assert [ -f  ${inListLcntNu} ]
	    goThroughList ${inListLcntNu} ${visibleFunction}
	    return
	fi

	opDo getLcntNuBase ${oneDocEntry}
	#lcntPathAnalyze "${cntntRawHome}"
	lcntInfoPrep "${cntntRawHome}"
	opDo pwd

    
	if [[ "${lcntAttrPermanence}_" == "repub_" ]] ; then
	    typeset this_publishableFiles=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`
            if [ "${this_publishableFiles}_" == "_" ] ; then
		opDo generateOneAccessPageBxo_general "${lcntNu}" "${cntntRawHome}"
	    else
		opDo generateOneAccessPage_repub "${lcntNu}" "${cntntRawHome}"
	    fi
	elif [[ "${lcntAttrPermanence}_" == "sw_" ]] ; then
	    opDo generateOneAccessPage_sw "${lcntNu}" "${cntntRawHome}"
	else
	    opDo generateOneAccessPageBxo_general "${lcntNu}" "${cntntRawHome}"
	fi
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_accessPageGen_md    [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_accessPageGen_md {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local origOutFile="${outFile}"

    outFile="/tmp/accessPage.html"
    opDo vis_accessPageGen $@

    cat "${outFile}" \
	| sed -e s/www.bytopic.org/bytopic/ -e s/www.bycontent.org/bycontent/ \
	| grep -v 'A Permanent Libre Published Content' \
	|  pandoc --from html --to markdown_strict -o "${origOutFile}"

    ls -l $( FN_absolutePathGet "${origOutFile}" )

    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_accessPageGen    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_accessPageGen {
  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}
    #lcntPathAnalyze "${cntntRawHome}"
    lcntInfoPrep "${cntntRawHome}"
    opDo pwd

    
    if [[ "${lcntAttrPermanence}_" == "repub_" ]] ; then
	typeset this_publishableFiles=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`
        if [ "${this_publishableFiles}_" == "_" ] ; then
	  opDo generateOneAccessPage_general "${lcntNu}" "${cntntRawHome}"
	else
	  opDo generateOneAccessPage_repub "${lcntNu}" "${cntntRawHome}"
	fi
    elif [[ "${lcntAttrPermanence}_" == "sw_" ]] ; then
      opDo generateOneAccessPage_sw "${lcntNu}" "${cntntRawHome}"
    else
      opDo generateOneAccessPage_general "${lcntNu}" "${cntntRawHome}"
    fi
  done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_readyRoomCleanDir    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_readyRoomCleanDir {
  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}
    lcntInfoPrep "${cntntRawHome}"
    
    # Protect Against bad docModulePath
    typeset dstPathChk=$( cat ${lcntInfoPath}/destPath1 )
    if [ -z "${dstPathChk}" ] ; then
	EH_problem "Bad ${docModulePath}"
	lpReturn 101
    fi
    if [ -d "${docModulePath}" ] ; then
	opDo rm -r "${docModulePath}"
    else
	EH_problem "Missing ${docModulePath}"
    fi
  done
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  setPubCategoryString    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function setPubCategoryString {
#set -x
  EH_assert [[ $# -eq 0 ]]

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  case ${lcnt_pubCategory} in
    "Permanent"|"LCNT"|"PLPC")
	    pubCategoryString="Permanent Libre Published Content"
       ;;
    "Records"|"RLCNT"|"record")
	    pubCategoryString="Published Libre Record"
       ;;
    "DRAFT"|"DLCNT"|"draft")
	    pubCategoryString="Draft Libre Published Content"
       ;;
    "Private")
	    pubCategoryString="Private Libre Generated Content"
       ;;
    "Repub")
	    pubCategoryString="Re-Published Public Content"
       ;;
    "SW")
	    pubCategoryString="Libre Software Content"
       ;;
    *)
       EH_problem "${lcnt_pubCategory} -- Unexpected"
       return
       ;;
  esac
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  getAccessPageOutputFileName    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function getAccessPageOutputFileName {
    G_funcEntry
    function describeF {  cat  << _EOF_
Also create the directory if needed.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${outFile}" ] ; then
	FN_dirCreatePathIfNotThere "${docModulePath}/accessPage"
	echo "${docModulePath}/accessPage/index.html"
    elif [ "${outFile}" == "MANDATORY" ] ; then
	FN_dirCreatePathIfNotThere "${docModulePath}/accessPage"
	echo "${docModulePath}/accessPage/index.html"
    else
	echo "${outFile}"
    fi

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  getAccessPageOutputDirName    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function getAccessPageOutputDirName {
    G_funcEntry
    function describeF {  cat  << _EOF_
Also create the directory if needed.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo FN_dirCreatePathIfNotThere "${docModulePath}/accessPage"   # 2019-10-04 - What Changed???
    
    echo "${docModulePath}/accessPage"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  copyHtmlAccessPageImages    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function copyHtmlAccessPageImages {
    G_funcEntry
    function describeF {  cat  << _EOF_
Any thing that is external to the html file but is needed will be 
copied to the accessPage directory.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ ! -z "${lcnt_accessPageDoc}" ] ; then
	filesList=$( find ${docModulePath}/${lcnt_accessPageDoc} -print | egrep ".png|.PNG|.jpg|.JPG|.pnm|.PNM" )		
    else
	filesList=$( find ${docModulePath}/${lcnt_one_docSrcList} -print | egrep ".png|.PNG|.jpg|.JPG|.pnm|.PNM" )	
    fi

    if [ -z "${filesList}" ] ; then 
	ANT_raw "Nothing To Copy"
    else
	opDo cp ${filesList} $( getAccessPageOutputDirName )

        # Backwards Compatibility
	if [ -f  "${docModulePath}/${lcnt_lcntNu}-access.html" ] ; then
	    opDo cp ${filesList} "${docModulePath}"
	fi
    fi 

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  announceAccessPageOutput    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function announceAccessPageOutput {
    G_funcEntry
    function describeF {  cat  << _EOF_
When done with generation, announce its location and provide access.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local inFile="$1"
    local accessPageOutputFileName=$( FN_absolutePathGet ${inFile} )    

    ls -l "${accessPageOutputFileName}"
    ANT_raw "cat ${accessPageOutputFileName}"
    ANT_raw "file://${accessPageOutputFileName}"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  generateOneAccessPage_general    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function generateOneAccessPage_general {

  typeset lcntNu="$1"
  typeset this_cntntRawHome="$2"


  print "####### Generate Access Page for ${lcntNu} ##############"
  
  cntntRawHome="${this_cntntRawHome}"
  lcntInfoPrep ${cntntRawHome}

  #typeset outputFile="${docModulePath}/${lcnt_lcntNu}-access.html"
  typeset outputFile=$( getAccessPageOutputFileName )

  # 
  setPubCategoryString
  
 cat  << _EOF_ > ${outputFile} 
<HTML>
<HEAD>
<TITLE>${lcnt_shortTitle}</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
</HEAD>
<BODY>
<P>
<P><BODY BGCOLOR="BFDFFF">
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">A ${pubCategoryString}</big></center>
<HR>
<P>
_EOF_


  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}, <a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}, ${lcnt_author_name[$i]}"
      fi
    fi
  done

 cat  << _EOF_ >> ${outputFile}

<H3 ALIGN="CENTER">${lcnt_mainTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subSubTitle}</H3>

<P>
<table border="0"> 
<tr><td>Document Number: </td><td>${lcnt_pubCategory}-${lcnt_lcntNu} &nbsp; 
<A HREF="${docModulePath}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib">[ .bib ]</A></td></tr>
<tr><td>Version: </td><td>${lcnt_version}</td></tr>
<tr><td>Dated: </td><td>${lcnt_date}</td></tr>
<tr><td>Group: </td><td>${lcnt_docGroup}</td></tr>
<tr><td>Primary URL: </td><td><a href="${lcnt_url}">${lcnt_url}</a></td></tr>
<tr><td>Federated Publications: </td>
    <td><a href="http://www.bytopic.org/${lcnt_pubCategory}/${lcnt_lcntNu}">ByTopic</a> -- 
        <a href="http://www.bycontent.org/${lcnt_pubCategory}/${lcnt_lcntNu}">ByContent</a>
    </td>
</tr>
<tr><td>AccessPage Revision: </td>
    <td> This AccessPage was produced on $( date +"%B %d, %C%y" ) at $( date +"%k:%M" ) $( date +"%Z")  ($( date +"%z" ))</td>
</tr>
<tr><td>Author(s): </td><td>${lcnt_authors}</td></tr>
_EOF_

   if [[ "${lcnt_organization}_" != "_" ]] ; then 
     if [[ -f ${lcnt_organization}/Name ]] ; then
       typeset organization_name=`cat ${lcnt_organization}/Name`
     else
       typeset organization_name="${lcnt_organization}"
     fi

     if [[ -f ${lcnt_organization}/Url ]] ; then
       typeset organization_url=`cat ${lcnt_organization}/Url`
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td><a href="${organization_url}">${organization_name}</a></td></tr>
<P>
_EOF_
     else
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td>${organization_name}</td></tr>
<P>
_EOF_

     fi

    fi

   if [[ "${lcnt_seeAlso}_" != "_" ]] ; then 
 cat  << _EOF_ >> ${outputFile}
<tr><td>See Also: </td><td>${lcnt_seeAlso}
</td></tr>
<P>
_EOF_
   fi


 cat  << _EOF_ >> ${outputFile}
</table>
_EOF_

#CopyLeft -- Verbatim Copying Permited


 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">AVAILABLE FORMATS</big><br>
<P>
<UL>
<P>
_EOF_
    typeset thisOneFormat
    for thisOneFormat in ${lcnt_pubFormats} ; do
      case ${thisOneFormat} in
	"genHtml")
	 fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList} | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}/index.html">HTML</A>:  -- ${fileSize} -- Displays the
document as a web page.
_EOF_
        ;;
	"html")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList} | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}/index.html">HTML</A>: -- ${fileSize} -- Displays the
document as a web page.
_EOF_
        ;;
	"tex4ht")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList} | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}/index.html">HTML</A>: -- ${fileSize} -- Displays the
document as a web page.
_EOF_
        ;;
	"heveaHtml")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList} | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}/index.html">HTML</A>: -- ${fileSize} -- Displays the
document as a web page.
_EOF_
        ;;
	"pdf")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList}.pdf | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>  
<A HREF="${docModulePath}/${lcnt_one_docSrcList}.pdf">PDF</A>: -- ${fileSize} -- Provides the document in Portable Document Format.
_EOF_
        ;;
	"ps")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList}.ps | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}.ps">PS</A>: -- ${fileSize} --  Provides the document in Postscript format for printing.
_EOF_
        ;;
	"odp")
	fileSize=`du -h ${docModulePath}/${lcnt_one_docSrcList}.odp | cut -f 1`
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${lcnt_one_docSrcList}.odp">ODP</A>: -- ${fileSize} --  Provides the document in Open Document Presentation.
_EOF_
        ;;
	"tty")
 cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath#/content/generated}/${lcnt_one_docSrcList}.tty">Text Only</A>: Provides the document in text-only format for faster downloading.
_EOF_
        ;;
	*)
	EH_problem "${thisOneFormat}: Unknown"
	print ""
	;;
      esac
    done

 cat  << _EOF_ >> ${outputFile}
</UL>
_EOF_


 typeset this_publishableFiles=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`

 if [ "${this_publishableFiles}_" != "_" ] ; then

     cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">AVAILABLE OTHER FORMS</big><br>
<P>
<UL>
<P>
_EOF_


     typeset thisOnePublishable
     for thisOnePublishable in ${this_publishableFiles} ; do
	 typeset thisFileName=`cat ${thisOnePublishable}`
	 fileSize=`du -h ${docModulePath}/${thisFileName} | cut -f 1`
	 typeset thisPublishableDesc=""
	 if [ -f ${thisOnePublishable}_desc ] ; then
	     thisPublishableDesc=$( cat ${thisOnePublishable}_desc )
	 fi
	 cat  << _EOF_ >> ${outputFile}
<LI>  
<A HREF="${docModulePath}/${thisFileName}">${thisFileName}</A>: -- ${fileSize} -- ${thisPublishableDesc} .
_EOF_
     done

 cat  << _EOF_ >> ${outputFile}
</UL>
_EOF_

   fi

 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">SHORT 
DESCRIPTION</big><br>
<P>${lcnt_description}
_EOF_



# MB: [2012-09-12 Wed] -- Processing of "${lcnt_accessPageInclusion}" is problematic -- revisit
#set -x

   if [ "${lcnt_accessPageInclusion}_" != "_" -o "${lcnt_accessPageInclusion}_" != "none_" ] ; then
       if [ -f "${lcnt_accessPageInclusion}" ] ; then
 cat  << _EOF_ >> ${outputFile}	   
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_
 cat ${lcnt_accessPageInclusion} >> ${outputFile}
       else
	   case ${lcnt_accessPageInclusion} in
	       "html")
		   cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_
		   if [ ! -z "${lcnt_accessPageDoc}" ] ; then
		       cat ${docModulePath}/${lcnt_accessPageDoc}/index.html >> ${outputFile}
		   else
		       cat ${docModulePath}/${lcnt_one_docSrcList}/index.html >> ${outputFile}
		   fi
		   opDo copyHtmlAccessPageImages 
		   ;;

		       "pdf-beamer")
			   cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_

			   if [ -z ${lcnt_one_docSrcList} ] ; then
			       if [ -f ${lcntInfoPath}/publishable1 ]; then
				   typeset publishable1=$( cat ${lcntInfoPath}/publishable1 )
				   cat  << _EOF_ >> ${outputFile}
<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${publishable1}#toolbar=0&navpanes=0&scrollbar=0" width="750" height="570">
_EOF_
			       else
				   EH_problem "Missing docSrcList and no publishable1"
			       fi
			   else
			       cat  << _EOF_ >> ${outputFile}
<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="570">
_EOF_
			   fi
			   ;;
       "pdf")
 cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL PDF INLINE DOCUMENT</big></center><br>
<P>
_EOF_

 if [ -z ${lcnt_one_docSrcList} ] ; then
     if [ -f ${lcntInfoPath}/publishable1 ]; then
	 typeset publishable1=$( cat ${lcntInfoPath}/publishable1 )
 cat  << _EOF_ >> ${outputFile}
<embed src="${docModulePath}/${publishable1}#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">
_EOF_
     else
	 EH_problem "Missing docSrcList and no publishable1"
     fi
 else

#<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">

 cat  << _EOF_ >> ${outputFile}
<embed src="${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">
_EOF_
 fi
       ;;
	*)
	EH_problem "${lcnt_accessPageInclusion}: Unknown"
	print ""
	;;
	   esac
       fi
   fi


 if [[ -s ${lcntInfoPath}/accessPageExtra ]] ; then

 cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_


   typeset this_accessPageExtra="`cat ${lcntInfoPath}/accessPageExtra`"
   cat ${cntntRawHome}/${this_accessPageExtra} >> ${outputFile}
 fi



 cat  << _EOF_ >> ${outputFile}
<P>
</BODY>
</HTML>
_EOF_

  # Backwards Compatibility
  if [ -f  "${docModulePath}/${lcnt_lcntNu}-access.html" ] ; then
      opDo cp "${outputFile}" "${docModulePath}/${lcnt_lcntNu}-access.html"
      announceAccessPageOutput "${docModulePath}/${lcnt_lcntNu}-access.html"
  fi

  announceAccessPageOutput "${outputFile}"
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  generateOneAccessPageBxo_general    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function generateOneAccessPageBxo_general {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Often invoked from lcntProc.sh
_EOF_
    }

    EH_assert [[ $# -eq 2 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    typeset lcntNu="$1"
    typeset this_cntntRawHome="$2"

    opDoRet bystarAcctAnalyze ${bystarUid}

    opAcctInfoGet ${bystarUid}

    bystarDomainFormsPrep 2> /dev/null
    

    print "####### Generate Access Page for ${lcntNu} ${bystarDomFormTld} ${bystarDomFormTld_web} ##############"
  
  cntntRawHome="${this_cntntRawHome}"
  lcntInfoPrep ${cntntRawHome}

  #typeset outputFile="${docModulePath}/${lcnt_lcntNu}-access.html"
  typeset outputFile=$( getAccessPageOutputFileName )

  # 
  setPubCategoryString
  
 cat  << _EOF_ > ${outputFile} 
<HTML>
<HEAD>
<TITLE>${lcnt_shortTitle}</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
</HEAD>
<BODY>
<P>
<P><BODY BGCOLOR="BFDFFF">
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">A ${pubCategoryString}</big></center>
<HR>
<P>
_EOF_


  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}, <a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}, ${lcnt_author_name[$i]}"
      fi
    fi
  done

 cat  << _EOF_ >> ${outputFile}

<H3 ALIGN="CENTER">${lcnt_mainTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subSubTitle}</H3>

<P>
<table border="0"> 
<tr><td>Document Number: </td><td>${lcnt_pubCategory}-${lcnt_lcntNu} &nbsp; 
<A HREF="${docModulePath}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib">[ .bib ]</A></td></tr>
<tr><td>Version: </td><td>${lcnt_version}</td></tr>
<tr><td>Dated: </td><td>${lcnt_date}</td></tr>
<tr><td>Group: </td><td>${lcnt_docGroup}</td></tr>
<tr><td>Primary URL: </td><td><a href="${lcnt_url}">${lcnt_url}</a></td></tr>
<tr><td>Federated Publications: </td>
    <td><a href="http://www.bytopic.org/${lcnt_pubCategory}/${lcnt_lcntNu}">ByTopic</a> -- 
        <a href="http://www.bycontent.org/${lcnt_pubCategory}/${lcnt_lcntNu}">ByContent</a>
    </td>
</tr>
<tr><td>AccessPage Revision: </td>
    <td> This AccessPage was produced on $( date +"%B %d, %C%y" ) at $( date +"%k:%M" ) $( date +"%Z")  ($( date +"%z" ))</td>
</tr>
<tr><td>Author(s): </td><td>${lcnt_authors}</td></tr>
_EOF_

   if [[ "${lcnt_organization}_" != "_" ]] ; then 
     if [[ -f ${lcnt_organization}/Name ]] ; then
       typeset organization_name=`cat ${lcnt_organization}/Name`
     else
       typeset organization_name="${lcnt_organization}"
     fi

     if [[ -f ${lcnt_organization}/Url ]] ; then
       typeset organization_url=`cat ${lcnt_organization}/Url`
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td><a href="${organization_url}">${organization_name}</a></td></tr>
<P>
_EOF_
     else
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td>${organization_name}</td></tr>
<P>
_EOF_

     fi

    fi

   if [[ "${lcnt_seeAlso}_" != "_" ]] ; then 
 cat  << _EOF_ >> ${outputFile}
<tr><td>See Also: </td><td>${lcnt_seeAlso}
</td></tr>
<P>
_EOF_
   fi


 cat  << _EOF_ >> ${outputFile}
</table>
_EOF_

#CopyLeft -- Verbatim Copying Permited


 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">AVAILABLE FORMATS</big><br>
<P>
<UL>
<P>
_EOF_

    local lcntSrcType
    for this_docSrcList in ${lcnt_docSrcList} ; do
	lcntSrcType=$( vis_determineSrcType "${cntntRawHome}" "${this_docSrcList}" )
     
	typeset thisOneFormat
	for thisOneFormat in ${lcnt_pubFormats} ; do

	    function notyetSupported {
		echo "NOTYET Supported"
	    }

	    function badLcntSrcType {
		EH_problem "Bad Doc: ${this_docSrcList} ${lcntSrcType}"
	    }


	    local rsyncLcntAsRoot
	    local resultPath
	    case ${thisOneFormat} in
		"heveaHtml")
		    if [ "${lcntSrcType}" == "presentation" ]  ; then
			# What we really want is the reveal.js files

			resultPath=${docModuleExportPath}/pres/${lcntNu}-pres.html
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Screencast-Presentation</A>: -- ${fileSize} -- Displays the
presentation document as a Reveal.Js web page.
_EOF_
			
		    elif [ "${lcntSrcType}" == "article" ]  ; then
			resultPath=${docModuleExportPath}/art/${lcntNu}-art.html
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Article-Html</A>: -- ${fileSize} -- Displays the
article document as a web page.
_EOF_

			
		    elif [ "${lcntSrcType}" == "presArt" ]  ; then
			resultPath=${docModuleExportPath}/presArt/${lcntNu}-presArt.html
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Presentation-As-Article-Html</A>: -- ${fileSize} -- Displays the
presentation document as an article web page.
_EOF_
			
		    else
			badLcntSrcType
		    fi
		    ;;

		"pdf")
		    if [ "${lcntSrcType}" == "presentation" ]  ; then
			resultPath=${docModuleExportPath}/pres/${lcntNu}-pres.pdf
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Presentation-Pdf</A>: -- ${fileSize} -- 
Provides the presentation document in Portable Document Format.
_EOF_

		    elif [ "${lcntSrcType}" == "article" ]  ; then
			resultPath=${docModuleExportPath}/art/${lcntNu}-art.pdf
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Article-Pdf</A>: -- ${fileSize} -- 
Provides the article document in Portable Document Format.
_EOF_

		    elif [ "${lcntSrcType}" == "presArt" ]  ; then
			resultPath=${docModuleExportPath}/presArt/${lcntNu}-presArt.pdf
			fileSize=$( du -h ${resultPath}  | cut -f 1 )
			rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
			cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Presentation-Article-Pdf</A>: -- ${fileSize} -- 
Provides the presentation document as an article in Portable Document Format.
_EOF_
			
		    else
			badLcntSrcType
		    fi
		    ;;
		
		"ps")
		    fileSize=`du -h ${docModulePath}/${this_docSrcList}.ps | cut -f 1`
		    cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${this_docSrcList}.ps">PS</A>: -- ${fileSize} --  Provides the document in Postscript format for printing.
_EOF_
		    ;;
		"odp")
		    fileSize=`du -h ${docModulePath}/${this_docSrcList}.odp | cut -f 1`
		    cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath}/${this_docSrcList}.odp">ODP</A>: -- ${fileSize} --  Provides the document in Open Document Presentation.
_EOF_
		    ;;
		"tty")
		    cat  << _EOF_ >> ${outputFile}
<LI>
<A HREF="${docModulePath#/content/generated}/${this_docSrcList}.tty">Text Only</A>: Provides the document in text-only format for faster downloading.
_EOF_
		    ;;
		*)
		    EH_problem "${thisOneFormat}: Unknown"
		    print ""
		    ;;
	    esac
	done
    done

 cat  << _EOF_ >> ${outputFile}
</UL>
_EOF_


 typeset this_publishableFiles=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`

 if [ "${this_publishableFiles}_" != "_" ] ; then

     cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">AVAILABLE OTHER FORMS</big><br>
<P>
<UL>
<P>
_EOF_


     typeset thisOnePublishable
     for thisOnePublishable in ${this_publishableFiles} ; do
	 typeset thisFileName=`cat ${thisOnePublishable}`
	 fileSize=`du -h ${docModulePath}/${thisFileName} | cut -f 1`
	 typeset thisPublishableDesc=""
	 if [ -f ${thisOnePublishable}_desc ] ; then
	     thisPublishableDesc=$( cat ${thisOnePublishable}_desc )
	 fi
	 cat  << _EOF_ >> ${outputFile}
<LI>  
<A HREF="${docModulePath}/${thisFileName}">${thisFileName}</A>: -- ${fileSize} -- ${thisPublishableDesc} .
_EOF_
     done

 cat  << _EOF_ >> ${outputFile}
</UL>
_EOF_

   fi

 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">SHORT 
DESCRIPTION</big><br>
<P>${lcnt_description}
_EOF_



# MB: [2012-09-12 Wed] -- Processing of "${lcnt_accessPageInclusion}" is problematic -- revisit
#set -x

   if [ "${lcnt_accessPageInclusion}_" != "_" -o "${lcnt_accessPageInclusion}_" != "none_" ] ; then
       if [ -f "${lcnt_accessPageInclusion}" ] ; then
 cat  << _EOF_ >> ${outputFile}	   
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_
 cat ${lcnt_accessPageInclusion} >> ${outputFile}
       else
	   case ${lcnt_accessPageInclusion} in
	       "html")
		   cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_
		   if [ ! -z "${lcnt_accessPageDoc}" ] ; then
		       cat ${docModulePath}/${lcnt_accessPageDoc}/index.html >> ${outputFile}
		   else
		       cat ${docModulePath}/${lcnt_one_docSrcList}/index.html >> ${outputFile}
		   fi
		   opDo copyHtmlAccessPageImages 
		   ;;

	       "pdf-beamer")
			   cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_

			   if [ -z ${lcnt_one_docSrcList} ] ; then
			       if [ -f ${lcntInfoPath}/publishable1 ]; then
				   typeset publishable1=$( cat ${lcntInfoPath}/publishable1 )
				   cat  << _EOF_ >> ${outputFile}
<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${publishable1}#toolbar=0&navpanes=0&scrollbar=0" width="750" height="570">
_EOF_
			       else
				   EH_problem "Missing docSrcList and no publishable1"
			       fi
			   else
			       cat  << _EOF_ >> ${outputFile}
<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="570">
_EOF_
			   fi
			   ;;
	       "pdf")
 cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL PDF INLINE DOCUMENT</big></center><br>
<P>
_EOF_

 if [ -z ${lcnt_one_docSrcList} ] ; then
     if [ -f ${lcntInfoPath}/publishable1 ]; then
	 typeset publishable1=$( cat ${lcntInfoPath}/publishable1 )
 cat  << _EOF_ >> ${outputFile}
<embed src="${docModulePath}/${publishable1}#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">
_EOF_
     else
	 EH_problem "Missing docSrcList and no publishable1"
     fi
 else

#<embed src="http://${lcnt_one_pubDestUrls}${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">

 cat  << _EOF_ >> ${outputFile}
<embed src="${docModulePath}/${lcnt_one_docSrcList}.pdf#toolbar=0&navpanes=0&scrollbar=0" width="750" height="1000">
_EOF_
 fi
                ;;

	       "revealjs")
		   resultPath=${docModuleExportPath}/pres/${lcntNu}-pres.html
		   rsyncLcntAsRoot=$( echo ${resultPath##*/rsync/} )
		   cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">IFRAMED REVEALJS INLINE SCREENCAST PRESENTATION DOCUMENT</big></center><br>
<P>
_EOF_
		   cat  << _EOF_ >> ${outputFile}
<p>
You can also access the Screencast-Presentation in 
<a href="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}">Full Page</a> form.
<br><br>
</p>
<p>
<iframe src="http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}" height="540" width="960">
If you can see this, your browser doesn't 
understand IFRAME.  However, we'll still <a href=http://${bystarDomFormTld_web}/${rsyncLcntAsRoot}>link</a>you to the file.
</iframe>
</p>
_EOF_

               ;;
	       *)
	EH_problem "${lcnt_accessPageInclusion}: Unknown"
	print ""
	;;
	   esac
       fi
   fi


 if [[ -s ${lcntInfoPath}/accessPageExtra ]] ; then

 cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_


   typeset this_accessPageExtra="`cat ${lcntInfoPath}/accessPageExtra`"
   cat ${cntntRawHome}/${this_accessPageExtra} >> ${outputFile}
 fi



 cat  << _EOF_ >> ${outputFile}
<P>
</BODY>
</HTML>
_EOF_

  # Backwards Compatibility
  if [ -f  "${docModulePath}/${lcnt_lcntNu}-access.html" ] ; then
      opDo cp "${outputFile}" "${docModulePath}/${lcnt_lcntNu}-access.html"
      announceAccessPageOutput "${docModulePath}/${lcnt_lcntNu}-access.html"
  fi

  announceAccessPageOutput "${outputFile}"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  generateOneAccessPage_repub    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function generateOneAccessPage_repub {

  typeset lcntNu="$1"
  typeset this_cntntRawHome="$2"


  print "####### Generate Access Page for ${lcntNu} ##############"
  
  cntntRawHome="${this_cntntRawHome}"
  lcntInfoPrep ${cntntRawHome}

  #typeset outputFile="${docModulePath}/${lcnt_lcntNu}-access.html"
  typeset outputFile=$( getAccessPageOutputFileName )

  setPubCategoryString
  
 cat  << _EOF_ > ${outputFile} 
<HTML>
<HEAD>
<TITLE>${lcnt_tag}</TITLE>
</HEAD>
<BODY>
<P>
<P><BODY BGCOLOR="BFDFFF">
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">A ${pubCategoryString}</big></center>
<HR>
<P>
_EOF_


  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}, <a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}, ${lcnt_author_name[$i]}"
      fi
    fi
  done

 cat  << _EOF_ >> ${outputFile}

<H3 ALIGN="CENTER">${lcnt_mainTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subSubTitle}</H3>

<P>
<table border="0"> 
<tr><td>Document Number: </td><td>${lcnt_pubCategory}-${lcnt_lcntNu} &nbsp; 
<A HREF="${docModulePath}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib">[ .bib ]</A></td></tr>
<tr><td>Version: </td><td>${lcnt_version}</td></tr>
<tr><td>Dated: </td><td>${lcnt_date}</td></tr>
<tr><td>Group: </td><td>${lcnt_docGroup}</td></tr>
<tr><td>Primary URL: </td><td><a href="${lcnt_url}">${lcnt_url}</a></td></tr>
<tr><td>Author(s): </td><td>${lcnt_authors}</td></tr>
_EOF_


   if [[ "${lcnt_organization}_" != "_" ]] ; then 
     if [[ -f ${lcnt_organization}/Name ]] ; then
       typeset organization_name=`cat ${lcnt_organization}/Name`
     else
       typeset organization_name="${lcnt_organization}"
     fi

     if [[ -f ${lcnt_organization}/Url ]] ; then
       typeset organization_url=`cat ${lcnt_organization}/Url`
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td><a href="${organization_url}">${organization_name}</a></td></tr>
<P>
_EOF_
     else
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td>${organization_name}</td></tr>
<P>
_EOF_

     fi

    fi
 cat  << _EOF_ >> ${outputFile}
</table>
_EOF_

#CopyLeft -- Verbatim Copying Permited


 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">AVAILABLE FORMATS</big><br>
<P>
<UL>
<P>
_EOF_

    typeset this_publishableFiles=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`
    typeset thisOnePublishable
    for thisOnePublishable in ${this_publishableFiles} ; do
      typeset thisFileName=`cat ${thisOnePublishable}`
      fileSize=`du -h ${docModulePath}/${thisFileName} | cut -f 1`
      if [[ -f ${thisOnePublishable}_desc ]] ; then
	  typeset thisPublishableDesc=$( cat ${thisOnePublishable}_desc )
	  thisPublishableDesc="-- ${thisPublishableDesc}"
      else
	  thisPublishableDesc=""
      fi
 cat  << _EOF_ >> ${outputFile}
<LI>  
<A HREF="${docModulePath}/${thisFileName}">${thisFileName}</A>: -- ${fileSize} ${thisPublishableDesc}.
_EOF_
     done

 cat  << _EOF_ >> ${outputFile}
</UL>
_EOF_

 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">SHORT 
DESCRIPTION</big><br>
<P>${lcnt_description}
_EOF_



 if [[ -s ${lcntInfoPath}/accessPageExtra ]] ; then
 cat  << _EOF_ >> ${outputFile}
<HR>
<P><center><big style="color: rgb(153, 51, 0); font-weight: bold;">FULL INLINE DOCUMENT</big></center><br>
<P>
_EOF_

   typeset this_accessPageExtra="`cat ${lcntInfoPath}/accessPageExtra`"
   cat ${cntntRawHome}/${this_accessPageExtra} >> ${outputFile}
 fi


 cat  << _EOF_ >> ${outputFile}
<P>
</BODY>
</HTML>
_EOF_

 announceAccessPageOutput ${outputFile}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  generateOneAccessPage_sw    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function generateOneAccessPage_sw {

  typeset lcntNu="$1"
  typeset this_cntntRawHome="$2"


  print "####### Generate SW Access Page for ${lcntNu} ##############"
  
  cntntRawHome="${this_cntntRawHome}"
  lcntInfoPrep ${cntntRawHome}

  #typeset outputFile="${docModulePath}/${lcnt_lcntNu}-access.html
  typeset outputFile=$( getAccessPageOutputFileName )
  
 cat  << _EOF_ > ${outputFile} 
<HTML>
<HEAD>
<TITLE>${lcnt_tag}</TITLE>
</HEAD>
<BODY >
<P>
<P><BODY BGCOLOR="BFDFFF">
<P>
<P>
<P>
<DIV ALIGN="CENTER">
<H1 ALIGN="CENTER"> </H1>
<P ALIGN="LEFT"></P>
</DIV>
<P>
_EOF_

  typeset lcnt_authors=""
  for (( i=1;i<=${author_count};i++ )) ; do
    if [[ "${lcnt_authors}_" == "_" ]] ; then
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="<a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_author_name[$i]}"
      fi
    else
      if [[ "${lcnt_author_url[$i]}_" != "_" ]] ; then
	lcnt_authors="${lcnt_authors}, <a href=${lcnt_author_url[$i]}>${lcnt_author_name[$i]}</a>"
      else
	lcnt_authors="${lcnt_authors}, ${lcnt_author_name[$i]}"
      fi
    fi
  done

 cat  << _EOF_ >> ${outputFile}

<H3 ALIGN="CENTER">${lcnt_mainTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subTitle}</H3>
<H3 ALIGN="CENTER">${lcnt_subSubTitle}</H3>

<P>
<table border="0"> 
<tr><td>Software Name: </td><td>${lcnt_pubCategory}-${lcnt_lcntNu} &nbsp; 
<A HREF="${docModulePath}/${lcnt_pubCategory}-${lcnt_lcntNu}.bib">[ .bib ]</A></td></tr>
<tr><td>Version: </td><td>${lcnt_version}</td></tr>
<tr><td>Dated: </td><td>${lcnt_date}</td></tr>
<tr><td>Group: </td><td>${lcnt_docGroup}</td></tr>
<tr><td>Primary URL: </td><td><a href="${lcnt_url}">${lcnt_url}</a></td></tr>
<tr><td>Author(s): </td><td>${lcnt_authors}</td></tr>
_EOF_


   if [[ "${lcnt_organization}_" != "_" ]] ; then 
     if [[ -f ${lcnt_organization}/Name ]] ; then
       typeset organization_name=`cat ${lcnt_organization}/Name`
     else
       typeset organization_name="${lcnt_organization}"
     fi

     if [[ -f ${lcnt_organization}/Url ]] ; then
       typeset organization_url=`cat ${lcnt_organization}/Url`
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td><a href="${organization_url}">${organization_name}</a></td></tr>
<P>
_EOF_
     else
 cat  << _EOF_ >> ${outputFile}
<tr><td>Organization: </td><td>${organization_name}</td></tr>
<P>
_EOF_

     fi

    fi
 cat  << _EOF_ >> ${outputFile}
</table>
_EOF_

 cat  << _EOF_ >> ${outputFile}

<P><big style="color: rgb(153, 51, 0); font-weight: bold;">SHORT 
DESCRIPTION</big><br>
<P>${lcnt_description}

_EOF_

 if [[ -s ${lcntInfoPath}/accessPageExtra ]] ; then
   typeset this_accessPageExtra="`cat ${lcntInfoPath}/accessPageExtra`"
   cat ${cntntRawHome}/${this_accessPageExtra} >> ${outputFile}
 fi

 cat  << _EOF_ >> ${outputFile}
</UL>
<P>
</BODY>
</HTML>
_EOF_

 announceAccessPageOutput ${outputFile}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_getLcntNuBaseInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getLcntNuBaseInfo {

  typeset docEntries="$@"
  typeset oneEntry
  for oneEntry in ${docEntries} ; do
    opDo getLcntNuBase ${oneEntry}
    echo "${lcntNu}: ${cntntRawHome}"
  done

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
