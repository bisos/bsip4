#!/bin/bash

IcmBriefDescription="Place Holder -- Create And Manage ~bxo/gits"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bisoGitManage.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/bxoGitsManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] | 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxISo/fullUsagePanel-en.org::Xref-BxISo][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bystarCentralAcct.libSh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t bystarUid="MANDATORY"

function G_postParamHook {
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    lpCurrentsGet
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo="
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    oneBystarUid=${currentBystarUid}

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorSection "Gits Repository Management" )
${G_myName} ${examplesInfo} -p bystarUid=${oneBystarUid} -i gitoReposBasesPrep
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Create / Manage BxSo Repositories
_CommentEnd_


function vis_gitoReposBasesPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bystarUidCentralPrep

    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )

    opDo mkdir -p ${bystarUidHome}/gits

    opDo mkdir -p ${bystarUidHome}/gits/priv
    opDo mkdir -p ${bystarUidHome}/gits/group
    opDo mkdir -p ${bystarUidHome}/gits/pub
    opDo mkdir -p ${bystarUidHome}/gits/admin

    opDo mkdir -p ${bystarUidHome}/gits/priv/bxe
    opDo git init --bare ${bystarUidHome}/gits/priv/bxe

    opDo mkdir -p ${bystarUidHome}/gits/priv/lcnt
    opDo git init --bare ${bystarUidHome}/gits/priv/lcnt

    opDo mkdir -p ${bystarUidHome}/gits/group/lcnt
    opDo git init --bare ${bystarUidHome}/gits/group/lcnt 

    opDo mkdir -p ${bystarUidHome}/gits/pub/rep1
    opDo git init --bare ${bystarUidHome}/gits/pub/rep1 

    #opDo mkdir -p ${bystarUidHome}/bxe
    opDo mkdir -p ${bystarUidHome}/sync/priv
    #opDo mkdir -p ${bystarUidHome}/sync/priv/lcnt
    opDo mkdir -p ${bystarUidHome}/sync/group
    opDo mkdir -p ${bystarUidHome}/sync/pub

    inBaseDirDo  ${bystarUidHome}/ git clone ${bystarUidHome}/gits/priv/bxe
    inBaseDirDo  ${bystarUidHome}/sync/priv git clone ${bystarUidHome}/gits/priv/lcnt
    inBaseDirDo  ${bystarUidHome}/sync/group git clone ${bystarUidHome}/gits/group/lcnt
    inBaseDirDo  ${bystarUidHome}/sync/pub git clone ${bystarUidHome}/gits/pub/rep1

    lpReturn
}



####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
