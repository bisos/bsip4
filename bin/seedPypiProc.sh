#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedPypiProc.sh,v 1.3 2018-01-08 00:22:47 lsipusr Exp $"
# *CopyLeft*
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/seedPypiProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ Describe/Help/Info

function vis_describe {
    cat  << _EOF_
For Full Documentation ad Orientation and Model See 

   /libre/ByStar/InitialTemplates/activeDocs/blee/mailCompose/softwares/fullUsagePanel-en.org
_EOF_
}

# }}}

# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/lcnObjectTree.libSh

# . ${opBinBase}/bystarSoftware.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh

# ./bystarMailing.libSh
# . ${opBinBase}/bystarMailing.libSh

# ./bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

# . ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh

# ./lpReRunAs.libSh 
. ${opBinBase}/lpReRunAs.libSh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/lpCurrents.libSh

. ${opBinBase}/usgBpos_lib.sh

# PRE parameters

function G_postParamHook {
     return 0
}

# }}}


# installDestBase="/usr/local/lib/python2.7/dist-packages"
installDestBase="/bisos/venv/py3/dev-bisos3/lib/python3.9/site-packages"

# {{{ Examples

function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

      icmPreps
    local pipPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}.tar.gz"

    local devPy3Bisos3="/bisos/venv/py3/dev-bisos3"
    #local relPy3Bisos3="/bystar/dist/venv/py2-bisos-3"
    local relPy3Bisos3="/bisos/venv/py3/bisos3"

    opDo icmPreps

    pypiPkgInfoExtract

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
$( examplesSeperatorChapter "Package Information" )
${G_myName} -i curDevVer         # lowest version number in the ./dist directory
${G_myName} -i pypiPkgInfoShow   # Show setup.py and ./dist and ./egg info
${G_myName} ${extraInfo} -i packagingTemplatesUpdate # Create/Renew templates for setup.py README.org
${G_myName} ${extraInfo} -i panelsUpdate # Modernize ./panels
$( examplesSeperatorChapter "Pip Local Direct Actions" )
pip show ${pypiPkgName}            # this local pkg ver=${pypiPkgVersion}
pip show --verbose ${pypiPkgName}  # this local pkg ver=${pypiPkgVersion}
pip uninstall ${pypiPkgName}
pip download ${pypiPkgName}        # Brings over the pkg but does not install
pip list -o --format columns       # Lists pkgs that are intersection of local and pypi
$( examplesSeperatorChapter "Building The Package" )
bx-dblock -i dblockUpdateFiles setup.py
touch ./pypiUploadVer ; bx-dblock -i dblockUpdateFiles setup.py ; rm  ./pypiUploadVer
${G_myName} ${extraInfo} -i licenseLhAgpl3
./setup.py develop   # Obsoleted
./setup.py sdist     # Obsoleted
${G_myName} ${extraInfo} -i fullPrepBuild curDev  # uses cur pkg rev
${G_myName} ${extraInfo} -i fullPrepBuild nextPypi # increments pypi latest pkg rev
${G_myName} ${extraInfo} -p repo=main -i fullPrepBuildUploadRePrep  # After upload recreates the dist with installed version
${G_myName} ${extraInfo} -p repo=main -i fullPrepBuildUpload
${G_myName} ${extraInfo} -p repo=test -i fullPrepBuildUpload
$( examplesSeperatorChapter "Registering and publishing the package" )
https://pypi.python.org/pypi  https://testpypi.python.org/pypi
twine upload --repository-url https://test.pypi.org/legacy/ ./dist/bisos.pkgName-0.8.tar.gz
${G_myName} ${extraInfo} -p repo=main -i twineUpload
${G_myName} ${extraInfo} -p repo=test -i twineUpload
$( examplesSeperatorChapter "Un Installation" )
${G_myName} ${extraInfo} -i pkgUnInstall ${relPy3Bisos3}
${G_myName} ${extraInfo} -i pkgUnInstall ${devPy3Bisos3}
${G_myName} ${extraInfo} -i pkgUnInstall sys
$( examplesSeperatorChapter "Installation" )
${G_myName} ${extraInfo} -i pkgInstall local ${relPy3Bisos3}   # pip install  ${pipPkgFile}
${G_myName} ${extraInfo} -i pkgInstall edit ${devPy3Bisos3}  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall edit sys  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall pypi ${relPy3Bisos3}  # pip install ${pypiPkgName}
pip install --no-cache-dir --editable ${pypiPkgName}
${G_myName} ${extraInfo} -i pkgLocalUsageMode      # show current symlink
${G_myName} ${extraInfo} -i pkgLocalUsageMode rel  # remove symlink
${G_myName} ${extraInfo} -i pkgLocalUsageMode dev  # create symlink
$( examplesSeperatorChapter "Cleaning" )
${G_myName} ${extraInfo} -i distClean
$( examplesSeperatorChapter "Pkg Versions (Installed vs setup.py vs PyPi)" )
pyPkgTools.cs
echo https://pypi.org/project/${pypiPkgName}  # Usually updates before pip database
${G_myName} -i versions 0.01       # shows all version info
${G_myName} ${extraInfo} -i nextVersion 0.01    # setup.py dblock
${G_myName} ${extraInfo} -i installedVersion    # setup.py dblock
setup.py --version  # read from ./setup.py
${G_myName} ${extraInfo} -i scriptFiles         # setup.py dblock
${G_myName} ${extraInfo} -i filesList
${G_myName} ${extraInfo} -i namespaceRequires   # setup.py dblock
$( examplesSeperatorChapter "pipx and Requirements And Dependencies" )
pipx install --force ${pypiPkgName}
pipx upgrade ${pypiPkgName}
pipx uninstall ${pypiPkgName}
pipx runpip ${pypiPkgName} list --outdated
pipx runpip ${pypiPkgName} freeze > ./requirements.txt ; ls -l ./requirements.txt # Update
pipx runpip ${pypiPkgName} show ${pypiPkgName}
$( examplesSeperatorChapter "Development Examples" )
${G_myName} ${extraInfo} -i vis_devExamples
_EOF_

}


