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

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bisosPyVenv_lib.sh

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
${G_myName} ${extraInfo} -i fullUpdate # Run all the full ICMs
${G_myName} ${extraInfo} -i fullUpgrades # pip and apt
${G_myName} ${extraInfo} -i fullMissingUpdate  # missingPipInstals and missingAptPkgsInstall
${G_myName} ${extraInfo} -i fullBisosBasesUpdate # ReClone and GitPull
$( examplesSeperatorChapter "Apt-Packages Update And New Installs" )
${G_myName} ${extraInfo} -i aptUpgrades    # apt-get -y upgrade
${G_myName} ${extraInfo} -i missingAptPkgsInstall  # apt-s needed for recent features
$( examplesSeperatorChapter "Python And Pip Update And New Installs" )
bisosPyVenvSetup.sh -h -v -n showRun -i venvPy3Dev_exists # Is dev env in effect
${G_myName} ${extraInfo} -i venvPy3Dev_stash # deactivte development environment
${G_myName} ${extraInfo} -i pipUnDevAndUpgrades
${G_myName} ${extraInfo} -i missingPipInstall
$( examplesSeperatorChapter "Missing Pip And Apt Packages" )
$( examplesSeperatorChapter "Bisos Bases Update" )
${G_myName} ${extraInfo} -i bisosBasesReClone  # with cntnrDevel.sh
${G_myName} ${extraInfo} -f -i bisosBasesReClone  # forceMode with cntnrDevel.sh
${G_myName} ${extraInfo} -i bisosBasesPull  # with bx-gitRepos
${G_myName} ${extraInfo} -i bisosBasesReDirAndReLink # with bx-bases
${G_myName} ${extraInfo} -i missingBxRepos # not in bx-bases yet -- Very remporary
$( examplesSeperatorChapter "Blee And Usage Environment Upgrade" )
${G_myName} ${extraInfo} -i bleeUpgrade # bleeDoomsManage.sh -i reBuild + blee -i chemacs2FullUpdate
${G_myName} ${extraInfo} -i bashRcVerify
${G_myName} ${extraInfo} -f -i bashRcVerify  # forceMode updates
$( examplesSeperatorChapter "Optional Interim Actions" )
${G_myName} ${extraInfo} -i libreInfoBaseAndInitialTemplates # Bring over /libre/ByStar panels
${G_myName} ${extraInfo} -i optPublicOsmt # Bring over
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Run all the full ICMs in turn.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_fullUpgrades
    lpDo vis_fullMissingUpdate
    lpDo vis_fullBisosBasesUpdate
    lpDo vis_bleeUpgrade
}


function vis_fullUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** fullBeforeBisosBasesReClone -- Run all missing packages interim commands.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_pipUnDevAndUpgrades
    lpDo vis_aptUpgrades
}


function vis_fullMissingUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Run all missing packages interim commands.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_missingPipInstall

    lpDo vis_missingAptPkgsInstall
}

function vis_fullBisosBasesUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Run all missing packages interim commands.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bisosBasesReClone

    lpDo vis_bisosBasesPull

    lpDo vis_bisosBasesReDirAndReLink
}

function vis_bisosBasesReDirAndReLink {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update directory and links in /bisos.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo bx-bases -v 20 --baseDir="/bisos" --pbdName="bisosRoot"  -i pbdUpdate all
    lpDo bx-bases -v 20 --baseDir="/bisos" --pbdName="bleeRoot"  -i pbdUpdate all

    lpReturn
}


function vis_bisosBasesReClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** When Auth, use cntnrDevel.sh.
***  TODO When Anon, use bisosBaseDirs.sh.
*** TODO Recloning is being done from scratch for all, instead it should be incremental
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # NOTYET Check to see if this is needed
    lpDo cntnrDevel.sh -h -v -n showRun -i securityMode developer

    if [ "${G_forceMode}" == "force" ] ; then
        lpDo echo cntnrDevel.sh -h -v -n showRun -i bisosDevBxo_fullSetup
        # NOTYET, rerun cachedls
    else
        ANT_raw "Run this only after you have pushed all your changes."
        ANT_raw "Not automated as part of batch full update as it can be dangerous."
        ANT_raw "/bisos/git/bxRepos and moved and re-cloned."

        lpDo echo cntnrDevel.sh -h -v -n showRun -i bisosDevBxo_fullSetup
        # NOTYET, rerun cachedls
    fi

    lpReturn
}

