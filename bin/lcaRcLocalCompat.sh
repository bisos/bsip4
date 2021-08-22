#!/bin/bash

IcmBriefDescription="Starter Facility For Creating Panels -- BxPanles, Notes"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: startOrgPanel.sh,v 1.5 2020-09-01 02:10:50 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGINNOT: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/siteIptable.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
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

# /opt/public/osmt/bin/lcnObjectTree.libSh
. ${opBinBase}/lcnObjectTree.libSh

# PRE parameters

ports=""
sysType=""

function G_postParamHook {
    #vis_loadActionEl
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

    #vis_startObjectGenExamples

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_

  # vis_ftoCommonExamples
  
  cat  << _EOF_
$( examplesSeperatorChapter "Initial /etc/rc.local" )
${G_myName} ${extraInfo} -i rcLocalStdout
${G_myName} ${extraInfo} -i rcLocalUpdate
${G_myName} ${extraInfo} -f -i rcLocalUpdate
ls -l /etc/rc.local
$( examplesSeperatorChapter "Raw iptable commands" )
sudo systemctl status rc-local.service
sudo systemctl enable rc-local.service
udo systemctl cat rc-local.service  # need to reboot -- perhaps it is enabled after -i rcLocalUpdate
_EOF_
}

noArgsHook() {
  vis_examples
}


function fileUpdateWithStdoutFunc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    EH_assert [[ $# -eq 2 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;       
  
    updateFileName=$1
    updateStdoutFunc=$2

    if [ "${G_forceMode}" == "force" ] ; then
        lpDo FN_fileSafeKeep ${updateFileName}
        ${updateStdoutFunc} | sudo tee ${updateFileName} >  /dev/null 
    else
        if [ -f ${updateFileName} ] ; then
            ANT_raw "File: ${updateFileName} exists -- no action taken"
        else
            lpDo FN_fileSafeKeep ${updateFileName}
            ${updateStdoutFunc} | sudo tee ${updateFileName} >  /dev/null         
        fi
    fi

    opDoComplain chown root ${updateFileName}  
    opDoComplain chmod ugo+x ${updateFileName}
    opDoComplain ls -l ${updateFileName}
}


function vis_rcLocalStdout {
  cat  << _EOF_
#!/bin/sh -e

logger "\$0 - rc.local started."

# Your commands come here

logger "\$0 - rc.local ended."
exit 0
_EOF_
}

function vis_rcLocalUpdate {
  
  local updateFileName="/etc/rc.local"
  local updateStdoutFunc=vis_rcLocalStdout

  lpDo fileUpdateWithStdoutFunc ${updateFileName} ${updateStdoutFunc}
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
