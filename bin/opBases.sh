#
# Mon 06 Sep 2021 06:18:01 PM PDT -- NOTYET, This File Should Be Revisitied Soon
# It needs to be updated to refelct /bisos/core/bsip.
#
# Assumes the following configuration 
# Basic variables
#

#set -x

#    opBase       -- Where osmt package is

if [ "${opBase}_" == "_" ] ; then
  if test -d /opt/public/osmt ; then
    opBase=/opt/public/osmt
  else
    echo "opBase not set"
    exit 1
  fi
fi

opBinBase=${opBase}/bin
opLibBase=${opBase}/lib
opManBase=$/opt/public/osmt/bin/seedSubjectAction.sh{opBase}/man
opSiteControlBase=${opBase}/siteControl
opSysConfigInputBase=${opBase}/sysConfigInput
opPoliciesBase=${opBase}/policies

palsBinBase="/bisos/pals/bin"
lcntBinBase="/bisos/core/lcnt/bin"
mailBinBase="/bisos/asc/mail/bin"
dnsBinBase="/bisos/asc/dns/bin"
bedrockBinBase="/bisos/asc/bedrock/bin"

#    opVarBase    -- Where files that grow live

if [ "${opVarBase}_" == "_" ] ; then
  if test -d /var/osmt ; then
    opVarBase=/var/osmt
  else
    echo "opVarBase not set"
    exit 1
  fi
fi

opLogBase=${opVarBase}/log
opSpoolBase=${opVarBase}/spool
opKeepBase=${opVarBase}/keep


#    mmaBase    --  bin/doc/man/lib/etc/... for immediate mmaUse

if [ "${mmaBase}_" == "_" ] ; then
  if test -d /opt/public/mma ; then
    mmaBase=/opt/public/mma
  else
    echo "mmaBase not set"
  fi
fi


#    mmaSrcBase    -- Sources that we consider part of mma

if [ "${mmaSrcBase}_" == "_" ] ; then
  if test -d /opt/public/mmaSrc ; then
    mmaSrcBase=/opt/public/mmaSrc
    mmaUeSrcBase=/opt/public/mmaUeSrc
  else
    mmaSrcBase=""
    echo "mmaSrcBase not set"
  fi
fi

#    mmaPkgBase    -- Result of mmaSrcBase in package form

if [ "${mmaPkgBase}_" == "_" ] ; then
  if test -d /opt/public/mmaPkgs ; then
    mmaPkgBase=/opt/public/mmaPkgs
  else
    mmaPkgBase=""
    echo "mmaPkgBase not set"
  fi
fi

# set-u fix
mmaUePkgBase=""
if [ "${mmaUePkgBase}_" == "_" ] ; then
  if test -d /opt/public/mmaUePkgs ; then
    mmaUePkgBase=/opt/public/mmaUePkgs
  else
    mmaUePkgBase=""
    #echo "mmaUePkgBase not set"
  fi
fi

#    adoptedSrcBase    -- Sources that we use

if [ "${adoptedSrcBase}_" == "_" ] ; then
  if test -d /opt/public/src ; then
    adoptedSrcBase=/opt/public/src
  else
    adoptedSrcBase=""
    echo "adoptedSrcBase not set"
  fi
fi


#    adoptedPkgBase    -- 

if [ "${adoptedPkgBase}_" == "_" ] ; then
  if test -d /opt/public/pkgs ; then
    adoptedPkgBase=/opt/public/pkgs
  else
    adoptedPkgBase=""
    echo "adoptedPkgBase not set"
  fi
fi


####


lpBaseDir_mapfiles="OBSOLEDTED_MAPFILES"                              # /libre/vc/mapFiles
lpBaseDir_lsip="/bisos/core/bsip"                               # /libre/vc/lsip
lpBaseDir_blee="/bisos/blee"                                # /libre/vc/ble
lpBaseDir_lcnt="/de/bx/lcnt"                                          # /libre/vc/lcnt
lpBaseDir_bystar="OBSOLTED_BYSTAR"                                # /libre/vc/bystar
lpBaseDir_bystarCentral="OBSOLTED_BYSTAR_CENTRAL"                # /libre/vc/bystar/central
lpBaseDir_bystarTemplates="OBSOLETED_BYSTAR_TEMPLATES"      # /libre/vc/bystar/central

lpAcct_user="bystar"                          #  
lpAcct_admin="bystar"                        #
lpAcct_bystarGroup="bisos"                 #

# set-u fix
Id=""


## NOTYET, JUNK, LEFTOVER
## 
#mmaBinDistBase=${mmaBase}
#mmaEzmlmBinDistBase=/opt/public/networking/mma/ezmlm/bin
#mmaSrcDistBase=${mmaSrcBase}
