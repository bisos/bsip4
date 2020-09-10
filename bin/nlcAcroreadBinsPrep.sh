#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/nlcAcroreadBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
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
	"libxml2:i386"
	"libcanberra_gtk_module:i386"
	"gtk2_engines_murrine:i386"
	"libatk_adaptor:i386"
	#
	"acroreadDpkg95"
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


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libxml2:i386"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libxml2:i386 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libxml2:i386 () { distFamilyGenerationHookRun binsPrep_libxml2:i386; }

binsPrep_libxml2:i386_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libxml2:i386"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libcanberra-gtk-module:i386"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libcanberra-gtk-module:i386 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libcanberra_gtk_module:i386 () { distFamilyGenerationHookRun binsPrep_libcanberra_gtk_module:i386; }

binsPrep_libcanberra_gtk_module:i386_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libcanberra-gtk-module:i386"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gtk2-engines-murrine:i386"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gtk2-engines-murrine:i386 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gtk2_engines_murrine:i386 () { distFamilyGenerationHookRun binsPrep_gtk2_engines_murrine:i386; }

binsPrep_gtk2_engines_murrine:i386_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gtk2-engines-murrine:i386"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libatk-adaptor:i386"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libatk-adaptor:i386 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libatk_adaptor:i386 () { distFamilyGenerationHookRun binsPrep_libatk_adaptor:i386; }

binsPrep_libatk_adaptor:i386_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libatk-adaptor:i386"; }

####+END:





_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Custom-Pkg: somethingCustom
_CommentEnd_


item_acroreadDpkg95 () {
  distFamilyGenerationHookRun binsPrep_acroreadDpkg95
}

binsPrep_acroreadDpkg95_DEFAULT_DEFAULT () {
    mmaThisPkgName="acroreadDpkg95"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook
    binsPrep_installPostHook="acroread_installPost"

    function customInstallScript {
	opDo mkdir -p /bisos/var/srcPkgs/acroread-9.5

	opDo wget -O /bisos/var/srcPkgs/acroread-9.5/adobe.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb

	opDo sudo dpkg --add-architecture i386
	opDo sudo apt update

	opDo sudo dpkg -i /bisos/var/srcPkgs/acroread-9.5/adobe.deb
    }
}

function acroread_installPost {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    opDo echo mimeopen -d *.pdf
    opDo echo sudo apt-get -f install
}



_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
