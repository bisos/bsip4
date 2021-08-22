#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bystarLcntUpload.sh,v 1.4 2018-04-26 19:14:10 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/bystarLcntUpload.sh 
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
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

   Layers Structure:

   *  bystarLcntProc.sh  (bystar, lcntNu)
   **      lcntProc.sh (bystar, in lcntRawHome) -- seedLcntProc.sh 
   ***          bystarLcntUpload.sh  (bystar, lcntRawHome) or (destUrls, lcntRawHome)
   ****              bystarPlone3Commands.sh  (bystar)

   bystarLcntUpload.sh
   -------------------

   plone3Sync    -- bystarPlone3Commands.sh  -i pathSyncTree

   plone3AccessPagePublish --

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/lcnLcntLib.sh

. ${opBinBase}/bystarHook.libSh

# bystarLib.sh
. ${opBinBase}/bystarLib.sh

. ${opBinBase}/opAcctLib.sh

. ${opBinBase}/lpCurrents.libSh

# mmaLayer3Lib.sh 
. ${opBinBase}/mmaLayer3Lib.sh 

# bystarDnsDomain.libSh  
. ${opBinBase}/bystarDnsDomain.libSh

. ${opBinBase}/bystarInfoBase.libSh


# PRE parameters

typeset -t acctTypePrefix=""
typeset -t bystarUid="MANDATORY"
typeset -t cntntRawHome="MANDATORY"
typeset -t inListLcntNu=""


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    lpCurrentsGet

    inListLcntNu=$( FN_absolutePathGet ${inListLcntNu} )

  oneInputFile="/tmp/oneInput.html"

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    oneInListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
    #typeset thisOneSaNu=${currentBystarUid}
    typeset thisOneSaNu="ea-59009"    
    typeset thisOnePlpcNu="PLPC-180038"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "LCNT Content Information" )
