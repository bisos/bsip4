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

# PRE parameters

profile=""

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
$( examplesSeperatorChapter "Doom Main Deploy -- profile=blee2" )
${G_myName} ${extraInfo} -p profile=blee2 -i buildInstall
${G_myName} ${extraInfo} -p profile=blee2 -i doomSync
${G_myName} ${extraInfo} -p profile=blee2 -i unMain
${G_myName} ${extraInfo} -p profile=blee2 -i reBuild
ls -l /bisos/blee/doom-blee-base/init.el
emacs --debug-init --with-profile blee2 &
$( examplesSeperatorChapter "Doom Main Deploy -- profile=sysDoom" )
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
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${profile}" ] ; then
        lpReturn 1
    fi

    doomFrameworkBase=/bisos/blee/doom-emacs-framework
    case $profile in
        blee2)
            doomInitBase="/bisos/blee/doom-blee-init"
            doomMainBase="/bisos/blee/27f/doom-blee-main"
            doomDirBase="/bisos/blee/doom-blee-base"
            ;;
        sysDoom)
            doomInitBase="/bisos/blee/doom-emacs-init"
            doomMainBase="/bisos/blee/27f/doom-emacs-main"
            doomDirBase="/bisos/blee/doom-base"
            ;;
        *)
            EH_problem
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


function vis_buildInstall {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert profilePrep

    export DOOMDIR="${doomDirBase}"
    export YES=y

    case $profile in
        blee2)
	    # /bisos/blee/doom-blee-base/initSansBlee.el
	    lpDo cp ${doomDirBase}/initSansBlee.el ${doomDirBase}/init.el
            ;;
        *)
            lpDo doNothing
            ;;
    esac

    lpDo mkdir ${doomMainBase}

    lpDo cp -r ${doomFrameworkBase}/* ${doomMainBase}
    lpDo cp ${doomInitBase}/init.el ${doomMainBase}
    lpDo cp ${doomInitBase}/early-init.el ${doomMainBase}
    lpDo cp ${doomInitBase}/init.example.el ${doomMainBase}

    lpDo ${doomMainBase}/bin/doom install

    case $profile in
        blee2)
	    # /bisos/blee/doom-blee-base/initSansBlee.el
	    # /bisos/blee/doom-blee-base/loadBlee.el
	    lpDo eval cat ${doomDirBase}/initSansBlee.el ${doomDirBase}/loadBlee.el \> ${doomDirBase}/init.el
            ;;
        *)
            lpDo doNothing
            ;;
    esac
    
    lpReturn
}

function vis_doomSync {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert profilePrep

    export DOOMDIR="${doomDirBase}"

    lpDo ${doomMainBase}/bin/doom sync

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
