#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/usgAcctManage.sh 
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

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/distHook.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

# PRE parameters

baseDir=""
acctName=""
acctComment=""

function G_postParamHook {
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

    vis_bxisoAccountsExamples
    
    vis_thisProvisionExamples
    
    vis_thisIcmExamples
}


function vis_thisIcmExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

 

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "List And Report On Existing BxISO Accounts" )
${G_myName} ${extraInfo} -i list bxisoAccts
${G_myName} ${extraInfo} -i report listOfAccounts
$( examplesSeperatorChapter "Setup Bases For Specified Account" )
${G_myName} ${extraInfo} -i acctBase_bashrcUpdate bystar
blee ${extraInfo} -p acctName=bystar -i provisionSetup
_EOF_
}

function vis_thisProvisionExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

  cat  << _EOF_
$( examplesSeperatorChapter "BxISO Provisioning Setups" )
${G_myName} -i provisionSetup   # Summary outputs
${G_myName} ${extraInfo} -i provisionSetup    # Detailed outputs
$( examplesSeperatorSection "BxISO Provisioning Account Setups" )
${G_myName} -p acctName=bystar -i provisionSetupAcct   # Summary outputs
${G_myName} ${extraInfo} -p acctName=bystar -i provisionSetupAcct    # Detailed outputs
_EOF_
}


noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In acctName's (mandtaory) HOME, with vis_prepUpdateInit create emacs init files.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    acctName=bystar
    lpDo vis_provisionSetupAcct
}


function vis_provisionSetupAcct {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In acctName's (mandtaory) HOME, with vis_prepUpdateInit create emacs init files.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${acctName}" ] ; then
	EH_problem "Missing acctName"
	lpReturn 101
    fi

    # NOTYET, verify that acctName is valid (source needed lib)    

    #  lpDo blee -v -n showRun -p acctName=${acctName} -i provisionSetup
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
