#!/bin/bash

IimBriefDescription="Installs unsited-bisos on a fresh debian-11 or debian-12"

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
*  /This File/ :: /bisos/core/bsip/bin/unsitedBisosDeploy.sh
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
The equivalent of this script as a Standalone-ICM script is at: https://github.com/bxGenesis/start
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

. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

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

. ${opBinBase}/siteRegistrar_lib.sh

. ${opBinBase}/container_lib.sh

. ${opBinBase}/usgBpos_lib.sh

# PRE parameters


typeset -t targetName=""

sshCmnd="ssh -o StrictHostKeyChecking=no"


function G_postParamHook {
    lpReturn
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    bisosCurrentsGet

    local oneTargetName=${curTargetBox:-}
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam curTargetBox 192.168.0.257  # input needed
${curTargetBox:-}
$( examplesSeperatorChapter "Distro Installation -- On Target" )
See: https://github.com/bxGenesis/start
$( examplesSeperatorChapter "Un Do -- De BISOS-ify -- Re-Install" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_boxUUID  # Box's unique-id for use by Manager 
$( examplesSeperatorChapter "Un Do -- De BISOS-ify -- Re-Install" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_deBisosIfy
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_reInstall
$( examplesSeperatorChapter "Distro Actions -- On Manager -- Ssh Into Target" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_intraToSudoersAddition # ManagerOnly -- intra user -- no bisos
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_aptSourcesPrep # ManagerOnly -- intra user -- no bisos
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_unsitedBisos # ManagerOnly -- intra user -- no bisos
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i distro_provisionBisos_ascertain
$( examplesSeperatorChapter "Full Update" )
${G_myName} ${extraInfo} -p targetName="${oneTargetName}" -i l1_fullUpdate  # PRIMARY Action (all of above distro_ actions)
_EOF_
}


function vis_l1_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update distro, and bring it to bisosBasePlatform.
*** TargetOnly -- intra user -- no bisos
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]
    EH_assert [ "${targetName}" != "localhost" ] # Must be invoked OnManger

    lpDo vis_distro_intraToSudoersAddition
    lpDo vis_distro_aptSourcesPrep
    lpDo vis_distro_provisionBisos_unsitedBisos
}


function vis_distro_intraToSudoersAddition {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Specific to debian. Allow for sudo-ing as intra.
*** By policy, at distro installation, intra is used as acctName, acctNamePasswd and rootPasswd
*** in the command below intra is used 4 times. acctName is used twice.
*** ManagerOnly -- intra user -- no bisos
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]
    
    # redirection of stderr gets rid of the Password: prompt, which can throw emacs off
    local intraLine=$( sshpass -p intra ${sshCmnd} intra@"${targetName}" "echo intra | su - root -c 'egrep ^intra /etc/sudoers'" 2> /dev/null )

    if [ -z "${intraLine}" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
             "echo intra | su - root -c 'echo intra ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers'"
    else
        ANT_raw "intra is already in /etc/sudoers -- skipped"
    fi
}


function vis_distro_aptSourcesPrep {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Setup apt/sources.list for initial use. Different for debian and ubuntu
*** In a debian box, the deb cdrom: line needs to be removed.
*** ManagerOnly -- intra user -- no bisos
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    local lsOrig=$( sshpass -p intra ${sshCmnd} intra@"${targetName}" sudo ls /etc/apt/sources.list.orig 2> /dev/null )

    if [ -z "${lsOrig}" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
             sudo cp -p /etc/apt/sources.list /etc/apt/sources.list.orig
    else
        ANT_raw "/etc/apt/sources.list.orig exists -- copying skipped"
    fi

    # In "''" "" is consumed by lpDo
    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         grep -v "'^deb cdrom:'" /etc/apt/sources.list \> /tmp/sources.list

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         sudo mv /tmp/sources.list /etc/apt/sources.list

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         sudo apt-get update
}

function vis_distro_provisionBisos_ascertain {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies identically to all distros.
*** ManagerOnly -- intra user
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    EH_assert [ ! -z "${targetName}" ]

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         sudo ls -l /bisos/core/bsip

}

function vis_distro_provisionBisos_unsitedBisos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Applies identically to all distros.
*** ManagerOnly -- intra user -- no bisos
** TODO Needs to support Deb11 and Deb12
** TODO Needs to become consistent with bxGenesis/start/raw-bisos.sh 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    EH_assert [ ! -z "${targetName}" ]

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
         sudo apt-get update

    #lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
    #    sudo apt-get -y upgrade


    local debVer=$(lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" lsb_release -a | grep Release | cut -d : -f 2)
    debVer=$(echo ${debVer})  # get rid of spaces

    if [ "${debVer}" == "12" ] ; then

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            sudo apt-get install -y pipx

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            pipx install bisos.provision

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
           \$HOME/.local/bin/provisionBisos.sh -h -v -n showRun -i sysBasePlatform

    elif [ "${debVer}" == "11" ] ; then

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            sudo apt-get install -y python3-pip

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            sudo pip3 install --upgrade bisos.provision

        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            /usr/local/bin/provisionBisos.sh ${G_commandPrefs} -i sysBasePlatform

   else
      EH_problem "Unsuported debVer=${debVer}"
   fi
}

function vis_l1_deBisosIfy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Needs to become consistent with bxGenesis/start/raw-bisos.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    local debVer=$(lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" lsb_release -a | grep Release | cut -d : -f 2)
    debVer=$(echo ${debVer})  # get rid of spaces

    if [ "${debVer}" == "12" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            \$HOME/.local/bin/provisionBisos.sh -h -v -n showRun -i deBisosIfy
    elif [ "${debVer}" == "11" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            /usr/local/bin/provisionBisos.sh -h -v -n showRun -i deBisosIfy
   else
      EH_problem "Unsuported debVer=${debVer}"
   fi
}

function vis_l1_reInstall {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Needs to become consistent with bxGenesis/start/raw-bisos.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    local debVer=$(lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" lsb_release -a | grep Release | cut -d : -f 2)
    debVer=$(echo ${debVer})  # get rid of spaces

    if [ "${debVer}" == "12" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            \$HOME/.local/bin/provisionBisos.sh -h -v -n showRun -i reInstall  sysBasePlatform
    elif [ "${debVer}" == "11" ] ; then
        lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
            /usr/local/bin/provisionBisos.sh -h -v -n showRun -i reInstall  sysBasePlatform
    else
      EH_problem "Unsuported debVer=${debVer}"
   fi
}

function vis_l1_boxUUID {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Needs to become consistent with bxGenesis/start/raw-bisos.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${targetName}" ]

    lpDo sshpass -p intra ${sshCmnd} intra@"${targetName}" \
        "echo intra | su - root -c 'dmidecode -s system-uuid'"
}

####### TO BE SORTED OUT #######

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


function vis_chromeOsDebianBisosInstall {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   cat  << _EOF_
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
