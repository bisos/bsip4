#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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

* This is a starting point for Merging opMachines.sh and bystarBoxAdmin.sh -- IMPORTANT --
** Use site/assign/BOX/box0059/cpf_box0059.sh
** Get rid of items file -- Get rid of subjectAction
** Scope of this is Physiacl Machines -- Not Virtual Machines -- unique id comes from dmidecode -s system-uuid and being physical
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh


. ${opBinBase}/bxo_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters
typeset -t type=""
typeset -t purpose=""

function containersBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos.fv/containers
    local selectedContainersPath="${usgHome}/bisos/sites/selected/siteBpos.fv/containers"
    
    local containersBxoId=""

    if [ -d "${selectedContainersPath}" ] ; then
	containersBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedContainersPath} )
	if [ -z "${containersBxoId}" ] ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${containersBxoId}" ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedContainersPath}"
	lpReturn 101
    fi

    local containersBase=$( FN_absolutePathGet ~${containersBxoId} )/containers
    EH_assert [ -d "${containersBase}" ]

    echo "${containersBase}"

    lpReturn
}	


function G_postParamHook {

    lpCurrentsGet

    lpReturn 0
}


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    #typeset oneId=`ifconfig eth0 | grep HWaddr | cut -c 39-55`
    local oneId=$( sudo dmidecode -s system-uuid )

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local containersBase=$( containersBaseObtain )
    EH_assert [ ! -z "${containersBase}" ]

    local boxId=$( sitePpBoxAssign.sh -i thisBoxFindId )
		   
    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site And BxO Information" )
ls -ld ${containersBase}/*
$( examplesSeperatorChapter "This Box Actions" )
${G_myName} ${extraInfo} -i typePurposeBaseDirsCreate
${G_myName} ${extraInfo} -p type=h -p purpose=bipc -i containerNuGetNext
${G_myName} ${extraInfo} -i boxIdFindContainerBase ${boxId}
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_typePurposeBaseDirsCreate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local types=("h" "p" "v")
   local purposes=("bgec" "bpsc" "bipc" "bluc" "bauc" "bdc")

   for eachType in ${types[@]} ;  do
       for eachPurpose in ${purposes[@]} ; do
	   lpDo mkdir -p  ${containersBase}/${eachType}-${eachPurpose}
       done
   done

   lpReturn
}	

function vis_containerNuGetNext {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${type}" ]
   EH_assert [ ! -z "${purpose}" ]   

   local containersBase=$( containersBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]

   local typePusposeBase="${containersBase}/${type}-${purpose}"
   EH_assert [ -d "${typePusposeBase}" ]
   
   opDoExit pushd "${typePusposeBase}" > /dev/null
   local lastContainer=$(  ls  | sort -n | tail -1 )
   if [ -z "${lastContainer}" ] ; then
       lastContainer=1000
   fi
   opDoExit popd > /dev/null

   local nextContainer=$( expr ${lastContainer} +  1 )

   echo ${nextContainer}   
}


function vis_boxIdFindContainerBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxId="$1"

   local containersBase=$( containersBaseObtain )
   EH_assert [ ! -z "${containersBase}" ] 

   local boxIdFps=$( find ${containersBase} -type d -print | grep boxId )

   local eachBoxIdFp=""
   local stored_boxId=""
   local found=""

   for eachBoxIdFp in ${boxIdFps} ; do   
       stored_boxId=$( fileParamManage.py -i fileParamRead ${eachBoxIdFp} boxId )

       if [ -z "${stored_boxId}" ] ; then
	   EH_problem "Missing boxId in ${eachBoxIdFp} -- continuing"
	   continue
       else
	   if [ "${boxId}" == "${stored_boxId}" ] ; then
	       found=${eachBoxIdFp}
	       break
	   fi
       fi
   done

   echo ${found}

   lpReturn
}	

function vis_thisBoxFindNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
   
   FN_nonDirsPart $( vis_thisBoxFindBase )
}

function vis_thisBoxFindBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
   
   vis_givenUniqueBoxIdFindContainerBase $(vis_myUniqueBoxId)
}


function vis_myUniqueBoxId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
    
    # if not physical, exit
    sudo dmidecode -s system-uuid
    lpReturn
}


function vis_thisBoxAdd {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersBaseObtain )

   EH_assert [ ! -z "${containersBase}" ]

   local containerBase=$( vis_givenUniqueBoxIdFindContainerBase $(vis_myUniqueBoxId) )
   local nextContainer=""
   local nextContainerBase=""   

   if [ -z ${containerBase} ] ; then
       # So we need to create it
       nextContainer=$( vis_containerGetNext )
       local nextContainerBase="${containersBase}/${nextContainer}"

       lpDo mkdir -p ${nextContainerBase}

       lpDo vis_thisContainerUpdateAt ${nextContainer}
   else
       ANT_raw "This Box Already Exists As ${containerBase} -- Creation/Update Skipped"
   fi
}
