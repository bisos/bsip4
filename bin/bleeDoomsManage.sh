#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

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
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
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

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Blee Lib Examples " )
${G_myName} ${extraInfo} -i examples_bleeLib
${G_myName} ${extraInfo} -i getEmacsVer 0
$( examplesSeperatorChapter "Doom Main Deploy -- profile=blee2" )
${G_myName} ${extraInfo} -p profile=blee2 -i buildInstall
${G_myName} ${extraInfo} -p profile=blee2 -i doomSync
${G_myName} ${extraInfo} -p profile=blee2 -i unMain
${G_myName} ${extraInfo} -p emacs=28 -p profile=blee2 -i reBuild
${G_myName} ${extraInfo} -p profile=blee2 -i switchInitTo sansBlee
${G_myName} ${extraInfo} -p profile=blee2 -i switchInitTo withBlee
ls -l /bisos/blee/doom-blee-base/init.el
emacs --debug-init --with-profile blee2 &
$( examplesSeperatorChapter "Doom Main Deploy -- profile=blee3" )
${G_myName} ${extraInfo} -p emacs=28 -p profile=blee3 -i buildInstall
${G_myName} ${extraInfo} -p profile=blee3 -i doomSync
${G_myName} ${extraInfo} -p profile=blee3 -i unMain
${G_myName} ${extraInfo} -p emacs=sys -p profile=blee3 -i reBuild
${G_myName} ${extraInfo} -p profile=blee3 -i switchInitTo sansBlee
${G_myName} ${extraInfo} -p profile=blee3 -i switchInitTo withBlee
ls -l /bisos/blee/doom-blee-base/init.el
emacs --debug-init --with-profile blee3 &( examplesSeperatorChapter "Doom Main Deploy -- profile=sysDoom" )
${G_myName} ${extraInfo} -p profile=sysDoom -i buildInstall
${G_myName} ${extraInfo} -p profile=sysDoom -i doomSync
${G_myName} ${extraInfo} -p profile=sysDoom -i unMain
${G_myName} ${extraInfo} -p profile=sysDoom -i reBuild
emacs --debug-init --with-profile doom &
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



function profilePrep {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Three variables are set:
1) <<doomFrameworkBase>> /bisos/blee/dooms/doomemacs  --- is anon cloned from https://github.com/doomemacs/doomemacs
2) <<doomDirBase>> /bisos/blee/dooms/doom-base-blee3  == Equivalent of .doom.d dir for packages and config
3) <<doomMainBase>> /bisos/blee/emacsVers/28.1/doom-blee3  == Re-creatable by bleeDoomManage.sh 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${profile}" ] ; then
        lpReturn 1
    fi
    local emacsVer=$(vis_getEmacsVer ${emacs})

    if [ -z "${emacsVer}" ] ; then
        EH_problem "Bad emacsVer=${emacsVer}"
        lpReturn 1
    fi

    #doomFrameworkBase=/bisos/blee/doom-emacs-framework
    doomFrameworkBase="/bisos/blee/dooms/doomemacs"
    case $profile in
        # NOTYET, no longer in real use. Should be obsoleted
        blee2)
            doomMainBase="/bisos/blee/emacsVers/${emacsVer}/doom-main-blee2"
            doomDirBase="/bisos/blee/dooms/doom-base-blee2"
            ;;
        # NOTYET, TODO, add to this sansBlee3, for testing in parallel with blee3
        blee3)
            doomMainBase="/bisos/blee/emacsVers/${emacsVer}/doom-main-blee3"
            doomDirBase="/bisos/blee/dooms/doom-base-blee3"
            ;;
        # NOTYET, TODO, Rename this to dist-doom, consistent with chemacs
        sysDoom)
            doomMainBase="/bisos/blee/emacsVers/${emacsVer}/doom-main-emacs"
            doomDirBase="/bisos/blee/dooms/doom-base-emacs"
            ;;
        *)
            EH_problem "Unknown profile=$profile"
            lpReturn 1
            ;;
    esac

    lpReturn
}


