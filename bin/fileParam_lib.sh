#!/bin/bash # -*- mode: shellscript-mode; -*-



####+BEGIN: bx:bash:top-of-file :vc "cvs" :partof "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: fileParam.libSh,v 1.3 2017-03-11 07:34:10 lsipusr Exp $"
# *CopyLeft*
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${fileParam_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "fileParam_lib :: Loading Library -- /bisos/bsip/bin/fileParam_lib.sh"
else
    TM_trace 7 "fileParam_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/fileParam_lib.sh" ; return
fi
####+END:


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_describe [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_describe {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    lpReturn
}       


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_vmInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function fileParam_write {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    typeset parRoot=$1
    typeset parName=$2
    typeset parValue=$3

    opDo fileParamManage.cs -i fileParamWrite "${parRoot}" "${parName}" "${parValue}"
   
    lpReturn
}

function fileParam_writeEnums {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 2 ]]

    declare parRoot="$1"
    declare parName="$2"
    shift; shift

    declare parPath="${parRoot}"/"${parName}/enums"
    
    opDo FN_dirCreatePathIfNotThere "${parPath}"
    
    function processOneItem {
        EH_assert [[ $# -eq 1 ]]
        declare thisItem="$1"
        inBaseDirDo "${parPath}" eval touch -- \"${thisItem}\"
    }

    if [ $# -gt 0 ] ; then
        typeset thisOne=""
        for thisOne in ${@} ; do
            processOneItem "${thisOne}"
        done
    else
        typeset thisLine=""
        while read thisLine ; do
            if [ "${thisLine}" != "" ] ; then
                processOneItem "${thisLine}"
            fi
        done
    fi
   
    lpReturn
}


function fileParam_writeAttr {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Write Attribute.
_EOF_
    }
    EH_assert [[ $# -eq 4 ]]

    declare parRoot="$1"
    declare parName="$2"
    declare parAttr="$3"
    declare attrValue="$4"    

    declare parPath="${parRoot}"/"${parName}"
    
    opDo FN_dirCreatePathIfNotThere "${parPath}"

    inBaseDirDo "${parPath}" eval echo "'${attrValue}'" \> "${parAttr}"
   
    lpReturn
}



function fileParam_writePath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset parNameFullPath=$1
    typeset parValue=$2

    opDo fileParamManage.cs -i fileParamWrite "${parNameFullPath}" "${parValue}"
    
    lpReturn
}


function fileParam_read {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset parRoot=$1
    typeset parName=$2

    opDo fileParamManage.cs  -i fileParamRead "${parRoot}" "${parName}"
   
    lpReturn
}

function fileParam_readPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset parNameFullPath=$1

    opDo fileParamManage.cs  -i fileParamReadPath -- "${parNameFullPath}"
   
    lpReturn
}



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
