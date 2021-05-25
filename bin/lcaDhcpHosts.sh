#!/bin/osmtKsh
#!/bin/osmtKsh

typeset RcsId="$Id: lcaDhcpHosts.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"

# Don't delete the line below. With KSH it makes things work. Puzzle. Mohsen.
#echo " "

if [ "${loadFiles}X" == "X" ] ; then
  seedActions.sh -l $0 "$@"
  exit $?
fi


function vis_examples {

#${visLibExamples}
 cat  << _EOF_
EXAMPLES:
--- Server BinsPrep ---
${G_myName} -e "Install" -i runFunc apt-get install dhcp3-server
${G_myName} -e "Check Status" -i runFunc dpkg -l dhcp3-server
${G_myName} -e "Check Status" -i runFunc dpkg -l dhcp3-common
--- Client BinsPrep ---
${G_myName} -e "Install" -i runFunc apt-get install dhcp3-client
${G_myName} -e "Check Status" -i runFunc dpkg -l dhcp3-client
${G_myName} -e "Check Status" -i runFunc dpkg -l dhcp3-common
--- Full Actions ---
${G_myName} -e "Full Update" -i runFunc echo "NOTYET"
--- Server Enable/Disable ---
${G_myName} -e "STOP" -i runFunc /etc/init.d/dhcp3-server stop
${G_myName} -e "START" -i runFunc /etc/init.d/dhcp3-server start
--- Server Config File ---
${G_myName} -n showRun -e "Config File Gen" -i dhcp3ServerConfigOutput
${G_myName} -n showRun -e "Config File Install" -i dhcp3ServerConfigUpdate
${G_myName} -n showRun -e "Config File Show Current" -i dhcp3ServerConfigShow
${G_myName} -n showRun -e "Defaults File Show Current" -i dhcp3ServerDefaultsShow
--- Client Examples ---
${G_myName} -e "WARNING: may CHANGE IP Addr" -i runFunc dhclient3 -d -w -n eth0
--- Log Files ---
${G_myName} -e "Server Logs" -i runFunc grep dhcpd /var/log/syslog
${G_myName} -e "Client Logs" -i runFunc grep dhclient /var/log/syslog
--- Help and Documentation ---
${G_myName} -e "Documentation/Help" -i runFunc man dhcpd3
_EOF_
}

noArgsHook() {
  vis_examples
}

function vis_help {
 cat  << _EOF_

_EOF_
}

dhcp3ServerConfigFile="/etc/dhcp3/dhcpd.conf"
dhcp3ServerDefaultsFile="/etc/default/dhcp3-server"

DEVICE=eth0

function vis_dhcp3ServerConfigShow {
 opDoComplain cat  ${dhcp3ServerConfigFile}
}

function vis_dhcp3ServerDefaultsShow {
 opDoComplain cat  ${dhcp3ServerDefaultsFile}
}


function vis_dhcp3ServerConfigUpdate {

  if [ "${opRunHostName}_" == "_zanjan" ] ; then
      EH_problem "$0 not supported on ${opRunHostName}"
      exit 1
  fi

  opDoComplain FN_fileDefunctMake ${dhcp3ServerConfigFile} ${dhcp3ServerConfigFile}.notUsed.${dateTag}

  opDoComplain vis_dhcp3ServerConfigOutput > ${dhcp3ServerConfigFile}
  opDoComplain chown root:root ${dhcp3ServerConfigFile}
  opDoComplain chmod 644  ${dhcp3ServerConfigFile}


  opDoComplain FN_fileDefunctMake ${dhcp3ServerDefaultsFile} ${dhcp3ServerDefaultsFile}.notUsed.${dateTag}

  echo "INTERFACES=\"$DEVICE\"" > ${dhcp3ServerDefaultsFile}
  opDoComplain chown root:root ${dhcp3ServerDefaultsFile}
  opDoComplain chmod 644  ${dhcp3ServerDefaultsFile}

}

validip(){
echo "$1" | egrep -q -e '[0-9]+\.[0-9]+\.[0-9]+.[0-9]+'
return $?
}

