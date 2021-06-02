#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: lpEach.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
#  This is part of ByStar Libre Services. http://www.by-star.net
#  Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
#  Subject to Libre Services License Version 1.0 -- See PLPC-120001 for restrictions.
#  This is a Halaal Poly-Existential intended to remain perpetually Halaal. 
# }}} DBLOCK-top-of-file
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/lpEach.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
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
------
echo -e "ea-59042" | ${G_myName} -i prepend bystarUid=
echo -e "ea-59042\nsa-20000" | ${G_myName} -i prepend bystarUid=
#echo -e "p1=AA;p2=BB\np1=CC;p2=DD" | ${G_myName} -i xparamsProg echo XX='\${p1}' YY='\${p2}' 2> /dev/null
_EOF_
}


noArgsHook() {
  vis_examples "$@"
}

# }}}

function vis_prepend {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Arg1 is prepend string.
If there is more than one arg, Arg1 is prepended to each arg as a line on stdout.
Otherwise Arg1 is prepended to each line of stdin and output  as a line on stdout.
_EOF_
    }
    EH_assert [[ $# -ge 1 ]]

    prependStr=$1

    shift

    if [ $# -eq 0 ] ; then
	while read thisLine ; do
	    echo  ${prependStr}${thisLine}
	done
    else
	for thisArg in $@; do
	    echo  ${prependStr}${thisArg}
	done
    fi
}
# }}}


# {{{ end of file

#local variables:
#major-mode: shellscript-mode
#folded-file: t
#fill-column: 90
# end:

# }}}
