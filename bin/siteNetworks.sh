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

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

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

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/box_lib.sh

setBasicItemsFiles opMachineItems

typeset -t opSiteName="nedaPlus"


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
    # local oneId=$( sudo dmidecode -s system-uuid )
    local oneId=$(vis_thisBoxUUID)


    typeset examplesInfo="${extraInfo} ${runInfo}"

    #local networksBase=$( networksBaseObtain )
    local siteNetworksBxoIdHome=$( vis_siteNetworksBxoIdHome )

    local thisBoxNu=$( siteBoxAssign.sh -i thisBoxFindNu )

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site And BxO Information" )
${G_myName} -i siteNetworksBxoIdHome  # ${siteNetworksBxoIdHome}
ls -ld ${siteNetworksBxoIdHome}/networks/*
find ${siteNetworksBxoIdHome}/routes -print
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} -i netsReport
$( examplesSeperatorChapter "Site Networks -- getNetAddrPrefix" )
${G_myName} -i forNetName_getNetAddrPrefix pubA
${G_myName} -i forNetName_getNetAddrPrefix pubB
${G_myName} -i forNetName_getNetAddrPrefix privA
${G_myName} -i forNetName_getNetAddrPrefix perimA
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} -i site_netNameAddr pubA
${G_myName} -i site_netNameAddr pubB
${G_myName} -i site_netNameAddr privA
${G_myName} -i site_netNameAddr perimA
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} -i site_netNameNetmask pubA
${G_myName} -i site_netNameNetmask pubB
${G_myName} -i site_netNameNetmask privA
${G_myName} -i site_netNameNetmask perimA
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} -i site_netName_routerDefault pubA
${G_myName} -i site_netName_routerDefault pubB
${G_myName} -i site_netName_routerDefault privA
${G_myName} -i site_netName_routerDefault perimA
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} -i routerSiteFpsPath privA pubA
$( examplesSeperatorChapter "With Abode Get Nets List" )
${G_myName} -i withAbodeGetApplicableNetsList Auto
${G_myName} -i withAbodeGetApplicableNetsList Mobile
${G_myName} -i withAbodeGetApplicableNetsList Perim
${G_myName} -i withAbodeGetApplicableNetsList Shield
${G_myName} -i withAbodeGetApplicableNetsList Internet
$( examplesSeperatorChapter "Obtain IP Addrs" )
${G_myName} -i site_netName_routerDefault pubA
${G_myName} -i containerIpAddrObtain_privA VSG-ub2004_ generic
$( examplesSeperatorChapter "Assign IP Addrs" )
${G_myName} ${extraInfo} -i assignNextAddr privA generic
${G_myName} ${extraInfo} -i releaseAddr privA generic 121
$( examplesSeperatorChapter "Assign Box IP Addrs" )
${G_myName} ${extraInfo} -i assignBoxAddr privA ${thisBoxNu}
${G_myName} ${extraInfo} -i releaseBoxAddr privA ${thisBoxNu}
${G_myName} ${extraInfo} -i assignVirtAddr privA 1009
${G_myName} ${extraInfo} -i releaseVirtAddr privA 1009
$( examplesSeperatorChapter "This Network Actions" )
${G_myName} ${extraInfo} -p bpoId=sysChar -i cntnr_netName_ipAddr pubA
${G_myName} ${extraInfo} -p bpoId=sysChar -i cntnr_netName_ipAddr pubB
${G_myName} ${extraInfo} -p bpoId=sysChar -i cntnr_netName_ipAddr privA
${G_myName} ${extraInfo} -p bpoId=sysChar -i cntnr_netName_ipAddr perimA
_EOF_
}


noArgsHook() {
  vis_examples
}

