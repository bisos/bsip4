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
    "gimp"
    $( itemNameFor "gimp-help-common" )
    $( itemNameFor "gimp-help-en" )
    $( itemNameFor "gimp-data" )
    $( itemNameFor "gimp-data-extras" )
    $( itemNameFor "gimp-gutenprint" )
    $( itemNameFor "gimp-dcraw" )    
)

# }}}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
bueGimpManage.sh -h -v -n showRun -i dotGimpByStar
_EOF_
}


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp () { distFamilyGenerationHookRun binsPrep_gimp; }

binsPrep_gimp_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-help-common"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-help-common [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_help_common () { distFamilyGenerationHookRun binsPrep_gimp_help_common; }

binsPrep_gimp_help_common_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-help-common"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-help-en"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-help-en [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_help_en () { distFamilyGenerationHookRun binsPrep_gimp_help_en; }

binsPrep_gimp_help_en_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-help-en"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-data"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-data [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_data () { distFamilyGenerationHookRun binsPrep_gimp_data; }

binsPrep_gimp_data_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-data"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-data-extras"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-data-extras [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_data_extras () { distFamilyGenerationHookRun binsPrep_gimp_data_extras; }

binsPrep_gimp_data_extras_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-data-extras"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-gutenprint"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-gutenprint [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_gutenprint () { distFamilyGenerationHookRun binsPrep_gimp_gutenprint; }

binsPrep_gimp_gutenprint_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-gutenprint"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gimp-dcraw"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gimp-dcraw [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gimp_dcraw () { distFamilyGenerationHookRun binsPrep_gimp_dcraw; }

binsPrep_gimp_dcraw_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gimp-dcraw"; }

####+END:



####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

