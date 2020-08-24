
# Assumes the following configuration 
# Basic variables
#

#set -x

#    bsipBase       -- Where bsip package is

if [ "${bsipBase}" == "" ] ; then
  if test -d /bisos/core/bsip ; then
    bsipBase=/bisos/core/bsip
  else
    echo "bsipBase not set"
    exit 1
  fi
fi

bsipBinBase=${bsipBase}/bin
echo "ZZZ $bsipBinBase KKK"
bsipLibBase=${bsipBase}/lib
bsipManBase=${bsipBase}/man
bsipSiteControlBase=${bsipBase}/siteControl
bsipSysConfigInputBase=${bsipBase}/sysConfigInput
bsipPoliciesBase=${bsipBase}/policies

#    bsipVarBase    -- Where files that grow live

if [ "${bsipVarBase}_" == "_" ] ; then
  if test -d /var/osmt ; then
    bsipVarBase=/var/osmt
  else
    echo "bsipVarBase not set"
    exit 1
  fi
fi

bsipLogBase=${bsipVarBase}/log
bsipSpoolBase=${bsipVarBase}/spool
bsipKeepBase=${bsipVarBase}/keep

