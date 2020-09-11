#!/bin/bash

IcmBriefDescription="Starter Facility To Be Used When New BSIF (Bystar Shell-Based Intefration Facilities) ICMs are to be created. For icm-bash packages use bxtStartIcmBash.sh."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: startBsipBash.sh,v 1.2 2020-09-01 02:10:49 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/startBsipBash.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/apps/defaults/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Overview     ::  Types Of ICM  [[elisp:(org-cycle)][| ]]
    The following ICM-Bash types are recognized:
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  groupInstance -- eg a new module to be added to an existing group  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  ICM-Types     ::  icmsGroup -- eg a new set of ICMs to be created  [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  <<<Problems>>> :: *[Problems]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Depends-On   ::  Has dependencies on sa-20000 being available  [[elisp:(org-cycle)][| ]]
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

function getOsmtBase { echo "/opt/public/osmt"; }
function getBsipBase { echo "/bisos/core/bsip"; }

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

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Start New Bash Library" )
${G_myName} ${extraInfo} -i osmtLibShBasic someLib.sh
${G_myName} ${extraInfo} -i bsipLibShBasic someLib.sh
$( examplesSeperatorChapter "Start New Instance For Existing Group" )
${G_myName} ${extraInfo} -i osmtBasic scriptName.sh
${G_myName} ${extraInfo} -i bsipBasic scriptName.sh
$( examplesSeperatorSection "Processros -- audioPres, presProc, ocrProc" )
${G_myName} ${extraInfo} -i lcntProc lcntProcBegin.sh
${G_myName} ${extraInfo} -i audioPres lcaXx.sh
${G_myName} ${extraInfo} -i presProc lcaXx.sh
${G_myName} ${extraInfo} -i ocrProc lcaXx.sh
$( examplesSeperatorSection "BinsPreps" )
${G_myName} ${extraInfo} -i binsPrepLcaSimple lcaXxBinsPrep.sh
${G_myName} ${extraInfo} -i binsPrepCustom lcaXxBinsPrep.sh
${G_myName} ${extraInfo} -i binsPrepExtRepo lcaXxBinsPrep.sh
${G_myName} ${extraInfo} -i pkgRePubLca notyetRepub.sh
$( examplesSeperatorSection "Daemon Managers" )
${G_myName} ${extraInfo} -i adminDaemonSvc lcaXxSvcAdmin.sh
${G_myName} ${extraInfo} -i adminDaemonSysV lcaXxSysvAdmin.sh
${G_myName} ${extraInfo} -i adminDaemonSysD lcaXxSysdAdmin.sh
$( examplesSeperatorChapter "Start General ICM" )
bxtStartIcmBash.sh
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ================
*  [[elisp:(org-cycle)][| ]]  IIF           :: osmtBasic   [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_osmtBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="/opt/public/osmt/bin"
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )
    #  /bisos/apps/defaults/software/begin/iimBash/lpSimple.generic
    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/iimBash"

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/lpSimple.generic ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -v -n showRun -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


function vis_bsipBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="$( getBsipBase )/bin"
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )
    #  /bisos/apps/defaults/software/begin/icmBash/lpSimple.generic
    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/icmBash"

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/lpSimple.generic ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -v -n showRun -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}



function vis_osmtLibShBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="/opt/public/osmt/lib"
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )
    #  /bisos/apps/defaults/software/begin/iimBash/libSh.generic
    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/iimBash"
    
    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/libSh.generic ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}

function vis_bsipLibShBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="$( getBsipBase )/bin"
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )
    #  /bisos/apps/defaults/software/begin/iimBash/libSh.generic
    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/icmBash"
    
    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/libSh.generic ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: icmStandaloneBasic   [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_icmStandaloneBasic {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="."
    # ~lsipusr/BUE/inserts/moded/sh-mode/bx/start/binsPrepLcaSimple.sh
    typeset icmTemplatesBaseDir=$( /bisos/apps/defaults/software/begin/iimBash )    

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    #opDo cp /opt/public/osmt/bin/iimStandaloneBegin.sh ${scriptFullName}
    opDo cp ${icmTemplatesBaseDir}/iimStandaloneBegin.sh ${scriptFullName}    
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*      ================
*      ====xxProc.sh===
*  [[elisp:(org-cycle)][| ]]  IIF           :: lcntProc   [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_lcntProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    opDo ./bxtStartLcnt.sh

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: audioPresProc.sh    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: ocrProc.sh    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: presProc.sh    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_binsPrepLcaSimple    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_binsPrepLcaSimple {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="."
    # ~lsipusr/BUE/inserts/moded/sh-mode/bx/start/binsPrepLcaSimple.sh
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )

    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/iimBash"

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${scriptFullName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptFullName}"
	lpReturn 101
    fi

    # /bisos/apps/defaults/software/begin/iimBash/binsPrepLcaSimple.sh
    opDo cp ${icmTemplatesBaseDir}/binsPrepLcaSimple.sh ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw "${scriptFullName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_binsPrepExtRepo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_binsPrepExtRepo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="."
    
    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/iimBash"

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${scriptFullName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptFullName}"
	lpReturn 101
    fi

    # /bisos/apps/defaults/software/begin/iimBash/binsPrepExtRepo.sh
    opDo cp ${icmTemplatesBaseDir}/binsPrepExtRepo.sh ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*      ================
*  [[elisp:(org-cycle)][| ]]  IIF           :: binsPrepCustom   [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_binsPrepCustom {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="."

    typeset icmTemplatesBaseDir="/bisos/apps/defaults/software/begin/icmBash"

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/binsPrepCustom.sh ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}



_CommentBegin_
*      ================
*  [[elisp:(org-cycle)][| ]]  IIF           :: adminDaemonSvc   [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_adminDaemonSvc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="/opt/public/osmt/bin"
    # ~lsipusr/BUE/inserts/moded/sh-mode/bx/start/binsPrepLcaSimple.sh
    #typeset icmTemplatesBaseDir=$( FN_absolutePathGet ~lsipusr/BUE/inserts/moded/sh-mode/bx/start )
    typeset icmTemplatesBaseDir=$(FN_absolutePathGet  /bisos/apps/defaults/software/begin/iimBash)

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/binsPrepLcaSimple.sh ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

    ANT_raw " ${scriptFullName}  -- is ready to be developed"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: adminDaemonSysV   [[elisp:(org-cycle)][| ]]
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: adminDaemonSysD   [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_adminDaemonSysD {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset scriptName="$1"
    typeset icmGroupBaseDir="/opt/public/osmt/bin"
    typeset icmTemplatesBaseDir=$(FN_absolutePathGet /bisos/apps/defaults/software/begin/iimBash)

    typeset scriptFullName=${icmGroupBaseDir}/${scriptName}
    
    if [ -f ${scriptFullName} ] ; then
	ANT_raw "${icmGroupBaseDir}/${scriptName} Exists -- Will Not Create -- Get Rid Of It, If Appropriate"
	ANT_raw "/bin/rm ${scriptName}"
	lpReturn 101
    fi

    opDo cp ${icmTemplatesBaseDir}/lcaXxSysdAdmin.sh ${scriptFullName}
    opDo chmod 775 ${scriptFullName}
    opDo bx-dblock -i dblockUpdateFiles ${scriptFullName}

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