function vis_devExamples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

      icmPreps
    local pipPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}.tar.gz"

    local devPy3Bisos3="/bisos/venv/py3/dev-bisos3"
    #local relPy3Bisos3="/bystar/dist/venv/py2-bisos-3"
    local relPy3Bisos3="/bisos/venv/py3/bisos3"

    opDo icmPreps

    pypiPkgInfoExtract

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
$( examplesSeperatorChapter "Installation" )
${G_myName} ${extraInfo} -i pkgInstall local ${relPy3Bisos3}   # pip install  ${pipPkgFile}
${G_myName} ${extraInfo} -i pkgInstall edit ${devPy3Bisos3}  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall local /bisos/tmp/venv/py3-tmp  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall edit /bisos/tmp/venv/py3-tmp
${G_myName} ${extraInfo} -i pkgInstall edit sys  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall pypi ${relPy3Bisos3}  # pip install ${pypiPkgName}
pip install --no-cache-dir --install-option="--install-scripts=/bystar/bin" --install-option="--install-data=/bystar/data" ${pipPkgFile}
pip install --no-cache-dir --index-url https://test.pypi.org/simple/ ${pypiPkgName}
pip install --no-cache-dir --editable ${pypiPkgName}
pip install --no-cache-dir --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple ${pypiPkgName}
${G_myName} ${extraInfo} -i pkgLocalUsageMode      # show current symlink
${G_myName} ${extraInfo} -i pkgLocalUsageMode rel  # remove symlink
${G_myName} ${extraInfo} -i pkgLocalUsageMode dev  # create symlink
$( examplesSeperatorChapter "Python Sphinx Documentation" )
${G_myName} ${extraInfo} -i sphinxDocUpdate
${G_myName} ${extraInfo} -f -i sphinxDocUpdate   # Force Recreation
${G_myName} ${extraInfo} -i sphinxDocPublish
${G_myName} ${extraInfo} -i sphinxDocClean
$( examplesSeperatorChapter "File Parameters Tree Base (fptb)" )
fileParamManage.py -v 30  -i fileParamDictReadDeep ../fptb
fileParamManage.py -i fileParamWritePath ../fptb/docTitle "Pkg's Human Oriented Name"
fileParamManage.py -i fileParamWritePath ../fptb/docVersion "0.1"
$( examplesSeperatorChapter "REAME.rst Creation --- Mostly Obsoleted" )
pandoc --from=latex -s -t rst --toc README.tex -o README.rst
pandoc --from=latex -s -t org --toc README.tex -o RESULT.org
pandoc --from=org -s -t rst --toc RESULT.org -o RESULT.rst
pandoc --from=org -s -t rst --toc README.org -o README.rst
xelatex README.tex
$( examplesSeperatorChapter "pip and setup.py Dependencies" )
pipreqs --force .
johnnydep -v 0 $pypiPkgName
pipdeptree -r -p $pypiPkgName # Needs a virtEnv
pipdeptree -fl -p $pypiPkgName # Needs a virtEnv
yolk -U $pypiPkgName # show if update available at PyPI
_EOF_

