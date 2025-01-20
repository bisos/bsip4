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

      pypiPkgInfoExtract
    local pipPkgFile="./dist/${pypiPkgName/./_}-${pypiPkgVersion}.tar.gz"

    local devPy3Bisos3="/bisos/venv/py3/dev-bisos3"
    #local relPy3Bisos3="/bystar/dist/venv/py2-bisos-3"
    local relPy3Bisos3="/bisos/venv/py3/bisos3"

    typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
$( examplesSeperatorChapter "Package Common Artifacts -- For Initiation and Modernization" )
${G_myName} -i artifactsBaseDir
${G_myName} -i artifactsList
${G_myName} -i artifactsUpdate  # Create/Renew templates for setup.py README.org
${G_myName} ${extraInfo} -f -i artifactsUpdate # Modernize -- Overwrite existing files
${G_myName} ${extraInfo} -i artifactsPanelsUpdate # Modernize ./panels
$( examplesSeperatorChapter "Package Information and Pip Local Direct Actions" )
${G_myName} -i pypiPkgInfoShow   # Show setup.py and ./dist and ./egg info
pip show ${pypiPkgName}            # this local pkg ver=${pypiPkgVersion}
pip show --verbose ${pypiPkgName}  # this local pkg ver=${pypiPkgVersion}
pip uninstall ${pypiPkgName}
pip download ${pypiPkgName}        # Brings over the pkg but does not install
pip list -o --format columns       # Lists all pkgs -- intersection of local and pypi
$( examplesSeperatorChapter "Building The Package" )
bx-dblock -i dblockUpdateFiles setup.py
touch ./pypiUploadVer ; bx-dblock -i dblockUpdateFiles setup.py ; rm  ./pypiUploadVer
./setup.py --name --version
${G_myName} ${extraInfo} -i distBuild    # Just run python3 -m build
${G_myName} ${extraInfo} -i fullPrep  # Update ./_description and ./README.rst based on ../README.org
${G_myName} ${extraInfo} -i fullPrepBuild forSys  # sets sysVer -- uses cur pkg rev
${G_myName} ${extraInfo} -i fullPrepBuild forPypi # sets pypiVer (increments pypi)
$( examplesSeperatorChapter "Registering and publishing the package" )
https://pypi.python.org/pypi  https://testpypi.python.org/pypi
${G_myName} ${extraInfo} -p repo=main -i twineUpload  # twine upload --repository-url https://test.pypi.org/legacy/ ./dist/bisos.pkgName-ver.tar.gz
${G_myName} ${extraInfo} -p repo=test -i twineUpload
${G_myName} ${extraInfo} -i twineCheck sdist # whl
${G_myName} ${extraInfo} -p repo=main -i fullPrepBuildUploadRePrep  # After upload recreates the dist with installed version
${G_myName} ${extraInfo} -p repo=main -i fullPrepBuildUpload  # sets pypiVer (increments pypi)
${G_myName} ${extraInfo} -p repo=test -i fullPrepBuildUpload
$( examplesSeperatorChapter "Installation" )
${G_myName} ${extraInfo} -i pkgInstall local ${relPy3Bisos3}   # pip install  ${pipPkgFile}
${G_myName} ${extraInfo} -i pkgInstall edit ${devPy3Bisos3}  # pip install --editable $(pwd)
${G_myName} ${extraInfo} -i pkgInstall pypi ${relPy3Bisos3}  # pip install ${pypiPkgName}
pip install --no-cache-dir --editable ${pypiPkgName}
$( examplesSeperatorChapter "Un-Installation and Re-Installation" )
${G_myName} ${extraInfo} -i pkgUnInstall ${relPy3Bisos3}
${G_myName} ${extraInfo} -i pkgUnInstall ${devPy3Bisos3}
${G_myName} ${extraInfo} -i pkgReInstall local ${relPy3Bisos3}
${G_myName} ${extraInfo} -i pkgReInstall edit ${devPy3Bisos3}
$( examplesSeperatorChapter "Cleaning" )
${G_myName} ${extraInfo} -i distClean
$( examplesSeperatorChapter "Pkg Versions at PyPi" )
pyPkgTools.cs  -i pypiLatestVersion ${pypiPkgName}           # PyPi Ver Latest  -- pip index versions ${pypiPkgName}
pyPkgTools.cs  -i pypiLatestVersionPlus ${pypiPkgName} 0.01  # Same as: -i pypiLatestVersion + 0.01
$( examplesSeperatorChapter "Pkg Versions at System" )
${G_myName} ${extraInfo} -i versReport                       # Report all PyPi and System Versions
${G_myName} ${extraInfo} -i sysVerInstalled                  # pip show ${pypiPkgName} | grep Version
${G_myName} ${extraInfo} -i sysVerAtDist                     # ls -v ./dist/* | head -1 --  natural sort of (ver) numbers
${G_myName} ${extraInfo} -i sysVerAtSetup                    # setup.py --version -- Reads from  ./setup.py
${G_myName} ${extraInfo} -i sysVerIsNew                      # Is this a brand new package
$( examplesSeperatorChapter "Setup.py  Dblock Support" )
${G_myName} ${extraInfo} -i verForSetup  # PRIMARY -- sysVerInstalled but if ./pypiUploadVer exists pypiLatestVersionPlus
touch ./pypiUploadVer ; ${G_myName} ${extraInfo} -i verForSetup; rm  ./pypiUploadVer  # pypiLatestVersionPlus
${G_myName} ${extraInfo} -i verForSetup forPypi # -i pypiVerNext
${G_myName} ${extraInfo} -i verForSetup forSys  # -i sysVerInstalled
${G_myName} ${extraInfo} -i scriptFiles         # produces list of script files -- used in setup.py dblock
${G_myName} ${extraInfo} -i filesList           # produces list of script files and .py files
${G_myName} ${extraInfo} -i namespaceRequires   # produces list of imported bisos modules -- used in setup.py dblock
$( examplesSeperatorChapter "pipx and Requirements And Dependencies" )
pipx install --force ${pypiPkgName}
pipx upgrade ${pypiPkgName}
pipx uninstall ${pypiPkgName}
pipx runpip ${pypiPkgName} list --outdated
pipx runpip ${pypiPkgName} freeze > ./requirements.txt ; ls -l ./requirements.txt # Update
pipx runpip ${pypiPkgName} show ${pypiPkgName}
$( examplesSeperatorChapter "Development Examples" )
${G_myName} ${extraInfo} -i devExamples
${G_myName} ${extraInfo} -i readmeToDescriptionOrg ../README.org ./_description.org
_EOF_

}


