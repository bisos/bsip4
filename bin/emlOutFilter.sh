#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: emlOutFilter.sh,v 1.4 2020-04-06 02:54:38 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/emlOutFilter.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# PRE parameters

baseDir=""

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i doTheWork
$( examplesSeperatorSection "Section Title" )
ls -C -F -1 | ${G_myName} ${extraInfo} -i lsToManifestStdout
ls -C -F -1 | ${G_myName} ${extraInfo} -p orgLevel=2 -p orgLabel=\$(basename \$(pwd)) -i lsToManifestStdout
ls -C -F -1 | ${G_myName} ${extraInfo} -p orgLevel=2 -p orgLabel=$(basename $(pwd)) -i lsToManifestStdout
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  noArgsHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function noArgsHook {
    if [[ $# -gt 0 ]] ; then
        ${G_myName} $*
        return
    fi

    G_runMode="showRun"

    vis_iimToEml
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  /=====/          :: InModule Functions  |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


tmpOutFile="./eml-$$.org"

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimToEml    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimToEml {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local thisEmacsClient=$( vis_thisEmacsClient )
    
    vis_bxEmlHeadStdout > ${tmpOutFile}
    vis_iimToEmlStdout >> ${tmpOutFile}
    vis_bxEmlTailStdout >> ${tmpOutFile}

    ( ${thisEmacsClient} -n -c ${tmpOutFile}; rm ${tmpOutFile} ) &

    lpReturn
}

function vis_stdinAtOrgLevelStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    declare orgTopLevel=1

    if [ $# -eq 1 ] ; then
        orgTopLevel="$1"
    fi

    typeset orgTopLevelStr=""

    for (( i=1; i<=${orgTopLevel}; i++ )) ; do
        orgTopLevelStr=${orgTopLevelStr}"*"
    done
    
    typeset thisLine=""

    cat |
        while read thisLine  ; do
            if [[ ${thisLine:0:1} == "*" ]] ; then
                echo "${orgTopLevelStr}${thisLine}"
            elif [[ ${orgTopLevel} == 0 ]] ; then 
                printf -- "${thisLine}\n"
            else
                echo "${orgTopLevelStr} ${thisLine}"
            fi
        done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimToEmlStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimToEmlStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    declare orgTopLevel=1

    if [ $# -eq 1 ] ; then
        orgTopLevel="$1"
    fi

    typeset thisLine=""

    cat |
    while read thisLine  ; do
        lineType=$( getLineType "${thisLine}" )

        lineProc "${lineType}" "${thisLine}" "${orgTopLevel}"
    done

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  getLineType    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function getLineType {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset thisLine="$1"

    if [[ "${thisLine}" == *###* ]] ; then
        echo "chapter"
    elif [[ "${thisLine}" == *===* ]] ; then
        echo "section"
    elif [[ "${thisLine}" == *%%%* ]] ; then
        echo "subsection"
    else
        echo "cmndLine"
    fi
    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  lineProc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lineProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    
    typeset lineType="$1"
    typeset thisLine="$2"
    typeset orgTopLevel="$3"

    typeset orgTopLevelStr=""

    for (( i=1; i<=${orgTopLevel}; i++ )) ; do
        orgTopLevelStr=${orgTopLevelStr}"*"
    done
    

    case "${lineType}" in
        "chapter")
        cat  << _EOF_
${orgTopLevelStr}  [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| ]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-top-overview)][(O)]]  ${thisLine}
_EOF_

            doNothing
            ;;
        "section")
        cat  << _EOF_
${orgTopLevelStr}*  [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| ]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-top-overview)][(O)]]  ${thisLine}
_EOF_
            ;;
        "subsection")
        cat  << _EOF_
${orgTopLevelStr}**  [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| ]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-top-overview)][(O)]]  ${thisLine}
_EOF_
            ;;
        "cmndLine")
        cat  << _EOF_
[[elisp:(lsip-local-run-command-here "$( str_escapeQuotes ${thisLine} )")][${thisLine}]] 
_EOF_
            ;;
        *)
            EH_problem "Unexpected lineType=${lineType}"
            lpReturn 1
            ;;
    esac


    lpReturn
}

function str_escapeQuotes {
    local inStr="$@"
    local outStr=$( echo "${inStr}" | sed -e 's@"@\\"@g' )
    print "${outStr}"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxEmlHeadStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bxEmlHeadStdout {
    G_funcEntry
    function describeF {   cat  << _EOF_
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:  [[elisp:(blee:bnsm:menu-back)][Back]] [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]]  [[elisp:(bury-buffer)][Bury]] 
####+END:
####+BEGIN: bx:dblock:bnsm:see-related
*  #Bash:  (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command "lpCurrentsAdmin.sh -i currentsGetThenShow")][Show Currents]]  [[elisp:(lsip-local-run-command "lpCurrentsAdmin.sh")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][More]]
**  #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]
####+END:

_EOF_
    }
    describeF

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_bxEmlTailStdout    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bxEmlTailStdout {
    G_funcEntry
    function describeF {  cat  << _EOF_

#+STARTUP: overview
_EOF_
    }
    describeF

    lpReturn
}



function vis_lsToManifestStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisLine=""

    egrep -v "_tree_|_treeProc_|Notes.org|CVS" |
    while read thisLine  ; do
        lsLineProc "${thisLine}"
    done

    lpReturn
}

function lsLineProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    typeset thisLine="$1"

    if [ -z "${orgLevel}" ] ; then
        orgLevel=1
    fi

    orgLevelString=""    

    for (( i=1; i <= ${orgLevel} ;i++ )) ; do
        orgLevelString="${orgLevelString}*"
    done
    
    cat  << _EOF_
${orgLevelString}  [[elisp:(org-cycle)][| ]]  ${orgLabel}      :: ${thisLine} [[elisp:(org-cycle)][| ]]
_EOF_

    lpReturn
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

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
