#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
Assumes that bisos account exists.
Assumes that python and pip and virtualenv are in place

- creates /opt/bisosProvisioners/venv/py2,3
- activates venv
- pip installs bisos.bases

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bisosPyVenv_lib.sh

function G_postParamHook {
     return 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"
    local onePip3Pkg="unisos.icm"
    local onePip2Pkg="unisos2.icm"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "BISOS Bases Initialization" )
${G_myName} ${extraInfo} -i pyVenv_provisionSetup  # virtenvsPrep + venvPy3_pipInstalls etc
${G_myName} ${extraInfo} -f -i pyVenv_provisionSetup  # forceMode virtenvsPrep + venvPy3_pipInstalls etc
$( examplesSeperatorSection "Create virtenvs and install packages" )
${G_myName} ${extraInfo} -i virtenvsPrep py3
${G_myName} ${extraInfo} -f -i virtenvsPrep py3  # force mode
$( examplesSeperatorSection "BISOS Install packages" )
${G_myName} ${extraInfo} -i venvPy3_pipInstalls   # Uses bisos.py3-all /bisos/git/bxRepos/bisos-pip/full/py3/setup.py
$( examplesSeperatorSection "BISOS Uninstall packages" )
${G_myName} ${extraInfo} -i venvPy3_bisosUninstalls
$( examplesSeperatorChapter "BISOS Upgrade Packages" )
${G_myName} ${extraInfo} -i venvPy3_pipUpgrades
$( examplesSeperatorChapter "BISOS List Packages" )
${G_myName} ${extraInfo} -f -i venvDo py3 pip list
${G_myName} ${extraInfo} -f -i venvDo py3 pip list --outdated --format=freeze
$( examplesSeperatorChapter "VenvDo -- Manage Packages" )
${G_myName} ${extraInfo} -f -i venvDo py3/dev install ${onePip3Pkg}
${G_myName} ${extraInfo} -f -i venvDo py3 reInstall ${onePip3Pkg}  # reinstall
${G_myName} ${extraInfo} -f -i venvDo py3 unInstall ${onePip3Pkg}
${G_myName} ${extraInfo} -f -i venvDo py3 pip list
$( examplesSeperatorChapter "Py3 Adopted Manage Environment" )
${G_myName} ${extraInfo} -i pyVenv_AdoptedSetup # Create Virtual Environment and dev pipInstalls
${G_myName} ${extraInfo} -i virtenvsPrep py3/adopted  # Create Virtual Environment
${G_myName} ${extraInfo} -f -i virtenvsPrep py3/adopted # force mode
${G_myName} ${extraInfo} -i venvPy3Adopted_pipInstalls # editable installed with ftoWalkThrough
$( examplesSeperatorChapter "Py3 Dev Manage Environment" )
${G_myName} ${extraInfo} -i pyVenv_DevSetup # Create Virtual Environment and dev pipInstalls
${G_myName} ${extraInfo} -i virtenvsPrep py3/dev  # Create Virtual Environment
${G_myName} ${extraInfo} -f -i virtenvsPrep py3/dev # force mode
${G_myName} ${extraInfo} -i venvPy3Dev_pipInstalls # editable installed with ftoWalkThrough
$( examplesSeperatorSection "Py3 Dev Venv Stash" )
${G_myName} ${extraInfo} -i venvPy3Dev_exists
${G_myName} ${extraInfo} -i venvPy3Dev_stashExists
${G_myName} ${extraInfo} -i venvPy3Dev_stashStatus
$(vis_venvPy3Dev_stashStatus)
${G_myName} ${extraInfo} -i venvPy3Dev_stash
${G_myName} ${extraInfo} -i venvPy3Dev_unStash
$( examplesSeperatorSection "Py3 Dev Venv For LSP Adjustments" )
${G_myName} ${extraInfo} -i venvPy3Dev_lspBisosSymLinks
$( examplesSeperatorChapter "Py3 Tmp Manage Environment" )
${G_myName} ${extraInfo} -i virtenvsPrep py3/tmp  # Create Virtual Environment
${G_myName} ${extraInfo} -f -i virtenvsPrep py3/tmp # force mode
$( examplesSeperatorChapter "Direct Examples" )
${pdb_venv_py3Bisos3}/bin/pip list --outdated --format=freeze
${pdb_venv_py3Bisos3}/bin/pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 ${pdb_venv_py3Bisos3}/bin/pip install --upgrade
pip2 list --outdated --format=freeze 
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
_EOF_
}

