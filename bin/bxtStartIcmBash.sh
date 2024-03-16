#!/bin/bash

IcmBriefDescription="Starter Facility To Be Used When New ICM-Bash Packages are to be created. ./bsifStartBash.sh is for Bash BISOS modules."

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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/bxtStartIcmBash.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedBxtCommon.sh -l $0 "$@"
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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxRefModel/icm/fullUsagePanel-en.org::Xref-][ICM Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Overview     ::  Types Of ICM  [[elisp:(org-cycle)][| ]]
    The following ICM-Bash types are recognized:
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  pkgInstance -- eg a new module to be added to an existing pkg  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmsPkg -- eg a new set of ICMs to be created  [[elisp:(org-cycle)][| ]]
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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    typeset nonDirsPart=$(FN_nonDirsPart $(pwd))

    #vis_startObjectGenExamples

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Update Environment For Existing Pkg" )
${G_myName} ${extraInfo} -r runRecs -i update .
${G_myName} ${extraInfo} -r moduleBase/runRecs -i update moduleBase
$( examplesSeperatorSection "Start A New Insatiable ICMs Pkg" )
${G_myName} ${extraInfo} -r runRecs -i instantiable . icm1.sh
${G_myName} ${extraInfo} -r moduleBase/runRecs -i instantiable moduleBase icm1.sh
$( examplesSeperatorSection "Start A Simple Standalone ICMs Pkg" )
${G_myName} ${extraInfo} -i icmPkged . ${nonDirsPart}.sh
$( examplesSeperatorSection "Start A New Grouped ICMs Pkg" )
${G_myName} ${extraInfo} -r runRecs -i icmGrouped . icm1.sh
${G_myName} ${extraInfo} -r moduleBase/runRecs -i icmGrouped moduleBase icm1.sh
$( examplesSeperatorSection "Start A New Packaged ICMs Pkg" )
${G_myName} ${extraInfo} -i icmPkged . ${nonDirsPart}.sh
${G_myName} ${extraInfo} -r runRecs -i icmPkged . ${nonDirsPart}.sh
${G_myName} ${extraInfo} -r moduleBase/runRecs -i icmPkged moduleBase ${nonDirsPart}.sh
$( examplesSeperatorChapter "Start BSIFs (Bystar Shell-Based Integration Facility)" )
bsifStartBash.sh
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ================
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmPkged    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmPkged {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset icmPkgBaseDir="$1"
    typeset icmScriptName="$2"

    typeset icmScriptPrefix=$( FN_prefix ${icmScriptName} )
    typeset panelFileName="${icmScriptPrefix}-Panel.org"

    if [ ! -d ${icmPkgBaseDir} ] ; then
        opDo mkdir -p ${icmPkgBaseDir}
    fi
    
    inBaseDirDo ${icmPkgBaseDir} vis_leafThereTag . icmBashProc.sh

    inBaseDirDo ${icmPkgBaseDir} vis_bxtThereObjectTypeTag . "bxt.icm.bash.pkged"   

    # OBSOLETED inBaseDirDo ${icmPkgBaseDir} cat /libre/ByStar/InitialTemplates/begin/templates/purposed/iimBashBasic/org/beginPanel.org | sed -e "s:@iimName@:${icmScriptName}:g" > ./Panel.org
    inBaseDirDo ${icmPkgBaseDir} cat /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/common/beginPanel.org | sed -e "s:@iimName@:${icmScriptName}:g" > ${panelFileName}

    inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/iimsProc.leaf.sh icmsProc.sh

    if [ -f ${icmPkgBaseDir}/${icmScriptName} ] ; then
        ANT_raw "${icmScriptName} in place -- initial setup skipped"
    else
        inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/pkged/lpSimple.generic ${icmScriptName}
    fi

    inBaseDirDo ${icmPkgBaseDir} eval echo "${icmScriptName}" \> "_selectedIcm"

    inBaseDirDo ${icmPkgBaseDir} bx-dblock -i dblockUpdateFiles ${icmScriptName}

    inBaseDirDo ${icmPkgBaseDir} ${icmScriptName} -i pkgedPanelPreps

    inBaseDirDo ${icmPkgBaseDir} bx-dblock -i dblockUpdateFiles ${panelFileName}

    inBaseDirDo ${icmPkgBaseDir} rm *~

    ANT_raw " ${icmScriptName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_icmGrouped    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_icmGrouped {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset icmPkgBaseDir="$1"
    typeset icmScriptName="$2"    

    if [ ! -d ${icmPkgBaseDir} ] ; then
        opDo mkdir -p ${icmPkgBaseDir}
    fi
    
    inBaseDirDo ${icmPkgBaseDir} vis_leafThereTag . icmBashProc.sh

    inBaseDirDo ${icmPkgBaseDir} vis_bxtThereObjectTypeTag . "bxt.icm.bash.grouped"   

    # OBSOLETED -- inBaseDirDo ${icmPkgBaseDir} cp  /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/grouped/beginPanel.org ./Panel.org
    inBaseDirDo ${icmPkgBaseDir} eval cat /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/common/beginPanel.org \| sed -e "s:@iimName@:${icmScriptName}:g" \> ./Panel.org    

    inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/iimsProc.leaf.sh icmsProc.sh

    inBaseDirDo ${icmPkgBaseDir} eval echo "${icmScriptName}" \> "_selectedIcm"

    #inBaseDirDo ${icmPkgBaseDir} bx-dblock -i dblockUpdateFiles ./Panel.org  # Should not be done here because icmsIn has not been prepared

    inBaseDirDo ${icmPkgBaseDir} rm *~

    ANT_raw " ${icmScriptName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_instantiable    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_instantiable {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Has not been tested -- Temporary place holder
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset icmPkgBaseDir="$1"
    typeset icmScriptName="$2"    

    if [ ! -d ${icmPkgBaseDir} ] ; then
        opDo mkdir -p ${icmPkgBaseDir}
    fi
    
    inBaseDirDo ${icmPkgBaseDir} vis_leafThereTag . icmBashProc.sh

    inBaseDirDo ${icmPkgBaseDir} vis_bxtThereObjectTypeTag . "bxt.icm.bash.instantiable"   

    inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iimBashBasic/org/beginPanel.org ./Panel.org

    inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/iimsProc.leaf.sh icmsProc.sh

    inBaseDirDo ${icmPkgBaseDir} cp /libre/ByStar/InitialTemplates/begin/templates/purposed/iimBashBasic/bash/lpSimple.generic ${icmScriptName}

    inBaseDirDo ${icmPkgBaseDir} mkdir tmp runs    

    inBaseDirDo ${icmPkgBaseDir} eval echo "${icmScriptName}" \> "_selectedIcm"

    inBaseDirDo ${icmPkgBaseDir} bx-dblock -i dblockUpdateFiles ./Panel.org ${icmScriptName}

    inBaseDirDo ${icmPkgBaseDir} rm *~

    ANT_raw " ${icmScriptName}  -- is ready to be developed"

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
