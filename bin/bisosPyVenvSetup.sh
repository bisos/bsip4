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
$( examplesSeperatorSection "Create virtenvs and install packages" )
${G_myName} ${extraInfo} -i virtenvsPrep py2
${G_myName} ${extraInfo} -f -i virtenvsPrep py3
$( examplesSeperatorSection "BISOS Install packages" )
${G_myName} ${extraInfo} -i venvPy2_pipInstalls
${G_myName} ${extraInfo} -i venvPy3_pipInstalls
${G_myName} ${extraInfo} -i venvPy2Dev_pipInstalls
${G_myName} ${extraInfo} -i venvPy3Dev_pipInstalls
$( examplesSeperatorSection "BISOS Uninstall packages" )
${G_myName} ${extraInfo} -i venvPy3_bisosUninstalls
$( examplesSeperatorChapter "BISOS Upgrade Packages" )
${G_myName} ${extraInfo} -i venvPy2_pipUpgrades
${G_myName} ${extraInfo} -i venvPy3_pipUpgrades
$( examplesSeperatorChapter "BISOS List Packages" )
${G_myName} ${extraInfo} -f -i venvDo py3 pip list
${G_myName} ${extraInfo} -f -i venvDo py3 pip list --outdated --format=freeze
$( examplesSeperatorChapter "VenvDo -- Manage Packages" )
${G_myName} ${extraInfo} -f -i venvDo py3/dev install ${onePip3Pkg}
${G_myName} ${extraInfo} -f -i venvDo py3 reInstall ${onePip3Pkg}  # reinstall
${G_myName} ${extraInfo} -f -i venvDo py3 unInstall ${onePip3Pkg}
${G_myName} ${extraInfo} -f -i venvDo py3 pip list
$( examplesSeperatorChapter "Direct Examples" )
${pdb_venv_py2Bisos3}/bin/pip2 list --outdated --format=freeze
${pdb_venv_py2Bisos3}/bin/pip2 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 ${pdb_venv_py2Bisos3}/bin/pip2 install --upgrade
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
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    lpDo vis_virtenvsPrep

    lpDo vis_venvPy2_pipInstalls
    lpDo vis_venvPy3_pipInstalls
    lpDo vis_venvPy2Dev_pipInstalls
    lpDo vis_venvPy3Dev_pipInstalls    
    
    lpReturn
}

function vis_venvDo  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
**
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
        py2)
            lpDo venvCmnd python2 venv/py2/bisos3 $@
            ;;
        py2/dev)
            lpDo venvCmnd python2 venv/py2/dev/bisos3 $@
            ;;
        py3)
            lpDo venvCmnd python3 venv/py3/bisos3 $@
            ;;
        py3/dev)
            lpDo venvCmnd python3 venv/py3/dev/bisos3 $@
            ;;
        *)
            EH_problem "UnKnown virtenvLabel=${virtenvLabel}"
            ;;
    esac
}



