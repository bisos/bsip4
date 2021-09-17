#!/bin/bash

IcmBriefDescription="Starter Facility To Be Used When New FTO Python ICM are to be created"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: startSwPyFto.sh,v 1.6 2020-07-20 02:52:44 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedFtoCommon.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedFtoCommon.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/startSwPyFto.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedFtoCommon.sh -l $0 "$@"
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxRefModel/iim/fullUsagePanel-en.org::Xref-][ICM Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Overview     ::  Types Of ICM  [[elisp:(org-cycle)][| ]]
**     Works closely with lcnObjectTree.libSh and seedFtoCommon.sh
**     The following PYPI-Python types are recognized:
***  [[elisp:(org-cycle)][| ]]  pypi-Types     ::  pypiLib -- A Library PYPI Package [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  pypi-Types     ::  pypiIcm -- A ICM PYPI Package [[elisp:(org-cycle)][| ]]
**    The following ICM-Python-Module types are recognized:
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmBinBasic -- A single Standalone ICM  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmBinPkgBasic -- An ICM that uses icmLibPkgBasic [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmLibBasic -- A library that uses ICM framework  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmLibPkgBasic -- A library that provides Cmnds which are used by icmBinPkgBasic [[elisp:(org-cycle)][| ]]
**    The following ICM-Python-Pkg types are recognized:
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  pkgIcmsBasic -- A icmBinPkgBasic + icmLibPkgBasic + FTO env [[elisp:(org-cycle)][| ]]
**    The following TOICM-Python types are recognized:
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  toIcmsPkg -- A Things Oriented  [[elisp:(org-cycle)][| ]]
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/lcnObjectTree.libSh

# PRE parameters

baseDir=""
maintain=""


function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    #vis_startObjectGenExamples

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_

  vis_ftoCommonExamples
  
  cat  << _EOF_
$( examplesSeperatorChapter "Start New PYPI-Python types" )
${G_myName} ${extraInfo} -i pypiLib leaf . 
${G_myName} ${extraInfo} -i pypiLib auxNode . 
${G_myName} ${extraInfo} -i pypiIcm leaf . 
$( examplesSeperatorChapter "Start New ICM-Python types" )
$( examplesSeperatorSection "Start New Basic ICM-Python Script" )
${G_myName} ${extraInfo}  -i icmBinBasic newIcmScript.py
${G_myName} -p maintain=true -i icmBinBasic newIcmScript.py          # Runs diff on the script's initial template
${G_myName} ${extraInfo}  -i icmBinPkgBasic newIcmPkgScript.py
${G_myName} -p maintain=true -i icmBinPkgBasic newIcmPkgScript.py    # Runs diff on the script's initial template
$( examplesSeperatorSection "Start New Basic ICM-Python Library" )
${G_myName} ${extraInfo} -i icmLibBasic newIcmLib.py
${G_myName} -p maintain=true -i icmLibBasic newIcmLib.py             # Runs diff on the script's initial template
${G_myName} ${extraInfo} -i icmLibPkgBasic newLibIcmPkg.py
${G_myName} -p maintain=true -i icmLibPkgBasic newLibIcmPkg.py       # Runs diff on the script's initial template
$( examplesSeperatorSection "Start New Packaged ICM-Python types" )
${G_myName} ${extraInfo}  -i pkgIcmsBasic .
$( examplesSeperatorChapter "Things oriented ICMs toicm" )
${G_myName} ${extraInfo}  -i toiim .
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Commands*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxtCommonObjOverWrites    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bxtCommonObjOverWrites {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if [ -f ./commonProc.sh ] ; then
        opDo rm ./commonProc.sh
    fi

    if [ -f ./commonPanel.org ] ; then
        opDo rm ./commonPanel.org       
    fi

    if [ -f ${commonObjectTypeFileName} ] ; then
        opDo eval echo "${1}" \> "${commonObjectTypeFileName}"
    fi

    # NOTYET, name of  _treeProc_ should be gotten from libSh
    opDo eval echo "iimsProc.sh" \> "_treeProc_"    

    lpReturn
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Commands*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pypiLib    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pypiLib {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local fileTreeItem="$1"
    local baseDir="$2"

    if [ ! -d ${baseDir} ] ; then
        opDo mkdir -p ${baseDir}
    fi
    
    case "${fileTreeItem}" in
        "leaf")
            inBaseDirDo ${baseDir} vis_startFtoUpdate leaf
            inBaseDirDo ${baseDir} vis_objectTypeOverwrite "sw.py.pypi.lib.fto.leaf"
            inBaseDirDo ${baseDir} cp /libre/ByStar/InitialTemplates/software/starts/pypiProc.sh pypiProc.sh
            opDo pypiProc.sh -v -n showRun -i pkgedPanelPreps
            ;;
        "auxNode")
            inBaseDirDo ${baseDir} vis_startFtoUpdate auxNode
            inBaseDirDo ${baseDir} vis_objectTypeOverwrite "sw.py.pypi.lib.fto.auxNode"
            #opDo ftoProc.sh -v -n showRun -i pkgedPanelPreps
            
            ;;
        *)
            EH_problem "Unknown ${iimType}"
            lpReturn
    esac
    
    inBaseDirDo ${baseDir} rm *~

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pypiIcm    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pypiIcm {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local fileTreeItem="$1"
    local baseDir="$2"

    if [ ! -d ${baseDir} ] ; then
        opDo mkdir -p ${baseDir}
    fi
    
    case "${fileTreeItem}" in
        "leaf")
            inBaseDirDo ${baseDir} vis_startFtoUpdate leaf
            inBaseDirDo ${baseDir} vis_objectTypeOverwrite "sw.py.pypi.icm.fto.leaf"
            inBaseDirDo ${baseDir} cp /libre/ByStar/InitialTemplates/software/starts/pypiProc.sh pypiProc.sh
            opDo pypiProc.sh -v -n showRun -i pkgedPanelPreps
            ;;
        *)
            EH_problem "Unknown ${iimType}"
            lpReturn
    esac
    
    inBaseDirDo ${baseDir} rm *~

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmBinBasic    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmBinBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local moduleFullName="$1"
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/bisos/examples/dev/bin/icmBegin.py"    
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/unisos/icmExamples/dev/bin/icmBegin.py"
    local startTemplateFile="/bisos/git/bxRepos/unisos-pip/icmExamples/py3/bin/icmBegin.py"
    

    function maintainFunction {
        G_funcEntry
        function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                           }
        EH_assert [[ $# -eq 0 ]]

        opDo echo diff ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${startTemplateFile}  ${moduleFullName}    

        lpReturn
    }

    if [ ! -z "${maintain}" ] ; then
        opDo maintainFunction
        lpReturn
    fi
    
    opDo FN_fileSafeKeep ${moduleFullName}

    opDo cp ${startTemplateFile}  ${moduleFullName}

    bx-dblock -i dblockUpdateFiles ${moduleFullName}

    opDo chmod 775 ${moduleFullName}

    ANT_raw " ${moduleFullName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmBinPkgBasic    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmBinPkgBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local moduleFullName="$1"
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/bisos/examples/dev/bin/icmBegin.py"    
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/unisos/icmExamples/dev/bin/icmPkgBegin.py"
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/unisos/icmExamples/dev/bin/icmBegin.py"
    local startTemplateFile="/bisos/git/bxRepos/unisos-pip/icmExamples/py3/bin/icmBegin.py"
    
    function maintainFunction {
        G_funcEntry
        function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                           }
        EH_assert [[ $# -eq 0 ]]

        opDo echo diff ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${startTemplateFile}  ${moduleFullName}    

        lpReturn
    }

    if [ ! -z "${maintain}" ] ; then
        opDo maintainFunction
        lpReturn
    fi
    
    opDo FN_fileSafeKeep ${moduleFullName}

    opDo cp ${startTemplateFile}  ${moduleFullName}

    bx-dblock -i dblockUpdateFiles ${moduleFullName}

    opDo chmod 775 ${moduleFullName}

    ANT_raw " ${moduleFullName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmLibBasic    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmLibBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local moduleFullName="$1"
    #local startTemplateFile="/libre/ByStar/InitialTemplates/update/sw/icm/py/start/icmLibBasic.py"
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/bisos/examples/dev/bisos/examples/icmLibBegin.py"
    local startTemplateFile="/bisos/git/bxRepos/bisos-pip/examples/py3/bisos/examples/icmLibBegin.py"
    
    function maintainFunc {
        G_funcEntry
        function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                           }
        EH_assert [[ $# -eq 0 ]]

        opDo echo diff ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${startTemplateFile}  ${moduleFullName}    

        lpReturn
    }

    if [ ! -z "${maintain}" ] ; then
        opDo maintainFunc
        lpReturn
    fi

    opDo FN_fileSafeKeep ${moduleFullName}

    opDo cp ${startTemplateFile}  ${moduleFullName}

    bx-dblock -i dblockUpdateFiles ${moduleFullName}

    ANT_raw " ${moduleFullName}  -- is ready to be developed. maintain it with:"
    ANT_raw " ${G_myName} -i icmLibBasicMaintain ${moduleFullName}"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmLibCmndBasic    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmLibPkgBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local moduleFullName="$1"
    #local startTemplateFile="/libre/ByStar/InitialTemplates/update/sw/icm/py/start/icmLibBasic.py"
    #local startTemplateFile="/de/bx/nne/dev-py/pypi/pkgs/bisos/examples/dev/bisos/examples/icmLibPkgBegin.py"
    local startTemplateFile="/bisos/git/bxRepos/bisos-pip/examples/dev/bisos/examples/icmLibPkgBegin.py"    

    function maintainFunc {
        G_funcEntry
        function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                           }
        EH_assert [[ $# -eq 0 ]]

        opDo echo diff ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${moduleFullName} ${startTemplateFile} 
        opDo echo cp ${startTemplateFile}  ${moduleFullName}    

        lpReturn
    }

    if [ ! -z "${maintain}" ] ; then
        opDo maintainFunc
        lpReturn
    fi

    opDo FN_fileSafeKeep ${moduleFullName}

    opDo cp ${startTemplateFile}  ${moduleFullName}

    bx-dblock -i dblockUpdateFiles ${moduleFullName}

    ANT_raw " ${moduleFullName}  -- is ready to be developed. maintain it with:"
    ANT_raw " ${G_myName} ${extraInfo} -i icmLibBasicMaintain ${moduleFullName}"    

    lpReturn
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Start New PYPI-Python types*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: basic -- Start A Basic IIM Python Packages  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_pkgIcmsBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset icmPkgBaseDir="$1"

    if [ ! -d ${icmPkgBaseDir} ] ; then
        opDo mkdir -p ${icmPkgBaseDir}
    fi

    inBaseDirDo ${icmPkgBaseDir} vis_startObjectGen leaf

    inBaseDirDo ${icmPkgBaseDir} vis_bxtCommonObjOverWrites "sw.py.icmPkg.fto.leaf"

    inBaseDirDo ${icmPkgBaseDir} vis_icmBinPkgBasic newIcmPkgScript.py
    
    inBaseDirDo ${icmPkgBaseDir} vis_icmLibPkgBasic newLibIcmPkg.py
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgIcmsBasicOld    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgIcmsBasicOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset iimPkgBaseDir="$1"

    if [ ! -d ${iimPkgBaseDir} ] ; then
        opDo mkdir -p ${iimPkgBaseDir}
    fi

    inBaseDirDo ${iimPkgBaseDir} vis_startObjectGen leaf

    inBaseDirDo ${iimPkgBaseDir} vis_bxtCommonObjOverWrites "bxt.py.iim"

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/pyBasicIim/beginPanel.org ./Panel.org

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/software/begin/iims/common/iimsProc.sh ./iimsProc.sh

    inBaseDirDo ${iimPkgBaseDir} cp -r -p /de/bx/nne/dev-py/iimsPkgs/iimExamples/iim_basicExamples.py .
    iimFileName=iim_basicExamples.py

    inBaseDirDo ${iimPkgBaseDir} eval echo "${iimFileName}" \> "_selectedIim"

    inBaseDirDo ${iimPkgBaseDir} bx-dblock -i dblockUpdateFiles ./Panel.org ./iimsProc.sh ${iimFileName}

    inBaseDirDo ${iimPkgBaseDir} iimsProc.sh -h -v -n showRun -i pkgInit    

    inBaseDirDo ${iimPkgBaseDir} ./iimsProc.sh -i panelPreps

    inBaseDirDo ${iimPkgBaseDir} rm *~

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: toiim -- Start A Target Oriented ICM Python Packages  [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_toiim    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_toicm {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset iimPkgBaseDir="$1"

    if [ ! -d ${iimPkgBaseDir} ] ; then
        opDo mkdir -p ${iimPkgBaseDir}
    fi

    inBaseDirDo ${iimPkgBaseDir} vis_startObjectGen leaf

    inBaseDirDo ${iimPkgBaseDir} vis_bxtCommonObjOverWrites "bxt.py.iim.to"

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/pyToIim/beginPanel.org ./Panel.org

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/software/begin/iims/common/iimsProc.sh ./iimsProc.sh

    inBaseDirDo ${iimPkgBaseDir} cp -r -p /de/bx/nne/dev-py/iimsPkgs/bxpManage/bxpManage.py .
    iimFileName=bxpManage.py

    inBaseDirDo ${iimPkgBaseDir} eval echo "${iimFileName}" \> "_selectedIim"

    inBaseDirDo ${iimPkgBaseDir} iimsProc.sh -h -v -n showRun -i pkgInit    

    inBaseDirDo ${iimPkgBaseDir} bx-dblock -i dblockUpdateFiles ./Panel.org ./iimsProc.sh ${iimFileName}

    inBaseDirDo ${iimPkgBaseDir} ./iimsProc.sh -i panelPreps

    inBaseDirDo ${iimPkgBaseDir} rm *~

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

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
