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
}

function vis_postSysBaseExamples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    cat  << _EOF_
$( examplesSeperatorChapter "Post SysBase -- BISOS Features" )
$( examplesSeperatorSection "KVM Hosting" )
${G_myName} ${extraInfo} -i kvmHosting_provisionSetup
$( examplesSeperatorSection "Base BxioContainer -- Information Object" )
${G_myName} ${extraInfo} -i bxioContainer_provisionSetup
$( examplesSeperatorSection "Base BxsoContainer -- Service Object" )
${G_myName} ${extraInfo} -i bxsoContainer_provisionSetup  # includes bxio
_EOF_
    
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

function vis_bxioContainer_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"

    echo "Setup tex, fonts, tools and needed scripts and preps for bxo old and new"
    
    lpReturn
}

function vis_bxsoContainer_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo "Setup tex, fonts, tools and needed scripts and preps for bxo old and new"
    
    lpReturn
}

function vis_gitlabServer_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    echo "Setup tex, fonts, tools and needed scripts and preps for bxo old and new"
    
    lpReturn
}

function vis_kvmHosting_provisionSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
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

