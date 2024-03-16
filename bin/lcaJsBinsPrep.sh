#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaJsBinsPrep.sh,v 1.6 2018-01-22 02:54:19 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/lcaJsBinsPrep.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@"
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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

#apt-cache search revealJs | egrep '^revealJs'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search revealJs | egrep '^revealJs'")][apt-cache search revealJs | egrep '^revealJs']]

    itemOrderedList=(
        "npm" #  package manager for Node.js
        "npmPkgsInstall"
        "npmPkgVideoInstall"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()

    itemNpmPkgsOrderedList=(
        "pyright"       # comment for pkg1
        "reveal.js"
    )

}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
${G_myName} -v -n showRun -i revealJsPluginsUpdate
${G_myName} -v -n showRun -i nodePpaPrep
node -v
npm -v
_EOF_
}



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "npm"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: npm [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_npm () { distFamilyGenerationHookRun binsPrep_npm; }

binsPrep_npm_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "npm"; }

####+END:


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Custom-Pkg: npmPkgsInstall
_CommentEnd_

vis_npmPkgsInstall () {
    ANT_raw "Here we process npmPkgsInstall one by one."
    local each
    for each in ${itemNpmPkgsOrderedList[@]} ; do
        opDo sudo npm install -g --save --prefix=/usr/local ${each}
    done
    print
}


item_npmPkgsInstall () {
  distFamilyGenerationHookRun binsPrep_npmPkgsInstall
}

binsPrep_npmPkgsInstall_DEFAULT_DEFAULT () {
    mmaThisPkgName="npmPkgsInstall"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook
    binsPrep_installPostHook=""

    typeset pkgRePubAgent=""

    function customInstallScript {
        lpDo vis_npmPkgsInstall
        # opDo sudo npm install -g --save --prefix=/usr/local reveal.js
    }
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Custom-Pkg: npmPkgVideoInstall
_CommentEnd_


item_npmPkgVideoInstall () {
  distFamilyGenerationHookRun binsPrep_npmPkgVideoInstall
}

binsPrep_npmPkgVideoInstall_DEFAULT_DEFAULT () {
    mmaThisPkgName="npmPkgsInstall"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook
    binsPrep_installPostHook=""

    typeset pkgRePubAgent=""

    function customInstallScript {
        opDo sudo npm install -g --save --prefix=/usr/local video.js@^5.8
        opDo sudo npm install -g --save --prefix=/usr/local videojs-resolution-switcher-v6
    }
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_revealJsPluginsUpdate [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_revealJsPluginsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;     

    typeset revealPluginBase="/usr/local/lib/node_modules/reveal.js/plugin"
    typeset thisPluginBase=""    

    if [ ! -d "${revealPluginBase}" ] ; then
        EH_problem "Missing ${revealPluginBase}"
        lpReturn 101
    fi

    thisPluginBase="${revealPluginBase}/audio-slideshow"
    
    opDoRet mkdir ${thisPluginBase}

    #
    # https://github.com/rajgoel/reveal.js-plugins/tree/master/audio-slideshow
    #
    inBaseDirDo ${thisPluginBase} wget https://github.com/rajgoel/reveal.js-plugins/raw/master/audio-slideshow/audio-slideshow.js
    inBaseDirDo ${thisPluginBase} wget https://github.com/rajgoel/reveal.js-plugins/raw/master/audio-slideshow/slideshow-recorder.js

    inBaseDirDo /usr/local/lib/node_modules git clone https://github.com/rajgoel/reveal.js-plugins
    
    #
    # https://github.com/denehyg/reveal.js-menu
    #
    opDo sudo npm install -g --save reveal.js-menu

    lpReturn
}       


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: nodePpaPrep [[elisp:(org-cycle)][| ]]
_CommentEnd_


function nodePpaPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    opDo sudo apt-get install python-software-properties
    
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
    
    sudo apt-get install nodejs
    
    lpReturn
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
