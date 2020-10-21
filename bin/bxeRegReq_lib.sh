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
** Creates a BARC (Bystar Account Request Container) based on command line.
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


typeset -t ServiceType=""
typeset -t ServiceSupportType=""

# PRE parameters for SMB
typeset -t CompanyName=""
typeset -t BusinessType=""
typeset -t Domain1="MANDATORY"
typeset -t Domain2="MANDATORY"
typeset -t streetAddress=""
typeset -t cityAddress=""
typeset -t stateAddress=""
typeset -t zipcodeAddress=""
typeset -t phone=""
typeset -t fax=""

# PRE parameters for bymemory
typeset -t FirstName=MANDATORY
typeset -t LastName=MANDATORY
typeset -t datebirth=""
typeset -t datedeath=""

# PRE parameters for byalias
typeset -t FirstName=""
typeset -t LastName=""
typeset -t AliasName=""

# PRE parameters common
typeset -t contactPerson=""
typeset -t emailAdmin=""
typeset -t domainHost=""
typeset -t hostName=""

# default bystarUid Must Be "" not MANDATORY
typeset -t bystarUid=""
typeset -t originationMethod=""


# PRE parameters optional 

typeset -t none=""


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_examplesBxAutonomousIndiv {
    bystarParamsMini="-p serviceType=\"BYSMB\" -p supportType=\"COMMITTED\" -p Domain2=\"mydomain\" -p Domain1=\"com\" "
    bystarParamsFull="-p companyName=\"Some Name\" -p businessType=\"RetailStore\" -p domainName=\"mydomain\" -p domainNameExt=\"com\" -p contactPerson= -p emailAdmin= -p streetAddress= -p cityAddress= -p stateAddress= -p zipcodeAddress= -p phone= -p fax= -p domainHost=\"bysmb.net\""
}

function vis_examplesBxAutonomousCorp {
    bystarParamsMini="-p serviceType=\"BYSMB\" -p supportType=\"COMMITTED\" -p Domain2=\"mydomain\" -p Domain1=\"com\" "
    bystarParamsFull="-p companyName=\"Some Name\" -p businessType=\"RetailStore\" -p domainName=\"mydomain\" -p domainNameExt=\"com\" -p contactPerson= -p emailAdmin= -p streetAddress= -p cityAddress= -p stateAddress= -p zipcodeAddress= -p phone= -p fax= -p domainHost=\"bysmb.net\""
}
    
function vis_examplesBxAutonomousSys {
    bystarParamsMini="-p serviceType=\"BYSMB\" -p supportType=\"COMMITTED\" -p Domain2=\"mydomain\" -p Domain1=\"com\" "
    bystarParamsFull="-p companyName=\"Some Name\" -p businessType=\"RetailStore\" -p domainName=\"mydomain\" -p domainNameExt=\"com\" -p contactPerson= -p emailAdmin= -p streetAddress= -p cityAddress= -p stateAddress= -p zipcodeAddress= -p phone= -p fax= -p domainHost=\"bysmb.net\""
}



function vis_examplesByname {
    extraInfo="-h -v -n showRun"

  #bystarParamsMini="-p serviceType=\"BYNAME\" -p supportType=\"TRIAL\" -p FirstName=\"jim\" -p LastName=\"jones\" "
  bystarParamsMini="-p serviceType=\"BYNAME\" -p supportType=\"COMMITTED\" -p FirstName=\"jim\" -p LastName=\"jones\" "
  bystarParamsFull="-p serviceType=\"BYNAME\" -p supportType=\"TRIAL\" -p FirstName=\"\" -p LastName=\"\" -p contactPerson= -p emailAdmin= -p domainHost=\"byname.net\""

    #vis_examplesCommon "BYNAME"
}

