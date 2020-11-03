#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxe_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxe_lib :: Loading Library -- /bisos/bsip/bin/bxe_lib.sh"
else
    TM_trace 7 "bxe_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxe_lib.sh" ; return
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
** 
** Creates a REGREQ (Bystar Account Request Container) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

# PRE parameters

bystarServiceType=NOTYET
bystarServiceSupportType=NOTYET

typeset -t ServiceType=""
typeset -t ServiceSupportType=""


typeset -t autonomy=""
typeset -t type=""

# PRE parameters for bymemory
typeset -t firstName=MANDATORY
typeset -t lastName=MANDATORY

typeset -t corpName=MANDATORY
typeset -t sysName=MANDATORY

typeset -t email=""

typeset -t originationMethod=""



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

# BarcFileName=/libre/ByStar/InfoBase/BARC/BYNAME/COMMITTED/BYNAME_COMMITTED_banan_mohsen.090215212754.BARC
# function BarcContainer {
#     function BarcContainerCommon {
#       bc_serviceType="BYNAME"
#       bc_serviceSupportType="COMMITTED"

#       bc_originationDate="090215212754"
#       bc_originationMethod="bap2barc"
#       bc_originatorHost="bisp0003"
#       bc_originatorId="mohsen"

#       bc_bystarUid="sa-20000"
#     }
#     function BarcContainer_BYNAME_COMMITTED {
#       bc_firstName="mohsen"
#       bc_lastName="banan"
#     }
#   BarcContainerCommon
#   BarcContainer_BYNAME_COMMITTED
# }
# date="Sun Feb 15 21:27:54 PST 2009"
# RBAE=/libre/ByStar/InfoBase/RBAE/BYNAME/sa/20000


# bxeAutonomy          autonomous|controlled (A or C)
# bxeType              individual|corp|system
# bxeInfoOrSvc         info|service
# firstName
# lastName
# identification


function vis_examplesBxAutonomousIndiv {
    bxeParamsMini="-p autonomy=\"A\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" "
    bxeParamsFull="-p autonomy=\"A\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" -p email=\"email\" "    
}

function vis_examplesBxAutonomousCorp {
    bxeParamsMini="-p autonomy=\"A\" -p type=\"corp\" -p corpName=\"corpName\" "
    bxeParamsFull="-p autonomy=\"A\" -p type=\"corp\" -p corpName=\"corpName\" -p email=\"email\" "    
}
    
function vis_examplesBxAutonomousSys {
    bxeParamsMini="-p autonomy=\"A\" -p type=\"system\" -p sysName=\"bisos\" "
    bxeParamsFull="-p autonomy=\"A\" -p type=\"system\" -p sysName=\"bisos\" "
}

function vis_examplesBxAutonomousSysTest {
    bxeParamsMini="-p autonomy=\"A\" -p type=\"system\" -p sysName=\"test1\" "    
    bxeParamsFull="-p autonomy=\"A\" -p type=\"system\" -p sysName=\"test1\" -p email=\"git-test1@byname.net\" "
}

function vis_regReqStdout {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    ANT_raw "creating a RegReq Container"

    
    
    bystarServiceSupportHookParamsSet ${autonomy} ${type}
 
    if [ "${originationMethod}" == "" ] ; then
	originationMethod="cmdLine"
    fi

    if [ -z "${email}" ] ; then
	email="NA"
    fi
    
 
 cat  << _EOF_
function RegReqContainer {
    function RegReqContainerCommon {
      bc_autonomy="${autonomy}"
      bc_type="${type}"

      bc_email="${email}"

      bc_originationDate="${dateTag}"
      bc_originationMethod="${originationMethod}"
      bc_originatorHost="${opRunHostName}"
      bc_originatorId="${opRunAcctName}"
    }
_EOF_


  bystarServiceSupportHookRun regReqContainerStdoutSpecific "active"


  cat  << _EOF_
  RegReqContainerCommon
  RegReqContainer_${bystarServiceType}_${bystarServiceSupportType}
}
_EOF_
}


regReqContainerStdoutSpecific_A_individual () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	RegReqTag="${bystarServiceType}_${bystarServiceSupportType}_${LastName}_${FirstName}"
	return
    fi


  cat  << _EOF_
    function RegReqContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_firstName="${firstName}"
      bc_lastName="${lastName}"
    }
_EOF_

}

regReqContainerStdoutSpecific_A_corp () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	RegReqTag="${bystarServiceType}_${bystarServiceSupportType}_${LastName}_${FirstName}"
	return
    fi

  cat  << _EOF_
    function RegReqContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_corpName="${corpName}"
    }
_EOF_

}


regReqContainerStdoutSpecific_A_system () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	RegReqTag="${bystarServiceType}_${bystarServiceSupportType}_${sysName}"
	return
    fi

  cat  << _EOF_
    function RegReqContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_sysName="${sysName}"
    }
_EOF_


}


function vis_regReqFileCreate {
    EH_assert [[ $# -eq 0 ]]

    bystarServiceSupportHookParamsSet ${autonomy} ${type}

    bystarServiceSupportHookRun regReqContainerStdoutSpecific "passive"


    if isDisposableRegisterUid ; then
        RegReqInfoBasePath="/libre/etc/bystar/infoBase/regReq"
    else
	RegReqInfoBasePath="/bisos/var/bxae/bxeRegReq"
    fi

    opDo mkdir -p ${RegReqInfoBasePath}

    RegReqBaseDir="${RegReqInfoBasePath}/${bystarServiceType}/${bystarServiceSupportType}"

    opDo mkdir -p ${RegReqBaseDir}

    RegReqFileName=${RegReqTag}.${dateTag}.REGREQ
    
    echo RegReqFileName=${RegReqBaseDir}/${RegReqFileName} > ${RegReqBaseDir}/${RegReqFileName} 

    vis_regReqStdout 1>> ${RegReqBaseDir}/${RegReqFileName} 

    opDo ls -l ${RegReqBaseDir}/${RegReqFileName} 1>&2 

    echo ${RegReqBaseDir}/${RegReqFileName}
}


function isDisposableRegisterUid  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Just a place holder. It should perhaps be eliminated.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage

    if [[ "${cp_platformUsageRegisterUid:-}_" == "DISPOSABLE_" ]] ; then
       return 0
    else   
	return 101
    fi
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
