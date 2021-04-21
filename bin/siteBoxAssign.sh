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

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

# PRE parameters
typeset -t siteName="MANDATORY"



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

    local ppBoxesBase=$( ppBoxesBaseObtain )

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site And BxO Information" )
ls -ld ${ppBoxesBase}/*
$( examplesSeperatorChapter "This Box Addition Actions" )
${G_myName} ${extraInfo} -i thisBoxAddAndPush   # =Primary Usage=
${G_myName} ${extraInfo} -i thisBoxAdd   # =Primary Usage=
${G_myName} ${extraInfo} -i thisBoxPush
${G_myName} ${extraInfo} -i boxesGitPull
${G_myName} ${extraInfo} -i thisBoxNuUpdateAt "$(vis_thisBoxFindNu)"
${G_myName} ${extraInfo} -i thisBoxNuGitUpdateAt "$(vis_thisBoxFindNu)"  # NOTYET
$( examplesSeperatorChapter "This Box Information" )
${G_myName} -i thisBoxFindNu
${G_myName} ${extraInfo} -i thisBoxFindNu
${G_myName} ${extraInfo} -i thisBoxFindId
${G_myName} ${extraInfo} -i thisBoxFindBase
$( examplesSeperatorChapter "Uniue Box Id" )
${G_myName} ${extraInfo} -i thisBoxUUID
${G_myName} ${extraInfo} -i givenUniqueBoxIdFindBoxNuBase "$(vis_thisBoxUUID)"
$( examplesSeperatorChapter "Next BoxNu" )
${G_myName} ${extraInfo} -i boxNuGetNext
${G_myName} -i boxNuGetNext
$( examplesSeperatorChapter "Common Facilities" )
${G_myName} -i boxNuToBoxId "$( vis_thisBoxFindNu )"
_EOF_
}


noArgsHook() {
  vis_examples
}


function ppBoxesBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/boxes.bpoFp/bpoId
    #local selectedPpBoxesPath="${usgHome}/bisos/sites/selected/siteBpos.fv/ppBoxes"
    #local selectedPpBoxesPath="${usgHome}/bisos/sites/selected/siteBpos/boxes.bpoFp/bpoId"

    local selectedSiteBxoId=$( vis_selectedSiteBxoId )
    local selectedPpBoxesPath="$( FN_absolutePathGet ~${selectedSiteBxoId} )/siteBpos/boxes.bpoFp/bpoId"    
    
    local ppBoxesBxoId=""

    if [ -d "${selectedPpBoxesPath}" ] ; then
	ppBoxesBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedPpBoxesPath} )
	if [ -z "${ppBoxesBxoId}" ] ; then
	    EH_problem "Missing ppBoxesBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${ppBoxesBxoId}" ; then
	    EH_problem "Missing ppBoxesBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedPpBoxesPath}"
	lpReturn 101
    fi

    local ppBoxesBase=$( FN_absolutePathGet ~${ppBoxesBxoId} )/boxes
    EH_assert [ -d "${ppBoxesBase}" ]

    echo "${ppBoxesBase}"

    lpReturn
}	


function vis_thisBoxNuUpdateAt {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local boxNu="$1"

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ] 

   local boxNuBase="${ppBoxesBase}/${boxNu}"

   EH_assert [ -d "${boxNuBase}" ]

   local my_uniqueBoxId=$(vis_thisBoxUUID)
   local stored_uniqueBoxId=$( fileParamManage.py -i fileParamRead  ${boxNuBase} uniqueBoxId )

   if [ -z "${stored_uniqueBoxId}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${boxNuBase} uniqueBoxId "${my_uniqueBoxId}"
   else
       if [ "${my_uniqueBoxId}" != "${stored_uniqueBoxId}" ] ; then
	   EH_problem "Expected ${my_uniqueBoxId} -- got ${stored_uniqueBoxId}"
	   lpReturn 101
       fi
   fi

   local stored_boxNu=$( fileParamManage.py -i fileParamRead  ${boxNuBase} boxNu )

   if [ -z "${stored_boxNu}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${boxNuBase} boxNu "${boxNu}"
   else
       if [ "${boxNu}" != "${stored_boxNu}" ] ; then
	   EH_problem "Expected ${boxNu} -- got ${stored_boxNu}"
	   lpReturn 101
       fi
   fi

   local my_boxId="box${boxNu}"
   local stored_boxId=$( fileParamManage.py -i fileParamRead  ${boxNuBase} boxId )

   if [ -z "${stored_boxId}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${boxNuBase} boxId "${my_boxId}"
   else
       if [ "${my_boxId}" != "${stored_boxId}" ] ; then
	   EH_problem "Expected ${my_boxId} -- got ${stored_boxId}"
	   lpReturn 101
       fi
   fi

   lpReturn
}	

function vis_boxNuGetNext {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ] 

   opDoExit pushd "${ppBoxesBase}" > /dev/null
   local lastBoxNu=$(  ls  | sort -n | tail -1 )
   if [ -z "${lastBoxNu}" ] ; then
       lastBoxNu=1000
   fi
   opDoExit popd > /dev/null
   
   local nextBoxNu=$( expr ${lastBoxNu} +  1 )

   echo ${nextBoxNu}   
}


function vis_givenUniqueBoxIdFindBoxNuBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]
   local uniqueBoxId="$1"

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ] 

   local boxNuBaseDirs=$( ls -d ${ppBoxesBase}/* 2> /dev/null )

   local eachBoxNuBase=""
   local stored_uniqueBoxId=""
   local found=""

   for eachBoxNuBase in ${boxNuBaseDirs} ; do   

       stored_uniqueBoxId=$( fileParamManage.py -i fileParamRead ${eachBoxNuBase} uniqueBoxId )

       if [ -z "${stored_uniqueBoxId}" ] ; then
	   EH_problem "Missing uniqueBoxId in ${eachBoxNuBase}"
	   continue
       else
	   if [ "${uniqueBoxId}" == "${stored_uniqueBoxId}" ] ; then
	       found=${eachBoxNuBase}
	       break
	   fi
       fi

   done

   echo ${found}

   lpReturn
}

function vis_boxNuToBoxId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 1 ]]
   
   local boxNu=$1
   echo "box${boxNu}"
}

function vis_thisBoxFindId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   
   echo $( vis_boxNuToBoxId $( vis_thisBoxFindNu ))
}

function vis_thisBoxFindNu {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
   
   FN_nonDirsPart "$( vis_thisBoxFindBase )"
}

function vis_thisBoxFindBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
   
   vis_givenUniqueBoxIdFindBoxNuBase "$(vis_thisBoxUUID)"
}


function vis_thisBoxUUID {
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

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ]

   local boxNuBase=$( vis_givenUniqueBoxIdFindBoxNuBase $(vis_thisBoxUUID) )
   local nextBoxNu=""
   local nextBoxNuBase=""   

   if [ -z ${boxNuBase} ] ; then
       # So we need to create it
       nextBoxNu=$( vis_boxNuGetNext )
       local nextBoxNuBase="${ppBoxesBase}/${nextBoxNu}"

       lpDo mkdir -p ${nextBoxNuBase}

       lpDo vis_thisBoxNuUpdateAt ${nextBoxNu}
   else
       ANT_raw "This Box Already Exists As ${boxNuBase} -- Creation/Update Skipped"
   fi
   echo ${nextBoxNu}
}


function vis_thisBoxPush {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ]

   lpDo eval echo ${ppBoxesBase} \| bx-gitRepos -i addCommitPush modifieds
}

function vis_thisBoxAddAndPush {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   lpDo vis_thisBoxAdd
   lpDo vis_thisBoxPush   
}

function vis_boxesGitPull {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]

   local ppBoxesBase=$( ppBoxesBaseObtain )

   EH_assert [ ! -z "${ppBoxesBase}" ]

   lpDo eval echo ${ppBoxesBase} \| bx-gitRepos -i gitRemPull
}
