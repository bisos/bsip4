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

. ${opBinBase}/l3_lib.sh 

function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo="-h"
  local defaultInterface=$( vis_defaultInterface )

    typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- Interfaces ---
${G_myName} -i defaultInterface # based on default route
${G_myName} -i givenInterfaceGetIPAddr ${defaultInterface}
${G_myName} -i ipLinkList
${G_myName} -i ipAddrList
${G_myName} -i ipAddrFindGivenThisNet 192.168.0
${G_myName} -i ipAddrGetGivenInterface ${defaultInterface}
${G_myName} -i ipAddrGetGivenInterface tun0
--- Interfaces ---
netstat -i
ifconfig -a
ifconfig eth0 down
ifconfig eth0 up
ifup -v -n eth0
ifup -v eth0
ifdown -v -n eth0
ifdown -v eth0
cat /etc/network/ifstate 
/etc/init.d/networking restart
--- IP Forwarding ---
${G_myName} -e "showCurrentState"  -i runFunc /sbin/sysctl net.ipv4.ip_forward  
${G_myName} ${extraInfo} -i ipForwardingShow
${G_myName} ${extraInfo} -i ipForwardingEnable
${G_myName} ${extraInfo} -i ipForwardingDisable
--- DHCP Client ---
ps -ef | grep dhcli
pkill dhcli
--- ROUTING ---
netstat -r
--- IPTABLES ---
iptables -L
iptables -t filter -n -L
iptables -t mangle -n -L
iptables -t nat -n -L
--- Misc ---
${G_myName} -i modProbeIpTables
${G_myName} -i ipTablesShow
--- LOGS AND REPORTS ---
lynx -dump "http://api.hostip.info/rough.php?ip=198.62.92.15"
traceroute ftp.uu.net | cut -d"(" -f2 | cut -d")" -f1 | xargs -i lynx -dump "http://api.hostip.info/rough.php?ip={}" | grep City
whois -h whois.radb.net 198.62.92
${G_myName} -i showLog
_EOF_
}

vis_help () {
  cat  << _EOF_
Human visibile administration and monitoring.
To see examples run:
${G_myName} -i examples
_EOF_
}

noArgsHook() {
    vis_examples
}


function vis_ipForwardingEnable {
   opDo cp /etc/sysctl.conf /etc/sysctl.conf.$$
   echo "net/ipv4/ip_forward=1" >> /etc/sysctl.conf
   opDo /sbin/sysctl -p /etc/sysctl.conf
    echo "Current Routing State Set To"
   opDo  cat /proc/sys/net/ipv4/ip_forward 
}

function vis_ipForwardingDisable {
   opDo cp /etc/sysctl.conf /etc/sysctl.conf.$$
   echo "net/ipv4/ip_forward=0" >> /etc/sysctl.conf
   opDo /sbin/sysctl -p /etc/sysctl.conf
    echo "Current Routing State Set To"
   opDo  cat /proc/sys/net/ipv4/ip_forward 
}

function vis_ipForwardingShow {
    echo "Current Routing State Set To"
    opDo cat /proc/sys/net/ipv4/ip_forward 
}

function vis_modProbeIpTables {
  opDo modprobe ip_tables
  lsmod | grep ip_tables
  return
}

function vis_ipTablesShow {
  opDo iptables -L
  return
}


function vis_showLog {
  opDo tail -100 /var/log/kern.log
  return
}

