#!/bin/bash

IcmBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: binsPrepLcaSimple.sh,v 1.1 2016-11-25 05:45:02 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/bleeBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
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
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  [Notes]       :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  [Xrefs]       :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
Xref-Here-
**  [[elisp:(org-cycle)][| ]]  Subject      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  [Info]        :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Pkgs-List]   :: Components List [[elisp:(org-cycle)][| ]]
_CommentEnd_

#apt-cache search something | egrep '^something'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search something | egrep '^something'")][apt-cache search something | egrep '^something']]

    itemOrderedList=(
	"preview_latex"
	"texlive_full"
	"hevea"
	# "tetex_extra"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()
}

distFamilyGenerationHookRun pkgsList

# itemOrderedList=("preview_latex" "tetex_extra")


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "texlive-full"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: texlive-full [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_texlive_full () { distFamilyGenerationHookRun binsPrep_texlive_full; }

binsPrep_texlive_full_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "texlive-full"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "hevea"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: hevea [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_hevea () { distFamilyGenerationHookRun binsPrep_hevea; }

binsPrep_hevea_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "hevea"; }

####+END:



item_preview_latex () {
  distFamilyGenerationHookRun binsPrep_preview_latex
}

binsPrep_preview_latex_DEFAULT_DEFAULT () {
    mmaThisPkgName="preview-latex"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="apt"
}


item_tetex_extra () {
  distFamilyGenerationHookRun binsPrep_tetex_extra
}

binsPrep_tetex_extra_DEFAULT_DEFAULT () {
    mmaThisPkgName="tetex-extra"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="tetex-extra"
}

binsPrep_tetex_extra_UBUNTU_1310 () {  # tetex-extra missing in 1310
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1404 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1604 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1804 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_2004 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

function examplesHookPost {
  cat  << _EOF_
----- POST HOOK EXAMPLES -------
    ${G_myName} -i extraInstall

    ${G_myName} -i lgrindInstall

    apt-get install arabtex
    apt-get install tex4ht

    ln -s /opt/public/osmt/share/texmf/tex/extras /usr/share/texmf/tex/extras
texhash
or
TEXINPUTS=.:/opt/public/osmt/share/texmf/tex/extras::

apt-get install latex2html
apt-get install gv xpdf


_EOF_
}


function vis_extraInstall {
    opDo ln -s /opt/public/osmt/share/texmf/tex/extras /usr/share/texmf/tex/extras
    opDo texhash
 
    # As an Alternative
    #export TEXINPUTS=.:/opt/public/osmt/share/texmf/tex/extras::

    opDo apt-get -y install latex2html
    opDo apt-get -y install gv xpdf

    opDo apt-get -y install arabtex
    opDo apt-get -y install tex4ht
    opDo apt-get -y install lgrind
    opDo apt-get -y install gnuplot
    opDo apt-get -y install transfig
    opDo apt-get -y install auctex
    opDo apt-get -y install latex-beamer

    #opDo apt-get -y install writer2latex         # DOES NOT WORK
    
    opDo apt-get -y install gnuhtml2latex         # Can also be used in place of writer2latex

    #opDo vis_lgrindInstall
}

function vis_lgrindInstall {

    ANT_raw "lgrindInstall needs to become version specific -- SKIPPED"

    return

    # lgrind disapeared in squeeze

    typeset srcPkgStableUrl=http://www.bybinary.org/republish/debian/squeeze/i386/lgrind_3.67-2_i386.deb
    typeset srcPkgStableName=lgrind_3.67-2_i386.deb

   opDoExit cd ${opVarBase}/distPkgs/all

   opDo wget ${srcPkgStableUrl}

   opDo dpkg -i ./${srcPkgStableName}
}