vis_dhcp3ServerConfigOutput(){

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

  host dezful {
    hardware ethernet 00:08:C7:B9:4A:2B; # boxname=dezful
    fixed-address 192.168.0.222;
  }

  host prsamsung {
    hardware ethernet 00:00:F0:AC:5B:AA; # boxname=samsung color printer
    fixed-address 192.168.0.101;
  }


  host dell1710n {
    hardware ethernet 00:04:00:AD:31:C5; 
    fixed-address 192.168.0.226;
  }

  host rakhsh {
    hardware ethernet 00:04:75:17:3D:B5; 
    fixed-address 192.168.0.125;
  }

  host jolfa {
    hardware ethernet 00:1A:A0:10:B3:E8; 
    fixed-address 192.168.0.129;
  }

  host birjand {
    hardware ethernet 00:15:C5:7B:6A:45; 
    fixed-address 192.168.0.130;
  }

  host shaad {
    hardware ethernet 00:04:75:17:3D:B8; 
    fixed-address 192.168.0.131;
  }

  host maku {
    hardware ethernet 00:04:75:17:3D:B9; 
    fixed-address 192.168.0.132;
  }

  host birjandWifi {
    hardware ethernet 00:1B:FC:90:A3:D0;  # Dell Laptop Mohsen Wifi
    fixed-address 192.168.0.133;
  }

  host n810Wifi1 {
    hardware ethernet 00:1D:6E:D4:29:97;
    fixed-address 192.168.0.134;
  }

  host n810Wifi2 {
    hardware ethernet 00:1D:6E:D5:BE:92;
    fixed-address 192.168.0.135;
  }

  host bue0005 {
    hardware ethernet 00:15:C5:A4:A8:8D; # Dell Laptop Darshi Wired
    fixed-address 192.168.0.136;
  }

  host bue0005Wifi {
    hardware ethernet 00:16:CE:8E:C3:EB;  # Dell Laptop Darshi Wifi
    fixed-address 192.168.0.137;
  }

  host bmue0001 {
    hardware ethernet 00:22:15:0E:8B:82;  # ASUS Netbook Darshi Wired
    fixed-address 192.168.0.138;
  }

  host bmue0001Wifi {
    hardware ethernet 00:15:AF:B4:E3:84;   # ASUS Netbook Darshi Wifi
    fixed-address 192.168.0.139;
  }


  host bmue0003 {
    hardware ethernet 00:22:15:13:49:25;  # ASUS Netbook Mohsen Wired
    fixed-address 192.168.0.140;
  }

  host bmue0003Wifi {
    hardware ethernet 00:15:AF:B6:0D:AD;   # ASUS Netbook Mohsen Wifi
    fixed-address 192.168.0.141;
  }


  host bue0010 {
    hardware ethernet e8:11:32:2d:3c:0c; # Samsung Laptop Wired Box0031
    fixed-address 192.168.0.142;
  }

  host bue0010Wifi {
    hardware ethernet b4:74:9f:6b:82:02;  # Samsung Laptop Wifi Box0031
    fixed-address 192.168.0.143;
  }

  host precordm001 {
    hardware ethernet 2c:cd:27:00:16:ac;  # Precor DM6467
    fixed-address 192.168.0.144;
  }

  host precoromap001 {
    hardware ethernet 06:2f:0c:ce:71:83;  # Precor Omap
    fixed-address 192.168.0.145;
  }

  # host bue0011  192.168.0.146 at precor
  # host bue0011Wifi  192.168.0.147 at precor

  host bue0012 {
    hardware ethernet e8:11:32:3d:2c:89; # Samsung Laptop (Maryam) Wired Box????
    fixed-address 192.168.0.148;
  }

  host bue0012Wifi {
    hardware ethernet b4:74:9f:6c:8f:7c;  # Samsung Laptop (Maryam) Wifi Box????
    fixed-address 192.168.0.149;
  }

  host precordm002 {
    hardware ethernet 2c:cd:27:00:0b:59;  # Precor DM6467
    fixed-address 192.168.0.150;
  }

  host precoromap002 {
    hardware ethernet ff:2f:0c:ce:71:ff;  # Precor Omap
    fixed-address 192.168.0.151;
  }

  host bue0013 {
    hardware ethernet c8:60:00:36:4c:58; # Asus Laptop Wired Box0034
    fixed-address 192.168.0.152;
  }

  host bue0013Wifi {
    hardware ethernet c0:18:85:1f:24:68;  # Asus Laptop Wifi Box0034
    fixed-address 192.168.0.153;
  }

  host babol {
    hardware ethernet 08:00:20:8F:F7:23; # boxname=babol
    fixed-address 192.168.0.227;
    
    filename "/tftpboot/sarge/sun4u.img";
    server-name "zanjan";
  }

  host saam {
    hardware ethernet 08:00:20:80:C8:5A; # boxname=saam
    fixed-address 192.168.0.228;
    
    filename "/tftpboot/sarge/sun4u.img";
    server-name "zanjan";
  }

  host arak {
    hardware ethernet 08:00:20:82:D2:9D; # boxname=arak
    fixed-address 192.168.0.229;
    
    filename "/tftpboot/sarge/sun4u.img";
    server-name "zanjan";
  }

  host manna {
    hardware ethernet 08:00:20:22:85:DD; 
    fixed-address 192.168.0.230;
    
    filename "/tftpboot/sarge/sun4m.img";
    server-name "zanjan";
  }

  host arash {
    hardware ethernet 08:00:20:20:0C:ED; 
    fixed-address 192.168.0.231;
    
    filename "/tftpboot/sarge/sun4m.img";
    server-name "zanjan";
  }

  host gorz {
    hardware ethernet 08:00:20:74:93:12; 
    fixed-address 192.168.0.232;
    
    filename "/tftpboot/sarge/sun4m.img";
    server-name "zanjan";
  }

  host majnoon {
    hardware ethernet 08:00:20:21:A8:AC; 
    fixed-address 192.168.0.233;
    
    filename "/tftpboot/etch/sun4m.img";
    server-name "zanjan";
  }

  host tahmineh {
    hardware ethernet 08:00:20:7A:3D:3A; 
    fixed-address 192.168.0.236;
    
    filename "/tftpboot/sarge/sun4m.img";
    server-name "zanjan";
  }

}
EOT
}

