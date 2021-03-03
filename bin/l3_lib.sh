
function vis_defaultInterface {
    EH_assert [[ $# -eq 0 ]]
    ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)'
}

function vis_ipLinkList {
    EH_assert [[ $# -eq 0 ]]
    ip link list | egrep '^[0-9]*:' | cut -d ':' -f 2
}

function vis_ipAddrList {
  EH_assert [[ $# -eq 0 ]]

  linkList=$( vis_ipLinkList )

  for thisLink in ${linkList} ; do
      thisIpAddr=$( vis_givenInterfaceGetIPAddr ${thisLink} )
      echo ${thisIpAddr}
  done
}

function vis_ipMacList {
  EH_assert [[ $# -eq 0 ]]

  linkList=$( vis_ipLinkList )

  for thisLink in ${linkList} ; do
      macAddr=$( ifconfig ${thisLink} | grep HWaddr | cut -c 39-55 )
      ANT_raw "${thisLink}: ${macAddr}"
      echo ${macAddr}
  done
}

function vis_ipAddrFindGivenThisNet {
  EH_assert [[ $# -eq 1 ]]
  thisNet=$1
  vis_ipAddrList | grep ${thisNet}
}

function vis_ipAddrGetGivenInterface {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    vis_givenInterfaceGetIPAddr $1

    lpReturn
}

function vis_givenNetGetInterface {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]
    local netAddr=$1
    
    ip addr show | grep ${netAddr} | grep -oE '[^ ]+$'

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
    ifconfig "${1}" |  grep Bcast: | sed 's/.*Bcast:\([^ ]*\) .*/\1/'
}


function vis_givenInterfaceGetMask {
    EH_assert [[ $# -eq 1 ]]
    # $1 is ifname, eg eth0
    ifconfig "${1}" |  grep Mask: | sed 's/.*Mask:\([^ ]*\)$/\1/'
}