noArgsHook() {
  vis_examples
}

function vis_pyVenv_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** py3/dev is not done here
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_virtenvsPrep py3

    lpDo vis_venvPy3_pipInstalls

    lpReturn
}

function vis_pyVenv_adoptedSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_virtenvsPrep py3/adopted

    lpDo vis_venvPy3Adopted_pipInstalls

    lpReturn
}


function vis_pyVenv_DevSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO needs to check for stashed
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_virtenvsPrep py3/dev

    lpDo lcaPythonCommonBinsPrep.sh -v -n showRun -s py3Bisos3DevPipInstalls  -a fullUpdate

    lpDo vis_venvPy3Dev_pipInstalls

    lpReturn
}

function vis_venvDo  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is virtenvLabel
_EOF_
    }
    EH_assert [[ $# -gt 2 ]]
    local virtenvLabel="$1"
    # local cmndAndRest=$@  # unused

    local bisosBaseDir="/bisos"

    function venvCmnd {
        EH_assert [[ $# -gt 3 ]]
        local pythonVersion="$1"
        local relBaseDir="$2"
        shift ; shift
        shift  # original label eg py3clean
        local cmndName="$1" # original cmnd
        shift

        local absBaseDir=${bisosBaseDir}/${relBaseDir}
        local venvPipProg=${absBaseDir}/bin/pip

        case ${cmndName} in
            reInstall)
                lpDo ${venvPipProg}  install --no-cache-dir --force-reinstall --upgrade $@
                ;;
            unInstall)
                lpDo ${venvPipProg} uninstall -y $@
                ;;
            pip)
                lpDo ${venvPipProg} $@
                ;;
            *)
                EH_problem "UnKnown cmndName=${cmndName}"
                ;;
        esac
    }

    case ${virtenvLabel} in
        py3)
            lpDo venvCmnd python3 venv/py3/bisos3 $@
            ;;
        py3/dev)
            if [ -d "/bisos/venv/py3/dev-bisos3" ] ; then
                lpDo venvCmnd python3 venv/py3/dev-bisos3 $@
            else
                ANT_RAW "Missing /bisos/venv/py3/dev-bisos3 -- Installation Skipped"
            fi
            ;;
        *)
            EH_problem "UnKnown virtenvLabel=${virtenvLabel}"
            ;;
    esac
}



