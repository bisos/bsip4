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

    local ppBoxesBase=$( ppBoxesBaseObtain )

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "vmHosting Bystar Portable Materialization Object Realization" )
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i containerAssign
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i sysCharRealize
${G_myName} ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i sysCharMaterialize
${G_myName} ${extraInfo} -p bxoId=NOTYET -i hostingMaterialize
$( examplesSeperatorChapter "VirtualGuest Bystar Portable Materialization Object Realization" )
${G_myName} ${extraInfo} -i vmGuestRealize
${G_myName} ${extraInfo} -i vmGuestMaterialize
$( examplesSeperatorChapter "VirtualGuest Bystar Portable Materialization Object Realization" )
${G_myName} ${extraInfo} -i containerRealize HSS-1001
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_containerAssign {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys identified by system-uuid, create a sysChar and everything else necessary.
- First make sure that there are no exisiting entities matching system-uuid
- We then create one number for this physical container
- We then check the arg for sysType, (exposed, intra, etc).
- Based on sysType, we then determine, which nets are needed.
- We then register new IP addrs on the applicable nets for host.
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${model}" ]   
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]

   local thisBoxNu=$( sitePpBoxAssign.sh -h -v -n showRun -i thisBoxFindNu )

   if [ -z "${thisBoxNu}" ] ; then
       thisBoxNu=$( sitePpBoxAssign.sh -i thisBoxAdd )
   fi
   EH_assert [ ! -z "${thisBoxNu}" ]

   local thisBoxId=$( sitePpBoxAssign.sh -i boxNuToBoxId ${thisBoxNu})

   local containerNu=""
   
   local existingContainerBase=$( siteContainerAssign.sh -p model=${model} -p abode=${abode} -p function=${function} -i withBoxIdFindContainerNu ${thisBoxId} )   
   if [ -z "${existingContainerBase}" ] ; then
       ANT_raw "Container for boxId=${thisBoxId} not found -- will be created"
       containerNu=$( siteContainerAssign.sh -p model=${model} -p abode=${abode} -p function=${function} -i containerNuGetNext )
   else
       ANT_raw "Container of boxId=${thisBoxId} existed and will be used."
       containerNu=$( FN_nonDirsPart $( FN_dirsPart ${existingContainerBase} ))
   fi

   lpDo siteContainerAssign.sh -v -n showRun -p model=${model} -p abode=${abode} -p function=${function} -i containerUpdate_atNu "${containerNu}"

   local containerBase=$( siteContainerAssign.sh -p model=${model} -p abode=${abode} -p function=${function} -i assignedContainerBase "${containerNu}" )

   lpDo  fileParamManage.py -i fileParamRead  ${containerBase} containerId

   lpReturn
}	


function vis_containerRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys identified by system-uuid, create a sysChar and everything else necessary.
- First make sure that there are no exisiting entities matching system-uuid
- We then create one number for this physical container
- We then check the arg for sysType, (exposed, intra, etc).
- Based on sysType, we then determine, which nets are needed.
- We then register new IP addrs on the applicable nets for host.
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerId=$1

   local containerBase=$( siteContainerAssign.sh -i withContainerIdGetBase "${containerId}" )

   model=$( fileParamManage.py -i fileParamRead  ${containerBase} model )
   abode=$( fileParamManage.py -i fileParamRead  ${containerBase} abode )
   function=$( fileParamManage.py -i fileParamRead  ${containerBase} function )      

   echo ${containerBase}
   echo ${function}
   
   lpReturn
}	


function vis_hostingMaterialize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys identified by system-uuid, assign ip addrs and names
- 
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   # bxoid

   lpReturn
}	



function vis_vmGuestRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys identified by system-uuid, create a sysChar and everything else necessary.
- First make sure that there are no exisiting entities matching system-uuid
- We then create one number for this physical container
- We then check the arg for sysType, (exposed, intra, etc).
- Based on sysType, we then determine, which nets are needed.
- We then register new IP addrs on the applicable nets for host.
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   lpReturn
}	

function vis_vmGuestMaterialize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
For the subject physical sys identified by system-uuid, assign ip addrs and names
- 
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   lpReturn
}	