function vis_devExamples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

      pypiPkgInfoExtract
    local pipPkgFile="./dist/${pypiPkgName/./_}-${pypiPkgVersion}.tar.gz"

    local devPy3Bisos3="/bisos/venv/py3/dev-bisos3"
    #local relPy3Bisos3="/bystar/dist/venv/py2-bisos-3"
    local relPy3Bisos3="/bisos/venv/py3/bisos3"


  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
$( examplesSeperatorChapter "Installation" )
${G_myName} ${extraInfo} -i pkgInstall local ${relPy3Bisos3}   # pip install  ${pipPkgFile/./_}
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



function vis_pipPkgFilePath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    pypiPkgInfoExtract

    local pipPkgFile="./dist/${pypiPkgName/./_}-${pypiPkgVersion}.tar.gz"
    echo ${pipPkgFile}
}


function vis_artifactsBaseDir { echo "/bisos/apps/defaults/begin/templates/purposed/pyModule" ;  }

function vis_artifactsList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
List the canonical sources for template artifacts.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local artifactsBaseDir=$(vis_artifactsBaseDir)

    echo ${artifactsBaseDir}/bash/pypiProc.sh
    echo ${artifactsBaseDir}/build/pyproject.toml
    echo ${artifactsBaseDir}/org/README.org
    echo ${artifactsBaseDir}/python/setup.py
    echo ${artifactsBaseDir}/license/lh-agpl3-LICENSE.txt
    echo ${artifactsBaseDir}/git/_gitattributes
    echo ${artifactsBaseDir}/git/_gitignore
}


 # if [ "${G_forceMode}" != "force" ]  ; then
 # FN_fileSafeCopy ./pypiProc.sh ./pypiProc.sh.$(DATE_getTag)


