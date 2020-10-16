#!/bin/bash

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org

####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedFgcSwSvc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedFgcSwSvc.sh]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/fgcKvmHostingSw.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedFgcSwSvc.sh -l $0 "$@" 
    exit $?
fi
####+END:



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Cmnd       ::  examplesHookPostExample    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    vis_fgcSvcExamples
    return
}


function examplesHookPost {
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
_EOF_

    # templatesEvolution
    
    return
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Items]       :: Items List [[elisp:(org-cycle)][| ]]
_CommentEnd_


itemsOrderedList=( 
    lcaKvmAdmin.sh
    lcaVagrantManage.sh
)


####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
