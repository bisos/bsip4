#!/bin/bash

#
# This file is shared between ./provisionBisos.sh and /usr/local/bin/bisosProvision.sh
#

_CommentBegin_
_CommentEnd_

sysOS=${sysOS-}
sysDist=${sysDist-}
sysID=${sysID-}

function sysOS_detect {
  if [[ ( -z "${sysOS}" ) && ( -z "${sysDist}" ) ]]; then
    # some systems dont have lsb-release yet have the lsb_release binary and
    # vice-versa
    if [ -e /etc/lsb-release ]; then
      . /etc/lsb-release

      if [ "${sysID}" = "raspbian" ]; then
        sysOS=${sysID}
        sysDist=`cut --delimiter='.' -f1 /etc/debian_version`
      else
        sysOS=${DISTRIB_ID}
        sysDist=${DISTRIB_CODENAME}

        if [ -z "$sysDist" ]; then
          sysDist=${DISTRIB_RELEASE}
        fi
      fi

    elif [ -e /etc/debian_version ]; then
      # some Debians have jessie/sid in their /etc/debian_version
      # while others have '6.0.7'
      sysOS=`cat /etc/issue | head -1 | awk '{ print tolower($1) }'`
      if grep -q '/' /etc/debian_version; then
        sysDist=`cut --delimiter='/' -f1 /etc/debian_version`
      else
        sysDist=`cut --delimiter='.' -f1 /etc/debian_version`
      fi

    elif [ `which lsb_release 2>/dev/null` ]; then
      sysDist=`lsb_release -c | cut -f2`
      sysOS=`lsb_release -i | cut -f2 | awk '{ print tolower($1) }'`

    else
      unknown_sysOS
    fi
  fi

  if [ -z "$sysDist" ]; then
    unknown_sysOS
  fi

  # remove whitespace from SYSOS and sysDist name
  sysOS="${sysOS// /}"
  sysDist="${sysDist// /}"

  #echo "Detected operating system as $sysOS/$sysDist."
}

sysOS_detect

function sysOS_isDebian {
  if [ "${sysOS}" = "debian" ] ; then
    return 0
  else
    return 1
  fi
}

function sysOS_isDeb12 {
  if sysOS_isDebian ; then
    if  [ "${sysDist}" = "12" ] ; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}

function sysOS_isDeb11 {
  if sysOS_isDebian ; then
    if  [ "${sysDist}" = "11" ] ; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}

function bisosBinBaseGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local provisionersBinBase=""

    if [ -z "${bxp_rootDir_bisos}" ] ; then
        EH_problem "Blank bxp_rootDir_bisos"
        lpReturn 101
    elif [ -d "${bxp_rootDir_bisos}/core/bsip/bin" ] ; then
        provisionersBinBase="${bxp_rootDir_bisos}/core/bsip/bin"
    else
        EH_problem "Missing ${bxp_rootDir_bisos}/core/bsip/bin"
        lpReturn 101
    fi

    echo ${provisionersBinBase}
}

export export PATH="$( bisosBinBaseGet ):${PATH}"

function vis_bisosProvisionExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local bisosBinBase="$( bisosBinBaseGet )"
    
    cat  << _EOF_
$( examplesSeperatorChapter "BISOS Provisioning:: From /bisos/core/bsip/bin/bsipProvision_lib.sh" )
$( examplesSeperatorSection "BSIP Provision Targets" )
${G_myName} ${extraInfo} -i bsipProvision_sysBasePlatform    # Minimal Host or Guest plus Blee
$( examplesSeperatorSection "BISOS Accounts" )
${G_myName} ${extraInfo} -i provisionBisosAccts
$( examplesSeperatorSection "USG Account Bases" )
${G_myName} ${extraInfo} -i provisionUsgAcctBases
$( examplesSeperatorSection "Sys Essentials" )
${G_myName} ${extraInfo} -i provisionEssentials
$( examplesSeperatorSection "Emacs, Blee, PyEnv and VirtSys" )
${G_myName} ${extraInfo} -i provisionPySysSetup
${G_myName} ${extraInfo} -i provisionPyVenvSetup
${G_myName} ${extraInfo} -i provisionBasicBlee
${G_myName} ${extraInfo} -i provisionVirtSysSetup
${G_myName} ${extraInfo} -i provisionEmacsFromSrc
$( examplesSeperatorChapter "Un Do --- BSIP deBisosIfy -- Data Loss ALERT" )
${G_myName} ${extraInfo} -i bsipDeBisosIfy       # For regression testing and updating
${G_myName} ${extraInfo} -i bsipDeBxoIfy         # Explicitly remove /bxo -- ALERT
${G_myName} ${extraInfo} -i bsipFullDeBisosIfy   # Complete Re-Install -- Data Loss ALERT
_EOF_

    vis_fromBsipProvisionExamplesList
}

