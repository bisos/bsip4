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
typeset -t model=""     # one of {h,p,v}
typeset -t abode=""  # one of {bpec,bpsc,bipc,bluc,bauc,bdc}


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

    local containersBase=$( vis_containersBaseObtain )
    local containerBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )    

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Container Repo Realization" )
${G_myName} -i containersBaseObtain
${G_myName} ${extraInfo} -i containerRepoUpdate ${containerBase}
$( examplesSeperatorChapter "Generic Container Repo Realization" )
${G_myName} ${extraInfo} -i containerRepoUpdate ${containersBase}/assign/Virt/Auto/Generic/deb10
${G_myName} ${extraInfo} -i containerRepoGenericsUpdate
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_containerRepoGenericsUpdate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersBaseObtain )

   #find ${containersBase} -type d -print | egrep '/Generic/.*[^/]$'
   local genericBasesList=( $(find ${containersBase} -type d -print | egrep '/Generic/[a-z|0-9]*$') )

   for each in ${genericBasesList[@]} ;  do
       lpDo echo $each
   done
   
   lpReturn
}	


function vis_containerRepoUpdate {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerAssignBase=$1

   local containersBase=$( containersBaseObtain )
   
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )

   local repoBase="${containersBase}/${containerId}"

   opDoRet mkdir -p ${repoBase}
   lpDo FN_fileSymlinkUpdate ${containerAssignBase} ${repoBase}/assign

   local abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
   local function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )
   local model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )         

   local containerSteadyBase=${repoBase}/steady
   lpDo mkdir -p ${containerSteadyBase}

   case ${function} in
       Generic)
	   case ${abode} in
	       Auto)
		   steady_networkMode="auto"
		   ;;
	       *)
		   doNothing
		   ;;
	   esac
	   ;;
       Server)
	   lpDo echo fileParamManage.py -i fileParamWrite ${platformInfoBase} vmGuestLeastSize "medium"
	   lpDo echo fileParamManage.py -i fileParamWrite ${platformInfoBase} networkMode "fixed"	   
	   ;;

       *)
	   EH_problem "NOTYET -- unimplemented ${function}"
   esac

   vis_containerSteadyWrite "${containerSteadyBase}"

   lpReturn
}	


function vis_containerRepoUpdate%% {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
With $1=containerId (eg HSS-1001), update the repo at bxoId base.
- record: model, abode, function.
- Based on abode, determine, interfaces/nets and assign ipAddrs
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerAssignBase=$1

   local containersBase=$( containersBaseObtain )
   
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )

   local repoBase="${containersBase}/${containerId}"

   opDoRet mkdir -p ${repoBase}
   lpDo FN_fileSymlinkUpdate ${containerAssignBase} ${repoBase}/assign

   local abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
   local function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )
   local model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )         

   local platformInfoBase=${repoBase}/platformInfo.fps
   lpDo mkdir -p ${platformInfoBase}

   local netAttachmentsBase=${repoBase}/netAttachments.fps
   lpDo mkdir -p ${netAttachmentsBase}

   local identityBase=${repoBase}/identity.fps
   lpDo mkdir -p ${identityBase}

   case ${function} in
       Server)
	   lpDo fileParamManage.py -i fileParamWrite ${platformInfoBase} vmGuestLeastSize "medium"
	   lpDo fileParamManage.py -i fileParamWrite ${platformInfoBase} networkMode "fixed"	   
	   ;;

       *)
	   EH_problem "NOTYET -- unimplemented ${function}"
   esac

   lpDo mkdir -p ${netAttachmentsBase}/if1
   
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4/ipAddrs
   lpDo mkdir -p ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps addr "192.168.0.151"
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps gateway "192.168.0.220"
   lpDo fileParamManage.py -i fileParamWrite ${netAttachmentsBase}/if1/ipv4/ipAddrs/addr1.fps netmask "24"
    
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers/auto.fps
   lpDo mkdir -p ${netAttachmentsBase}/if1/resolvers/dns1.fps

   lpDo mkdir -p ${netAttachmentsBase}/if1/routes
   lpDo mkdir -p ${netAttachmentsBase}/if1/routes/auto.fps
   lpDo mkdir -p ${netAttachmentsBase}/if1/routes/route1.fps
   
   lpReturn
}	

