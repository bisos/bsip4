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
*  /This File/ :: /bisos/core/bsip/bin/lcaVagrantBoxBuild.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
* 
*
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


. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Vagrant Boxes" )
${G_myName} ${extraInfo} -i fullUpdate
_EOF_

  vis_examples_boxNamesList
}

function vis_examples_boxName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local boxName="$1"
    
  cat  << _EOF_
$( examplesSeperatorSection "Box Facilities For -- ${boxName}" )
${G_myName} ${extraInfo} -p box=${boxName} -i vagrantFile_stdout
${G_myName} ${extraInfo} -p box=${boxName} -i vagrantFile_path
${G_myName} ${extraInfo} -p box=${boxName} -i vagrantFile_run
_EOF_
  # ${G_myName} ${extraInfo} -p box=${boxName} -i forBoxGetHostname 1
}

boxNamesList=( 
    bento/debian-10.8
    bento/debian-11.pre
    bento/ubuntu-20.04
    bxDistro/debian-10.8/mini
    bxDistro/debian-11.pre/mini
    bxDistro/ubuntu-20.04/mini
    bxDistro/debian-10.8/desktop
    bxDistro/debian-11.pre/desktop
    bxDistro/ubuntu-20.04/desktop
    bisos/debian-10.8/bxcntnr
    bisos/debian-11.pre/bxcntnr
    bisos/ubuntu-20.04/bxcntnr    
)

function vis_examples_boxNamesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    for each in ${boxNamesList[@]} ; do
        vis_examples_boxName ${each}
    done
}



noArgsHook() {
  vis_examples
}

vmParamRam=2049
vmParamDisk=20GB
vmParamCpus=2    

function vis_forBoxGetHostname {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Output a vagrantfile using the sysChar BxO.
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]

    EH_assert [ ! -z "${box}" ]    

    local vmNameQualifier="$1"

    local hostname=""
    
    pathToArray ${box}

    set ${pathArray[@]}

    function nameSpace {
        if [ "$1" == "bxDistro" ] ; then
            echo "dist"
        else
            echo $1
        fi
    }

    function distroName {
        if [ "$1" == "debian-10.8" ] ; then
            echo "deb108"
        elif [ "$1" == "debian-11.pre" ] ; then
            echo "deb11pre"         
        elif [ "$1" == "ubuntu-20.04" ] ; then
            echo "ub2004"           
        else
            EH_problem "Unknown Distr=$1"
            echo ""
        fi
    }

    if [ ${#pathArray[@]} -eq 2 ] ; then
        hostname=$( nameSpace "${pathArray[0]}" )-$( distroName "${pathArray[1]}" )-"${vmNameQualifier}"
    else
        hostname=$( nameSpace "${pathArray[0]}" )-$( distroName "${pathArray[1]}" )-${pathArray[2]}-"${vmNameQualifier}"
    fi

    echo ${hostname}

    lpReturn
}


function vis_vagrantFile_stdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Output a vagrantfile using the sysChar BxO.
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -lt 2 ]]

    EH_assert [ ! -z "${box}" ]    

    local vmNameQualifier=""
    
    if [ $# -eq 0 ] ; then
        vmNameQualifier=""
    else
        vmNameQualifier="$1"
        shift
    fi

    local dateTag=$( date +%Y%m%d%H%M%S )

    local boxName="${box}-${vmNameQualifier}"

    local hostname=$( vis_forBoxGetHostname ${vmNameQualifier} )

    function topPart {
    cat  << _EOF_
# -*- mode: ruby -*-

# Vagrantfile for ${boxName} -- 
# Generated with ${G_myName}:${thisFunc} on $(hostname) at ${dateTag} -- Do Not Hand Edit
# 
# boxName=${boxName}
# 

# The "2" in Vagrant.configure is for configuration version. Don't change it.
Vagrant.configure("2") do |config|
  config.vm.define "${hostname}" do |guest|
    guest.vm.box = "${box}"
    guest.vm.hostname = "${hostname}"
    guest.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :libvirt do |libvirt|
      libvirt.driver = "kvm"
      libvirt.default_prefix = 'vag'  # Set a prefix for the machine different from dir name.

      libvirt.memory = ${vmParamRam}
      libvirt.cpus = ${vmParamCpus}

    end
    
    guest.disksize.size = "${vmParamDisk}"

_EOF_
    }
    
    topPart
    vis_vagrantFile_bottomPart ${boxName}
}