function vis_virtenvsPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Installs or Reinstalls venv. virtenvLabel is one of py2 py2/dev py3 py3/dev.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local virtenvLabel="$1"

    local bisosBaseDir="/bisos"


    function virtenvReInstall {
        EH_assert [[ $# -eq 2 ]]
        local pythonVersion="$1"
        local relBaseDir="$2"

        local absBaseDir=${bisosBaseDir}/${relBaseDir}

        if [ "${G_forceMode}" != "force" ]  ; then
	        if [ -d "${absBaseDir}" ] ; then
                EH_problem "${absBaseDir} exists and forceMode not specified."
                lpReturn
	        fi
        fi

        if [ -d "${absBaseDir}" ] ; then
            lpDo mv "${absBaseDir}" "${absBaseDir}.$(DATE_nowTag)"
        fi

        inBaseDirDo ${bisosBaseDir} virtualenv --python=${pythonVersion} "${relBaseDir}"

        lpDo ${absBaseDir}/bin/python -m pip install --upgrade pip
    }

    case ${virtenvLabel} in
        py2)
            lpDo virtenvReInstall python2 venv/py2/bisos3
            ;;
        py2/dev)
            lpDo virtenvReInstall python2 venv/py2/dev/bisos3
            ;;
        py3)
            lpDo virtenvReInstall python3 venv/py3/bisos3
            ;;
        py3/dev)
            lpDo virtenvReInstall python3 venv/py3/dev/bisos3
            ;;
        *)
            EH_problem "UnKnown virtenvLabel=${virtenvLabel}"
            ;;
    esac
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_venvPy2_pipUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Upgrade py2 packages.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local upgradeSubjectPkgs=$(lpDo eval ${pdb_venv_py2Bisos3}/bin/pip2 list --outdated --format=freeze \| grep -v flufl.bounce)

    if [ -z "${upgradeSubjectPkgs}" ] ; then
        ANT_raw "No packages needed to be upgraded for ${pdb_venv_py2Bisos3}."
        lpReturn
    fi

    ANT_raw "Upgrade Subject Packages For ${pdb_venv_py2Bisos3}:"
    ANT_raw "${upgradeSubjectPkgs}"

    lpDo eval echo ${upgradeSubjectPkgs} \| grep -v '^\-e' \| cut -d = -f 1  \| xargs -n1 ${pdb_venv_py2Bisos3}/bin/pip2 install --upgrade

    lpReturn
}

function vis_venvPy3_pipUpgrades {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Upgrade py2 packages.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local upgradeSubjectPkgs=$(lpDo eval ${pdb_venv_py3Bisos3}/bin/pip list --outdated --format=freeze \| grep -v flufl.bounce)

    if [ -z "${upgradeSubjectPkgs}" ] ; then
        ANT_raw "No packages needed to be upgraded for ${pdb_venv_py3Bisos3}."
        lpReturn
    fi

    ANT_raw "Upgrade Subject Packages For ${pdb_venv_py3Bisos3}:"
    ANT_raw "${upgradeSubjectPkgs}"

    lpDo eval printf '%s\\n' ${upgradeSubjectPkgs} \| grep -v '^\-e' \| cut -d = -f 1  \| xargs -n1 ${pdb_venv_py3Bisos3}/bin/pip install --upgrade

    lpReturn
}

function vis_venvPy3_bisosUninstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Upgrade py2 packages.
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



function vis_venvPy2_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Make sure python2 and python3 and their pips are in place
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    local py2ActivateFile="${pdb_venv_py2Bisos3}/bin/activate"

    if [ ! -f "${py2ActivateFile}" ] ; then
	EH_problem "Missing ${py2ActivateFile} -- BISOS Provisioners venv pip installs aborted"
	lpReturn 101
    fi

    lpDo sudo -u bisos ${pdb_venv_py2Bisos3}/bin/pip2 install --no-cache-dir --force-reinstall --upgrade bisos.py2-all

    lpDo sudo -u bisos ${pdb_venv_py2Bisos3}/bin/pip2 list 

    lpReturn
}


function vis_venvPy3_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Make sure python2 and python3 and their pips are in place
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

function vis_venvPy2Dev_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Make sure python2 and python3 and their pips are in place
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    local py2ActivateFile="${pdb_venv_py2Bisos3Dev}/bin/activate"

    if [ ! -f "${py2ActivateFile}" ] ; then
        EH_problem "Missing ${py2ActivateFile} -- BISOS Provisioners venv pip installs aborted"
        lpReturn 101
    fi

    source ${py2ActivateFile}

    lpDo echo ${VIRTUAL_ENV}
    
    lpDo echo NOTYEY ftoWalk throug the bisos-pip repo

    lpDo pip2 list 
    
    lpReturn
}


function vis_venvPy3Dev_pipInstalls {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Make sure python2 and python3 and their pips are in place
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
    
    lpDo echo NOTYEY ftoWalk throug the bisos-pip repo

    lpDo pip3 list 
    
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

