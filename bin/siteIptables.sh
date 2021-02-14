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

baseDir=""
maintain=""


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
$( examplesSeperatorChapter "Apply White List To Ports" )
${G_myName} ${extraInfo} -i applyWhiteListToPrivatePorts
${G_myName} ${extraInfo} -i applyPrivatePortExceptions ssh 192.168.0.0/24
$( examplesSeperatorChapter "Delete White List From Ports" )
${G_myName} ${extraInfo} -i deleteWhiteListFromPrivatePorts
${G_myName} ${extraInfo} -i deletePrivatePortExceptions ssh 192.168.0.0/24
$( examplesSeperatorChapter "Raw iptable commands" )
sudo iptables -L  # List
sudo iptables -F  # Flush
sudo iptables -L INPUT -v  # List with statistics
_EOF_
}

noArgsHook() {
  vis_examples
}

function whiteListAddrs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    itemOrderedWhiteList=( 
	"192.168.0.0/24"
	"198.62.92.0/24"
    )
}

function tcpPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    itemOrderedPrivatePorts=( 
	"ssh"
	"sunrpc"
	"netbios-ns"
	"loc-srv"
	"microsoft-ds"
    )
}


function vis_applyWhiteListToPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
To make (filterFilePanelCleanups) available to vis_panelActions.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo whiteListAddrs
    lpDo tcpPrivatePorts

    local eachPrivatePort=""

    for eachPrivatePort in ${itemOrderedPrivatePorts[@]} ; do
	lpDo vis_applyPrivatePortExceptions "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
    done
    
    lpReturn
}


function vis_applyPrivatePortExceptions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
save-excursion is needed, so that we visually remain in the current shell.
_EOF_
    }
    EH_assert [[ $# -gt 1 ]]

    local portNu="$1"
    shift
    local exceptionsAddrList=$@

    local eachExceptionAddr=""

    for eachExceptionAddr in ${exceptionsAddrList} ; do
	lpDo sudo iptables -A INPUT -p tcp -s ${eachExceptionAddr} --dport ${portNu} -j ACCEPT
    done

    lpDo sudo iptables -A INPUT -p tcp --dport ${portNu} -j DROP

    lpReturn
}



function vis_deleteWhiteListFromPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
To make (filterFilePanelCleanups) available to vis_panelActions.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo whiteListAddrs
    lpDo tcpPrivatePorts

    local eachPrivatePort=""

    for eachPrivatePort in ${itemOrderedPrivatePorts[@]} ; do
	lpDo vis_deletePrivatePortExceptions "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
    done
    
    lpReturn
}


function vis_deletePrivatePortExceptions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
save-excursion is needed, so that we visually remain in the current shell.
_EOF_
    }
    EH_assert [[ $# -gt 1 ]]

    local portNu="$1"
    shift
    local exceptionsAddrList=$@

    local eachExceptionAddr=""

    lpDo sudo iptables -D INPUT -p tcp --dport ${portNu} -j DROP
    
    for eachExceptionAddr in ${exceptionsAddrList} ; do
	lpDo sudo iptables -D INPUT -p tcp -s ${eachExceptionAddr} --dport ${portNu} -j ACCEPT
    done

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
