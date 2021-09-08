#!/bin/bash

echo "OBSOLETED BY ./startSwPyFto.sh"

exit

IcmBriefDescription="Starter Facility To Be Used When New IIMs are to be created"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedBxtCommon.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedBxtCommon.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/bxtStartIcmPy.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedBxtCommon.sh -l $0 "$@"
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxRefModel/iim/fullUsagePanel-en.org::Xref-][IIM Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Overview     ::  Types Of IIM  [[elisp:(org-cycle)][| ]]
    The following IIM-Bash types are recognized:
***  [[elisp:(org-cycle)][| ]]  IIM-Types     ::  pkgInstance -- eg a new module to be added to an existing pkg  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  IIM-Types     ::  iimsPkg -- eg a new set of IIMs to be created  [[elisp:(org-cycle)][| ]]
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


# PRE parameters

baseDir=""

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

    vis_startObjectGenExamples

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Start New Instance For Existing Pkg" )
${G_myName} ${extraInfo} -p iimType=cm -i polySon . 
${G_myName} ${extraInfo} -p iimType=pmcm -i polySon .
${G_myName} ${extraInfo}  -i toiim .
${G_myName} ${extraInfo}  -i basic .
$( examplesSeperatorSection "Start A New IIMs Pkg" )
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: vis_bxtCommonObjOverWrites  [[elisp:(org-cycle)][| ]]
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
*      ================
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: polySon -- CM and PM Blank PolySon IIM Python Packages  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_polySon {
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

    inBaseDirDo ${iimPkgBaseDir} vis_bxtCommonObjOverWrites "bxt.py.iim.polySon"

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/polySon/beginPanel.org ./Panel.org

    inBaseDirDo ${iimPkgBaseDir} cp /libre/ByStar/InitialTemplates/software/begin/iims/common/iimsProc.sh ./iimsProc.sh

    typeset iimFileName=""
    
    case ${iimType} in
        "cm")
            inBaseDirDo ${iimPkgBaseDir} cp -r -p /de/bx/nne/sonDev/dists/auth/tmo/eia/polySonStartCm/polySonStartIim.py .
            iimFileName=polySonStartIim.py
            ;;
        "pmcm")
            inBaseDirDo ${iimPkgBaseDir} cp -r -p /de/bx/nne/sonDev/dists/auth/tmo/eia/polySonStartPmCm/polySonStartIim.py .
            iimFileName=polySonStartIim.py          
            ;;
        *)
            EH_problem "Unknown ${iimType}"
            lpReturn
    esac

    inBaseDirDo ${iimPkgBaseDir} mkdir -p ./iimsIn/control  ./iimsIn/proxies ./iimsIn/targets

    inBaseDirDo ${iimPkgBaseDir} eval echo "${iimFileName}" \> "_selectedIim"

    inBaseDirDo ${iimPkgBaseDir} bx-dblock -i dblockUpdateFiles ./Panel.org ./iimsProc.sh ${iimFileName}

    inBaseDirDo ${iimPkgBaseDir} ./iimsProc.sh -i panelPreps

    inBaseDirDo ${iimPkgBaseDir} rm *~

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: toiim -- Start A Target Oriented IIM Python Packages  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_toiim {
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
*  [[elisp:(org-cycle)][| ]]  IIF           :: basic -- Start A Basic IIM Python Packages  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_basic {
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
