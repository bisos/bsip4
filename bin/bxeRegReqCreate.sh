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
*  /This File/ :: /bisos/core/bsip/bin/bxeRrPkgCreate.sh 
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

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bystarHook.libSh

# PRE parameters

baseDir=""

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


function G_postParamHook {
     return 0
}



noArgsHook() {
    if [[ $# -eq 0 ]] ; then
	vis_examples
	return
    fi

    case "$1" in
	bysmb)
	    shift
	    vis_examplesBysmb $@   
	    ;;
	bca)
	    shift
	    vis_examplesBca $@   
	    ;;
	byname)
	    shift
	    vis_examplesByname $@   
	    ;;
	byalias)
	    shift
	    vis_examplesByalias $@   
	    ;;
	bymemory)
	    shift
	    vis_examplesBymemory $@   
	    ;;
	bywhere)
	    shift
	    vis_examplesBywhere $@   
	    ;;
	all)
	    shift
	    vis_examplesBysmb $@   
	    vis_examplesBca $@   
	    vis_examplesByname $@   
	    vis_examplesByalias $@   
	    vis_examplesBymemory $@   
	    vis_examplesBywhere $@   
	    ;;
	*)
	    echo "Usage: $0 {byname|byalias|bymemory|bysmb|bywhere|all}"
	    exit 1
	    ;;
    esac
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    # vis_examplesBysmb
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i doTheWork
_EOF_


 cat  << _EOF_
#### BYNAME ####
${G_myName} byname
#### BYMEMORY ####
${G_myName} bymemory
#### BYALIAS ####
${G_myName} byalias
#### BYSMB ####
${G_myName} bysmb
#### BCA -- Controlled/Slave Account ####
${G_myName} bca

_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examplesCommon {
    extraInfo="-h -v -n showRun"

 cat  << _EOF_
EXAMPLES:
#### $1 ####
${G_myName} ${extraInfo} ${bystarParamsMini} -i BarcStdout
${G_myName} ${extraInfo} ${bystarParamsMini} -i BarcFileCreate
--- Full ---
${G_myName} ${extraInfo} ${bystarParamsFull} -i BarcStdout
${G_myName} ${extraInfo} ${bystarParamsFull} -i BarcFileCreate
_EOF_
}


function vis_examplesBysmb {
    extraInfo="-h -v -n showRun"

    #bystarParamsMini="-p serviceType=\"BYSMB\" -p supportType=\"TRIAL\" -p Domain2=\"mydomain\" -p Domain1=\"com\" "
    bystarParamsMini="-p serviceType=\"BYSMB\" -p supportType=\"COMMITTED\" -p Domain2=\"mydomain\" -p Domain1=\"com\" "
    bystarParamsFull="-p companyName=\"Some Name\" -p businessType=\"RetailStore\" -p domainName=\"mydomain\" -p domainNameExt=\"com\" -p contactPerson= -p emailAdmin= -p streetAddress= -p cityAddress= -p stateAddress= -p zipcodeAddress= -p phone= -p fax= -p domainHost=\"bysmb.net\""

    vis_examplesCommon "BYSMB"
}

function vis_examplesBca {
    extraInfo="-h -v -n showRun"

    bystarParamsMini="-p serviceType=\"BCA\" -p masterAcct=\"ea-59050\" -p FirstName=\"jim\" -p LastName=\"jones\" -p BcaTag=\"jim.jones\" "
    bystarParamsFull="${bystarParamsMini}"

    vis_examplesCommon "BCA"
}


function vis_examplesByname {
    extraInfo="-h -v -n showRun"

  #bystarParamsMini="-p serviceType=\"BYNAME\" -p supportType=\"TRIAL\" -p FirstName=\"jim\" -p LastName=\"jones\" "
  bystarParamsMini="-p serviceType=\"BYNAME\" -p supportType=\"COMMITTED\" -p FirstName=\"jim\" -p LastName=\"jones\" "
  bystarParamsFull="-p serviceType=\"BYNAME\" -p supportType=\"TRIAL\" -p FirstName=\"\" -p LastName=\"\" -p contactPerson= -p emailAdmin= -p domainHost=\"byname.net\""

    vis_examplesCommon "BYNAME"
}

function vis_examplesByalias {
    extraInfo="-h -v -n showRun"

  bystarParamsMini="-p serviceType=\"BYALIAS\" -p AliasName=\"soccerDad\" -p supportType=\"TRIAL\""
  bystarParamsFull="-p serviceType=\"BYALIAS\" -p FirstName=\"soccerDad\" -p contactPerson= -p emailAdmin= -p domainHost=\"byname.net\""

    vis_examplesCommon "BYALIAS"
}

function vis_examplesBymemory {
    extraInfo="-h -v -n showRun"

  bystarParamsMini="-p serviceType=\"BYMEMORY\" -p FirstName=\"jim\" -p LastName=\"jones\" -p supportType=\"TRIAL\""
  bystarParamsFull="-p serviceType=\"BYMEMORY\" -p FirstName=\"\" -p LastName=\"\" -p contactPerson= -p emailAdmin= -p domainHost=\"byname.net\""

    vis_examplesCommon "BYMEMORY"
}

function vis_examplesBywhere {
    extraInfo="-h -v -n showRun"

  bystarParamsMini="-p serviceType=\"BYWHERE\" -p WhereCode=\"1-98008-5742-19\" -p supportType=\"TRIAL\""
  bystarParamsFull="-p serviceType=\"BYWHERE\" -p WhereCode=\"1-98008-5742-19\" -p contactPerson= -p emailAdmin= -p domainHost=\"byname.net\""

    vis_examplesCommon "BYWHERE"
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
	BarcInfoBasePath="/libre/ByStar/InfoBase/BARC"
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


function vis_doTheWork {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_failExample
    EH_retOnFail

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