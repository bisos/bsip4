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

####+NOTBEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedPlone3NewProc.sh -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
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

  sitePagesList=`echo ${sitePages}`

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
---  Documentation / How-To / Information ---
${G_myName} ${extraInfo}  -i describe
${G_myName} ${extraInfo}  -i howTo
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
${G_myName} ${extraInfo} -i startObjectGen folder example1
${G_myName} ${extraInfo} -i startObjectGenExamples
${G_myName} ${extraInfo} -i startObjectUpdateInCwd
--- Transition From plone3 to plone3New ---
${G_myName} ${extraInfo} -i objectTypeInCwdGuess
${G_myName} ${extraInfo} -i startObjectUpdateInCwd
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom
${G_myName} ${extraInfo} -e "" -i plone3ProcUpgrade
--- Transition Recursively Under ---
${G_myName} ${extraInfo}  -i treeRecurse startObjectUpdateUnder
--- Common ByStar Features ---
${G_myName} ${extraInfo} -e "" -i plone3ProcRenew
--- Common ByStar Features ---
${G_myName} ${extraInfo} -e "" -i CommonFeaturesVcGet
--- LCNT Inclusion ----
${G_myName} ${extraInfo} -e "" -i lcntListsGetDirectory
${G_myName} ${extraInfo} -e "" -i lcntListsInitialize
_EOF_

  vis_startObjectGenExamples

}

# }}}



# {{{ ByStar Common Features VC Get Symlinks

function vis_CommonFeaturesVcGet {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    typeset here=`pwd`

    opDoRet bystarAcctPathAnalyze ${here}
    EH_retOnFail

    bystarUidHome=${bystarAcctBase}

    if [ -d ${bystarUidHome}/lcaPlone/CommonFeatures ] ; then
        EH_problem "Already In Place: ${bystarUidHome}/lcaPlone/CommonFeatures"
        lpReturn 101
    fi

    opDoRet mkdir ${bystarUidHome}/lcaPlone/CommonFeatures

    opDo pushd ${bystarUidHome}/lcaPlone/CommonFeatures

    opDo /usr/mapFiles/ByStar/InitialTemplates/lcaPlone/CommonFeatures/bystarMapVerModules.sh -p bystarUid=${bystarUid} -p cvsRoot=cvsRoot_bySourceCvs1Ssh -i fullUpdate

    opDo popd
}


# }}}

# {{{ Lcnt Facilities (lists, updates)

function vis_lcntListsGetDirectoryObsoleted {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDoRet bystarAcctPathAnalyze ${here}
    EH_retOnFail

    bystarUidHome=${bystarAcctBase}

    typeset baseDir=${bystarUidHome}/lcaPlone/ContentTree/lcntLists

    if [ -d ${baseDir} ] ; then
        EH_problem "Already In Place: ${baseDir}"
        lpReturn 101
    fi

    opDoRet mkdir ${baseDir}

    opDo pushd ${baseDir}

    # exclude CVS directory in the cp
    opDo find /libre/ByStar/InitialTemplates/lcaPlone/Customs/lcntLists  -maxdepth 1 -type f -exec cp {} . \;

    opDo popd
}

function vis_lcntListsInitializeObsoleted {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDoRet bystarAcctPathAnalyze ${here}
    EH_retOnFail

    bystarUidHome=${bystarAcctBase}

    typeset baseDir=${bystarUidHome}/lcaPlone/ContentTree/lcntLists

    if [ -d ${baseDir} ] ; then
        EH_problem "Already In Place: ${baseDir}"
        lpReturn 101
    fi

    opDoRet mkdir ${baseDir}

    opDo pushd ${baseDir}

    function README {  cat  << _EOF_

lcntUpload.list    -- Used by plone3Proc.sh to upload docs in this list to this site

lcntPrimary.list   -- Used by Library Site Index -- Usually a same or subset of lcntUpload.list

lcntOther.list     -- Used in combination with lcntPrimary.list for Library Full IndexPLPC-110001: /lcnt/lgpc/neda/permanent/ByStar/ByStarConcept
_EOF_
    }

    opDo eval "README > ./README"

    function lcntUpload {  cat  << _EOF_
_EOF_
    }
    opDo eval "lcntUpload > ./lcntUpload.list"


    function lcntPrimary {  cat  << _EOF_
PLPC-110001: /lcnt/lgpc/neda/permanent/ByStar/ByStarConcept
_EOF_
    }
    opDo eval "lcntPrimary > ./lcntPrimary.list"


    function lcntOther {  cat  << _EOF_
_EOF_
    }
    opDo eval "lcntOther > ./lcntOther.list"

    opDo popd
}

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
