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


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/sysSealIptables.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
$( examplesSeperatorChapter "Apply White List To Ports" )
${G_myName} ${extraInfo} -i applyWhiteListTo tcpUdp_commonPrivatePorts
${G_myName} ${extraInfo} -i applyWhiteListTo tcpUdp_imapPrivatePorts
${G_myName} ${extraInfo} -i applyPrivatePortExceptions tcp ssh 192.168.0.0/24
$( examplesSeperatorChapter "Delete White List From Ports" )
${G_myName} ${extraInfo} -i deleteWhiteListFromPrivatePorts
${G_myName} ${extraInfo} -i deletePrivatePortExceptions tcp ssh 192.168.0.0/24
$( examplesSeperatorChapter "Raw iptable commands" )
sudo iptables -L  # List
sudo iptables -F  # Flush
sudo iptables -L INPUT -v  # List with statistics
$( examplesSeperatorChapter "Block Public And Delete White List From SysType" )
${G_myName} ${extraInfo} -i unsealSysTypeWithWhiteList vmHost
${G_myName} ${extraInfo} -i unsealSysTypeWithWhiteList vmGuest
${G_myName} ${extraInfo} -i unsealSysTypeWithWhiteList mailonly
${G_myName} ${extraInfo} -i unsealSysTypeWithWhiteList webOnly
${G_myName} ${extraInfo} -i unsealSysTypeWithWhiteList webAndMail
$( examplesSeperatorChapter "Block Public And Apply White List To SysType" )
${G_myName} ${extraInfo} -i sealSysTypeWithWhiteList vmHost
${G_myName} ${extraInfo} -i sealSysTypeWithWhiteList vmGuest
${G_myName} ${extraInfo} -i sealSysTypeWithWhiteList mailonly
${G_myName} ${extraInfo} -i sealSysTypeWithWhiteList webOnly
${G_myName} ${extraInfo} -i sealSysTypeWithWhiteList webAndMail
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
        "127.0.0.0/8"
        "192.168.0.0/24"
    )
}

function tcpUdp_commonPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    tcp_privatePorts=(
        "telnet"
        "ssh"              # 22
        "sunrpc"
        "loc-srv"          # tcp-135
        "netbios-ssn"      # tcp-139
        "microsoft-ds"     # tcp-445
    )
    
    udp_privatePorts=( 
        "sunrpc"
        "loc-srv"          # udp-135
        "netbios-ns"       # tcp-137
        "netbios-dgm"      # tcp-138    
        "microsoft-ds"     # tcp-445
        
    )
}

function tcpUdp_imapPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    tcp_privatePorts=(
        "110"             # pop3 not encrypted
        "995"             # pop3 encrypted
        "143"             # IMAP non-encrypted port
        "993"             # Secure IMAP
    )
    
    udp_privatePorts=( 
    )
}


function tcpUdp_mailPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    tcp_privatePorts=(
        "smtp"            # tcp-25
        "submission"      # tcp-587
        "smtps"           # 465
        "110"             # pop3 not encrypted
        "995"             # pop3 encrypted
        "143"             # IMAP non-encrypted port
        "993"             # Secure IMAP
    )
    
    udp_privatePorts=( 
    )
}

function tcpUdp_webPrivatePorts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    tcp_privatePorts=(
        "http"            # tcp-80
        "https"           # tcp-443
        "8080"            # tcp-8080
    )
    
    udp_privatePorts=( 
    )
}



function sysType_vmHost {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    tcpUdp_portsListSpec=( 
        "tcpUdp_commonPrivatePorts"
        "tcpUdp_mailPrivatePorts"
        "tcpUdp_webPrivatePorts"
    )
}

function sysType_vmGuest {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    tcpUdp_portsListSpec=( 
        "tcpUdp_commonPrivatePorts"
        "tcpUdp_mailPrivatePorts"
        "tcpUdp_webPrivatePorts"
    )
}



function sysType_mailOnly {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    tcpUdp_portsListSpec=( 
        "tcpUdp_commonPrivatePorts"
        "tcpUdp_webPrivatePorts"        
    )
}


function sysType_webOnly {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    tcpUdp_portsListSpec=( 
        "tcpUdp_commonPrivatePorts"
        "tcpUdp_mailPrivatePorts"       
    )
}


function sysType_webAndMail {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    tcpUdp_portsListSpec=( 
        "tcpUdp_commonPrivatePorts"
    )
}


function vis_sealSysTypeWithWhiteList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given sysType (eg vmHost), for each of the tcp/udp portsListSpecs,
we invoke vis_applyWhiteListTo.
In this context tcp_portsListSpec and udp_portsListSpec are 
global arrays which contain function names that in turn activate
tcp_privatePorts and udp_privatePorts (which are also global arrays)
containing port-name or port numbers that are to be privately open and 
externally closed.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local sysType="$1"
    local sysTypeFuncName=""

    sysTypeFuncName=$( ListFuncs | egrep "^sysType_${sysType}$" )

    if [ -z "${sysTypeFuncName}" ] ; then
        EH_problem "Did not find sysType_${sysType} -- No action taken"
        lpReturn
    fi

    lpDo ${sysTypeFuncName}

    local eachTcpUdpPortsListSpec=""
    for eachTcpUdpPortsListSpec in ${tcpUdp_portsListSpec[@]} ; do
        lpDo vis_applyWhiteListTo ${eachTcpUdpPortsListSpec}
    done
    
    lpReturn
}


