#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]


function vis_help {
 cat  << _EOF_


  - lcntBaseSet

  - lcntPubBaseSet

  - lcntPrivBaseSet


   TODO:

   Layers Structure:

   *  bystarLcntProc.sh  (bystar, lcntNu)
   **      lcntProc.sh (bystar, in lcntRawHome) -- seedLcntProc.sh 
   ***          bystarLcntUpload.sh  (bystar, lcntRawHome) or (destUrls, lcntRawHome)
   ****              bystarPlone3Commands.sh  (bystar)

   bystarLcntProc.sh
   -----------------

   plone3Upload  -- Locates lcntRawHome, invokes lcntProc.sh webPublish

   # NOTYET

   plone3AccessPageUpload  -- Locates lcntRawHome, invokes lcntProc.sh plone3AccessPageUpload


_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries


# ./lcnLcntLib.sh 
. ${opBinBase}/lcnLcntLib.sh

. ${opBinBase}/bystarHook.libSh

# bystarLib.sh
. ${opBinBase}/bystarLib.sh

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh


#. ${opBinBase}/lpCurrents.libSh
. ${opBinBase}/bisosCurrents_lib.sh

# mmaLayer3Lib.sh 
#. ${opBinBase}/mmaLayer3Lib.sh 

# bystarDnsDomain.libSh  
# . ${opBinBase}/bystarDnsDomain.libSh

#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/usgBpos_lib.sh


# PRE parameters
typeset -t acctTypePrefix=""
typeset -t bystarUid="MANDATORY"
typeset -t inListLcntNu=""
typeset -t lcntParam=""

function G_postParamHook {
    #bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    lpCurrentsGet

    inListLcntNu=$( FN_absolutePathGet ${inListLcntNu} )

  oneInputFile="/tmp/oneInput.html"

}

function vis_examples {
 typeset extraInfo="-h -v -n showRun"
 typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
 oneInListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  typeset thisOneSaNu=${currentBystarUid:-}

     visLibExamplesOutput ${G_myName}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Currents And BxO Management Information" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId ${oneBxoId:-}
$( examplesSeperatorChapter "Full Actions" )
${G_myName} ${extraInfo} -i lcntBasesFullSetup
$( examplesSeperatorChapter "BISOS LCNT BinsPreps" )
${G_myName} ${extraInfo} -i bisosLcntBinsPrep   # invokes lcaLaTexBinsPrep.sh and others
$( examplesSeperatorChapter "LCNT Bases Setup" )
${G_myName} ${extraInfo} -i lcntBaseVcGet # activate the public BISOS pip_lcntBases BPO
${G_myName} ${extraInfo} -i lcntBasesSetup  # Uses pip_lcntBases BPO and creats links to /de/sys/lcnt and /lcnt
${G_myName} ${extraInfo} -i usgBpos_lcntBases_bxoPath  # Passive -- BPO Path containing link to /de/sys/lcnt/lgpc etc
${G_myName} ${extraInfo} -i usgBposLcntBasesSetup # 
$( examplesSeperatorChapter "/lcnt Preparations" )
${G_myName} -p uid=lsipusr ${extraInfo} -i lcntBaseFullPrep     # Get + Prep + Build
${G_myName} -p uid=lsipusr ${extraInfo} -i lcntBaseGetPrep      # Get + Prep
${G_myName} -p uid=root ${extraInfo} -i lcntBaseGet             # VC Get
${G_myName} -p uid=lsipusr ${extraInfo} -i lcntBasePrep         # Recreates /lcnt/outputs/
${G_myName} -p uid=lsipusr ${extraInfo} -i lcntBaseFullBuild    # Builds/Process all formats
${G_myName} -p uid=lsipusr ${extraInfo} -i lcntBaseFullUpdate   # fullBuild + localContentPrep
---
${G_myName} -p uid=any ${extraInfo} -i lcntBasePlone3PublishDestUrls
${G_myName} -p uid=any ${extraInfo} -i lcntBaseClean
---- Plone3 Lcnt Entries Verify ----
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -p inListLcntNu="${oneInListLcntNu}" -i plone3EntriesVerify all
---- Plone3 Upload ----
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -p inListLcntNu="${oneInListLcntNu}" -i plone3Upload all
${G_myName} -p uid=any ${extraInfo} -p inListLcntNu="${oneInListLcntNu}" -i lcntFullUpdate all
# ALL LCNT documents /lcnt/outputs/all/lists/nuBaseDir
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -i plone3Upload all
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i plone3Upload PLPC-110001 
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i plone3Upload PLPC-110001 PLPC-110002
--- Build and upload All of ${thisOneSaNu}/lcaPlone/ContentTree/lcntList ---
${G_myName} -p uid=any ${extraInfo} -p bystarUid=${thisOneSaNu} -i plone3FullUploadAcctList
--- Given lcntNu, get or do stuff ---
${G_myName} -p uid=any ${extraInfo} -i lcntVisit PLPC-110001
${G_myName} -p uid=any ${extraInfo} -i lcntSrcs PLPC-110001
${G_myName} -p uid=any ${extraInfo} -i lcntInfoReport PLPC-110001
${G_myName} -p uid=any ${extraInfo} -p lcntParam=docModulePath -i lcntParamGet PLPC-110001
_EOF_
}


noArgsHook() {
  vis_examples
}


function vis_bisosLcntBinsPrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** After this we should have everything we need for lcnt activities.
*** TODO Revisit buePersian is favor of a generalized fonts setup
*** TODO Acroread needs to be added
*** TODO Media processing needs to be added
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    lpDo lcaLaTexBinsPrep.sh -s all -a fullUpdate

    lpDo lcaLaTexBinsPrep.sh -i extraInstall

    lpDo buePersian.sh -v -n showRun -i persianFullInstall

    lpDo buePersian.sh -v -n showRun -i fontXbZarInstall

    lpDo nlcAcroreadBinsPrep.sh -v -n showRun -i fullUpdate 
}

