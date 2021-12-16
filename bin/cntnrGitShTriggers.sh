#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
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

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/sysCharGuestPreps.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
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

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/usgBpos_lib.sh


# PRE parameters

typeset -t bpoId=""
# usg=""

function G_postParamHook {
    bpoIdPrepValidate    

    if [ ! -z "${bpoId}" ] ; then
        bpoHome=$( FN_absolutePathGet ~${bpoId} )
    fi
    
    bisosCurrentsGet
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    #oneBxoId="prs-bisos"
    oneBxoId="${currentBxoId}"
    #oneBxoId="pic_dnsServer"    
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
$( examplesSeperatorChapter "BISOS System (gitSh) Account" )
bisosAccounts.sh
bisosAccounts.sh -h -v -n showRun -i gitShBxSysAcctVerify  # Info
bisosAccounts.sh -h -v -n showRun -i gitShBxSysAcctCreate  # acctAdd, report
bisosAccounts.sh -h -v -n showRun -i userAcctsDelete gitSh
$( examplesSeperatorChapter "Full Actions" )
${G_myName} ${extraInfo} -i fullUpdate
$( examplesSeperatorChapter "Home Account And Keys Setup" )
${G_myName} ${extraInfo} -i gitShAccountCreate
${G_myName} ${extraInfo} -i noInteractiveShellSetup
$( examplesSeperatorChapter "Invoker (client) Side:: SSH Setup" )
${G_myName} ${extraInfo} -i gitSh_invoker_sshUsgSetup performerCntnrId
${G_myName} ${extraInfo} -i gitSh_invoker_sshUsgLogin performerCntnrId
$( examplesSeperatorChapter "Performer (server) Side:: SSH Setup" )
${G_myName} ${extraInfo} -i gitSh_performer_sshSetup cntnrName pubKeyFile
$( examplesSeperatorChapter "Performer (server) Side:: Repos Create And Triggers Setup" )
${G_myName} ${extraInfo} -i gitSh_performer_repo_jekyll
$( examplesSeperatorChapter "Invoker (client) Side:: Trigger With Git Push" )
${G_myName} ${extraInfo} -i gitSh_invoke_trigger_jekyll
_EOF_
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo echo NOTYET

    lpReturn
}       

function vis_gitShAccountCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* NOTYET, create the account if needed.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


function vis_noInteractiveShellSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local gitShellCommands=$(echo ~gitSh/git-shell-commands)

    echo ${gitShellCommands}

    if [ -d  "${gitShellCommands}" ] ; then
        ANT_raw "${gitShellCommands} is in place, creation skipped"
    else
        lpDo sudo -u gitSh  mkdir ${gitShellCommands}~gitSh/git-shell-commands
    fi
    ls -ld ${gitShellCommands}

    cat  << _EOF_  | sudo -u gitSh  tee ${gitShellCommands}/no-interactive-login
#!/usr/bin/env bash

printf '%s\n' "Authenticated as \$USER user, but interactive logins are disabled."

exit 128
_EOF_

    lpDo sudo -u gitSh  chmod +x ~gitSh/git-shell-commands/no-interactive-login
    lpDo ls -l ~gitSh/git-shell-commands/no-interactive-login

    lpReturn
}       

function vis_gitSh_invoker_sshUsgSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* Add to ~/.ssh/config file as tested -- Use existing usgSshCustom
** \$1 is performer cntnrId
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    lpReturn
}

function vis_gitSh_invoker_sshUsgLogin {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* Arg1 is performer address. No password prompt. Login declined.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    lpReturn
}

function vis_gitSh_performer_sshSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* arg1 is cntnrName, arg2 is pubKeyFile.
** Add pub key to authorized file. Change permissions.
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    lpReturn
}

function vis_gitSh_performer_repo_jekyll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* Repo Create; Create post-./post-receive
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

function vis_gitSh_invoke_trigger_jekyll {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
* update file. add .; commit; push
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

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