hookRun "examplesHookPost"
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func      ::  icmPreps    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function icmPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    pypiPkgInfoExtract

    fptb_docVersion=$(fileParamManage.py -i fileParamReadPath ../fptb/docVersion)
    fptb_docTitle=$(fileParamManage.py -i fileParamReadPath ../fptb/docTitle)    
}


function vis_packagingTemplatesUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local templatesBase="/bisos/apps/defaults/begin/templates/purposed/pyModule"

    ANT_raw "pyModule Template Base: ${templatesBase}"

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/bash/pypiProc.sh
    if [ ! -f "pypiProc.sh" ] ; then
        lpDo cp "${templatesBase}/build/pypiProc.sh" pypiProc.sh
    else
        ANT_raw "pypiProc.sh -- is in place, updating skipped"
    fi

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/build/MANIFEST.in
    if [ ! -f "MANIFEST.in" ] ; then
        lpDo cp "${templatesBase}/build/MANIFEST.in" MANIFEST.in
    else
        ANT_raw "MANIFEST.in -- is in place, updating skipped"
    fi

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/build/pyproject.toml
    if [ ! -f "pyproject.toml" ] ; then
        lpDo cp "${templatesBase}/build/pyproject.toml" pyproject.toml
    else
        ANT_raw "pyproject.toml -- is in place, updating skipped"
    fi

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/org/README.org
    if [ ! -f "README.org" ] ; then
        lpDo cp "${templatesBase}/org/README.org" README.org
    else
        ANT_raw "README.org -- is in place, updating skipped"
    fi

    #
    # Order is important. setup.py should come last.
    #

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/python/setup.py
    if [ ! -f "setup.py" ] ; then
        lpDo cp "${templatesBase}/python/setup.py" setup.py
        lpDo bx-dblock -i dblockUpdateFiles setup.py
    else
        ANT_raw "setup.py -- is in place, updating skipped"
    fi

    lpReturn
}


