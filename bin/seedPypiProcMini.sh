#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedPypiProc.sh,v 1.3 2018-01-08 00:22:47 lsipusr Exp $"
# *CopyLeft*
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/seedPypiProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ Describe/Help/Info

function vis_describe {
    cat  << _EOF_
For Full Documentation ad Orientation and Model See 

   /libre/ByStar/InitialTemplates/activeDocs/blee/mailCompose/softwares/fullUsagePanel-en.org
_EOF_
}

# }}}

# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/lcnObjectTree.libSh

# . ${opBinBase}/bystarSoftware.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh

# ./bystarMailing.libSh
# . ${opBinBase}/bystarMailing.libSh

# ./bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

# . ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaQmailLib.sh
# . ${opBinBase}/mmaDnsLib.sh

# ./lpReRunAs.libSh 
. ${opBinBase}/lpReRunAs.libSh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/lpCurrents.libSh

. ${opBinBase}/usgBpos_lib.sh

# PRE parameters

function G_postParamHook {
     return 0
}

# }}}

# {{{ Examples


function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  # sitePagesList=`echo ${sitePages}`

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
_EOF_


hookRun "examplesHookPost"
}


noArgsHook() {
  vis_examples
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