function vis_virtenvsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Installs or Reinstalls venv. virtenvLabel is one of py3 py3/dev.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local virtenvLabel="$1"

    local bisosBaseDir="/bisos"

    function virtenvReInstall {
        EH_assert [[ $# -eq 2 ]]
        local pythonVersion="$1"
        local baseDir="$2"

        if [ "${G_forceMode}" != "force" ]  ; then
                if [ -d "${baseDir}" ] ; then
                EH_problem "${baseDir} exists and forceMode not specified."
                lpReturn
                fi
        fi

        if [ -d "${baseDir}" ] ; then
            lpDo mv "${baseDir}" "${baseDir}.$(DATE_nowTag)"
        fi

        lpDo sudo apt-get install python3-virtualenv

        lpDo  virtualenv --python=${pythonVersion} "${baseDir}"

        lpDo ${baseDir}/bin/python -m pip install --upgrade pip
        lpDo ls -ld "${baseDir}"
    }

    case ${virtenvLabel} in
        py3)
            lpDo virtenvReInstall python3 ${bisosBaseDir}/venv/py3/bisos3
            ;;
        py3/dev)
            lpDo virtenvReInstall python3 ${bisosBaseDir}/venv/py3/dev-bisos3
            ;;
        py3/adopted)
            lpDo virtenvReInstall python3 ${bisosBaseDir}/venv/py3/adopted
            ;;
        py3/tmp)
            local tmpBaseDir=${bisosBaseDir}/tmp/venv
            lpDo FN_dirCreatePathIfNotThere ${tmpBaseDir}
            lpDo virtenvReInstall python3 ${tmpBaseDir}/py3-tmp
            ;;
        *)
            EH_problem "UnKnown virtenvLabel=${virtenvLabel}"
            ;;
    esac
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_sitePkgsBaseGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local sitePkgsBase=""

    # Debian 11
    if [ -d "/bisos/venv/py3/dev-bisos3/lib/python3.9/site-packages" ] ; then
	sitePkgsBase="/bisos/venv/py3/dev-bisos3/lib/python3.9/site-packages"

    # Debian 12
    elif [ -d "/bisos/venv/py3/dev-bisos3/lib/python3.11/site-packages" ] ; then
	sitePkgsBase="/bisos/venv/py3/dev-bisos3/lib/python3.11/site-packages"

    else
	EH_problem "Missing /bisos/venv/py3/dev-bisos3/lib/python3.{9,11}/site-packages"
    fi
    
    echo ${sitePkgsBase}
}


function vis_venvPy3Dev_lspBisosSymLinks {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Go to the dev-bisos3 lib directory and create symlink in there for bisos namespaces.
** Without these lsp won't work.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local sitePkgsBase=$( vis_sitePkgsBaseGet )

    local bisosPyNamespaces="bisos unisos blee"

    for eachNamespace in ${bisosPyNamespaces} ; do
        echo ${eachNamespace}

        # /bisos/venv/py3/dev-bisos3/lib/python3.9/site-packages/bisos
        # /bisos/venv/py3/dev-bisos3/lib/python3.11/site-packages/bisos	
        lpDo ls -l  ${sitePkgsBase}/${eachNamespace}
        if [ -h "${sitePkgsBase}/${eachNamespace}" ] ; then
            lpDo echo "${sitePkgsBase}/${eachNamespace} is a link and we assume it is all good"
        else
            if [ ! -d "${sitePkgsBase}/${eachNamespace}" ] ; then
                EH_problem "Not a link and not a dir, is bad: ${sitePkgsBase}/${eachNamespace} --- Look into it"
                lpReturn 101
            else
                lpDo rmdir "${sitePkgsBase}/${eachNamespace}"
                if [ -d "${sitePkgsBase}/${eachNamespace}" ] ; then
                    EH_problem "rmdir failed.  ${sitePkgsBase}/${eachNamespace} --- Look into it"
                    lpReturn 101
                fi

                lpDo FN_fileSymlinkUpdate /bisos/git/auth/bxRepos/${eachNamespace}-pip/namespace/py3/${eachNamespace} ${sitePkgsBase}/${eachNamespace}
            fi
        fi
        lpDo ls -l  /bisos/venv/py3/dev-bisos3/lib/python3.9/site-packages/${eachNamespace}
    done

    lpReturn
}


function vis_venvPy3_pipUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Updates only packages that need to be updated. Applies to py3 and py3/dev
** Order of upgrades is important. pip does not enforce that. 
** So, we force the ones that should happen first before the automated --outdated.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #/bisos/venv/py3/bisos3/bin/python -m pip install --upgrade pip
    lpDo ${pdb_venv_py3Bisos3}/bin/python -m pip install --upgrade pip

    lpDo ${pdb_venv_py3Bisos3}/bin/pip install --no-cache-dir --force-reinstall --upgrade charset-normalizer

    local upgradeSubjectPkgs=$(lpDo eval ${pdb_venv_py3Bisos3}/bin/pip list --outdated --format=freeze \| grep -v flufl.bounce)

    if [ -z "${upgradeSubjectPkgs}" ] ; then
        ANT_raw "No packages needed to be upgraded for ${pdb_venv_py3Bisos3}."
        lpReturn
    fi

    ANT_raw "Upgrade Subject Packages For ${pdb_venv_py3Bisos3}:"
    ANT_raw "${upgradeSubjectPkgs}"

    lpDo eval printf '%s\\n' ${upgradeSubjectPkgs} \| grep -v '^\-e' \| cut -d = -f 1  \| xargs -n1 ${pdb_venv_py3Bisos3}/bin/pip install --no-cache-dir --force-reinstall --upgrade

    lpReturn
}