function vis_lcntBasesFullSetup {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_lcntBaseVcGet
    lpDo vis_lcntBasesSetup
    lpDo vis_usgBposLcntBasesSetup

    lpReturn
}       

function vis_lcntBaseFullPrep%% {
    EH_assert [[ $# -eq 0 ]]

    opDo vis_lcntBaseGet
    opDo vis_lcntBasePrep
    opDo vis_lcntBaseFullBuild
}


function vis_lcntBaseGetPrep%% {
    EH_assert [[ $# -eq 0 ]]

    # NOTYET  BaseGet needs to be root -- Rest needs to be lsipusr

    opDo vis_lcntBaseGet
    opDo vis_lcntBasePrep
}


function vis_lcntBaseVcGet {
    EH_assert [[ $# -eq 0 ]]

    lpDo bpoActivate.sh -h -v -n showRun -p privacy="priv" -p bxoId="pip_lcntBases" -i bpoActivate
}


function vis_symLinkContent%% {
  EH_assert [[ $# -eq 0 ]]
  developerVerify

  FN_fileSymlinkUpdateKeep  /here/content/ /content
  opDo ls -ld /content
}


function vis_lcntBasesSetup {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Uses pip_lcntBases BPO and creats links to /de/sys/lcnt and /lcnt
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    lpDo mkdir -p /de/sys/lcnt
    if [ ! -h /lcnt ] ; then
      lpDo sudo ln -s /de/sys/lcnt /lcnt
    fi

    # pip_lcntBases should become a public BPO
    local thisBxoHome=$(lpDo FN_absolutePathGet ~pip_lcntBases)

    EH_assert [ -d ${thisBxoHome}/bxdpt ]
    
    # ~pip_lcntBases/REGISTRY
    lpDo FN_fileSymlinkUpdate  ${thisBxoHome}/bxdpt /de/sys/lcnt/bxdpt
    lpDo FN_fileSymlinkUpdate  ${thisBxoHome}/BIB /de/sys/lcnt/BIB
    lpDo FN_fileSymlinkUpdate  ${thisBxoHome}/CENTRAL /de/sys/lcnt/CENTRAL
    lpDo FN_fileSymlinkUpdate  ${thisBxoHome}/REGISTRY /de/sys/lcnt/REGISTRY

    local thisBxoHomeVarPath="${thisBxoHome}/var"
    
    local varBaseDirBxoId="/bisos/var/bxoId/pip_lcntBases"

    lpDo FN_dirCreatePathIfNotThere ${varBaseDirBxoId}
    
    lpDo FN_fileSymlinkUpdate ${varBaseDirBxoId} ${thisBxoHomeVarPath}

    lpDo mkdir -p  ${thisBxoHomeVarPath}/outputs/all/lists

    lpDo FN_fileSymlinkUpdate  ${thisBxoHomeVarPath}/outputs /de/sys/lcnt/outputs
}


function vis_bisosLcntBinsPrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** After this we should have everything we need for lcnt activities.
*** TODO Revisit buePersian is favor of a generalized fonts setup
*** TODO Acroread needs to be added
*** TODO Media processing needs to be added
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    # lpDo lcaLaTexBinsPrep.sh -s all -a fullUpdate
    lpDo lcaLaTexBinsPrep.sh -i fullUpdate

    lpDo lcaLaTexBinsPrep.sh -i extraInstall

    lpDo buePersian.sh -v -n showRun -i persianFullInstall

    lpDo buePersian.sh -v -n showRun -i fontXbZarInstall

    lpDo nlcAcroreadBinsPrep.sh -v -n showRun -i fullUpdate 
}


function vis_usgBposLcntBasesSetup {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Creates symlinks using vis_usgBpos_lcntBases_bxoPath.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    local lcntBasesPath=$(lpDo vis_usgBpos_lcntBases_bxoPath)

    EH_assert [ -d "${lcntBasesPath}" ]

    lpDo FN_fileSymlinkUpdate ${lcntBasesPath}/lcnt/lgpc /de/sys/lcnt/lgpc
}


function vis_lcntBasePrep {
    EH_assert [[ $# -eq 0 ]]

    # runAs lsipusr

    if [ -d  /lcnt/outputs/all/lists ] ; then
        opDoExit pushd /lcnt/outputs/all/lists
        opDo rm nuBaseDir*
        opDoExit popd
    fi

    opDo lcnLcntOutputs.sh -n showRun  -p outFile=/lcnt/outputs/all/lists/nuBaseDir -i nuBaseDirFullUpdate
    opDo lcnLcntOutputs.sh -n showRun  -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -i sortListsFullUpdate

    opDo lcnLcntOutputs.sh -n showRun  -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -i inListFullBibOut all
    opDo lcnLcntOutputs.sh -n showRun  -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p urlFormat="url" -i inListFullBibOut all
}

function vis_lcntBaseFullBuild {
    EH_assert [[ $# -eq 0 ]]
    opDoExit cd /lcnt
    opDo ./lcntProc.sh   -i dirsRecurse fullBuild
}


function vis_lcntBaseFullUpdate {
    EH_assert [[ $# -eq 0 ]]
    opDoExit cd /lcnt
    opDo ./lcntProc.sh   -i dirsRecurse fullUpdate
}

function vis_lcntBasePlone3PublishDestUrls {
    EH_assert [[ $# -eq 0 ]]
    opDoExit cd /lcnt
    opDo ./lcntProc.sh   -i dirsRecurs xxNOTYETxx
}


function vis_lcntBaseClean {
    EH_assert [[ $# -eq 0 ]]
    opDoExit cd /lcnt
    opDo ./lcntProc.sh   -i dirsRecurse fullClean
}

#
# 
#


function vis_plone3Upload {
  EH_assert [[ $# -gt 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
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
    if [ "${this_cntntRawHome}" =  "" ] ; then
        EH_problem "Missing cntntRawHome -- ${oneDocEntry}"
        continue
    fi

    lcntInfoPrep ${this_cntntRawHome}

    opDoRet cd ${this_cntntRawHome}

    #opDo ./lcntProc.sh -p  bystarUid=${bystarUid} -i plone3Publish
    opDo  ./lcntProc.sh -p  bystarUid=${bystarUid} -i plone3FullPublish
  done
}


function vis_plone3EntriesVerify {
  EH_assert [[ $# -gt 0 ]]

  EH_assert [[ "${bystarUid}_" != "MANDATORY_" ]]
  #EH_assert [[ "${inListLcntNu}_" != "MANDATORY_" ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      #FN_fileSafeKeep ${outFile}

      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi
    getLcntNuBase ${oneDocEntry}
    typeset this_cntntRawHome="${cntntRawHome}"
    if [ "${this_cntntRawHome}" =  "" ] ; then
        EH_problem "Missing cntntRawHome -- ${oneDocEntry}"
        continue
    fi

    #ANT_raw "Verified: ${oneDocEntry}"
  done
}


function vis_lcntVisit {
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

    opDoRet pushd ${this_cntntRawHome}
    opDo emacsclient *.ttytex
    opDoRet popd

  done
}

function vis_lcntSrcs {
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

    echo ${this_cntntRawHome}/*.ttytex
  done
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

function vis_lcntParamGet {
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
    opDo getLcntNuBase ${oneDocEntry} > /dev/null
    typeset this_cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${this_cntntRawHome}
    eval echo '$'{${lcntParam}}
  done
}


function vis_lcntFullUpdate {
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

    opDoRet pushd ${this_cntntRawHome}
    opDo ./lcntProc.sh  -i fullUpdate
    opDoRet popd

  done
}


####+BEGIN: bx:dblock:lsip:bash:function :func "vis_plone3FullUploadAcctList" :type "nonidempotent"
# {{{ vis_plone3FullUploadAcctList
function vis_plone3FullUploadAcctList {
    TM_funcEntered
    thisFuncName=$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )
####+END:
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bystarUid}_" != "INVALID_" ]]
    function describeF {  cat  << _EOF_
_EOF_
    }
    opDoRet bystarAcctAnalyze ${bystarUid}
    EH_retOnFail

    if [ ! -f ${bystarUidHome}/lcaPlone/ContentTree/lcntList ] ; then
        EH_problem "Missing ${bystarUidHome}/lcaPlone/ContentTree/lcntList"
        lpReturn 101
    fi

    opDo ${G_myName} -p bystarUid=${bystarUid} -p inListLcntNu="${bystarUidHome}/lcaPlone/ContentTree/lcntList" -i plone3Upload all
}
# }}}


