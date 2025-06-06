#!/bin/bash

IimBriefDescription="Manage Multiple Dooms Configurations, Profiles and Setup"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxCentralRegistrar.sh 
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

. ${opBinBase}/bleeLib.sh

# PRE parameters

profile=""
emacs="0"

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""    
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    profile=doom-blee3
    EH_assert doomProfilePrep

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Blee Lib Examples " )
${G_myName} ${extraInfo} -i examples_bleeLib
${G_myName} ${extraInfo} -i getEmacsVer 0
$( examplesSeperatorChapter "Doom Main Deploy -- profile=doom-dist emacs=sys" )
${G_myName} ${extraInfo} -p emacs=sys -i reBuildAll   # NOTYET, has not been implemented yet
${G_myName} ${extraInfo} -p emacs=29 -i reBuildAll    # NOTYET, has not been implemented yet
$( examplesSeperatorChapter "Doom Main Deploy -- profile=doom-dist emacs=sys" )
${G_myName} ${extraInfo} -p profile=doom-dist -i buildInstall
${G_myName} ${extraInfo} -p profile=doom-dist -i doomSync
${G_myName} ${extraInfo} -p profile=doom-dist -i deleteRunBase
${G_myName} ${extraInfo} -p profile=doom-dist -i reBuild           #  deleteRunBase + buildInstall
$( examplesSeperatorChapter "Doom Main Deploy -- profile=withoutBlee3doom-blee3 emacs=sys" )
${G_myName} ${extraInfo} -p profile=doom-withoutBlee3 -i buildInstall
${G_myName} ${extraInfo} -p profile=doom-withoutBlee3 -i doomSync
${G_myName} ${extraInfo} -p profile=doom-withoutBlee3 -i deleteRunBase
${G_myName} ${extraInfo} -p profile=doom-withoutBlee3 -i reBuild           #  deleteRunBase + buildInstall
$( examplesSeperatorChapter "Switch Config From With to Sans -- profile=doom-blee3 emacs=sys" )
${G_myName} ${extraInfo} -p profile=doom-blee3 -i switchInitTo sansBlee
${G_myName} ${extraInfo} -p profile=doom-blee3 -i switchInitTo withBlee
ls -l /bisos/blee/doom-blee-base/init.el
$( examplesSeperatorChapter "Doom Main Deploy -- profile=doom-blee3 emacs=sys" )
pushd  /bisos/git/anon/ext/emacs/doomemacs ; git pull ; popd
${G_myName} ${extraInfo} -p profile=doom-blee3 -i buildInstall
${G_myName} ${extraInfo} -p profile=doom-blee3 -i doomSync
${G_myName} ${extraInfo} -p profile=doom-blee3 -i deleteRunBase
${G_myName} ${extraInfo} -p profile=doom-blee3 -i reBuild           #  deleteRunBase + buildInstall
ls -ld ${doomRunBase}     # Where straight packages are installed (based on ${doomDirBase})
ls -ld ${doomDirBase}     # Where Doom  init.el, packages.el and config.el are
emacs --debug-init --with-profile doom-blee3 &
blee -i run doom-blee3
$( examplesSeperatorChapter "Doom Main Deploy -- profile=doom-blee3 emacs=29" )
${G_myName} ${extraInfo} -p emacs=29 -p profile=doom-blee3 -i buildInstall
${G_myName} ${extraInfo} -p emacs=29 -p profile=doom-blee3 -i doomSync
${G_myName} ${extraInfo} -p emacs=29 -p profile=doom-blee3 -i deleteRunBase
${G_myName} ${extraInfo} -p emacs=29 -p profile=doom-blee3 -i reBuild           #  deleteRunBase + buildInstall
$( examplesSeperatorChapter "Blee" )
blee
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  buildInstall    [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_reBuild {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_deleteRunBase
    lpDo vis_buildInstall

    lpReturn
}

function vis_deleteRunBase {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert doomProfilePrep

    lpDo rm -r -f ${doomRunBase}

    lpReturn
}

function vis_switchInitTo {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** This is temporary.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert doomProfilePrep

    local switchTo="$1"

    case ${switchTo} in
        sansBlee)
            case $profile in
                doom-blee3)
                    ANT_raw "switchInitTo -- switchTo=${switchTo} profile=${profile}"
                    lpDo cp ${doomDirBase}/configSansBlee.el ${doomDirBase}/config.el
                    lpDo ls -l  ${doomDirBase}/config.el
                    # lpDo chmod 444 ${doomDirBase}/config.el
                    ;;
                *)
                    EH_problem "Unknown profile=${profile} -- sansBlee skipped"
                    ;;
            esac
            ;;
        withBlee)
            case $profile in
                doom-blee3)
                    ANT_raw "switchInitTo -- switchTo=${switchTo} profile=${profile}"
                    lpDo eval cat ${doomDirBase}/configSansBlee.el ${doomDirBase}/extras.el \>  ${doomDirBase}/configWithBlee.el
                    lpDo cp ${doomDirBase}/configWithBlee.el ${doomDirBase}/config.el
                    lpDo ls -l  ${doomDirBase}/config.el
                    # lpDo chmod 444 ${doomDirBase}/config.el
                    ;;
                *)
                    EH_problem "Unknown profile=${profile} -- withBlee skipped"
                    ;;
            esac
            ;;
        *)
            EH_problem "Bad Input: switchTo=${switchTo}"
            ;;
    esac
}


