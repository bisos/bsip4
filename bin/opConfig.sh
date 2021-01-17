#!/bin/bash

if [ "${OSMTROOT}X" == "X" ] ; then
    typeset currDir=`dirname $0`
    if [[ "${currDir}_" == "._" ]] ; then 
      currDir=`pwd`
    fi
    export OSMTROOT=${currDir%/bin}
fi

export opBase=${OSMTROOT}

export opVarBase=/var/osmt

export mmaBase=/opt/public/mma

export mmaSrcBase=/opt/public/mmaSrc

export mmaPkgBase=/opt/public/mmaPkgs

export adoptedSrcBase=/opt/public/src

export adoptedPkgBase=/opt/public/pkgs

# set-u fix
#PATH="${opBinBase}:${mmaBinDistBase}/bin:${mmaEzmlmBinDistBase}:${PATH}"

function opRunEnvOutputGeneric {
  opRunSiteName=genericSite
  opRunClusterName=genericCluster
  opRunHostMode=standalone
  opRunHostName=`uname -n`
  opRunOsType=`uname -s`
  opRunOsRev=`uname -r`
  opRunMachineArch=`uname -m`
  opRunParamStandalone=strict
  opRunDomainName=genericDomain

  vis_opRunDistFamilySet > /dev/null  
  
  cat  << _EOF_  
# THIS FILE MACHINE GENERATED with ${G_myName} and $0
opRunSiteName=${opRunSiteName}
opRunClusterName=${opRunClusterName}
opRunDomainName=${opRunDomainName}
opRunHostName=${opRunHostName}
opRunHostFamily=BUE
opRunHostFamilyTag=00
opRunHostMode=${opRunHostMode}
# Read Only Parameters
opRunOsType=${opRunOsType}
opRunOsRev=${opRunOsRev}
opRunMachineArch=${opRunMachineArch}
# Hostwide Parameters
opRunParamStandalone=${opRunParamStandalone}
opRunDistFamily=${opRunDistFamily}
opRunDistGeneration=${opRunDistGeneration}
opRunDistGenNu=${opRunDistGenNu}
BoxName=box00
bxpDistGeneration=bx3
bxpSwProfile=bx2IoC
bxpVirtGuestType=unknown
bxpVirtHostFqdn=none
bxpVirtHostIpAddr=none
_EOF_
}


vis_opRunDistFamilySet () {

  opRunDistFamily="UNKNOWN"
  
  if grep buntu /etc/issue ; then
    opRunDistFamily="UBUNTU"
  elif grep "Debian GNU/Linux" /etc/issue ; then
    opRunDistFamily="DEBIAN"
 elif grep "maemo" /etc/issue ; then
    opRunDistFamily="MAEMO"
 elif grep "Red Hat" /etc/issue ; then
    opRunDistFamily="REDHAT"
 elif grep "Solaris" /etc/issue ; then
    opRunDistFamily="SOLARIS"
  else
    opRunDistFamily="UNSUPPORTED"
  fi

  opRunDistGeneration="UNKNOWN"
  case ${opRunDistFamily} in
    "UBUNTU")
	      if grep "6.10" /etc/issue ; then
		opRunDistGeneration="EDGY"
		opRunDistGenNu="6.10"
	      elif grep "14.04" /etc/issue ; then  # LTS
		opRunDistGeneration="1404"
		opRunDistGenNu="14.04"
	      elif grep "Xenial" /etc/issue ; then  # LTS
		opRunDistGeneration="1604"
		opRunDistGenNu="16.04"
	      elif grep "16.04" /etc/issue ; then  # LTS
		opRunDistGeneration="1604"
		opRunDistGenNu="16.04"
	      elif grep "Beaver" /etc/issue ; then  # LTS
		opRunDistGeneration="1804"
		opRunDistGenNu="18.04"
	      elif grep "18.04" /etc/issue ; then  # LTS
		opRunDistGeneration="1804"
		opRunDistGenNu="18.04"
	      elif grep "Focal" /etc/issue ; then  # LTS
		opRunDistGeneration="2004"
		opRunDistGenNu="20.04"
	      elif grep "20.04" /etc/issue ; then  # LTS
		opRunDistGeneration="2004"
		opRunDistGenNu="20.04"
	      else
		opRunDistGeneration="UNSUPPORTED"
		opRunDistGenNu="UNSUPORTED"
	      fi
       ;;
    "DEBIAN")
	  # NOTYET -- use lsb_release -i or /etc/os-release ... instead
	      if grep "3.1" /etc/issue ; then
		opRunDistGeneration="SARGE"
		opRunDistGenNu="3.1"
	      elif grep "7.0" /etc/issue ; then
		opRunDistGeneration="7"
		opRunDistGenNu="7.0"
	      elif grep "10" /etc/issue ; then
		opRunDistGeneration="10"
		opRunDistGenNu="10"
	      else
		opRunDistGeneration="UNSUPPORTED"
		opRunDistGenNu="UNSUPORTED"
	      fi
       ;;
    "REDHAT")
	     opRunDistGeneration="UNSUPPORTED"
       ;;
    "UNKNOWN")
	       opRunDistGeneration="UNSUPPORTED"
       ;;
    "UNSUPPORTED")
		   opRunDistGeneration="UNSUPPORTED"
       ;;
    *)
       opRunDistGeneration="UNSUPPORTED"
	EH_oops ;
       return
       ;;
  esac


}



if [[ -f /etc/osmtInfo ]] ; then
    opRunEnvStoreFile=/etc/osmtInfo
else
  if [[ "${CURENVBASE}_" == "_" ]] ; then
    opRunEnvOutputGeneric | sudo tee /etc/osmtInfo
    opRunEnvStoreFile=/etc/osmtInfo
    echo "Using the generic ${opRunEnvStoreFile}"
  else
    if [[ -f ${CURENVBASE}/tools/osmtInfo ]] ; then 
      opRunEnvStoreFile=${CURENVBASE}/tools/osmtInfo
    else
      opRunEnvOutputGeneric > ${CURENVBASE}/tools/osmtInfo
      opRunEnvStoreFile=${CURENVBASE}/tools/osmtInfo
      echo "Using the generic ${opRunEnvStoreFile}"
    fi
  fi
fi