function vis_fromBsipProvisionExamplesList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    local bisosBinBase="$( bisosBinBaseGet )"
    local bisosProg="${bisosBinBase}/bsipProvision.sh"

    ${bisosProg} -i postSysBaseExamples
    
}

function vis_bsipProvision_sysBasePlatform {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"

    lpDo vis_provisionBisosAccts
    
    lpDo vis_provisionUsgAcctBases

    lpDo vis_provisionEssentials

    lpDo vis_provisionPySysSetup

    lpDo vis_provisionPyVenvSetup

    lpDo vis_provisionBasicBlee

    lpDo vis_provisionVirtSysSetup

    lpDo ${bisosBinBase}/bsipProvision.sh -h -v -n showRun -i sysBaseGeneralAugment
    
    lpDo echo skipping vis_provisionEmacsFromSrc

    lpDo echo obtain this containers bpoId

    lpDo echo then setup static ip addresses
}


function vis_provisionBisosAccts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bisosAccounts.sh
    local bisosProg="${bisosBinBase}/bisosAccounts.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else        
        opDo "${bisosProg}" -h -v -n showRun -i bisosAcctsProvisionSetup
    fi
    
    lpReturn
}

function vis_provisionUsgAcctBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/usgAcctManage.sh
    local bisosProg="${bisosBinBase}/usgAcctManage.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else        
        opDo "${bisosProg}" -h -v -n showRun -i provisionSetup
    fi
    
    lpReturn
}


function vis_provisionEssentials {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bisosSysEssentialsBinsPrep.sh
    local bisosProg="${bisosBinBase}/bisosSysEssentialsBinsPrep.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else
        opDo "${bisosProg}" -h -v -n showRun -i sysPreps
        opDo "${bisosProg}" -h -v -n showRun -i fullUpdate
    fi
    
    lpReturn
}

function vis_provisionBasicBlee {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bleeBinsPrep.sh
    local bisosProg="${bisosBinBase}/bleeBinsPrep.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else        
        opDo "${bisosProg}" -h -v -n showRun -i fullUpdate
    fi
    
    lpReturn
}

function vis_provisionPySysSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bisosPySysSetup.sh
    local bisosProg="${bisosBinBase}/bisosPySysSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else        
        opDo "${bisosProg}" -h -v -n showRun  -i pySys_provisionSetup
    fi
    
    lpReturn
}

function vis_provisionPyVenvSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bisosPyVenvSetup.sh
    local bisosProg="${bisosBinBase}/bisosPyVenvSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else        
        opDo "${bisosProg}" -h -v -n showRun  -i pyVenv_provisionSetup
    fi
    
    lpReturn
}

function vis_provisionVirtSysSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
        
    # /bisos/core/bsip/bin/bisosVirtSysSetup.sh
    local bisosProg="${bisosBinBase}/bisosVirtSysSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
        EH_problem "Missing ${bisosProg}"
        lpReturn 1
    else
        echo $PATH
        opDo "${bisosProg}" -h -v -n showRun  -i virtSys_provisionSetup
    fi
    
    lpReturn
}


function vis_osmtGenesis {
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

function vis_provisionEmacsFromSrc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
    
    opDo sudo -u bisos ${bisosBinBase}/lcaEmacsSrcBinsPrep.sh -v -n showRun -i srcFullBuild emacs27
        
    lpReturn
}


function vis_bsipFullDeBisosIfy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    lpDo echo "This Will DELETE ALL OF BISOS -- Are You Sure You Want To Proceed? Ctl-C To Abort:"
    read

    lpDo vis_bsipDeBxoIfy
    lpDo vis_bsipDeBisosIfy

    lpDo echo "Full Alert Should Come Here"

    lpReturn
}

function vis_bsipDeBisosIfy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    lpDo echo "Running as root. This Will DELETE ALL OF /bisos /de -- Are You Sure You Want To Proceed? Ctl-C To Abort:"
    read

    if userExists bystar ; then
        lpDo bisosAccounts.sh -h -v -n showRun -i usgAcctDelete bystar
        lpDo bisosAccounts.sh -h -v -n showRun -i bxoAcctDelete bxisoDelimiter
        lpDo bisosAccounts.sh -h -v -n showRun -i bisosGroupAcctDelete
    else
         echo "bystar account does not exists. You should run deBisosIfy not bsipDeBisosIfy"
    fi

    lpDo rm -r -f /de

    lpDo rm -r -f /bisos

    lpDo rm -r -f /opt/bisosProvisioner

    if sysOS_isDeb11 ; then
        lpDo pip3 uninstall --yes bisos.bashStandaloneIcmSeed bisos.provision
    fi

    lpReturn
}

function vis_bisosDeBxoIfy {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Primarily used for convenient regression testing.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo echo "This Will DELETE ALL OF /bxo -- Are You Sure You Want To Proceed? Ctl-C To Abort:"
    read

    lpDo rm -r -f /bxo
}
