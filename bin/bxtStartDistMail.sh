#!/bin/bash

####+BEGIN: bx:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
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

####+BEGIN: bx:bsip:bash:seed-spec :types "seedNameDistProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedNameDistProc.sh]] |
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxtStartDistMail.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedNameDistProc.sh -l $0 "$@"
    exit $?
fi
####+END:

# {{{ Describe/Help/Info

function vis_describe {
    cat  << _EOF_


_EOF_
}

# }}}

# {{{ Examples

function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`

  vis_startObjectGenExamples
}

# }}}



# {{{ Empty New Section


# }}}

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