function vis_unsealSysTypeWithWhiteList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given sysType (eg vmHost), for each of the tcp/udp portsListSpecs,
we invoke vis_applyWhiteListTo.
In this context tcp_portsListSpec and udp_portsListSpec are 
global arrays which contain function names that in turn activate
tcp_privatePorts and udp_privatePorts (which are also global arrays)
containing port-name or port numbers that are to be privately open and 
externally closed.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local sysType="$1"
    local sysTypeFuncName=""

    sysTypeFuncName=$( ListFuncs | egrep "^sysType_${sysType}$" )

    if [ -z "${sysTypeFuncName}" ] ; then
        EH_problem "Did not find sysType_${sysType} -- No action taken"
        lpReturn
    fi

    lpDo ${sysTypeFuncName}

    local eachTcpUdpPortsListSpec=""
    for eachTcpUdpPortsListSpec in ${tcpUdp_portsListSpec[@]} ; do
        lpDo vis_deleteWhiteListTo ${eachTcpUdpPortsListSpec}
    done
    
    lpReturn
}


function getTcpOrUdpFromPortsList%% {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given a function name starting with tcp_ or udp_, return tcp or udp.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local portsListSpecFunc="$1"
    
    IFS='_' read -ra eachPortsListParts <<< "${portsListSpecFunc}"
    local tcpOrUdp="${eachPortsListParts[0]}"
    case ${tcpOrUdp} in
        tcp|udp )
            doNothing
            ;;
        * )
            EH_problem "Neither tcp, nor udp"
            tcpOrUdp=""
    esac
    echo ${tcpOrUdp}
}


function vis_applyWhiteListTo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Accepts a series of ports-specification functions as args.
First global list of whiteListAddrs is obtained as global itemOrderedWhiteList.
For eachPortsListSpecFunc, that function is invoked -- which
makes effective the global tcp_privatePorts or udp_privatePorts.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local args=$@
    local eachPortsListSpecFunc=""
    local tcpOrUdp=""

    lpDo whiteListAddrs    

    for eachPortsListSpecFunc in ${args} ; do
        
        lpDo ${eachPortsListSpecFunc}  # the function specified as arg

        local eachPrivatePort=""
        
        for eachPrivatePort in ${tcp_privatePorts[@]} ; do
            lpDo vis_applyPrivatePortExceptions "tcp" "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
        done

        for eachPrivatePort in ${udp_privatePorts[@]} ; do
            lpDo vis_applyPrivatePortExceptions "udp" "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
        done
    done
    
    lpReturn
}



function vis_deleteWhiteListTo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Accepts a series of ports-specification functions as args.
First global list of whiteListAddrs is obtained as global itemOrderedWhiteList.
For eachPortsListSpecFunc, that function is invoked -- which
makes effective the global tcp_privatePorts or udp_privatePorts.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    local args=$@
    local eachPortsListSpecFunc=""
    local tcpOrUdp=""

    lpDo whiteListAddrs    

    for eachPortsListSpecFunc in ${args} ; do
        
        lpDo ${eachPortsListSpecFunc}  # the function specified as arg

        local eachPrivatePort=""
        
        for eachPrivatePort in ${tcp_privatePorts[@]} ; do
            lpDo vis_deletePrivatePortExceptions "tcp" "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
        done

        for eachPrivatePort in ${udp_privatePorts[@]} ; do
            lpDo vis_deletePrivatePortExceptions "udp" "${eachPrivatePort}" ${itemOrderedWhiteList[@]}
        done
    done
    
    lpReturn
}




function vis_applyPrivatePortExceptions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
save-excursion is needed, so that we visually remain in the current shell.
_EOF_
    }
    EH_assert [[ $# -gt 2 ]]

    local tcpOrUdp="$1"
    local portNu="$2"
    shift
    shift
    local exceptionsAddrList=$@

    local eachExceptionAddr=""

    for eachExceptionAddr in ${exceptionsAddrList} ; do
        lpDo sudo iptables -A INPUT -p ${tcpOrUdp} -s ${eachExceptionAddr} --dport ${portNu} -j ACCEPT
    done

    lpDo sudo iptables -A INPUT -p ${tcpOrUdp} --dport ${portNu} -j DROP

    lpReturn
}



function vis_deletePrivatePortExceptions {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
save-excursion is needed, so that we visually remain in the current shell.
_EOF_
    }
    EH_assert [[ $# -gt 2 ]]

    local tcpOrUdp="$1"
    local portNu="$2"
    shift
    shift
    local exceptionsAddrList=$@

    local eachExceptionAddr=""

    lpDo sudo iptables -D INPUT -p ${tcpOrUdp} --dport ${portNu} -j DROP
    
    for eachExceptionAddr in ${exceptionsAddrList} ; do
        lpDo sudo iptables -D INPUT -p ${tcpOrUdp} -s ${eachExceptionAddr} --dport ${portNu} -j ACCEPT
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