function vis_panelsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    pypiPkgInfoExtract

    if [ -d "./panels/${pypiPkgName}" ] ; then
        ANT_raw "./panels/${pypiPkgName} alread in place. Update skipped."
        lpReturn
    fi

    lpDo mkdir ./panels/${pypiPkgName}
    if [ -d ./panels/_nodeBase_ ] ; then
        lpDo mv ./panels/bleePanelProc.sh  ./panels/ftoProc.sh  ./panels/_nodeBase_  ./panels/_objectType_ ./panels/_tree_ ./panels/_treeProc_ ./panels/${pypiPkgName}
    fi

    lpDo mkdir ./panels/${pypiPkgName}/README
    inBaseDirDo ./panels/${pypiPkgName}/README startOrgPanel.sh -h -v -n showRun -i bleePanelBase leaf .
    lpDo rm ./panels/${pypiPkgName}/README/fullUsagePanel-en.org
    lpDo ln -s $(pwd)/README.org ./panels/${pypiPkgName}/README/fullUsagePanel-en.org

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func      ::  pypiPkgInfoExtract    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function pypiPkgInfoExtract {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    pypiPkgName=""    
    pypiPkgNamespace=""
    pypiPkgModule=""
    pypiPkgBaseMode=""
    pypiPkgVersion=""
    pypiPkgAuthor=""
    pypiPkgModuleBase=""    

    local thisBase=$(basename $(pwd))

    if [[ ${thisBase} == *"rel"* ]] ; then
        pypiPkgBaseMode="rel"
    elif [[ ${thisBase} == *"dev"* ]] ; then
        pypiPkgBaseMode="dev"
    elif [[ ${thisBase} == *"py2"* ]] ; then
        pypiPkgBaseMode="rel"
    elif [[ ${thisBase} == *"py3"* ]] ; then
        pypiPkgBaseMode="rel"
    else
        EH_oops "Missing or bad: ${thisBase}"
    fi

    pypiPkgName=$(./setup.py --name)

    # echo ZZ${pypiPkgName}XX
    if [ -z "${pypiPkgName}" ] ; then
        pypiPkgName="missing.pkg"
    fi
    # IFS=. command eval 'components=(${pypiPkgName##*-})'
    IFS=. command eval 'components=(${pypiPkgName##*=})'

    pypiPkgModule=${components[-1]}
    
    unset 'components[${#components[@]}-1]'

    pypiPkgNamespace=""
    for each in "${components[@]}"; do
        if [ -z ${pypiPkgNamespace} ] ; then
            pypiPkgNamespace="${each}"
        else
            pypiPkgNamespace="${pypiPkgNamespace}.${each}"
        fi
    done

    local pkgModuleBase=""

    if [ -z "${pypiPkgModule}" ] ; then
        EH_problem "Bad Usage"
    else
        if [ -z "${pypiPkgNamespace}" ] ; then
            pkgModuleBase="./${pypiPkgModule}"
        else
            pkgModuleBase="./${pypiPkgNamespace}/${pypiPkgModule}"
        fi
    fi
    
    pypiPkgModuleBase=${pkgModuleBase}    

    pypiPkgVersion=$(./setup.py --version)

    pypiPkgAuthor=$(./setup.py --author)    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pypiPkgInfoShow    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pypiPkgInfoShow {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps

    echo pypiPkgBaseMode=${pypiPkgBaseMode} -- pypiPkgName=${pypiPkgName} -- pypiPkgModule=${pypiPkgModule} -- pypiPkgNamespace=${pypiPkgNamespace} -- pypiPkgVersion=${pypiPkgVersion}
    echo pkgModuleBase=$(vis_pkgModuleBase)

    if [ -d "./${pypiPkgName}.egg-info" ] ; then
        lpDo egrep '^Version' ./${pypiPkgName}.egg-info/PKG-INFO
    else
        ANT_raw "Missing ./${pypiPkgName}.egg-info"
    fi

    if [ -d "./dist" ] ; then
        lpDo ls ./dist/*
    else
        ANT_raw "Missing ./dist"
    fi

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgModuleBase    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgModuleBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps

    local pkgModuleBase=""

    if [ -z "${pypiPkgModule}" ] ; then
        EH_problem "Bad Usage"
    else
        if [ -z "${pypiPkgNamespace}" ] ; then
            pkgModuleBase="./${pypiPkgModule}"
        else
            pkgModuleBase="./${pypiPkgNamespace}/${pypiPkgModule}"
        fi
    fi

    echo "${pkgModuleBase}"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgLocalUsageMode    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgLocalUsageMode {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Manage symlinks at ${installDestBase}/${pypiPkgNamespace}/${pypiPkgModule}.
** With no args, show current symlink
** With \$1=rel (release mode), remove symlink
** With \$1=dev (development mode), create symlink
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    opDo icmPreps

    local moduleLink="${installDestBase}/${pypiPkgNamespace}/${pypiPkgModule}"
    
    if [ $# -eq 0 ] ; then
        if [ -h "${moduleLink}" ] ; then
            opDo ls -l ${moduleLink}
        else
            ANT_raw "Released Production Mode"
            opDo ls -ld $(FN_absolutePathGet "${installDestBase}/$(vis_pkgModuleBase)")
        fi
        lpReturn
    fi

    local mode=$1

    if [ "${mode}" == "rel" ] ; then
        opDo FN_fileSymlinkRemoveIfThere "${moduleLink}"
    elif [ "${mode}" == "dev" ] ; then
        if [ ! -d "${installDestBase}/${pypiPkgNamespace}" ] ; then
            lpDo mkdir -p  "${installDestBase}/${pypiPkgNamespace}"
        fi
        opDo FN_fileSymlinkUpdate $(FN_absolutePathGet $(vis_pkgModuleBase)) "${moduleLink}"
    else
        EH_oops ""
    fi
    
    lpReturn
}


function withVenvBaseGetActiveFile {
    local venvBase=$1
    if [ "${venvBase}" == "sys" ] ; then
        echo ""
        return 0
    fi
    if [ ! -d "${venvBase}" ] ; then
        return 1
    fi
    if [ ! -f "${venvBase}"/bin/activate ] ; then
        return 1
    fi
    echo "${venvBase}"/bin/activate
    return 0
}

function sourceVenvActiveFile {
    local activeFile=$1
    if [ -z ${activeFile} ] ; then
        return
    else
        opDo . ${activeFile}
    fi
}

function vis_pkgUnInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local venvBase="$1"

    opDo icmPreps

      
    local activeFile=$(withVenvBaseGetActiveFile ${venvBase})

    if [ ! -z ${activeFile} ] ; then
        opDo sourceVenvActiveFile ${activeFile}
    fi
    
    opDo pip uninstall -y --no-cache-dir "${pypiPkgName}"
        
    lpReturn
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgInstall    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local installType="$1"
    local venvBase="$2"

    opDo icmPreps

    # opDo sudo chgrp employee /usr/local/lib/python2.7/dist-packages
    
    local pipPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}.tar.gz"
      
    local activeFile=$(withVenvBaseGetActiveFile ${venvBase})

    if [ ! -z ${activeFile} ] ; then
        opDo sourceVenvActiveFile ${activeFile}
    else
        ANT_raw "No activeFile -- Will apply to system"
    fi
    
    if [ "${installType}" == "edit" ]; then
        # MB 2024 -- git pull should not be done here
        # opDo git pull
        if [ -f  "./pyproject.toml" ] ; then
            lpDo mv ./pyproject.toml ./TMP-pyproject.toml
        fi
        opDo  pip install --no-cache-dir --editable .
        if [ -f  "./pyproject.toml" ] ; then
            EH_problem "Un-expected ./pyproject.toml"
        else
            if [ -f  "./TMP-pyproject.toml" ] ; then
                lpDo mv ./TMP-pyproject.toml ./pyproject.toml
            fi
        fi
        return
        
    elif [ "${installType}" == "local" ]; then
        if [ -f "${pipPkgFile}" ] ; then
            opDo pip install --no-cache-dir "${pipPkgFile}"
        else
            EH_problem "Missing pipPkgFile=${pipPkgFile}"
        fi
        return
        
    elif [ "${installType}" == "pypi" ]; then
        opDo pip install --no-cache-dir "${pypiPkgName}"
    else
        EH_problem "bad argument -- ${installType}"
        return
    fi
        
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_distClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_distClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps
    
    if [ -d ./dist ] ; then
        opDo rm -r ./dist
    else
        ANT_raw "No ./dist -- Skipping removal"
    fi

    # Module's autodoc
    pkgModuleAutodoc="$( vis_pkgModuleBase )/autodoc"

    # NOTYET, should not use star. Should uses package name.
    if [ -d ./*.egg-info ] ; then
        opDo rm -r ./*.egg-info
    else
        ANT_raw "No ./*.egg-info -- Skipping removal"
    fi

    opDo vis_sphinxDocClean

    opDo FN_fileRmIfThere -v *~
    opDo FN_fileRmIfThere -v *.pyc     

    inBaseDirDo $(vis_pkgModuleBase) FN_fileRmIfThere -v *.pyc
    inBaseDirDo $(vis_pkgModuleBase) FN_fileRmIfThere -v *~

    inBaseDirDo ${pypiPkgNamespace} FN_fileRmIfThere -v *.pyc    
    inBaseDirDo ${pypiPkgNamespace} FN_fileRmIfThere -v *~

    local pycacheDirs=$(find . -type d -print | egrep '/__pycache__$')

    if [ ! -z "${pycacheDirs}" ] ; then
        lpDo /bin/rm -r ${pycacheDirs}
    else
        ANT_raw "No __pycache__ dirs under here -- Skipping removal"
    fi

    # function rm_pycache {
    #     local here=$(pwd)
    #     if [ -d ./__pycache__ ] ; then
    #         opDo rm -r ./__pycache__
    #     else
    #         ANT_raw "No ./__pycache__ in ${here} -- Skipping removal"
    #     fi
    # }

    # inBaseDirDo $(vis_pkgModuleBase) rm_pycache
    # inBaseDirDo ${pypiPkgNamespace} rm_pycache

    opDo FN_fileRmIfThere -v README.aux README.out README.log

    opDo FN_fileRmIfThere ./auto/*
    if [ -d ./auto ] ; then
        opDo rmdir ./auto
    fi

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func      ::  sphinxDocUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function sphinxDocUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset baseDir="autodoc"

    if [[ "${G_forceMode}_" == "force_" ]] ; then
        opDo FN_dirSafeKeep ${baseDir}      
    fi
    
    if [ ! -d ${baseDir} ] ; then
        sphinx-apidoc . --full -o ${baseDir} -H "${fptb_docTitle}" -A "${pypiPkgAuthor}" -V "${fptb_docVersion}"
        FN_textReplace "^#sys.path.insert.*$" "sys.path.insert(0, os.path.abspath('..'))" ./autodoc/conf.py
        FN_textReplace "^html_theme = 'alabaster'" "html_theme = 'classic'" ./autodoc/conf.py
    fi

    inBaseDirDo ${baseDir} make html
    inBaseDirDo ${baseDir} make latex
    inBaseDirDo ${baseDir}/_build/latex make
    echo acroread $(FN_absolutePathGet "${baseDir}/_build/latex/*.pdf")
    echo $(FN_absolutePathGet "${baseDir}/_build/html/index.html")
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_sphinxDocPkgUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_sphinxDocUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps
    
    pkgModuleBase=$(vis_pkgModuleBase)

    inBaseDirDo ${pkgModuleBase} sphinxDocUpdate
};


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_sphinxDocPublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_sphinxDocPublish {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ANT_raw "NOTYET"

    lpReturn

    if [ -d ./iim/autodoc/_build ] ; then
        opDo sudo cp -r ./iim/autodoc/_build/html /var/www
    else
        EH_problem "Missing ./iim/autodoc/_build"
    fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_sphinxDocClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_sphinxDocClean {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -d ./autodoc ] ; then
        opDo rm -r ./autodoc
    else
        ANT_raw "No ./autodoc -- Skipping removal"
    fi

    # Module's autodoc
    pkgModuleAutodoc="$( vis_pkgModuleBase )/autodoc"

    if [ -d ${pkgModuleAutodoc} ] ; then
        opDo rm -r ${pkgModuleAutodoc}
    else
        ANT_raw "No ${pkgModuleAutodoc} -- Skipping removal"
    fi

    savedAutodoc=$(echo ${pkgModuleAutodoc}*)

    if [ "${savedAutodoc}" != "${pkgModuleAutodoc}*" ] ; then
        opDo FN_dirDeleteIfThere ${savedAutodoc}
    fi
}

function vis_distBuild {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Running setup.py is being obsoleted. Will use python build
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo ./setup.py sdist
}

function vis_fullPrepBuild {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local buildType="$1"

    case $buildType in
        "curDev"|"nextPypi")
            doNothing
            ;;
        *)
            EH_problem "Unexpected buildType=${buildType} -- Should be curDev or nextPypi"
            lpReturn 1
            ;;
    esac

    opDo icmPreps

    opDo vis_licenseLhAgpl3
    if [ -f ./README.tex ] ; then
        opDo pandoc --from=latex -s -t rst --toc README.tex -o README.rst
    fi

    if [ -f ./README.org ] ; then
        lpDo echo "Converting README.org to README.rst with pandoc"
        cat README.org   | egrep -v  '^Panel Controls:' | egrep -v '^Links:' | pandoc --from=org -s -t rst --toc -o README.rst
    fi

    if [ "${buildType}"  == "nextPypi" ] ; then
        lpDo touch "./pypiUploadVer"
        lpDo bx-dblock -i dblockUpdateFiles ./setup.py
        # lpDo vis_distClean
        lpDo vis_distBuild
        lpDo rm "./pypiUploadVer"
   elif [ "${buildType}"  == "curDev" ] ; then
        lpDo bx-dblock -i dblockUpdateFiles ./setup.py
        # lpDo vis_distClean
        lpDo vis_distBuild
    else
        EH_problem "Unexpected buildType=${buildType} -- Should be curDev or nextPypi"
        lpReturn 1
    fi
}



function vis_fullPrep%% {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps

    opDo vis_distClean
    
    opDo vis_licenseLhAgpl3
    if [ -f ./README.tex ] ; then
        opDo pandoc --from=latex -s -t rst --toc README.tex -o README.rst
    fi

    if [ -f ./README.org ] ; then
        lpDo echo "Converting README.org to README.rst with pandoc"
        cat README.org   | egrep -v  '^Panel Controls:' | egrep -v '^Links:' | pandoc --from=org -s -t rst --toc -o README.rst
    fi

    opDo ./setup.py sdist
}

function vis_fullPrepBuildUploadRePrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps

    lpDo vis_fullPrepBuildUpload

    opDo vis_fullPrepBuild curDev  # recreates the dist with installed version

 }


function vis_fullPrepBuildUpload {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo icmPreps

    local pypiUrl=''

    if [ "${repo}" == "main" ] ; then
        pypiUrl='https://pypi.python.org/pypi'
    elif [ "${repo}" == "test" ] ; then
        pypiUrl='https://testpypi.python.org/pypi'
    else
        EH_oops "Bad repo"
        return
    fi

    opDo vis_fullPrepBuild nextPypi

    opDo vis_twineUpload

    opDo echo ${pypiUrl}
}


function vis_twineUpload {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo touch "./pypiUploadVer"   # NB:  IMPORTANT
    opDo icmPreps
    lpDo rm "./pypiUploadVer"

    local repoStr="--repository-url https://upload.pypi.org/legacy/"
    #local userName=$(fileParamManage.py  -i fileParamReadPath /de/bx/nne/dev-py/pypi/pkgs/fptb/pypiProfile/default/userName)
    #local userPasswd=$(fileParamManage.py  -i fileParamReadPath /de/bx/nne/dev-py/pypi/pkgs/fptb/pypiProfile/default/userPasswd)

    local credentialsBxoPath=$(lpDo vis_usgBpos_credentials_bxoPath)

    EH_assert [ -n "${credentialsBxoPath}" ]
    
    #local userName=$(fileParamManage.py  -i fileParamReadPath ${credentialsBxoPath}/pypi/profiles/default/userName)
    local userName="__token__"
    EH_assert [ -n "${userName}" ]
    #local userPasswd=$(fileParamManage.py  -i fileParamReadPath ${credentialsBxoPath}/pypi/profiles/default/userPasswd)
    local userPasswd=$(fileParamManage.py  -i fileParamReadPath ${credentialsBxoPath}/pypi/profiles/default/userToken)
    EH_assert [ -n "${userPasswd}" ]
    
    if [ "${repo}" == "main" ] ; then
        repoStr=${repoStr}
    elif [ "${repo}" == "test" ] ; then
        repoStr="--repository-url https://test.pypi.org/legacy/"
        userName=$(fileParamManage.py  -i fileParamReadPath ${credentialsBxoPath}/pypi/profiles/testDefault/userName)
        EH_assert [ -n "${userName}" ]
        userPasswd=$(fileParamManage.py  -i fileParamReadPath ${credentialsBxoPath}/pypi/profiles/testDefault/userPasswd)
        EH_assert [ -n "${userPasswd}" ]
    else
        EH_oops "Bad repo"
        return
    fi

    local credentials="--username ${userName} --password ${userPasswd}"

    local pipPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}.tar.gz"

    #opDo gpg --detach-sign -a dist/package-1.0.1.tar.gz

    if [ -f "${pipPkgFile}" ] ; then
        opDo twine upload --verbose ${repoStr} ${credentials} ${pipPkgFile}
    else
        EH_problem "Missing pipPkgFile=${pipPkgFile}"
    fi  
}


function vis_licenseLhAgpl3 {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    manifestFile="./MANIFEST.in"

    opDo echo NOTYET Fix cp /libre/ByStar/InitialTemplates/license/lh-agpl3/lh-agpl3-LICENSE.txt  ./lh-agpl3-LICENSE.txt

    FN_lineIsInFile "^include lh-agpl3-LICENSE.txt" ${manifestFile} ; thisRetVal=$?
    if [[ ${thisRetVal} -eq 0 ]] ; then
        ANT_raw "lh-agpl3-LICENSE.txt is already in ${manifestFile}."
        return 
    fi

    cat >> ${manifestFile} << _EOF_ 
include lh-agpl3-LICENSE.txt
_EOF_

}

function vis_versions {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

   opDo icmPreps

    local nextVersion=$(vis_nextVersion $1)
    local installedVersion=$(vis_installedVersion)
    local setupVersion=$(setup.py --version)

    lpDo echo "Installed=${installedVersion} -- setup.py=${setupVersion} -- PyPi+$1=${nextVersion}" -- https://pypi.org/project/${pypiPkgName}
}


function vis_nextVersion {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local increment="$1"

    lpDo pypiPkgInfoExtract

    lpDo  pyPkgTools.cs  -i pypiLatestVersionPlus ${pypiPkgName} ${increment}
}

function vis_installedVersion {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    ###  local installedVer=$( pip show $(setup.py --name)  | egrep '^Version:' | cut -d ":" -f 2 )
    local installedVer=$( vis_curDevVer )

    echo ${installedVer}
}

function vis_curDevVer {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    lpDo pypiPkgInfoExtract
    # -v natural sort of (version) numbers within text.
    local curDevVer=$(ls -v ./dist/* | head -1 | sed -e s:.tar.gz:: -e s:./dist/${pypiPkgName}-::)

    echo ${curDevVer}
}


function vis_scriptFiles {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # lpDo pypiPkgInfoExtract

    local scriptFiles=""

    if [ -d "./bin" ] ; then
        scriptFiles="$( ls ./bin/* )"
    fi

    for each in ${scriptFiles} ; do
        echo "'$each',"
    done
}


function vis_filesList {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo pypiPkgInfoExtract

    local scriptFiles=""
    local moduleFiles=""

    if [ -d "./bin" ] ; then
        scriptFiles="$( ls ./bin/* )"
    fi

    local modulesBaseDir="./${pypiPkgNamespace}/${pypiPkgModule}"
    if [ -d "${modulesBaseDir}" ] ; then
        moduleFiles="$( ls ${modulesBaseDir}/*.py )"
    else
        EH_problem "Missing ${modulesBaseDir}"
    fi

    echo ${scriptFiles} ${moduleFiles}
}


function vis_namespaceRequires {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo pypiPkgInfoExtract

    local filesList="$( vis_filesList )"

    local tmpBleeFile=$( FN_tempFile )
    lpDo touch ${tmpBleeFile}

    function procEachBlee {
        local eachFile=$1
        egrep 'from.*import.*$' ${eachFile} \
            | grep blee \
            | cut -d ' ' -f 2  >> ${tmpBleeFile}
    }

    for each in ${filesList} ; do
        lpDo procEachBlee ${each}
    done
    if [ ! -z  "${tmpBleeFile}" ] ; then
        echo "\"blee\","
    fi
    lpDo cat ${tmpBleeFile} | sort | uniq | sed -e 's:\(^.*$\):\"\1\",:'
    lpDo rm ${tmpBleeFile}

    local tmpFile=$( FN_tempFile )
    lpDo touch ${tmpFile}

    function procEach {
        local eachFile=$1
        egrep 'from.*import.*$' ${eachFile} \
            | grep ${pypiPkgNamespace} \
            | cut -d ' ' -f 2 \
            | egrep -v ${pypiPkgName} \
            | egrep -v bisos.b.cs \
            | egrep -v ${pypiPkgNamespace}'$' >> ${tmpFile}
    }

    for each in ${filesList} ; do
        lpDo procEach ${each}
    done
    if [ ! -z  "${tmpBleeFile}" ] ; then
        echo "\"${pypiPkgNamespace}\","
    fi

    # First get rid of blank lines, also insert quotes around file names.
    #
    lpDo cat ${tmpFile} | grep -v '^[[:space:]]*$' | sort | uniq | sed -e 's:\(^.*$\):\"\1\",:'
    lpDo rm ${tmpFile}
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

