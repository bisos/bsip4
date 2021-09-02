#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedFtoCommon.sh,v 1.9 2020-08-23 18:21:24 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/bisosProvision.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


function vis_describe {  cat  << _EOF_
Module description comes here.
_EOF_
                      }

# Import Libraries

#

. ${opBinBase}//platformBases_lib.sh
. ${opBinBase}/bsipProvision_lib.sh


function G_postParamHook {
     return 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_
    
    vis_bisosProvisionExamples "${extraInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Runs After /bisos/bsip/bin is in place" )
${G_myName} ${extraInfo} -i sysBaseGeneralAugment
_EOF_

}

function vis_postSysBaseExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Post SysBase -- BISOS Materialization Containers" )
$( examplesSeperatorSection "KVM Hosting" )
${G_myName} ${extraInfo} -i kvmHosting_provisionSetup # fgcfgcKvmHosting SW and SVC -- Ready for guestBpo Materialization
$( examplesSeperatorSection "BISOS-ASC Container -- For AAIS Materialization" )
${G_myName} ${extraInfo} -i ascContainer_provisionSetup  # fgc-s SW and SVC for adopted service components
${G_myName} ${extraInfo} -i ascContainer_provisionSetup_sw  # fgc-s SW
${G_myName} ${extraInfo} -i ascContainer_provisionSetup_svc  # fgc-s SVC
$( examplesSeperatorChapter "Post SysBase -- BISOS Features" )
$( examplesSeperatorSection "LCNT BISOS-APP Provisioning" )
${G_myName} ${extraInfo} -i lcnt_provisionSetup   # Untested
_EOF_

# $( examplesSeperatorSection "Base BxioContainer -- Information Object" )
# ${G_myName} ${extraInfo} -i bxioContainer_provisionSetup
# $( examplesSeperatorSection "Base BxsoContainer -- Service Object" )
# ${G_myName} ${extraInfo} -i bxsoContainer_provisionSetup  # includes bxio

}


function osmtTmpExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local provisionersBinBase="$( provisionersBinBaseGet )"

    cat  << _EOF_    
$( examplesSeperatorChapter "Temporary OSMT Setup" )
$( examplesSeperatorSection "Run OSMT Genesis" )
${provisionersBinBase}/osmtBx2GenesisSelfcontained.sh
${G_myName} ${extraInfo} -i osmtGenesis baseIoC
${G_myName} ${extraInfo} -i osmtGenesis baseIoC atNeda
$( examplesSeperatorChapter "BISOS Bases Administration (/bisos/core)" )
$( examplesSeperatorSection "bisosBasesAdmin" )
_EOF_
}


noArgsHook() {
  vis_examples
}


function vis_sysBaseGeneralAugment {
     G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Augment provisionBisos.sh -i sysBasePlatform using /bisos/bsip/bin facilities.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"

    lpDo ${bisosBinBase}/bisosPyVenvSetup.sh -h -v -n showRun -i venvPy3_pipInstalls

    lpDo ${bisosBinBase}/lcaJsBinsPrep.sh -v -n showRun -i fullUpdate

    lpDo ${bisosBinBase}/lcaPythonCommonBinsPrep.sh -v -n showRun -i fullUpdate

    lpDo sudo -u bystar ${bisosBinBase}/blee -v -n showRun -p acctName=bystar -i provisionSetup

    lpDo bisosCurrentsManage.sh -i setParam cur_bxoId_parent pis_defaultSite

    lpDo echo "Stuff from bisosMaintainInterim.sh comes here."
}


function vis_lcnt_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** LCNT BISOS-APP Provisioning
*** Panel: /bisos/panels/bisos-apps/lcnt/_nodeBase_/fullUsagePanel-en.org
*** TODO: Needs testing
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"

    lpDo bisosLcntSetup.sh -h -v -n showRun -i bisosLcntBinsPrep
    lpDo bisosLcntSetup.sh -h -v -n showRun -i lcntBasesFullSetup

    lpReturn
}

function vis_ascContainer_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** fgc-s SW and SVC for adopted service components
*** Panel:
*** TODO: needs testing
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_ascContainer_provisionSetup_sw

    lpDo vis_ascContainer_provisionSetup_svc

    lpReturn
}


function vis_ascContainer_provisionSetup_sw {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** fgc-s SW and SVC for adopted service components
*** Panel:
*** TODO: needs testing
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo lcaApache2BinsPrep.sh -v -n showRun -i fullUpdate

    lpDo fgcDnsSw.sh -v -n showRun -i  fullUpdate

    lpDo fgcMailTransferSw.sh -v -n showRun -i  fullUpdate

    lpDo fgcMailAccessSw.sh -v -n showRun -i  fullUpdate

    lpDo fgcPlone3Sw.sh -v -n showRun -i  fullUpdate

    lpReturn
}

function vis_ascContainer_provisionSetup_svc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** fgc-s SW and SVC for adopted service components
*** Panel:
*** TODO: needs testing
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo fgcMailTransferSvc.sh -v -n showRun -i fullUpdate

    lpDo fgcMailAccessSvc.sh -v -n showRun -i fullUpdate

    lpDo fgcPlone3Svc.sh -v -n showRun -i fullUpdate

    lpReturn
}


function vis_gitlabServer_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo ""
    
    lpReturn
}

function vis_kvmHosting_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** fgcfgcKvmHosting SW and SVC -- Ready for guestBpo Materialization
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo fgcKvmHostingSw.sh -h -v -n showRun -i  fullUpdate

    lpDo fgcKvmHostingSvc.sh -h -v -n showRun -i  fullUpdate    
    
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

