#!/bin/bash

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: lcaGcipherDebBinsPrep.sh,v 1.4 2020-02-03 01:28:39 lsipusr Exp $"
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal. 
# }}} DBLOCK-top-of-file
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/lcaVagrantBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ NOTES/Status:

function vis_describe {  cat  << _EOF_

_EOF_
}

# }}}

# {{{ Components List

#apt-cache search something | egrep '^something'


itemOrderedList=( 
    "ollamaDirect"
)

# }}}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
${G_myName} ${extraInfo} -i extensionsComeHere
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: ollamaDirect [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ollamaDirect () { distFamilyGenerationHookRun binsPrep_ollamaDirect; }

binsPrep_ollamaDirect_DEFAULT_DEFAULT () {
    mmaThisPkgName="na"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {

        inBaseDirDo /tmp curl -fsSL https://ollama.com/install.sh | sh
        lpDo ollama --version
        lpDo systemctl is-active ollama.service
        lpDo ollama pull deepseek-r1:7b
        lpDo ollama run deepseek-r1:7b
        lpDo ollama serve & curl http://localhost:11434/api/generate -d '{"model": "deepseek-r1:7b", "prompt": "Hello, how are you?"}'
    }
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