function vis_BarcStdout {
   EH_assert [[ $# -eq 0 ]]

  ANT_raw "creating a BARC Container"

  if [ "${serviceType}_" == "BCA_" ] ; then
    cp_MasterAcct=${masterAcct}
    masterAcctBagpLoad
    supportType="${cp_master_ServiceSupportType}"
  fi

   bystarServiceSupportHookParamsSet ${serviceType} ${supportType}
 
   if [ "${originationMethod}_" == "_" ] ; then
       originationMethod="cmdLine"
   fi

 
 cat  << _EOF_
function BarcContainer {
    function BarcContainerCommon {
      bc_serviceType="${serviceType}"
      bc_serviceSupportType="${supportType}"

      bc_originationDate="${dateTag}"
      bc_originationMethod="${originationMethod}"
      bc_originatorHost="${opRunHostName}"
      bc_originatorId="${opRunAcctName}"

      bc_bystarUid="${bystarUid}"
    }
_EOF_


  bystarServiceSupportHookRun barcContainerStdoutSpecific "active"


  cat  << _EOF_
  BarcContainerCommon
  BarcContainer_${bystarServiceType}_${bystarServiceSupportType}
}
_EOF_
}


barcContainerStdoutSpecific_BYNAME_DEFAULT () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	BarcTag="${bystarServiceType}_${bystarServiceSupportType}_${LastName}_${FirstName}"
	return
    fi


  cat  << _EOF_
    function BarcContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_firstName="${FirstName}"
      bc_lastName="${LastName}"
    }
_EOF_

}

barcContainerStdoutSpecific_BYMEMORY_DEFAULT () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	BarcTag="${bystarServiceType}_${bystarServiceSupportType}_${LastName}_${FirstName}"
	return
    fi

  cat  << _EOF_
    function BarcContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_firstName="${FirstName}"
      bc_lastName="${LastName}"
    }
_EOF_

}


barcContainerStdoutSpecific_BYALIAS_DEFAULT () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	BarcTag="${bystarServiceType}_${bystarServiceSupportType}_${AliasName}"
	return
    fi

  cat  << _EOF_
    function BarcContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_AliasName="${AliasName}"
    }
_EOF_


}


barcContainerStdoutSpecific_BYSMB_DEFAULT () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	BarcTag="${bystarServiceType}_${bystarServiceSupportType}_${Domain1}_${Domain2}"
	return
    fi

  cat  << _EOF_
    function BarcContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_companyName=""
      bc_Domain1="${Domain1}"
      bc_Domain2="${Domain2}"
    }
_EOF_
}

barcContainerStdoutSpecific_BCA_DEFAULT () {
   EH_assert [[ $# -eq 1 ]]

    if [ "$1_" = "passive_" ] ; then
	BarcTag="${bystarServiceType}_${bystarServiceSupportType}_${masterAcct}_${LastName}_${FirstName}"
	return
    fi

  cat  << _EOF_
    function BarcContainer_${bystarServiceType}_${bystarServiceSupportType} {
      bc_masterAcct="${masterAcct}"
      bc_firstName="${FirstName}"
      bc_lastName="${LastName}"
      bc_BcaTag="${BcaTag}"
    }
_EOF_
}

barcContainerStdoutSpecific_DEFAULT_DEFAULT () {
   ANT_raw "Missing ${bystarServiceType}_${bystarServiceSupportType}"
}


function vis_BarcFileCreate {
   EH_assert [[ $# -eq 0 ]]

  if [ "${serviceType}_" == "BCA_" ] ; then
    cp_MasterAcct=${masterAcct}
    masterAcctBagpLoad
    supportType="${cp_master_ServiceSupportType}"
  fi

    bystarServiceSupportHookParamsSet ${serviceType} ${supportType}

    bystarServiceSupportHookRun barcContainerStdoutSpecific "passive"


    if isDisposableRegisterUid ; then
        BarcInfoBasePath="/libre/etc/bystar/infoBase/barc"
    else
	BarcInfoBasePath="/bisos/var/bxae/bxeRegReq"
    fi

    opDo mkdir -p ${BarcInfoBasePath}

    BarcBaseDir="${BarcInfoBasePath}/${bystarServiceType}/${bystarServiceSupportType}"

    opDo mkdir -p ${BarcBaseDir}

    BarcFileName=${BarcTag}.${dateTag}.BARC
    
    echo BarcFileName=${BarcBaseDir}/${BarcFileName} > ${BarcBaseDir}/${BarcFileName} 

    vis_BarcStdout 1>> ${BarcBaseDir}/${BarcFileName} 

    opDo ls -l ${BarcBaseDir}/${BarcFileName} 1>&2 

    echo ${BarcBaseDir}/${BarcFileName}
}


function isDisposableRegisterUid  {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Just a place holder. It should perhaps be eliminated.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo fileParamsLoadVarsFromBaseDir /libre/etc/bystar/usage

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