function vis_vagrantFile_bottomPart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Output a vagrantfile using the sysChar BxO.
_EOF_
                       }
    local thisFunc=${G_thisFunc}
    EH_assert [[ $# -eq 1 ]]

    local boxName="$1"

    function baseContainer {
    cat  << _OUTER_EOF_

    ## SHELL PROVISIONING
    guest.vm.provision "shell", inline: <<-_EOF_MainRootShell_
       set -x

      cat  << _EOF_
 ######### PHASE 2: Cleanup and Shutdown  -- Running As Root
_EOF_
      
      shutdown now
      exit 0

_EOF_MainRootShell_
  end
end

_OUTER_EOF_
    }

    baseContainer
}


function vis_vagrantFile_run {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]    
    EH_assert [ ! -z "${bpoId}" ]

    EH_assert  vis_bxoAcctVerify "${bpoId}"

    local dirsPart=$( FN_dirsPart $(vis_vagrantFile_path) )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    echo ${vmsDirsList}
    for thisDir in ${vmsDirsList} ; do
        echo $(pwd)/${thisDir}
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    lpDo cd ${thisDir}

    lpDo eval vis_vagrantFile_stdout ${nextNu} $@ \> Vagrantfile

    lpDo pwd

    lpDo vagrant up
    
    lpReturn
}       


function vis_vagrantBoxesBasePathCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${box}" ]

    local vagrantBoxesBasePath="/var/vagrantBoxesBase"
    
    if [ -d "${vagrantBoxesBasePath}" ] ; then
        echo "/var/vagrantBoxesBase"
        lpReturn
    fi

     if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    lpDo FN_dirCreatePathIfNotThere "${vagrantBoxesBasePath}"

    lpDo chmod 777 "${vagrantBoxesBasePath}" # NOTYET, revisit

    echo "/var/vagrantBoxesBase"
    
    lpReturn
}       


function vis_vagrantFile_path {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Returns stdout path to Vagrantfile's base directory of the bpoHome.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${box}" ]

    local vagrantBoxesBasePath=$( vis_vagrantBoxesBasePathCreate )
    EH_assert [ ! -z "${vagrantBoxesBasePath}" ]    

    local thisBoxBasePath="${vagrantBoxesBasePath}/${box}"
    
    lpDo FN_dirCreatePathIfNotThere "${thisBoxBasePath}"

    echo ${thisBoxBasePath}/Vagrantfile
                                                    
    lpReturn
}       


function vis_vagrantFile_run {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on the Vagrantfile, create a VM image.
NAT + genesis target.
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ ! -z "${box}" ]

    local dirsPart=$( FN_dirsPart $(vis_vagrantFile_path) )
    EH_assert [ ! -z "${dirsPart}" ]
    
    local thisDir=""

    opDoExit cd ${dirsPart}    
    local vmsDirsList=$( ls | grep -v Vagrantfile | grep -v bxo | grep -v history | sort -n )

    echo ${vmsDirsList}
    for thisDir in ${vmsDirsList} ; do
        echo $(pwd)/${thisDir}
    done

    nextNu=$( expr ${thisDir} +  1 )
    opDoExit mkdir ${nextNu}
    thisDir=${nextNu}

    lpDo cd ${thisDir}

    lpDo eval vis_vagrantFile_stdout ${nextNu} $@ \> Vagrantfile

    lpDo pwd

    lpDo vagrant up
    
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
