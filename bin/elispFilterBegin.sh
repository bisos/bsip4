#!/bin/bash

IcmBriefDescription="
* NOTYET: Short Description Of This Interactive Command Module"

####+BEGIN: bx:bash:origin-statement :control "release"
ORIGIN="
* Part Of ByStar -- Best Used With Emacs, Blee and COMEEGA."
####+END:

####+BEGIN: bx:bash:top-of-file :control "release"
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bash:author :control "release" :author "mohsenBanan"
__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact"
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedElisp.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedElisp.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/elispFilterBegin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedElisp.sh -l $0 "$@" 
    exit $?
fi
####+END:

####+BEGIN: bx:dblock:global:file-insert :surround "default" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
_CommentBegin_
* /->/ ([[file:/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org][dblock-inFile]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
* /<-/ [[file:/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org][dblock-inFile]])
_CommentEnd_
####+END:

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


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


function noArgsHook {
  vis_examples
}


elispScriptFile="${opBinBase}/elispFilterHtml.el"


function vis_examplesNOT {
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


#
# See Help in seedElisp.sh 
#

function examplesHookPost {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    docName="BusPlan"

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )    
#/bin/rm ./index.html
${G_myFullName} ${extraInfo} -p el="${elispScriptFile}" -p exec=main -p inFile="./${docName}.html" -p outFile="./index.html" -i emacs ${docName}
$( examplesSeperatorChapter "One Time Processing Of The elisp Script" )
${G_myName} ${extraInfo} -i outputScript
_EOF_
}

function vis_outputScript {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

  cat  << _EOF_
Elisp code can be packaged here.
_EOF_

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
