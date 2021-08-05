#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lpCurrentsAdmin.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/bisosCurrentsAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
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
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/platformBases_lib.sh
. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteRegistrar_lib.sh


# PRE parameters
typeset -t registrar=""
typeset -t id=""
typeset -t password=""


function G_postParamHook {
	
    return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )    

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "FULL Site Deployment" )
${G_myName} ${extraInfo} -i fullUpdate  # currents + siteFullUpdate
$( examplesSeperatorChapter "Interim Actions Of fullUpdate" )
${G_myName} ${extraInfo} -i gcipherPipInstall
${G_myName} ${extraInfo} -i missingAptPkgsInstall
$( examplesSeperatorChapter "Optional Interim Actions" )
${G_myName} ${extraInfo} -i libreInfoBaseAndInitialTemplates
_EOF_
}


noArgsHook() {
  vis_examples
}


function vis_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Run all interim commands.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_gcipherPipInstall

    lpDo vis_missingAptPkgsInstall
}


function vis_gcipherPipInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** /bisos/venv/py2/bisos3/bin/gcipher
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo /bisos/venv/py2/bisos3/bin/pip2 install --upgrade unisos.gcipher

    lpDo which -a gcipher
    
    lpReturn
}


function vis_missingAptPkgsInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Missing apt packages to be sorted out and absorbed
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo apt-get -y install w3m
    lpDo sudo apt-get -y install mhonarc
    #lpDo mkdir -p /bxo/r3/usg/bystar/mhonarc/var/attachments
    lpDo bueMailManage.sh -h -v -n showRun -i mhonarcBasePrep
    
    lpReturn
}

function vis_libreInfoBaseAndInitialTemplates {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Missing apt packages to be sorted out and absorbed
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo mkdir /libre
    lpDo sudo chown bisos:bisos /libre
    lpDo sudo chmod 775 /libre

    lpDo mkdir /libre/ByStar

    lpDo scp -r bystar@192.168.0.151:/libre/ByStar/InfoBase /libre/ByStar
    lpDo scp -r bystar@192.168.0.151:/libre/ByStar/InitialTemplates /libre/ByStar
    
    lpReturn
}



_CommentBegin_
*      ################      *End Of Editable Text*
_CommentEnd_

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