function vis_reBuild {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_unMain
    lpDo vis_buildInstall

    lpReturn
}

function vis_unMain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert profilePrep

    lpDo rm -r -f ${doomMainBase}

    lpReturn
}

function vis_switchInitTo_ObsoletedDeb11 {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** This is temporary.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert profilePrep

    local switchTo="$1"

    case ${switchTo} in
        sansBlee)
            case $profile in
                blee2|blee3)
                    lpDo chmod ug+rw ${doomDirBase}/init.el
                    # /bisos/blee/doom-blee-base/initSansBlee.el
                    lpDo cp ${doomDirBase}/initSansBlee.el ${doomDirBase}/init.el
                    lpDo chmod 444 ${doomDirBase}/init.el
                    ;;
                *)
                    EH_problem "Unknown profile=${profile} -- sansBlee skipped"
                    ;;
            esac
            ;;
        withBlee)
            case $profile in
                blee2|blee3)
                    lpDo chmod ug+rw ${doomDirBase}/init.el
                    # /bisos/blee/doom-blee-base/initSansBlee.el
                    # /bisos/blee/doom-blee-base/loadBlee.el
                    # /bisos/blee/dooms/doom-base-blee3/blee-init.el
                    # lpDo eval cat ${doomDirBase}/initSansBlee.el ${doomDirBase}/loadBlee.el \> ${doomDirBase}/init.el
                    lpDo eval cat ${doomDirBase}/initSansBlee.el ${doomDirBase}/blee-init.el \> ${doomDirBase}/init.el
                    lpDo chmod 444 ${doomDirBase}/init.el
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

function vis_switchInitTo {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** This is temporary.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    EH_assert profilePrep

    local switchTo="$1"

    case ${switchTo} in
        sansBlee)
            case $profile in
                blee2|blee3)
                    ANT_raw "switchInitTo -- switchTo=${switchTo} profile=${profile}"
                    lpDo cp ${doomDirBase}/configSansBlee.el ${doomDirBase}/config.el
                    # lpDo chmod 444 ${doomDirBase}/config.el
                    ;;
                *)
                    EH_problem "Unknown profile=${profile} -- sansBlee skipped"
                    ;;
            esac
            ;;
        withBlee)
            case $profile in
                blee2|blee3)
                    ANT_raw "switchInitTo -- switchTo=${switchTo} profile=${profile}"
                    lpDo cp ${doomDirBase}/configWithBlee.el ${doomDirBase}/config.el
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

    EH_assert profilePrep

    local emacsExec=$(vis_getEmacsExec ${emacs})

    if [ -z "${emacsExec}" ] ; then
        EH_problem "Bad emacsExec=${emacsExec}"
        lpReturn 1
    fi

    export DOOMDIR="${doomDirBase}"
    export YES=y
    export EMACS="${emacsExec}"

    lpDo vis_switchInitTo sansBlee

    lpDo mkdir -p ${doomMainBase}

    lpDo cp -r ${doomFrameworkBase}/* ${doomMainBase}

    lpDo echo DOOMDIR=${DOOMDIR}
    lpDo echo EMACS=${EMACS}

    # If this proved to be a fix, NOTYET, make bystar a param
    lpDo echo "Be Patient, this can take a Long Time -- Running: sudo -u bystar ${doomMainBase}/bin/doom --force install"
    sudo -u bystar stdbuf -i0 -o0 -e0  ${doomMainBase}/bin/doom --force install  </dev/null

    lpDo vis_switchInitTo withBlee

    lpReturn
}

function vis_doomSync {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert profilePrep

    local emacsExec=$(vis_getEmacsExec ${emacs})

    if [ -z "${emacsExec}" ] ; then
        EH_problem "Bad emacsExec=${emacsExec}"
        lpReturn 1
    fi

    export DOOMDIR="${doomDirBase}"
    export EMACS="${emacsExec}"

    lpDo vis_switchInitTo sansBlee

    lpDo ${doomMainBase}/bin/doom sync

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
