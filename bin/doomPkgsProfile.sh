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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/doomPkgsProfile.sh
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

. ${opBinBase}/fileUpdate.libSh

# PRE parameters

reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos"

pkgsProfileDotEl="/bisos/blee/profiles/doom/doom-3.0.0-alpha.el"


function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""    
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Doom Pkgs Profile" )
${G_myName} ${extraInfo} -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i doomPkgsStdout
${G_myName} -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i doomPkgsStdout
${G_myName} ${extraInfo} -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i doomPkgsUpdate
${G_myName} ${extraInfo} -f -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i doomPkgsUpdate
${G_myName} -f -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i doomPkgsUpdate
${G_myName} ${extraInfo} -p reposBase="/bisos/blee/29f/doom-main-blee3/.local/straight/repos" -i emacsProfilesVerify
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


function vis_doomPkgsStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Example of stdout
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

  cat  << _EOF_
;;;
;;; Machine Generated By ${G_myFullName}::${G_thisFunc} on $( DATE_nowTag )
;;; Input= ${reposBase}
_EOF_

  local filesList=$( inBaseDirDo ${reposBase} ls)
  local each

  function processEach {
    local repoUrl=$(inBaseDirDo ${reposBase}/$each git remote -v | egrep -v ' \(push\)$' | cut -f 2 | cut -f 1 -d ' ')
    local commit=$(git show  | head -1 | cut -f 2 -d ' ')
    cat  << _EOF_
 (${each}
  :repoUrl "${repoUrl}"
  :commit "${commit}"
 )
_EOF_
  }
  echo "("
  for each in ${filesList} ; do
    processEach
  done
  echo ")"
}

function vis_doomPkgsFile {
  local updateFileName=$( echo ${pkgsProfileDotEl} )
  echo ${updateFileName}
}


function vis_doomPkgsUpdate {
  local updateFileName=$( vis_doomPkgsFile  )
  local updateStdoutFunc=vis_doomPkgsStdout

  lpDo vis_updateFileWithStdoutFunc ${updateStdoutFunc} ${updateFileName}
}

function vis_doomPkgsVerify {
  local updateFileName=$( vis_doomPkgsFile  )
  local updateStdoutFunc=vis_doomPkgsStdout

  lpDo vis_verifyFileWithStdoutFunc  ${updateStdoutFunc} ${updateFileName}
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
