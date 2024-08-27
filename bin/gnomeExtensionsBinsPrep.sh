#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaKodiBinsPrep.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/lcaKodiBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ################  CONTENTS-LIST ###############
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]* Module Description, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_
function vis_describe {  cat  << _EOF_
**      ====[[elisp:(org-cycle)][Fold]]==== /Module Desrciption/
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related-Xrefs:]* <<Xref-Here->>  -- External Documents 
Xref-Here-
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Components List
_CommentEnd_

#apt-cache search something | egrep '^something'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search something | egrep '^something'")][apt-cache search something | egrep '^something']]

    itemOrderedList=( 
        "gnome_shell_extension_manager"
        "gnome_shell_extension_prefs"
        "gnome_shell_extension_dash_to_panel"
        "gnome_shell_extension_gsconnect"
        "gnome_shell_extension_gsconnect_browsers"
        "python_gi_dev"
        "gnome_tweaks"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
_EOF_
}


function vis_moduleDescription {
  cat  << _EOF_
_EOF_
}


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-shell-extension-manager"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-shell-extension-manager [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_shell_extension_manager () { distFamilyGenerationHookRun binsPrep_gnome_shell_extension_manager; }

binsPrep_gnome_shell_extension_manager_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-shell-extension-manager"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-shell-extension-prefs"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-shell-extension-prefs [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_shell_extension_prefs () { distFamilyGenerationHookRun binsPrep_gnome_shell_extension_prefs; }

binsPrep_gnome_shell_extension_prefs_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-shell-extension-prefs"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-shell-extension-dash-to-panel"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-shell-extension-dash-to-panel [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_shell_extension_dash_to_panel () { distFamilyGenerationHookRun binsPrep_gnome_shell_extension_dash_to_panel; }

binsPrep_gnome_shell_extension_dash_to_panel_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-shell-extension-dash-to-panel"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-shell-extension-gsconnect"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-shell-extension-gsconnect [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_shell_extension_gsconnect () { distFamilyGenerationHookRun binsPrep_gnome_shell_extension_gsconnect; }

binsPrep_gnome_shell_extension_gsconnect_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-shell-extension-gsconnect"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-shell-extension-gsconnect-browsers"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-shell-extension-gsconnect-browsers [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_shell_extension_gsconnect_browsers () { distFamilyGenerationHookRun binsPrep_gnome_shell_extension_gsconnect_browsers; }

binsPrep_gnome_shell_extension_gsconnect_browsers_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-shell-extension-gsconnect-browsers"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-gi-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: python-gi-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_gi_dev () { distFamilyGenerationHookRun binsPrep_python_gi_dev; }

binsPrep_python_gi_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-gi-dev"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnome-tweaks"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnome-tweaks [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnome_tweaks () { distFamilyGenerationHookRun binsPrep_gnome_tweaks; }

binsPrep_gnome_tweaks_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnome-tweaks"; }

####+END:




_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
