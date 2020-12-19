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
*  /This File/ :: /bisos/bsip/bin/lcaZoomBinsPrep.sh 
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
    "zoom"
)

# }}}

item_zoom () {
  distFamilyGenerationHookRun binsPrep_zoom
}

binsPrep_zoom_DEFAULT_DEFAULT () {
    mmaThisPkgName="na"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
	#lpDo sudo dpkg --purge --force-all zoom

	inBaseDirDo /tmp wget https://zoom.us/client/latest/zoom_amd64.deb
	
	opDo sudo apt-get install -y /tmp/zoom_2.2.10_x86_64.deb
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