function vis_artifactsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used for both initiation and modernization.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local artifactsBaseDir=$(vis_artifactsBaseDir)

    ANT_raw "=== pyModule Artifacts / Template Base Dir: ${artifactsBaseDir}"

    function updateAsNeeded {
        EH_assert [[ $# -eq 2 ]]
        local artifact="$1"
        local templateFile="$2"

        if [ ! -f "${artifact}" ] ; then
            ANT_raw "Missing ${artifact} -- cp ${templateFile} ${artifact}"
            lpDo cp ${templateFile} ${artifact}
        else
            if  cmp -s  "${templateFile}" "${artifact}" ; then
                ANT_raw "${artifact} -- is current, no update needed"
            else
                # ANT_raw "force=${G_forceMode} -- ${artifact} is NOT Current"
                if [ "${G_forceMode}" == "force" ] ; then
                    FN_fileSafeCopy ${artifact} ${artifact}.$(DATE_getTag)
                    lpDo cp ${templateFile} ${artifact}
                else
                    ANT_raw "${artifact} -- not current but updating skipped -- Perhaps use -f"
                fi
            fi
        fi
    }

    function initializeOnly {
        EH_assert [[ $# -eq 2 ]]
        local artifact="$1"
        local templateFile="$2"

        if [ ! -f "${artifact}" ] ; then
            ANT_raw "Missing ${artifact} -- cp ${templateFile} ${artifact}"
            lpDo cp "${templateFile}" "${artifact}"
        else
            ANT_raw "${artifact} -- can not be reasonably machined compared. Consider diffing"
            lpDo echo diff  "${templateFile}"  "${artifact}"
        fi
    }

    function decommission {
        EH_assert [[ $# -eq 1 ]]
        local artifact="$1"

        if [ -f "${artifact}" ] ; then
            ANT_raw "${artifact} Noticed -- No Longer Needed -- Decomissioned"
            lpDo mv ${artifact} ${artifact}.$(DATE_getTag)
        else
            ANT_raw "${artifact} Not There -- Good, No action is needed."
        fi
    }

    function perhapsSwapReadmeOrg {
        EH_assert [[ $# -eq 0 ]]

        if [ -L "../README.org" ] && [ -f "./README.org" ] ; then
            ANT_raw "./README.org is a file and ../README.org is symlink. Will Swap."
            lpDo rm ../README.org
            lpDo mv ./README.org ../README.org
        elif [ -f "./README.org" ] && [ -f "../README.org" ] ; then
            ANT_raw "./README.org exists file and ../README.org exists. Will obsolete ./README.org."
            lpDo mv  ./README.org  ./README.org.$(DATE_getTag)
        elif [ -f "./README.org" ] && [ ! -f "../README.org" ] ; then
            ANT_raw "./README.org exists file and ../README.org is missing . Will Swap."
            lpDo mv  ./README.org  ../README.org
        else
            ANT_raw "No ./README.org deduced, No action needed."
        fi
    }

    lpDo updateAsNeeded "pypiProc.sh" "${artifactsBaseDir}/bash/pypiProc.sh"

    lpDo updateAsNeeded "pyproject.toml" "${artifactsBaseDir}/build/pyproject.toml"

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/license/lh-agpl3-LICENSE.txt
    lpDo updateAsNeeded "lh-agpl3-LICENSE.txt" "${artifactsBaseDir}/license/lh-agpl3-LICENSE.txt"

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/git/_gitignore
    lpDo updateAsNeeded "../.gitignore" "${artifactsBaseDir}/git/_gitignore"

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/git/_gitattributes
    lpDo updateAsNeeded "../.gitattributes" "${artifactsBaseDir}/git/_gitattributes"

    lpDo decommission ./MANIFEST.in

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/python/setup.py
    lpDo initializeOnly "setup.py" "${artifactsBaseDir}/python/setup.py"

    lpDo perhapsSwapReadmeOrg

    # /bisos/apps/defaults/begin/templates/purposed/pyModule/org/README.org
    lpDo initializeOnly ../"README.org" "${artifactsBaseDir}/org/README.org"

    lpReturn
}


function vis_artifactsPanelsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    pypiPkgInfoExtract

    if [ -d "./panels/${pypiPkgName}" ] ; then
        ANT_raw "./panels/${pypiPkgName} alread in place. Just perhaps updating the README"

        if [ ! -e ./panels/${pypiPkgName}/README/fullUsagePanel-en.org ] ; then
            ANT_raw "Updating ./panels/${pypiPkgName}/README/fullUsagePanel-en.org"
            lpDo rm ./panels/${pypiPkgName}/README/fullUsagePanel-en.org
            lpDo ln -s ../../../../README.org ./panels/${pypiPkgName}/README/fullUsagePanel-en.org
        else
            ANT_raw "In place. No action required for ./panels/${pypiPkgName}/README/fullUsagePanel-en.org"
        fi
        lpReturn
    fi

    # When does not ./panels/${pypiPkgName}

    lpDo mkdir -p ./panels/${pypiPkgName}
    if [ -d ./panels/_nodeBase_ ] ; then
        lpDo mv ./panels/bleePanelProc.sh  ./panels/ftoProc.sh  ./panels/_nodeBase_  ./panels/_objectType_ ./panels/_tree_ ./panels/_treeProc_ ./panels/${pypiPkgName}
    fi

    lpDo mkdir ./panels/${pypiPkgName}/README
    inBaseDirDo ./panels/${pypiPkgName}/README startOrgPanel.sh -h -v -n showRun -i bleePanelBase leaf .
    lpDo rm ./panels/${pypiPkgName}/README/fullUsagePanel-en.org
    lpDo ln -s ../../../../README.org ./panels/${pypiPkgName}/README/fullUsagePanel-en.org

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

    opDo pypiPkgInfoExtract

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

    ANT_raw "pipPkgFilePath:"
    lpDo vis_pipPkgFilePath

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

    opDo pypiPkgInfoExtract

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

    opDo pypiPkgInfoExtract

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

    opDo pypiPkgInfoExtract

    local activeFile=$(withVenvBaseGetActiveFile ${venvBase})

    if [ ! -z ${activeFile} ] ; then
        opDo sourceVenvActiveFile ${activeFile}
    fi
    
    opDo pip uninstall -y --no-cache-dir "${pypiPkgName}"
        
    lpReturn
}


function vis_pkgReInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local installType="$1"
    local venvBase="$2"


    local venvBase="$1"

    opDo pypiPkgInfoExtract

    local activeFile=$(withVenvBaseGetActiveFile ${venvBase})

    if [ ! -z ${activeFile} ] ; then
        opDo sourceVenvActiveFile ${activeFile}
    fi

    opDo pip uninstall -y --no-cache-dir "${pypiPkgName}"

    lpDo vis_fullPrepBuild forSys

    lpDo vis_pkgInstall ${installType} ${venvBase}

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

    opDo pypiPkgInfoExtract

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
Cleanup the package for git upload.
Delete everything that is reproducible.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo pypiPkgInfoExtract
    
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

    opDo FN_fileRmIfThere -v *~
    opDo FN_fileRmIfThere -v *.pyc     

    opDo FN_fileRmIfThere -v   _description.org
    opDo FN_fileRmIfThere -v   README.rst

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


function vis_distBuild {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Running setup.py is being obsoleted. Will use python build
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # OBSOLETED lpDo ./setup.py sdist

    #
    # The default behaviour of build is to make both an sdist and a wheel from the source
    # in the current directory; our usage is deliberately specific to just source distribution.
    #

    lpDo python3 -m build --sdist .
}

function vis_fullPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
Update ./_description and ./README.rst based on ../README.org
First produce ./_description.org with vis_readmeToDescriptionOrg
The use pandoc on ./_description.org to produce ./README.rst.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -f ../README.org ] ; then
        lpDo vis_readmeToDescriptionOrg ../README.org ./_description.org
        lpDo pandoc --from=org -s -t rst --toc ./_description.org -o ./README.rst
    else
        EH_problem "Missing ../README.org"
    fi
}

function vis_readmeToDescriptionOrg {
    G_funcEntry
    function describeF {  cat  << _EOF_
Common Usage: arg1=../README.org arg2=./_description.org
copy ../README.org to tempfile. bx-dblock tempFile. After stripping produce ./_description.org
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local inFile="$1"
    local outFile="$2"

    lpDo echo "Converting ${inFile} to ${outFile}"

    local tmpFile=${outFile}-TMP.org

    lpDo cp ${inFile} ${tmpFile}

    lpDo bx-dblock -i dblockUpdateFiles ${tmpFile}

    lpDo echo "Striping some org markups from ${tmpFile} and creating ${outFile}"

    cat ${tmpFile}   |\
        egrep -v  '^~Panel Links' |\
        egrep -v '^~Blee Panel' |\
        egrep -v '^~See Also' |\
        egrep -v '^# ' |\
        egrep -v '^#\+BEGIN:' |\
        egrep -v '^#\+END:' |\
        egrep -v '^#\+DATE:' |\
        egrep -v '^#\+AUTHOR:' |\
        egrep -v '^#\+OPTIONS:' |\
        egrep -v '^#\+STARTUP:' |\
        egrep -v '^#\+SEQ_TODO:' |\
        egrep -v '^#\+TAGS:' |\
        egrep -v '^#\+CATEGORY:' |\
        egrep -v '^#\+CAPTION:' |\
        egrep -v '^#\+NAME:' |\
        egrep -v '^#\+ATTR_HTML:' |\
        egrep -v '\.png' |\
        sed -e s:/py3/:/:g |\
        cat > ${outFile}

    lpDo rm ${tmpFile}

    lpDo ls -l ${outFile}
}


function vis_fullPrepBuild {
    G_funcEntry
    function describeF {  cat  << _EOF_
Run  vis_fullPrep and then build arg1=forSys or  arg1=forPypi.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local buildType="$1"

    case $buildType in
        "forSys"|"forPypi")
            doNothing
            ;;
        *)
            EH_problem "Unexpected buildType=${buildType} -- Should be forSys or forPypi"
            lpReturn 1
            ;;
    esac

    opDo pypiPkgInfoExtract

    lpDo vis_fullPrep

    if [ "${buildType}"  == "forPypi" ] ; then
        lpDo touch "./pypiUploadVer"
        lpDo bx-dblock -i dblockUpdateFiles ./setup.py
        # lpDo vis_distClean
        lpDo vis_distBuild
        lpDo rm "./pypiUploadVer"
   elif [ "${buildType}"  == "forSys" ] ; then
        lpDo bx-dblock -i dblockUpdateFiles ./setup.py
        # lpDo vis_distClean
        lpDo vis_distBuild
    else
        EH_problem "Unexpected buildType=${buildType} -- Should be forSys or forPypi"
        lpReturn 1
    fi
}


function vis_fullPrepBuildUploadRePrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo pypiPkgInfoExtract

    lpDo vis_fullPrepBuildUpload

    opDo vis_fullPrepBuild forSys  # recreates the dist with installed version

 }


function vis_fullPrepBuildUpload {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo pypiPkgInfoExtract

    local pypiUrl=''

    if [ "${repo}" == "main" ] ; then
        pypiUrl='https://pypi.python.org/pypi'
    elif [ "${repo}" == "test" ] ; then
        pypiUrl='https://testpypi.python.org/pypi'
    else
        EH_oops "Bad repo"
        return
    fi

    opDo vis_fullPrepBuild forPypi

    opDo vis_twineUpload

    opDo echo ${pypiUrl}
}


function vis_twineCheck {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3 ]]

    opDo pypiPkgInfoExtract

    local targets=""
    if [ $# -eq 0 ] ; then
        targets="sdist"
    else
        targets="$@"
    fi

    local sdistPkgFile="./dist/${pypiPkgName/./_}-${pypiPkgVersion}.tar.gz"
    local whlPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}-py3-none-any.whl"

    if [ ! -f "${sdistPkgFile}" ] ; then
        EH_problem "Missing sdistPkgFile=${sdistPkgFile}"
        lpReturn 101
    fi

    if [ ! -f "${whlPkgFile}" ] ; then
        EH_problem "Missing  whlPkgFile=${whlPkgFile}"
        lpReturn 101
    fi

    for each in ${targets} ; do
        if [ "${each}" == "sdist" ] ; then
            lpDo twine check ${sdistPkgFile}
        elif [ "${each}" == "whl" ] ; then
            lpDo twine check ${whlPkgFile}
        else
            EH_problem "Bad Usage target=${each}"
        fi
    done
}


function vis_twineUpload {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo touch "./pypiUploadVer"   # NB:  IMPORTANT
    opDo pypiPkgInfoExtract
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

    local sdistPkgFile="./dist/${pypiPkgName/./_}-${pypiPkgVersion}.tar.gz"

    if [ ! -f "${sdistPkgFile}" ] ; then
        EH_problem "Missing sdistPkgFile=${sdistPkgFile}"
        lpReturn 101
    fi

    #opDo gpg --detach-sign -a dist/package-1.0.1.tar.gz

    lpDo twine upload --verbose ${repoStr} ${credentials} ${sdistPkgFile}

    lpReturn

    # UNREACHED FOR NOW

    local whlPkgFile="./dist/${pypiPkgName}-${pypiPkgVersion}-py3-none-any.whl"

   if [ ! -f "${whlPkgFile}" ] ; then
        EH_problem "Missing  whlPkgFile=${whlPkgFile}"
        lpReturn 101
    fi

    lpDo twine upload --verbose ${repoStr} ${credentials}  ${whlPkgFile}
}

function vis_verForSetup {
    G_funcEntry
    function describeF {  cat  << _EOF_
The version number to be used in setup.py. Used in dblock.
With arg1=forSys -- In order try: vis_sysVerAtDist vis_sysVerInstalled vis_pypiVerLatest or 0.1
With arg1=forPypi -- In order try: (vis_pypiVerNext 0.01) or 0.1
With no args: in presence of ./pypiUploadVer, same as arg1=forPypi otherwise same as arg1=forSys
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    function forPypi {
        local pypiVerNext=$(vis_pypiVerNext 0.01)
        if [ -z "${pypiVerNext}" ] ; then
            echo "0.1"
            lpReturn
        fi
        echo "${pypiVerNext}"
        lpReturn
    }

    function forSys {

        local sysVerAtDist=$(vis_sysVerAtDist)
        if [ ! -z "${sysVerAtDist}" ] ; then
            echo "${sysVerAtDist}"
            lpReturn
        fi

        local sysVerInstalled=$(vis_sysVerInstalled 2> /dev/null)
        if [ ! -z "${sysVerInstalled}" ] ; then
            echo "${sysVerInstalled}"
            lpReturn
        fi

        local pypiVerLatest=$(vis_pypiVerLatest)
        if [ ! -z "${pypiVerLatest}" ] ; then
            echo "${pypiVerLatest}"
            lpReturn
        fi

        # So, it is a new package
        echo "0.1"

        lpReturn
    }

    if [ $# -eq 1 ] ; then
        local action=$1

        if [ "${action}" == "forPypi" ] ; then
            lpDo forPypi
        elif [ "${action}" == "forSys" ] ; then
            lpDo forSys
        else
            EH_problem "Bad Usage action=${action}"
            lpReturn
        fi
    else
        if [ -f  ./pypiUploadVer ] ; then
            lpDo forPypi
        else
            lpDo forSys
        fi
    fi
}



function vis_versReport {
    G_funcEntry
    function describeF {  cat  << _EOF_
Report all version numbers.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    opDo pypiPkgInfoExtract

    local pypiVerLatest=$(vis_pypiVerLatest)
    local pypiVerNext=$(vis_pypiVerNext 0.01)

    local sysVerInstalled=$(vis_sysVerInstalled 2> /dev/null)
    local sysVerAtDist=$(vis_sysVerAtDist)
    local sysVerAtSetup=$(vis_sysVerAtSetup)
    local sysVerIsNew=$(vis_sysVerIsNew)

    lpDo echo "${pypiPkgName}: pypiVerLatest=${pypiVerLatest} ; pypiVerNext=${pypiVerNext} ; sysVerInstalled=${sysVerInstalled} ; sysVerAtDist=${sysVerAtDist} ; sysVerAtSetup=${sysVerAtSetup} ; sysVerIsNew=${sysVerIsNew}"
}


function vis_sysVerIsNew {
    G_funcEntry
    function describeF {  cat  << _EOF_
We consider a package as New if there is no trace of it on the system and no trace of it on PyPi.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo pypiPkgInfoExtract

    local sysVerInstalled=$(vis_sysVerInstalled 2> /dev/null)
    if [ ! -z "${sysVerInstalled}" ] ; then
        echo "False"
        lpReturn
    fi

    local sysVerAtDist=$(vis_sysVerAtDist)
    if [ ! -z "${sysVerAtDist}" ] ; then
        echo "False"
        lpReturn
    fi

    local pypiVerLatest=$(vis_pypiVerLatest)
    if [ ! -z "${pypiVerLatest}" ] ; then
        echo "False"
        lpReturn
    fi

    echo "True"
    lpReturn
}


function vis_pypiVerNext {
    G_funcEntry
    function describeF {  cat  << _EOF_
Latest version number at PyPi plus specified increment.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local increment="$1"

    lpDo pypiPkgInfoExtract

    lpDo  pyPkgTools.cs  -i pypiLatestVersionPlus ${pypiPkgName} ${increment}
}

function vis_pypiVerLatest {
    G_funcEntry
    function describeF {  cat  << _EOF_
Latest version number at PyPi.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo pypiPkgInfoExtract

    lpDo  pyPkgTools.cs  -i pypiLatestVersion ${pypiPkgName}
}


function vis_sysVerInstalled {
    G_funcEntry
    function describeF {  cat  << _EOF_
Version number reported by pip.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    local installedVer=$( pip show $(setup.py --name)  | egrep '^Version:' | cut -d ":" -f 2 )
    # local installedVer=$( vis_curDevVer )

    echo ${installedVer}
}

function vis_sysVerAtSetup {
    G_funcEntry
    function describeF {  cat  << _EOF_
The version number inside of setup.py file.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local ver=$(setup.py --version)

    echo ${ver}
}

function vis_sysVerAtDist {
    G_funcEntry
    function describeF {  cat  << _EOF_
Lowest version number in ./dist/*.tar.gz --- During edit/development versions are kept stable.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local curDistVer=""

    if [ ! -d ./dist ] ; then
        echo ""
        lpReturn
    fi
        
    lpDo pypiPkgInfoExtract

    local curDistVer=$(ls -v ./dist/*.tar.gz | head -1 | sed -e s:.tar.gz:: -e s:./dist/${pypiPkgName}-::)

    echo ${curDistVer}
}


function vis_scriptFiles {
    G_funcEntry
    function describeF {  cat  << _EOF_
produces list of script files -- used in setup.py dblock
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # lpDo pypiPkgInfoExtract

    local scriptFiles=""

    if [ -d "./bin" ] ; then
        scriptFiles="$( ls bin/* )"
    fi

    for each in ${scriptFiles} ; do
        echo "'$each',"
    done
}


function vis_filesList {
    G_funcEntry
    function describeF {  cat  << _EOF_
produces list of script files and .py files -- Used in setup.py dblock
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
produces a list of imported bisos modules -- used in setup.py dblock
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
            | egrep -v from \
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

