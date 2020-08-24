#!/bin/osmtKsh


# ./opAcctLib.sh
. ${opBinBase}/opAcctLib.sh


function vis_usgAcctNextLocalUidNu {
  EH_assert [[ $# -eq  0 ]]

  passwdFileInfo=$( egrep '^..-16' /etc/passwd | sort | tail -1 | cut -d: -f1 )

  if [ "${passwdFileInfo}_" == "_" ] ; then 
    echo "16001"
  else
    lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
    nextNu=$( expr $lastNuStr +  1 )
    echo ${nextNu}
  fi
}


function checkAcctExist {

  typeset thisName="$@"

  typeset inEtcPasswd_userid=`cat /etc/passwd | grep -i ":${thisName}:" | cut -d: -f1`
  
  if [[ -n ${inEtcPasswd_userid} ]] ; then
    print "${inEtcPasswd_userid}"
    return 1
  else
    print "none"
    return 0
  fi
}