function vis_bisosBasesPull {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Git pull all bases.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxReposEnd=$(FN_fileSymlinkEndGet /bisos/git/bxRepos)

    if [ "${bxReposEnd}" == "/bisos/git/auth/bxRepos" ] ; then
        lpDo eval  bx-gitRepos -p vcMode=auth -i cachedLs \| bx-gitRepos -i gitRemPull
    elif [ "${bxReposEnd}" == "/bisos/git/anon/bxRepos" ] ; then
        lpDo eval  bx-gitRepos -p vcMode=auth -i cachedLs \| bx-gitRepos -i gitRemPull
    else
        EH_problem "OOPS, unexpected bxReposEnd=${bxReposEnd}"
    fi

    lpReturn
}


function vis_aptUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo apt-get update
    lpDo sudo apt-get -y --with-new-pkgs upgrade
    lpDo sudo apt -y autoremove
    lpDo sudo apt-get -y upgrade

    echo "Last line should have been: 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded."

    lpReturn
}

function vis_pipUnDevAndUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_venvPy3Dev_stash

    lpDo bisosPyVenvSetup.sh -h -v -n showRun -i venvPy3_pipUpgrades

    lpReturn
}


function vis_missingPipInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # In case there are new ones that have not been installed
    lpDo lcaPythonCommonBinsPrep.sh -v -n showRun -i fullUpdate

    lpDo bisosPyVenvSetup.sh -h -v -n showRun -i venvPy3_pipInstalls
    
    # lpDo /bisos/venv/py3/bisos3/bin/pip3 install --upgrade unisos.gcipher



    function toBeAbsorbedIn_bleeBinsPrep {
        # sudo npm install --global pyright
        #lpDo pipx install pytest
        return
    }
    lpDo toBeAbsorbedIn_bleeBinsPrep


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

function vis_missingBxRepos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Missing bxRepos not in bx-bases yet.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo  /bisos/git/auth/bxRepos/bisos-pip git clone git@mb1_github:bisos-pip/bxoGitlab.git

    lpReturn
}


function vis_libreInfoBaseAndInitialTemplates {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
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

function vis_optPublicOsmt {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo sudo mkdir -p /opt/public
    lpDo sudo chown bisos:bisos /opt/public
    lpDo sudo chmod 775 /opt/public

    lpDo scp -r bystar@192.168.0.151:/opt/public/osmt /opt/public

    lpReturn
}


function vis_bleeUpgrade {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Missing apt packages to be sorted out and absorbed
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    # sha1 obtained from a stable release -- git rev-parse HEAD
    inBaseDirDo /bisos/blee/extPkgs/emacs-application-framework git reset --hard 4ce9b1cab0f4894adcb1710917f96279cccd401b


    lpDo bleeDoomsManage.sh -h -v -n showRun -p profile=blee2 -i reBuild
    # lpDo bleeDoomsManage.sh -h -v -n showRun -p profile=sysDoom -i reBuild

    lpDo blee -h -v -n showRun -i blee1InitSetup

    lpDo blee -h -v -n showRun -i chemacs2FullUpdate    
    
    lpReturn
}


function vis_bashRcVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** If _bashrc needs updating, do so.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local diffResults=$(lpDo diff /bisos/apps/defaults/bashrc/usg/_bashrc ~/_bashrc)

    if [ -z "${diffResults}" ] ; then
        ANT_raw "_bashrc is current -- updating skipped"
        if [ "${G_forceMode}" == "force" ] ; then
            ANT_raw "_bashrc forceMode ignored -- skipped"
        fi
        lpReturn
    else
        echo "${diffResults}"
    fi

    if [ "${G_forceMode}" == "force" ] ; then
        lpDo mv ~/_bashrc  ~/_bashrc.$(DATE_nowTag)
        lpDo cp /bisos/apps/defaults/bashrc/usg/_bashrc ~/_bashrc
    else
        EH_problem "_bashrc needs updating but forceMode was not specified."
    fi

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
