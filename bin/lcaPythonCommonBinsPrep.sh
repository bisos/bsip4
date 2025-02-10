#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaPythonCommonBinsPrep.sh,v 1.3 2016-08-15 18:51:34 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/lcaPythonCommonBinsPrep.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@"
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ================ CONTENTS-LIST ================
*      ================ *[Info]* General TODO List
_CommentEnd_
function vis_describe {  cat  << _EOF_
**     ============ Essential Features TODO
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
        "python3_venv"         # needed by pipx
        "py3Bisos3PipInstalls"
        "pipxInstalls"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()

    itemPy3Bisos3PipOrderedList=(
        "pipx"
        "bisos.gcipher"       #
        "yolk3k"               # Did not work with pipx
        # "twine"                #
        "pykeepass-cache"
        "python-gnupg"
        "google-api-python-client"
        "google-auth-oauthlib"
        "pygit2"
        "graphviz"
        "python-magic"
        "cryptography"
        "keyring"
        "build"
    )

# "libvirt-python" only applies to hosts not guests -- should be bundeled with lcaKvmBinsPrep.sh because of libvirt-bin

    itemPipxOrderedList=(
        "twine"       # for pypi uploading
        "pipreqs"     # for requirements creation
        "johnnydep"    # dependency tree
        "pipdeptree"  # dependency tree
        # See github.com/hlissner/doom-emacs/blob/develop/modules/lang/python/README.org
        "pytest"      # Used by blee and doom
        "nose"        # Used by blee and doom
        "black"       # Used by blee and doom
        "isort"       # Used by blee and doom
        #
        "mypy"        # Used in python mode
        "pylint"      # Used in python mode
        "flake8"      # Used in python mode
        "pyflakes"
        "pep8"
        "bisos.pycs"
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
${G_myName} ${extraInfo} -i repositoryAdd
_EOF_
}



function pkgsList_DEFAULT_DEFAULT_OLD {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=( 
        python_xlrd
        python_xlwt
        python_pexpect       # send/receive expect and respond
        "python_argparse" 
        "pychecker"
        "pyflakes"
        "ipython"
        "pylint"
        "graphviz"            # For Profiling
        "python_pip"
        "pep8"
        "python_flake8"
        "python_zsi"          # - Zolera Soap Infrastructure
        "python_suds"         # 
        "python_pypdf"        # 
        "libxml2_dev"         #  Used by lxml
        "libxslt1_dev"        #  Used by lxml
        "zlib1g_dev"          #  Used by lxml -- Was: zlib1g-dev:i386
        python_sphinx
    )
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [ExamplesExt] :: Module Specific Additions [[elisp:(org-cycle)][| ]]
_CommentEnd_


function examplesHookPost%% {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i pipInstallCommon
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [PyPi]        :: pipInstallCommon [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pipInstallCommon {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo chgrp employee /usr/local/lib/python2.7/dist-packages
    # ;; ;; Jedi settings  -- Goes with Blee setup
    opDo pip install jedi
    #opDo pip install --user jedi
    opDo pip install epc
    #opDo pip install --user epc
    #
    opDo pip install --upgrade  lxml         # ubuntu's is not good enough for openpyxl

    opDo pip install gprof2dot                # For Profiler Graphing
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [PyPi]        :: pipInstallOpenpyxl [[elisp:(org-cycle)][| ]]
_CommentEnd_



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python3-venv"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: python3-venv [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python3_venv () { distFamilyGenerationHookRun binsPrep_python3_venv; }

binsPrep_python3_venv_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python3-venv"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "graphviz"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: graphviz [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_graphviz () { distFamilyGenerationHookRun binsPrep_graphviz; }

binsPrep_graphviz_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "graphviz"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-pexpect"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-pexpect [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_pexpect () { distFamilyGenerationHookRun binsPrep_python_pexpect; }

binsPrep_python_pexpect_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-pexpect"; }

####+END:



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libxml2-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: libxml2-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libxml2_dev () { distFamilyGenerationHookRun binsPrep_libxml2_dev; }

binsPrep_libxml2_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libxml2-dev"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libxslt1-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: libxslt1-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libxslt1_dev () { distFamilyGenerationHookRun binsPrep_libxslt1_dev; }

binsPrep_libxslt1_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libxslt1-dev"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-pypdf"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-pypdf [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_pypdf () { distFamilyGenerationHookRun binsPrep_python_pypdf; }

binsPrep_python_pypdf_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-pypdf"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-zsi"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-zsi [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_zsi () { distFamilyGenerationHookRun binsPrep_python_zsi; }

binsPrep_python_zsi_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-zsi"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-suds"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-suds [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_suds () { distFamilyGenerationHookRun binsPrep_python_suds; }

binsPrep_python_suds_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-suds"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pep8"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: pep8 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pep8 () { distFamilyGenerationHookRun binsPrep_pep8; }

binsPrep_pep8_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pep8"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-flake8"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-flake8 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_flake8 () { distFamilyGenerationHookRun binsPrep_python_flake8; }

binsPrep_python_flake8_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-flake8"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pylint"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: pylint [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pylint () { distFamilyGenerationHookRun binsPrep_pylint; }

binsPrep_pylint_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pylint"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-pip"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-pip [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_pip () { distFamilyGenerationHookRun binsPrep_python_pip; }

binsPrep_python_pip_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-pip"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-argparse"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-argparse [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_argparse () { distFamilyGenerationHookRun binsPrep_python_argparse; }

binsPrep_python_argparse_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-argparse"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pychecker"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: pychecker [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pychecker () { distFamilyGenerationHookRun binsPrep_pychecker; }

binsPrep_pychecker_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pychecker"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pyflakes"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: pyflakes [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pyflakes () { distFamilyGenerationHookRun binsPrep_pyflakes; }

binsPrep_pyflakes_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pyflakes"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "ipython"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: ipython [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ipython () { distFamilyGenerationHookRun binsPrep_ipython; }

binsPrep_ipython_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "ipython"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "zlib1g-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: zlib1g-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_zlib1g_dev () { distFamilyGenerationHookRun binsPrep_zlib1g_dev; }

binsPrep_zlib1g_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "zlib1g-dev"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-xlrd"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-xlrd [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_xlrd () { distFamilyGenerationHookRun binsPrep_python_xlrd; }

binsPrep_python_xlrd_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-xlrd"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-xlwt"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-xlwt [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_xlwt () { distFamilyGenerationHookRun binsPrep_python_xlwt; }

binsPrep_python_xlwt_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-xlwt"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "python-sphinx"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Apt-Pkg       :: python-sphinx [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_python_sphinx () { distFamilyGenerationHookRun binsPrep_python_sphinx; }

binsPrep_python_sphinx_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "python-sphinx"; }

####+END:


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: py3Bisos3 pip installs
_CommentEnd_

vis_py3Bisos3PipInstalls () {
    ANT_raw "Here we process py3Bisos3PipInstalls one by one."
    local each
    for each in ${itemPy3Bisos3PipOrderedList[@]} ; do
        lpDo sudo -u bisos /bisos/core/bsip/bin/bisosPyVenvSetup.sh -h -v -n showRun -f -i venvDo py3 reInstall "${each}"
    done
    print
}

vis_py3Bisos3DevPipInstalls () {
    ANT_raw "Here we process py3Bisos3PipInstalls one by one."
    local each
    for each in ${itemPy3Bisos3PipOrderedList[@]} ; do
        lpDo sudo -u bisos /bisos/core/bsip/bin/bisosPyVenvSetup.sh -h -v -n showRun -f -i venvDo py3/dev reInstall "${each}"
    done
    print
}



item_py3Bisos3PipInstalls () {
  distFamilyGenerationHookRun binsPrep_py3Bisos3PipInstalls
}

binsPrep_py3Bisos3PipInstalls_DEFAULT_DEFAULT () {
    mmaThisPkgName="py3Bisos3PipInstalls"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_py3Bisos3PipInstalls
    }
}

item_py3Bisos3DevPipInstalls () {
  distFamilyGenerationHookRun binsPrep_py3Bisos3DevPipInstalls
}

binsPrep_py3Bisos3DevPipInstalls_DEFAULT_DEFAULT () {
    mmaThisPkgName="py3Bisos3DevPipInstalls"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_py3Bisos3DevPipInstalls
    }
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: pipx installs
_CommentEnd_

vis_pipxInstalls () {
    ANT_raw "Here we process pipxInstalls one by one."
    #lpDo sudo -u bisos id
    local each
    for each in ${itemPipxOrderedList[@]} ; do
        lpDo sudo -u bisos env PIPX_HOME=/bisos/pipx PIPX_BIN_DIR=/bisos/pipx/bin /bisos/venv/py3/bisos3/bin/pipx install "${each}"
    done
}

item_pipxInstalls () {
  distFamilyGenerationHookRun binsPrep_pipxInstalls
}

binsPrep_pipxInstalls_DEFAULT_DEFAULT () {
    mmaThisPkgName="pipxInstalls"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_pipxInstalls
        lpReturn
    }
}


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

