
function vis_defaultInterface {
    EH_assert [[ $# -eq 0 ]]
    ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)'
}

function vis_defaultIPAddr {
    EH_assert [[ $# -eq 0 ]]
    local defaultInterface=$( vis_defaultInterface )
    local defaultIPAddr=$( vis_givenInterfaceGetIPAddr ${defaultInterface} )
    echo ${defaultIPAddr}
}


function vis_ipLinkList {
    EH_assert [[ $# -eq 0 ]]
    ip link list | egrep '^[0-9]*:' | cut -d ':' -f 2
}

function vis_ipAddrList {
  EH_assert [[ $# -eq 0 ]]

  linkList=$( vis_ipLinkList )

  for thisLink in ${linkList} ; do
      thisIpAddr=$( vis_givenInterfaceGetIPAddr ${thisLink} 2> /dev/null )
      echo ${thisIpAddr}
  done
}

function vis_ipMacList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Obsoleted -- needs to be revisited.
_EOF_
    }
    
  EH_assert [[ $# -eq 0 ]]

  local linkList=$( vis_ipLinkList 2> /dev/null )
  local thisLink=""

  for thisLink in ${linkList} ; do
      local macAddr=$( ifconfig "${thisLink}" 2> /dev/null | grep ether | sed 's/.*ether \(.*\) txqueuelen.*$/\1/')

      #macAddr=$( ifconfig ${thisLink} | grep HWaddr | cut -c 39-55 )
      #ANT_raw "${thisLink}: ${macAddr}"
      if [ ! -z "${macAddr}" ] ; then
	  echo ${macAddr}
      fi
  done
}


function vis_givenNetGetIPAddr {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Implemented  for class C only. $2 is the prefix number.
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]
    local netAddr=$1
    local netAddrStr=$( echo "${netAddr}" | sed -e 's/\.0$//' )
    
    vis_ipAddrList | grep ${netAddrStr}
}


function vis_givenNetGetInterface {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Implemented  for class C only. $2 is the prefix number.
_EOF_
		       }
    EH_assert [[ $# -eq 2 ]]
    local netAddr=$1
    local netAddrStr=$( echo "${netAddr}" | sed -e 's/\.0$//' )
    
    ip addr show | grep ${netAddrStr} | grep -oE '[^ ]+$'

    lpReturn
}	

function vis_givenIPAddrGetInterface {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]
    local IPAddr=$1
    
    ip addr show | grep ${IPAddr} | grep -oE '[^ ]+$'

    lpReturn
}	


function vis_givenInterfaceGetIPAddr {
    EH_assert [[ $# -eq 1 ]]
    # $1 is ifname, eg eth0
    ip -4 addr show "${1}" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
}


function vis_givenInterfaceGetBcastAddr {
    EH_assert [[ $# -eq 1 ]]
    # $1 is ifname, eg eth0
    #ifconfig "${1}" |  grep broadcast | sed 's/.*broadcast\([^ ]*\) .*/\1/'
    ifconfig "${1}" |  grep broadcast | grep -oE '[^ ]+$'
}


function vis_givenInterfaceGetMask {
    EH_assert [[ $# -eq 1 ]]
    # $1 is ifname, eg eth0
    #ifconfig "${1}" |  grep netmask | sed 's/.*netmask\([^ ]*\)$/\1/'
    ifconfig "${1}" | grep netmask | sed 's/.*netmask \(.*\) broadcast.*$/\1/'
    #ifconfig "${1}" | grep netmask | grep -oE 'netmask[ ]\d+[ ]'
}

function vis_givenInterfaceGetMacAddr {
    EH_assert [[ $# -eq 1 ]]
    local macAddr=$( ifconfig "${1}" | grep ether | sed 's/.*ether \(.*\) txqueuelen.*$/\1/')
    echo ${macAddr}
}