function vis_venvPy3_bisosUninstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Uninstalls packages -- Unverified
*** TODO needs testing and cleanup. It is UNVERIFIED.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local upgradeSubjectPkgs=$(lpDo eval ${pdb_venv_py3Bisos3}/bin/pip list --format=freeze \| egrep 'unisos\|bisos\|blee')

    if [ -z "${upgradeSubjectPkgs}" ] ; then
        ANT_raw "No packages needed to be upgraded for ${pdb_venv_py3Bisos3}."
        lpReturn
    fi

    ANT_raw "Upgrade Subject Packages For ${pdb_venv_py3Bisos3}:"
    ANT_raw "${upgradeSubjectPkgs}"

    lpDo eval printf '%s\\n' ${upgradeSubjectPkgs} \| grep -v '^\-e' \| cut -d = -f 1  \| xargs -n1 ${pdb_venv_py3Bisos3}/bin/pip uninstall -y

    lpReturn
}


function vis_venvPy3_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3. Not py3/dev. Uses bisos.py3-all virtual package.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    local py3ActivateFile="${pdb_venv_py3Bisos3}/bin/activate"

    if [ ! -f "${py3ActivateFile}" ] ; then
            EH_problem "Missing ${py3ActivateFile} -- BISOS Provisioners venv pip installs aborted"
            lpReturn 101
    fi

    lpDo sudo -u bisos ${pdb_venv_py3Bisos3}/bin/pip3 install --no-cache-dir --force-reinstall --upgrade bisos.py3-all

    lpDo sudo -u bisos ${pdb_venv_py3Bisos3}/bin/pip3 list 

    lpReturn
}

function vis_venvPy3Dev_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3/dev. Not py3. Installs packages as editable. Uses ftoWalkRunCmnd pypiProc.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local py3ActivateFile="${pdb_venv_py3Bisos3Dev}/bin/activate"

    if [ ! -f "${py3ActivateFile}" ] ; then
        EH_problem "Missing ${py3ActivateFile} -- BISOS Provisioners venv pip installs aborted"
        lpReturn 101
    fi

    source ${py3ActivateFile}

    lpDo echo ${VIRTUAL_ENV}

    # inBaseDirDo /bisos/git/bxRepos ftoProc-pip.sh -i ftoWalkRunCmnd pypiProc.sh -i pkgInstall edit ${pdb_venv_py3Bisos3Dev}
    inBaseDirDo /bisos/git/bxRepos/bisos-pip ftoProc.sh -i ftoWalkRunCmnd pypiProc.sh -i pkgReInstall edit ${pdb_venv_py3Bisos3Dev}

    lpDo pip3 list 
    
    lpReturn
}


function vis_venvPy3Adopted_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies only to py3. Not py3/dev. Uses bisos.py3-all virtual package.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    local py3ActivateFile="${pdb_venv_py3Adopted}/bin/activate"

    if [ ! -f "${py3ActivateFile}" ] ; then
            EH_problem "Missing ${py3ActivateFile} -- BISOS Provisioners venv pip installs aborted"
            lpReturn 101
    fi

    # lpDo sudo -u bisos ${pdb_venv_py3Adopted}/bin/pip3 install --no-cache-dir --force-reinstall --upgrade bisos.py3Adopted

    lpDo sudo -u bisos ${pdb_venv_py3Adopted}/bin/pip3 list

    lpReturn
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

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

