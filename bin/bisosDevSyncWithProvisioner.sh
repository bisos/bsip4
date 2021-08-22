#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

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


function vis_describe {  cat  << _EOF_
Module description comes here.
_EOF_
                      }

# Import Libraries

#
. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

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
${G_myName} ${extraInfo} -i list
${G_myName} ${extraInfo} -i diffs
${G_myName} ${extraInfo} -i update
_EOF_
}

noArgsHook() {
  vis_examples
}


function vis_list {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ls ./unisosAccounts_lib.sh ./bisosGroupAccount_lib.sh ./platformBases_lib.sh

    lpReturn
}


function vis_diffs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo diff /bisos/core/bsip/bin/unisosAccounts_lib.sh ./unisosAccounts_lib.sh

    opDo diff /bisos/core/bsip/bin/bisosGroupAccount_lib.sh ./bisosGroupAccount_lib.sh

    opDo diff /bisos/core/bsip/bin/platformBases_lib.sh  ./platformBases_lib.sh

    lpReturn
}


function vis_update {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if cmp /bisos/core/bsip/bin/unisosAccounts_lib.sh ./unisosAccounts_lib.sh; then
        ANT_raw "Same, update skipped -- /bisos/core/bsip/bin/unisosAccounts_lib.sh ./unisosAccounts_lib.sh"    
    else
        lpDo cp /bisos/core/bsip/bin/unisosAccounts_lib.sh ./unisosAccounts_lib.sh
    fi

    if cmp /bisos/core/bsip/bin/bisosGroupAccount_lib.sh ./bisosGroupAccount_lib.sh; then
        ANT_raw "Same, update skipped -- /bisos/core/bsip/bin/bisosGroupAccount_lib.sh ./bisosGroupAccount_lib.sh"
    else
        lpDo cp /bisos/core/bsip/bin/bisosGroupAccount_lib.sh ./bisosGroupAccount_lib.sh        
    fi

    if cmp /bisos/core/bsip/bin/platformBases_lib.sh ./platformBases_lib.sh; then
        ANT_raw "Same, update skipped -- /bisos/core/bsip/bin/platformBases_lib.sh ./platformBases_lib.sh"
    else
        lpDo cp /bisos/core/bsip/bin/platformBases_lib.sh ./platformBases_lib.sh        
    fi

    lpReturn
}

