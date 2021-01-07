#!/bin/bash

IimBriefDescription="Bx Service Entity Provisioning -- From RegReq to Realize"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxcseProvision.sh 
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


# . ${opBinBase}/bystarHook.libSh
. ${opBinBase}/bxeHookRun_lib.sh

. ${opBinBase}/bxeRegReq_lib.sh

. ${opBinBase}/bxeProvision_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

baseDir=""

function G_postParamHook {
    lpDo lpCurrentsGet
    return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_
  vis_examplesBxContainerEntity all all
   cat  << _EOF_
$( examplesSeperatorChapter "Selected Specific Types and Scopes" )
${G_myName} ${extraInfo} -i examplesBxContainerEntity all all full
${G_myName} ${extraInfo} -i examplesBxContainerEntity all regReqCreate all
${G_myName} ${extraInfo} -i examplesBxContainerEntity vmHost all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity exposed all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity perimeter all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity intra all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity usage all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity dev all essentials
${G_myName} ${extraInfo} -i examplesBxContainerEntity android all essentials
$( examplesSeperatorChapter "Registration Request -- RegReq Creation" )
bxeRegReqManage.sh
$( examplesSeperatorChapter "Central Registration Of The Request -- BxeDesc Creation" )
selfCentralRegistrar.sh
bxCentralRegistrar.sh
$( examplesSeperatorChapter "Capturing Of The Registration -- BxeDesc Stash" )
bxeDescManage.sh
$( examplesSeperatorChapter "BxO And Git Accts Creation -- BxeRealization and BxO Instantiation" )
bxeRealize.sh
_EOF_

    
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_doTheWork {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_failExample
    EH_retOnFail

    lpReturn
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
