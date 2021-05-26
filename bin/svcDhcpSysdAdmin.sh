#!/bin/bash

IimBriefDescription="lcaXxSysdAdmin.sh SysD (systemd) Daemon Admin"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaSambaSysdAdmin.sh,v 1.1 2016-11-25 05:31:42 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedAdminDaemonSysD.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedAdminDaemonSysD.sh]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/svcDhcpSysdAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedAdminDaemonSysD.sh -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- BxPanels  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  BxPanel      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/servicesManage/bxSupervision/systemd/fullUsagePanel-en.org::Xref-][Systemd Panel]] [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  BxPanel      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/samba/fullUsagePanel-en.org::Xref-][Samba Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  SysD         :: BISOS Customizations [[elisp:(org-cycle)][| ]]
    Based on the generic SysD (systemd) init daemon Start/Stop/Restart.
    This facility only manages the start/stop of daemon.

_EOF_
}

function vis_describe { vis_moduleDescription; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Parameters    :: SysD (systemd) Daemon Parameter Settings [[elisp:(org-cycle)][| ]]
_CommentEnd_


daemonName="dhcp"
daemonsServiceName=(
    "isc-dhcp-server"
    # "isc_dhcp_server6"
)
daemonControlScript="/etc/init.d/${daemonName}"

serviceDefaultFile="/etc/default/isc-dhcp-server"

# /etc/dhcp/
daemonConfigDir="/etc/dhcp"
daemonConfigFile="${daemonConfigDir}/$dhcpd.conf"

# /var/log
daemonLogDir="/var/log"
# /var/log
daemonLogFile="${daemonLogDir}/syslog"
daemonLogErrFile="${daemonLogDir}/syslog"

dhcpV4PidFile="/var/run/dhcpd.pid"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Customized Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

#$( examplesSeperatorSection "Section Title" )

  visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
_EOF_

  vis_examplesFullService
  vis_examplesDaemonControl


  cat  << _EOF_
$( examplesSeperatorChapter "Server Config" )
_EOF_
  
  vis_examplesServerConfig

  vis_examplesLogInfo

 cat  << _EOF_
$( examplesSeperatorChapter "Misc -- Validation and Testing" )
---- CONFIGURE ----
${G_myName} ${extraInfo} -i serverConfigStdout here
${G_myName} ${extraInfo} -i serverConfigUpdate here
${G_myName} ${extraInfo} -i serverConfigShow
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Full Operations" )
${G_myName} ${extraInfo} -i fullUpdate    # Applies to both physical and virtual systems
( examplesSeperatorChapter "Step By Step Preps" )
--- Server Enable/Disable ---
${G_myName} -e "STOP" -i runFunc /etc/init.d/dhcp-server stop
${G_myName} -e "START" -i runFunc /etc/init.d/dhcp-server start
--- Server Config File ---
${G_myName} -n showRun -e "Config File Gen" -i dhcpServerConfigOutput
${G_myName} -n showRun -e "Config File Install" -i dhcpServerConfigUpdate
( examplesSeperatorChapter "Name Or Visit Service Files" )
cat ${dhcpV4ServerConfigFile}  # dhcpV4ServerConfigFile
cat ${dhcpV4ServerDefaultFile} # dhcpV4ServerDefaultFile
cat ${dhcpV4PidFile} # dhcpV4PidFile
${G_myName} -n showRun -e "Config File Show Current" -i dhcpServerConfigShow
${G_myName} -n showRun -e "Defaults File Show Current" -i dhcpServerDefaultsShow
--- Client Examples ---
${G_myName} -e "WARNING: may CHANGE IP Addr" -i runFunc dhclient3 -d -w -n eth0
--- Log Files ---
${G_myName} -e "Server Logs" -i runFunc grep dhcpd /var/log/syslog
${G_myName} -e "Client Logs" -i runFunc grep dhclient /var/log/syslog
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  serverConfig  :: serverConfigUpdate Overwrites [[elisp:(org-cycle)][| ]]
_CommentEnd_

#
# NOTE WELL: vis_serverConfigUpdate overwrites the seed
#

function vis_serverConfigUpdate {
    return
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
    # seed Overwrite
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    typeset thisConfigFile=${serviceDefaultFile}

    typeset thisDateTag=`date +%y%m%d%H%M%S`

    FN_fileSafeCopy ${thisConfigFile} ${thisConfigFile}.${thisDateTag}

    opDo FN_textReplace "^ENABLED=\"false\"" "ENABLED=true" ${thisConfigFile}
    opDo FN_textReplace "^CELERYD_CHDIR=\/opt\/celery\/project\/" "CELERYD_CHDIR=/de/bx/nne/dev-py/iimsPkgs/celeryFirst" ${thisConfigFile}
    opDo FN_textReplace "^CELERYD_CHDIR=\"\/opt\/Myproject\/\"" "CELERYD_CHDIR=\"/de/bx/nne/dev-py/iimsPkgs/celeryFirst\"" ${thisConfigFile}
    opDo FN_textReplace "^CELERY_APP=tasks"  "CELERY_APP=tasks" ${thisConfigFile}

    opDo chmod go+r ${thisConfigFile}
    opDo ls -ldt ${thisConfigFile}
    opDo diff  ${thisConfigFile} ${thisConfigFile}.${thisDateTag}

    opDo /etc/init.d/${daemonName} restart

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  setConfigFile :: NOTYET, Unprocessed [[elisp:(org-cycle)][| ]]
_CommentEnd_


function do_setConfigFile {

  echo  "About to configure Samba configuration"
  continueAfterThis

  subjectValidatePrepare

  typeset configTemplate="/usr/share/samba/smb.conf"
  typeset sambaConfigFile="/etc/samba/smb.conf"

  EH_assert [[ -e ${configTemplate} ]]

  FN_fileSafeKeep ${sambaConfigFile}

  opDo cp ${configTemplate} ${sambaConfigFile}

  opDo FN_textReplace "workgroup = DEBIAN_FANS$" "workgroup =  ${iv_sambaHost_workgroup}" ${sambaConfigFile}

  opDo FN_textReplace "^;   security = user$" "security = ${iv_sambaHost_security}" ${sambaConfigFile}

  if [[ "${iv_sambaHost_shareDirsRef[@]}_" != "_" ]] ; then
    typeset oneRef
    for oneRef in ${iv_sambaHost_shareDirsRef[@]}; do
      ${oneRef} >> ${sambaConfigFile}
    done
  fi
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Repos Prep    :: Create/Update Repositories and SymLinks [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_reposPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
/dd/this/a/6/samba/anon
/dd/this/a/6/samba/auth
/samba/anon
/samba/auth
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset sambaBaseRepo=$1

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;    

    opDo FN_dirCreatePathIfNotThere ${sambaBaseRepo}/samba
    opDo FN_dirCreatePathIfNotThere ${sambaBaseRepo}/samba/anon
    opDo chmod 777 ${sambaBaseRepo}/samba/anon
    opDo FN_dirCreatePathIfNotThere ${sambaBaseRepo}/samba/auth
    opDo chmod 777 ${sambaBaseRepo}/samba/auth

    opDo FN_dirCreatePathIfNotThere /samba

    opDo FN_fileSymlinkUpdate ${sambaBaseRepo}/samba/anon /samba/anon
    opDo FN_fileSymlinkUpdate ${sambaBaseRepo}/samba/auth /samba/auth    
    
    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  verifys       :: Basic Verfications and Tests --  vis_visitUrl [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_visitUrl {
    lpReturn
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisUrl="http://localhost/git-daemon"

    #opDo bx-browse-url.sh -i openUrlNewTab ${thisUrl}
 
    echo ${thisUrl}

    lpReturn
}


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


dhcpV4ServerConfigFile="/etc/dhcp/dhcpd.conf"
dhcpV4ServerDefaultFile="/etc/default/isc-dhcp-server"
dhcpV4PidFile="/var/run/dhcpd.pid"

DEVICE=eth0

function vis_dhcpServerConfigShow {
 opDoComplain cat  ${dhcpServerConfigFile}
}

function vis_dhcpServerDefaultsShow {
 opDoComplain cat  ${dhcpServerDefaultsFile}
}


function vis_dhcpServerConfigUpdate {

  if [ "${opRunHostName}_" == "_zanjan" ] ; then
      EH_problem "$0 not supported on ${opRunHostName}"
      exit 1
  fi

  opDoComplain FN_fileDefunctMake ${dhcpServerConfigFile} ${dhcpServerConfigFile}.notUsed.${dateTag}

  opDoComplain vis_dhcpServerConfigOutput > ${dhcpServerConfigFile}
  opDoComplain chown root:root ${dhcpServerConfigFile}
  opDoComplain chmod 644  ${dhcpServerConfigFile}


  opDoComplain FN_fileDefunctMake ${dhcpServerDefaultsFile} ${dhcpServerDefaultsFile}.notUsed.${dateTag}

  echo "INTERFACES=\"$DEVICE\"" > ${dhcpServerDefaultsFile}
  opDoComplain chown root:root ${dhcpServerDefaultsFile}
  opDoComplain chmod 644  ${dhcpServerDefaultsFile}

}

validip(){
echo "$1" | egrep -q -e '[0-9]+\.[0-9]+\.[0-9]+.[0-9]+'
return $?
}

vis_dhcpServerConfigOutput(){

# Taken liberally from knoppix-terminalserver 

NETWORK=192.168.0
NETMASK=255.255.255.0

IPRANGE_FROM="192.168.0.161"
IPRANGE_TO="192.168.0.169"

EH_assert validip "$IPRANGE_FROM"
EH_assert validip "$IPRANGE_TO"

#ALLNAMESERVERS="64.8.192.9, 192.168.0.126"
#ALLNAMESERVERS="66.93.87.2, 216.231.41.2, 192.168.0.126"
ALLNAMESERVERS="66.93.87.2, 192.168.0.126"

ALLGATEWAYS="192.168.0.220"
#ALLGATEWAYS="192.168.0.22"

IP=`mmaLayer3Admin.sh -i runFunc givenInterfaceGetIPAddr eth0`

# Generate dhcpd.conf from template
# Borrowed  lots of code from knoppix

cat <<EOT
# dhcpd.conf Auto Generated by OSMT

# global settings
allow booting;
allow bootp;
default-lease-time 600;
max-lease-time 7200;

subnet ${NETWORK}.0 netmask ${NETMASK} {
  next-server $IP;
  if substring (option vendor-class-identifier, 0, 9) = "Etherboot" { filename "etherboot.nbi"; }
  else { filename "pxelinux.0"; }
  option subnet-mask ${NETMASK};
  range ${IPRANGE_FROM} ${IPRANGE_TO};
  ${ALLNAMESERVERS:+option domain-name-servers $ALLNAMESERVERS;}
  ${ALLGATEWAYS:+option routers $ALLGATEWAYS;}

  host aladdin {
    hardware ethernet 00:0F:B5:8F:67:C5; # boxname=kerman
    #fixed-address 192.168.0.107;
    fixed-address 192.168.0.108;
  }

}
EOT
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