function vis_buildInstall {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert doomProfilePrep

    local emacsExec=$(vis_getEmacsExec ${emacs})

    if [ -z "${emacsExec}" ] ; then
        EH_problem "Bad emacsExec=${emacsExec}"
        lpReturn 1
    fi

    export DOOMDIR="${doomDirBase}"
    export YES=y
    export EMACS="${emacsExec}"

    lpDo vis_switchInitTo sansBlee

    lpDo mkdir -p ${doomRunBase}

    lpDo cp -r ${doomFrameworkBase}/* ${doomRunBase}

    lpDo echo DOOMDIR=${DOOMDIR}
    lpDo echo EMACS=${EMACS}

    # /bisos/git/anon/ext/emacs/doomemacs /bisos/blee/dooms/doomemacs  --- is anon cloned from https://github.com/doomemacs/doomemacs
    # ln -s /bisos/git/anon/ext/emacs/doomemacs /bisos/blee/dooms/doomemacs
    # sha1 obtained on Fri Dec 8 12:13:10 2023 from a stable release -- git rev-parse HEAD
    inBaseDirDo /bisos/git/anon/ext/emacs/doomemacs git reset --hard 03d692f129633e3bf0bd100d91b3ebf3f77db6d1

    # If this proved to be a fix, NOTYET, make bystar a param
    lpDo echo "Be Patient, this can take a Long Time -- Running: sudo -u bystar ${doomRunBase}/bin/doom --force install"
    #sudo -u bystar stdbuf -i0 -o0 -e0  ${doomRunBase}/bin/doom --force install  </dev/null
    lpDo eval stdbuf -i0 -o0 -e0  ${doomRunBase}/bin/doom --force install  \</dev/null

    lpDo vis_switchInitTo withBlee

    # NOTYET
    echo "NOTYET, BAD and UGLY"
    lpDo cp /bisos/blee/env3/doom/doom-straight.el /bisos/blee/emacsVers/28.2/doom-run-blee3/lisp/doom-straight.el

    lpReturn
}

function vis_doomSync {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert doomProfilePrep

    local emacsExec=$(vis_getEmacsExec ${emacs})

    if [ -z "${emacsExec}" ] ; then
        EH_problem "Bad emacsExec=${emacsExec}"
        lpReturn 1
    fi

    export DOOMDIR="${doomDirBase}"
    export EMACS="${emacsExec}"

    lpDo vis_switchInitTo sansBlee

    lpDo ${doomRunBase}/bin/doom sync

    lpDo vis_switchInitTo withBlee

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
