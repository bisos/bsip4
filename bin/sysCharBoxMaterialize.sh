#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
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
*  /This File/ :: /bisos/core/bsip/bin/bxeRealize.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

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

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/siteRegistrar_lib.sh


# PRE parameters

typeset -t bxoId=""
# usg=""

function G_postParamHook {
    bxoIdPrepValidate    

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi
    
    bisosCurrentsGet
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    oneBxoId="${currentBxoId}"
    oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )

    oneTargetBox=${curTargetBox:-}

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId "${oneBxoId}"
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox 192.168.0.45  # Currently curTargetBox=${curTargetBox:-}
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox localhost  # Currently curTargetBox=${curTargetBox:-}
$( examplesSeperatorChapter "New Box Realize -- On Manager And On Target Box" )
# Install Distro With Intra Account And Priv Interface Access -- record ipAddr for curTargetBox
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i boxSiteBasePlatform  # OnManager
ssh -X bystar@${oneTargetBox}    # Then run emacs, then realize as below
sysCharDeploy.sh ${extraInfo} -p model=Host -p abode=Shield -p function=Server -i boxRealizeOrActivateOnTarget # OnTarget Only
sysCharDeploy.sh ${extraInfo} -p model=Pure -p abode=Shield -p function=Server -i boxRealizeOrActivateOnTarget # OnTarget Only
sysCharDeploy.sh ${extraInfo} -p model=Host -p abode=Internet -p function=Server -i boxRealizeOrActivateOnTarget # OnTarget Only
$( examplesSeperatorChapter "Full Existing Box Activation -- On Manager Or On Target Box" )
# Install Distro With Intra Account And Priv Interface Access -- record ipAddr for curTargetBox
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i boxFullActivate # OnManager From Begining-To-End
# Or In Steps boxFullActivate = boxSiteBasePlatform + boxActivateAtSiteBasePlatform
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i boxSiteBasePlatform  # OnManager
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i boxActivateAtSiteBasePlatform # OnManager
sysCharDeploy.sh ${extraInfo} -i boxActivateAtSiteBasePlatform # OnTarget -- After site has been setup
$( examplesSeperatorChapter "Full Box Un Assign -- OnManager/OnTarget -- For ReAssignment/ReRealize" )
siteBoxAssign.sh -i thisBoxFindId
siteContainerAssign.sh ${extraInfo} -i withBoxIdFindContainerBase "${boxId}"
siteContainerAssign.sh ${extraInfo} -i containerBoxUnAssignAndPush "${boxId}"
siteContainerAssign.sh ${extraInfo} -i containerBoxUnAssign "${boxId}"
$( examplesSeperatorChapter "Target Box Information -- On Manager Or On Target Box" )
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i siteBasePlatform_newBoxAscertain
sysCharDeploy.sh ${extraInfo} -i siteBasePlatform_newBoxAscertain
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i siteBasePlatform_containerBoxRepoAscertain
sysCharDeploy.sh ${extraInfo} -i siteBasePlatform_containerBoxRepoAscertain
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i containerBoxBpoId
sysCharDeploy.sh ${extraInfo} -i containerBoxBpoId
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i containerBoxBpoPath
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i sysCharedPlatform_containerBoxReport
sysCharDeploy.sh ${extraInfo} -i sysCharedPlatform_containerBoxReport
sysCharDeploy.sh ${extraInfo} -i containerBoxBpoPath
$( examplesSeperatorChapter "Box Convey Parameters And BISOS Development Preps -- After sysChar Activation" )
sysCharDeploy.sh ${extraInfo} -p targetName="${oneTargetBox}" -i usgConvey_bisosDeveloper # onManager+onTarget
sysCharDeploy.sh ${extraInfo} -p bisosDevBxoId=prompt -i usgConvey_bisosDeveloper # onTarget
# NOTYET, show selected usgConvey_bisosDeveloper
sysCharDevel.sh ${extraInfo} -i bisosDevBxo_fullSetup  # activate, actuate, set mode
$( examplesSeperatorChapter "Box Disk Preps" )
sysDiskDrives.sh 
$( sysCharDeploy.sh -i containerBoxBpoPath )/sys/bin/sysDiskDrives-niche.sh 
$( examplesSeperatorChapter "Hosting Container Actions" )
sysCharPreps.sh
sysCharPreps.sh -h -v -n showRun -i fullUpdate
$( examplesSeperatorChapter "Pure Container Actions" )
_EOF_
}


function vis_containerSteadyWrite {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerSteadyBase="$1"
   # typically something like: /bxo/r3/iso/pmc_siteName-containers/VAG-deb10_/steady/

   EH_assert [ -d "${containerSteadyBase}" ]

   # blank or auto or static
   if [ ! -z "${containerSteady_networkMode:-}" ] ; then
       lpDo fileParamManage.py -v 20 -i fileParamWrite ${containerSteadyBase}/net networkMode.fp "${containerSteady_networkMode}"
   fi
   
   if [ ! -z "${containerSteady_privA_addr:-}" ] ; then
       lpDo fileParamManage.py -i fileParamWrite ${containerSteadyBase}/net/ipv4/privA.fps addr "${containerSteady_privA_addr}"

       local netSiteFpsPath=$( vis_netSiteFpsPath privA )
       lpDo FN_fileSymlinkUpdate "${netSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/privA.fps/net.fps

       local routerSiteFpsPath=$( vis_routerSiteFpsPath privA pubA)
       lpDo FN_fileSymlinkUpdate "${routerSiteFpsPath}"  ${containerSteadyBase}/net/ipv4/privA.fps/router-pubA.fps
   fi
}



function vis_firstBisosBoxInstall {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   cat  << _EOF_
** vis_distro_intraToSudoersAddition
*** echo intra | su - root -c 'echo intra ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers'
** vis_distro_aptSourcesPrep
*** sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.orig
*** grep -v "'^deb cdrom:'" /etc/apt/sources.list \> /tmp/sources.list
*** sudo mv /tmp/sources.list /etc/apt/sources.list
*** sudo apt-get update
** vis_distro_provisionBisos_sysBasePlatform
*** sudo apt-get update
*** sudo apt-get -y upgrade
*** sudo apt-get install -y python3-pip
*** sudo pip3 install --upgrade bisos.provision
*** sudo provisionBisos.sh -v -h -n showRun -i sysBasePlatform
** Do The equivalent of vagrantfile -- Get TBD's from there
*** sudo /bisos/core/bsip/bin/sysCharDeploy.sh -h -v -n showRun -p registrar="TBD" -p id="TBD" -p password="intra" -p siteBxoId="TBD" -i bisosBasePlatform_siteSetup
*** sudo -u bystar /bisos/core/bsip/bin/sysCharDeploy.sh -h -v -n showRun -p bisosDevBxoId=TBD -i usgConvey_bisosDeveloper
_EOF_
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
