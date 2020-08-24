#!/bin/bash

#
# This file is shared between ./provisionBisos.sh and /usr/local/bin/bisosProvision.sh
#

_CommentBegin_
****** TODO Add blee symlinks
****** TODO Add git clone auth as well
****** TODO Drive this for development
_CommentEnd_


currentUser=$(id -un)
currentUserGroup=$(id -g -n ${currentUser})


bx_platformInfoManage=$( which -a bx-platformInfoManage.py | grep -v venv | head -1 )


bisosUserName=""
bisosGroupName=""
    
rootDir_bisos=""
rootDir_bxo=""
rootDir_deRun=""

rootDir_provisioners=""

venvBasePy2=""
venvBasePy3=""


if [ -f "${bx_platformInfoManage}" ] ; then 
    bisosUserName=$( ${bx_platformInfoManage} -i pkgInfoParsGet | grep bisosUserName | cut -d '=' -f 2 )
    bisosGroupName=$( ${bx_platformInfoManage}  -i pkgInfoParsGet | grep bisosGroupName | cut -d '=' -f 2 )
    
    rootDir_bisos=$( ${bx_platformInfoManage}  -i pkgInfoParsGet | grep rootDir_bisos | cut -d '=' -f 2 )
    rootDir_bxo=$( ${bx_platformInfoManage}  -i pkgInfoParsGet | grep rootDir_bxo | cut -d '=' -f 2 )
    rootDir_deRun=$( ${bx_platformInfoManage} -i pkgInfoParsGet | grep rootDir_deRun | cut -d '=' -f 2 )        

    rootDir_provisioners=$( ${bx_platformInfoManage} -i pkgInfoParsGet | grep rootDir_provisioners | cut -d '=' -f 2 )

    venvBasePy2="${rootDir_provisioners}/venv/py2"
    venvBasePy3="${rootDir_provisioners}/venv/py3"    
fi


function vis_provisionBisosExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local provisionersBinBase="$( provisionersBinBaseGet )"

    
    cat  << _EOF_
$( examplesSeperatorChapter "BISOS Provisioning:: SelfReliant ICMs Invocations" )
$( examplesSeperatorSection "Sys Install Pythons And Pips And Sys Packages" )
${provisionersBinBase}/bisosSysPythonSetup.sh
${G_myName} ${extraInfo} -i pythonSysEnvPrepForVirtenvs
$( examplesSeperatorSection "Create Accounts" )
${provisionersBinBase}/bisosAccounts.sh
${G_myName} ${extraInfo} -i updateAccts
$( examplesSeperatorSection "Create BisosProv Virtenvs And Install Packages" )
${provisionersBinBase}/bisosProvisionersVenvSetup.sh
${G_myName} ${extraInfo} -i provisionersVenvPipInstalls
$( examplesSeperatorSection "Create /bisos Bases" )
${provisionersBinBase}/bisosBaseDirsSetup.sh
${G_myName} ${extraInfo} -i bisosBaseDirsSetup
$( examplesSeperatorSection "Anon Git Clone BxRepos" )
${provisionersBinBase}/bisosBaseDirsSetup.sh
${G_myName} ${extraInfo} -i provisionersGitReposAnonSetup   # Runs as sudo -u bisos 
$( examplesSeperatorChapter "Temporary OSMT Setup" )
$( examplesSeperatorSection "Run OSMT Genesis" )
${provisionersBinBase}/osmtBx2GenesisSelfcontained.sh
${G_myName} ${extraInfo} -i osmtGenesis baseIoC
${G_myName} ${extraInfo} -i osmtGenesis baseIoC atNeda
$( examplesSeperatorChapter "BISOS Bases Administration (/bisos/core)" )
$( examplesSeperatorSection "bisosBasesAdmin" )
_EOF_
}


function vis_provisionBystarAccts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local provisionersBinBase="$( provisionersBinBaseGet )"
	
    # /opt/bisosProvisioner/gitRepos/provisioners/bin/bisosSysPythonSetup.sh
    local bisosProg="${provisionersBinBase}/bisosSysPythonSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i pythonSysEnvPrepForVirtenvs
    fi
    
    lpReturn
}

function vis_provisionVenvPkgs {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local provisionersBinBase="$( provisionersBinBaseGet )"
	
    # /opt/bisosProvisioner/gitRepos/provisioners/bin/bisosProvisionersVenvSetup.sh
    local bisosProg="${provisionersBinBase}/bisosProvisionersVenvSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i fullUpdate
    fi
    
    lpReturn
}



function vis_provisionOsmtGenesis {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    local icmArgs="$@"

    local provisionersBinBase="$( provisionersBinBaseGet )"
	
    # /opt/bisosProvisioner/gitRepos/provisioners/bin/osmtBx2GenesisSelfcontained.sh
    local bisosProg="${provisionersBinBase}/osmtBx2GenesisSelfcontained.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else
	osmtBx2GenesisSelfcontained.sh -h -v -n showRun -r basic -i baseIoC            # Blee + Ability To Import Io
    	opDo sudo "${bisosProg}"  -h -v -n showRun -r basic -i $@
    fi
    
    lpReturn
}


# Use the rest till /bisos/bsip/xx is in place,
# if [ -f "${bisosBsipNotyet}" ] ; then
#     . ${something}
# fi