${G_myName} -p uid=any ${extraInfo} -i lcntInfoReport PLPC-110001
${G_myName} -p uid=any ${extraInfo} -i lcntInfoReport PLPC-180038
$( examplesSeperatorChapter "Plone3 (Upload)" )
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i plone3Sync ${thisOnePlpcNu}
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -p cntntRawHome=. -i plone3Sync
$( examplesSeperatorChapter "Apache Sync (Upload)" )
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i rsyncUpload ${thisOnePlpcNu}
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i rsyncBaseUpload  # node_modules
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -p cntntRawHome=. -i rsyncUpload
$( examplesSeperatorChapter "Rsync Preparations" )
${G_myName} ${extraInfo}  -p cntntRawHome=. -i rsyncLocalUpdateFigures
$( examplesSeperatorChapter "Plone3 AccessPage Upload" )
${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p cntntRawHome=. -i plone3AccessPagePublish
$( examplesSeperatorChapter "Sync Dest BxUIDs" )
${G_myName} ${extraInfo}  -p cntntRawHome=. -i plone3SyncDestBxUids  ${thisOnePlpcNu}
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3Sync    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3Sync {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${cntntRawHome}_" != "MANDATORY_" ]]

    # invoked from lcntProc.sh

    lcntInfoPrep ${cntntRawHome}

    opDo bystarPlone3Commands.sh  -p bystarUid=${bystarUid} -p path="${docModulePath}"  -i pathSyncTree
}

function vis_rsyncBaseUpload {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Often invoked from lcntProc.sh
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    opDoRet bystarAcctAnalyze ${bystarUid}    
    opAcctInfoGet ${bystarUid}
    bystarDomainFormsPrep 2> /dev/null


    function rsyncUploadNodesModule {
        local sourcePath="/rsync/node_modules"
        local destPath=$( FN_dirsPart ${sourcePath} )
        
        opDo mmaRsyncAdmin.sh -p rsyncOptions="--delete-after --stats" -p destHost=${bystarDomFormTld_web} -p dest=${destPath} -p source=${sourcePath} -i localToRemoteUpdate           
    }
    rsyncUploadNodesModule
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  rsyncUpload  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_rsyncLocalUpdateFigures {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Copy figures to the local /rsync/lcnt/common/figures to be uploaded with lcntRsyncUploadFigures.
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]

    function processOneLcnt {
        local figuresListPng=$( inBaseDirDo ${cntntRawHome} ./lcntProc.sh -i figuresList )
        local rsyncLcntFiguresBase="/rsync/lcnt/common/figures"

        opDo cp ${figuresListPng} ${rsyncLcntFiguresBase}
        
    }
    
    if [ $# -eq 0 ] ; then
        EH_assert [[ "${cntntRawHome}_" != "MANDATORY_" ]]
        lcntInfoPrep ${cntntRawHome}
        processOneLcnt
    else
        typeset docEntries="$@"

        typeset oneDocEntry
        for oneDocEntry in ${docEntries}; do
            if [[ "${oneDocEntry}_" == "all_" ]]; then
                EH_assert [ -f  ${inListLcntNu} ]
                goThroughList ${inListLcntNu} ${visibleFunction}
                return
            fi

            opDo getLcntNuBase ${oneDocEntry}

            cntntRawHome="${cntntRawHome}"
            lcntInfoPrep ${cntntRawHome}

            processOneLcnt
        done
    fi

    lpReturn
}       


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  rsyncUpload  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_rsyncUpload {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Often invoked from lcntProc.sh
_EOF_
    }

    EH_assert [[ $# -ge 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    opDoRet bystarAcctAnalyze ${bystarUid}    
    opAcctInfoGet ${bystarUid}
    bystarDomainFormsPrep 2> /dev/null

    function lcntRsyncUploadOne {
        local destPath=$( FN_dirsPart ${docModuleExportPath} )

        opDo mmaRsyncAdmin.sh -p rsyncOptions="--delete-after --stats" -p destHost=${bystarDomFormTld_web} -p dest=${destPath} -p source=${docModuleExportPath} -i localToRemoteUpdate          
    }

    
    if [ $# -eq 0 ] ; then
        EH_assert [[ "${cntntRawHome}_" != "MANDATORY_" ]]
        lcntInfoPrep ${cntntRawHome}
        lcntRsyncUploadOne
        opDo vis_rsyncLocalUpdateFigures
    else
        typeset docEntries="$@"

        typeset oneDocEntry
        for oneDocEntry in ${docEntries}; do
            if [[ "${oneDocEntry}_" == "all_" ]]; then
                EH_assert [ -f  ${inListLcntNu} ]
                goThroughList ${inListLcntNu} ${visibleFunction}
                return
            fi

            opDo getLcntNuBase ${oneDocEntry}

            cntntRawHome="${cntntRawHome}"
            lcntInfoPrep ${cntntRawHome}

            lcntRsyncUploadOne
            opDo vis_rsyncLocalUpdateFigures ${oneDocEntry}
        done
    fi

    function lcntRsyncUploadFigures {
        local sourcePath="/rsync/lcnt/common/figures"
        local destPath=$( FN_dirsPart ${sourcePath} )
        
        opDo mmaRsyncAdmin.sh -p rsyncOptions="--delete-after --stats" -p destHost=${bystarDomFormTld_web} -p dest=${destPath} -p source=${sourcePath} -i localToRemoteUpdate           
    }
    lcntRsyncUploadFigures

    lpReturn
}       




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3SyncDestBxUids    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3SyncDestBxUids {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
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

        cntntRawHome="${cntntRawHome}"
        lcntInfoPrep ${cntntRawHome}

        if [ -z "${lcnt_pubDestBxUids}" ] ; then 
            EH_problem "No pubDestBxUids specified"
            lpReturn 1
        fi

        typeset thisDest
        for thisDest in ${lcnt_pubDestBxUids} ; do
            bystarUid=${thisDest}
            opDo vis_plone3Sync
        done
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3SyncDestUrls    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3SyncDestUrls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
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

    cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${cntntRawHome}

    typeset thisDest
    for thisDest in ${lcnt_pubDestUrls} ; do
      ANT_raw "NOTYET from pubDestUrls get bystarUid and then same as plone3Sync"
      ANT_raw "NOTYET ${thisDest}"
      #opDo echo bystarPlone3Commands.sh -h -v -n showRun -p username=zopemanager -p password=zopemanager -p id="${docModulePath}" -p siteurl=${thisDest} -i externalFileSyncTree
    done

  done

}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3AccessPagePublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3AccessPagePublish {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${cntntRawHome}_" != "MANDATORY_" ]]

    lcnLcntPre

    lcntInfoPrep ${cntntRawHome}

    # /content/generated/doc.free/neda/PLPC/100107/current/

    contentBaseDir=${docModulePath}
  
    thisDocBaseName=`head -1 ${lcntInfoPath}/docSrcList`

    #accessPageFullName=${contentBaseDir}/${lcnt_lcntNu}-access.html
    #accessPageFullName=${contentBaseDir}/accessPage/index.html
    accessPageFullName=${contentBaseDir}/accessPage
    accessPageFolderName=${contentBaseDir}/accessPage

    opDo bystarPlone3Portlets.sh -h -v -n showRun -p bystarUid=${bystarUid} -p siteFolder="${accessPageFullName}" -i ploneManagePortletsLeft absent
    
    opDo bystarPlone3Portlets.sh -h -v -n showRun -p bystarUid=${bystarUid} -p siteFolder="${accessPageFullName}" -i ploneManagePortletsRight absent

    function expandStar {
cat << _EOF_ | sed -e 's/\*/Star/g'
${lcnt_shortTitle}
_EOF_
}
 

    #plusShortTitle=`expandStar | sed -e 's/ /+/g`
    plusShortTitle=`expandStar`


    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="/${lcnt_pubCategory}"  -p title="${lcnt_pubCategory}"  -p description="" -i folderCreate

    #typeset tmpFile="/tmp/${G_myName}.$$"
    
    #lcaPlone3Support.sh -h -v -n showRun -i redirectGenJavascript ${accessPageFullName} 0 > ${tmpFile}
    #lcaPlone3Support.sh -h -v -n showRun -i redirectGenDtml ${accessPageFullName} 0 > ${tmpFile}
    
    opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="/${lcnt_pubCategory}" -p sitePage="${lcnt_lcntNu}" -p title="\"${lcnt_pubCategory}-${lcnt_lcntNu}: ${plusShortTitle}\""  -p description="" -p linkDest="${accessPageFullName}" -i linkAddAndPublish

    #opDo bystarPlone3Commands.sh -p bystarUid=${bystarUid} -p siteFolder="/${lcnt_pubCategory}" -p sitePage="${lcnt_lcntNu}" -p title="\"${lcnt_pubCategory}-${lcnt_lcntNu}: ${plusShortTitle}\""  -p description="" -p inputFile="${accessPageFullName}" -i pageUploadHtmlAndPublish

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  /Junk Yard/              ::  *Obsoleted*  [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3AccessPagePublishObsoleted    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3AccessPagePublishObsoleted {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${cntntRawHome}_" != "MANDATORY_" ]]

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  # /content/generated/doc.free/neda/PLPC/100107/current/

  contentBaseDir=${docModulePath}
  
  thisDocBaseName=`head -1 ${lcntInfoPath}/docSrcList`

  accessPageFullName=${contentBaseDir}/${lcnt_lcntNu}-access.html


  function expandStar {
cat << _EOF_ | sed -e 's/\*/Star/g'
${lcnt_shortTitle}
_EOF_
}
 

  plusShortTitle=`expandStar | sed -e 's/ /+/g`

  typeset thisDest
  for thisDest in ${lcnt_pubDestUrls} ; do

    opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="/${lcnt_pubCategory}" -p siteurl=${thisDest} -i createPloneFolder
  
    #opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="${lcnt_lcntNu}" -p title="${lcnt_pubCategory}-${lcnt_lcntNu}:+${plusShortTitle}" -p inputFile="${accessPageFullName}" -p description="" -p siteurl=${thisDest}/${lcnt_pubCategory} -i addDoc_and_publish

    opDo lcaPloneCommands.sh -p siteFqdn=${thisDest} -p userName=zopemanager -p password=zopemanager -p siteFolder="/${lcnt_pubCategory}" -p sitePage="${lcnt_lcntNu}" -p title="${lcnt_pubCategory}-${lcnt_lcntNu}:+${plusShortTitle}"  -p description="" -p inputFile="${accessPageFullName}" -i ploneUploadHtmlAndPublish

    #opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="AccessPage" -p title="Access+Page+for+${lcnt_pubCategory}+${lcnt_lcntNu}" -p inputFile="${accessPageFullName}" -p description="" -p siteurl=${thisDest}/${contentBaseDir} -i addDoc_and_publish

    opDo lcaPloneCommands.sh -p siteFqdn=${thisDest} -p userName=zopemanager -p password=zopemanager -p siteFolder="${contentBaseDir}" -p sitePage="AccessPage" -p title="Access+Page+for+${lcnt_pubCategory}+${lcnt_lcntNu}"  -p description="" -p inputFile="${accessPageFullName}" -i ploneUploadHtmlAndPublish

   # Although this is not the right place to put this figureInclusion,
   # it just makes sense since we have all of the information needed at this stage.

    if [[ "${lcnt_accessPageInclusion}_" != "_" ]] ; then
      typeset figuresInclusion=`ls ${contentBaseDir}/${thisDocBaseName}/*.png 2> /dev/null`
      typeset oneFigure
      if [[ "${figuresInclusion}_" != "_" ]] ; then
        for oneFigure in ${figuresInclusion}; do
          this_id=`FN_nonDirsPart ${oneFigure}`
          opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p title="Figure+${this_id}" -p inputFile="${oneFigure}" -p id="${this_id}" -p siteurl=${thisDest}/PLPC -i addExternalFile  
        done
      fi
    fi

   done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_plone3SyncObsolete    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plone3SyncObsolete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    EH_assert [[ $# -gt 0 ]]
    EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]

    # invoked from lcntProc.sh

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}

    cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${cntntRawHome}

    opDo bystarPlone3Commands.sh  -p bystarUid=${bystarUid} -p path="${docModulePath}"  -i pathSyncTree

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


