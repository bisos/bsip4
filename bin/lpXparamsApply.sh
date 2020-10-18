#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: lpXparamsApply.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
#  This is part of ByStar Libre Services. http://www.by-star.net
#  Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
#  Subject to Libre Services License Version 1.0 -- See PLPC-120001 for restrictions.
#  This is a Halaal Poly-Existential intended to remain perpetually Halaal. 
# }}} DBLOCK-top-of-file
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
####+END:

# {{{ Help/Info

function vis_help {
    cat  << _EOF_

_EOF_
}

# }}}

# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lcnFileParams.libSh
. ${opBinBase}/lpParams.libSh

# ./lpXparams.libSh
. ${opBinBase}/lpXparams.libSh

# PRE parameters optional

function G_postParamHook {
     return 0
}

# }}}

# {{{ Examples

function vis_examples {
  #typeset extraInfo="-h -c fast -v -n showRun"
  typeset extraInfo=""
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`

  typeset runInfo="-p ri=any:mailFolders"

  oneName=WilliamCooley
  oneBystarUid="ma-57003"

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
---- xparamsFuncs -----
${G_myName} -i bymemoryList | ${G_myName} -i xparamsFuncs vis_showParams
${G_myName} -i bymemoryList | ${G_myName} -i xparamsFuncs vis_showParams vis_showParams 
------
echo bystarUid=${oneBystarUid} | ${G_myName} -i xparamsProg echo XX '\${bystarUid}'
echo -e "p1=AA;p2=BB" | ${G_myName} -i xparamsProg echo XX='\${p1}' YY='\${p2}'
echo -e "p1=AA;p2=BB\np1=CC;p2=DD" | ${G_myName} -i xparamsProg echo XX='\${p1}' YY='\${p2}' 2> /dev/null
echo -e "p1=AA;p2=BB\np1=CC;p2=DD" | ${G_myName}  echo XX='\${p1}' YY='\${p2}' 2> /dev/null
echo -e "p1=AA;p2=BB\np1=CC;p2=DD" > /tmp/xparms.inList
${G_myName} -p inList=/tmp/xparms.inList -i xparamsProg echo XX='\${p1}' YY='\${p2}' 2> /dev/null
_EOF_
}


noArgsHook() {
  vis_xparamsProg "$@"
}

# }}}

# {{{ end of file

#local variables:
#major-mode: shellscript-mode
#folded-file: t
#fill-column: 90
# end:

# }}}
