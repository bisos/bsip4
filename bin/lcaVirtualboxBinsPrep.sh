#!/bin/bash

IcmBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: binsPrepExtRepo.sh,v 1.2 2017-02-14 05:42:23 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaXxBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
Xref-
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/samba/fullUsagePanel-en.org::Xref-][MODULE Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Pkgs-List     :: Components List [[elisp:(org-cycle)][| ]]
_CommentEnd_

#apt-cache search virtualbox | egrep '^virtualbox'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search virtualbox | egrep '^virtualbox'")][apt-cache search virtualbox | egrep '^virtualbox']]

    itemOrderedList=( 
        "virtualbox_repoAdd"
        "virtualbox6_1"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  ExamplesExt   :: Module Specific Additions -- examplesHook [[elisp:(org-cycle)][| ]]
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
_EOF_
}

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "virtualbox"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: virtualbox [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_virtualbox6_1 () { distFamilyGenerationHookRun binsPrep_virtualbox6_1; }

binsPrep_virtualbox6_1_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "virtualbox-6.1"; }

####+END:


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || add-apt-repository :: virtualbox_repoAdd [[elisp:(org-cycle)][| ]]
_CommentEnd_

vis_repositoryAdd () {
    #
    # You can add the new repository one of two ways.
    # 1) With add-apt-repository, something like:
    #     opDo sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
    # 2) By writing in the /etc/apt/sources.list.d/ directly, something like:
    #    echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian  focal contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list
    #
    # Next you need to create trust with apt-key add, something like,
    # lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -"
    #
    
    echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian  focal contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list
    lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -"
    lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -"
    
    sudo apt-get update
}


item_virtualbox_repoAdd () {
  distFamilyGenerationHookRun binsPrep_virtualbox_repoAdd
}

binsPrep_virtualbox_repoAdd_DEFAULT_DEFAULT () {
    mmaThisPkgName="virtualbox_repoAdd"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_repositoryAdd
    }
}




_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
