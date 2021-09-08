# NOTYET

# MOHSEN Review Comments:
# - Add EH_assert for all functions.
# - Instead of "^$1" do "^$1[ \t]" -- space or tab
#



function vis_examplesBxSvcLogInfo {
 cat  << _EOF_
$( examplesSeperatorChapter "Logs" )
${G_myName} ${extraInfo} -p bxoId="${oneBystarAcct}" -p ss=${oneSs} -i bxSvcLogFilesList
${G_myName} ${extraInfo} -p bxoId="${oneBystarAcct}" -p ss=${oneSs} -i bxSvcLogTail
${G_myName} ${extraInfo} -p bxoId="${oneBystarAcct}" -p ss=${oneSs} -i bxSvcLogGrep
${G_myName} ${extraInfo} -p bxoId="${oneBystarAcct}" -p ss=${oneSs} -i bxSvcLogErrTail
${G_myName} ${extraInfo} -p bxoId="${oneBystarAcct}" -p ss=${oneSs} -i bxSvcLogErrGrep
_EOF_
}



function vis_bxSvcLogFilesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoIdCentralPrep
    bystarAcctAnalyze ${bxoId}
    EH_assert bystarSrAnalyze

    EH_assert bxSvcLogParamsObtain ${bxoIdHome}
    cat  << _EOF_
bxSvcLogDir="${bxSvcLogDir}"
bxSvcLogFile="${bxSvcLogFile}"
bxSvcLogErrFile="${bxSvcLogErrFile}"
_EOF_

    if [ "${bxSvcLogDir}_" != "_" ] ; then 
        opDo ls -l ${bxSvcLogDir} 
    fi

    if [ "${bxSvcLogFile}_" != "_" ] ; then 
        opDo ls -l ${bxSvcLogFile} 
    fi

    if [ "${bxSvcLogErrFile}_" != "_" ] ; then 
        opDo ls -l ${bxSvcLogErrFile} 
    fi
}

function vis_bxSvcLogTail {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoIdCentralPrep
    bystarAcctAnalyze ${bxoId}
 
    EH_assert bxSvcLogParamsObtain  ${bxoIdHome}

    if [ "${bxSvcLogFile}_" != "_" ] ; then 
        opDo tail -50 ${bxSvcLogFile} 
    fi
}

function vis_bxSvcLogGrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoIdCentralPrep
    bystarAcctAnalyze ${bxoId}
 
    EH_assert bxSvcLogParamsObtain  ${bxoIdHome}

    if [ "${bxSvcLogFile}_" != "_" -a ! -z "${daemonName}" ] ; then 
        opDo grep -i ${daemonName} ${bxSvcLogFile} 
    fi
}


function vis_bxSvcLogErrTail {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoIdCentralPrep
    bystarAcctAnalyze ${bxoId}
 
    EH_assert bxSvcLogParamsObtain  ${bxoIdHome}

    if [ "${bxSvcLogErrFile}_" != "_" ] ; then 
        opDo tail -50 ${bxSvcLogErrFile} 
    fi
}

function vis_bxSvcLogErrGrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert bxoIdCentralPrep
    bystarAcctAnalyze ${bxoId}
 
    EH_assert bxSvcLogParamsObtain  ${bxoIdHome}

    if [ "${bxSvcLogErrFile}_" != "_" -a ! -z ${daemonName} ] ; then 
        opDo grep -i ${daemonName} ${bxSvcLogErrFile} 
    fi
}


#
# #########
#



function vis_examplesSvcLogInfo {
 cat  << _EOF_
$( examplesSeperatorChapter "Logs" )
${G_myName} ${extraInfo} -i svcLogFilesList
${G_myName} ${extraInfo} -i svcLogTail
${G_myName} ${extraInfo} -i svcLogGrep
${G_myName} ${extraInfo} -i svcLogErrTail
${G_myName} ${extraInfo} -i svcLogErrGrep
_EOF_
}



function vis_svcLogFilesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert svcLogParamsObtain
  cat  << _EOF_
svcLogDir="${svcLogDir}"
svcLogFile="${svcLogFile}"
svcLogErrFile="${svcLogErrFile}"
_EOF_

  if [ "${svcLogDir}_" != "_" ] ; then 
      opDo ls -l ${svcLogDir} 
  fi

  if [ "${svcLogFile}_" != "_" ] ; then 
      opDo ls -l ${svcLogFile} 
  fi

  if [ "${svcLogErrFile}_" != "_" ] ; then 
      opDo ls -l ${svcLogErrFile} 
  fi
}

function vis_svcLogTail {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert svcLogParamsObtain

    if [ "${svcLogFile}_" != "_" ] ; then 
        opDo tail -50 ${svcLogFile} 
    fi
}

function vis_svcLogGrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert svcLogParamsObtain

    if [ "${svcLogFile}_" != "_" -a ! -z ${daemonName} ] ; then 
        opDo grep -i ${daemonName} ${svcLogFile} 
    fi
}


function vis_svcLogErrTail {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert svcLogParamsObtain

    if [ "${svcLogErrFile}_" != "_" ] ; then 
        opDo tail -50 ${svcLogErrFile} 
    fi
}

function vis_svcLogErrGrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    EH_assert svcLogParamsObtain

    if [ "${svcLogErrFile}_" != "_" -a ! -z ${daemonName} ] ; then 
        opDo grep -i ${daemonName} ${svcLogErrFile} 
    fi
}

#
# ###########
#

opSyslogFile="/etc/syslog.conf"

function opSyslogHUP {
  opDoComplain pkill -HUP syslogd
}

# NOTYET Watchlog function example
#!/bin/sh
# /usr/local/bin/watchlog
#exec tail -F /var/multilog/$1/current | tai64nlocal


function opSyslogLineShow {
  EH_assert [[ $# -eq 1 ]]
  # $1 -- serviceName

  opDoComplain egrep "^$1" ${opSyslogFile}
}

function opSyslogLineVerify {
  EH_assert [[ $# -eq 2 ]]
  # $1 -- serviceName
  # $2 -- Line

  typeset lineShow=`opSyslogLineShow $1`

  if [[ -z ${lineShow} ]] ; then
    ANT_raw "Service '$1' is not available."
    return 1
  else
    if [[ `print ${lineShow}` == "$2" ]] ; then
      ANT_raw "Service '$1' is verified."
      return 0
    else
      ANT_raw "Service '$1' is not verified."
      return 1
    fi
  fi

}

function opSyslogLineUpdate {
  EH_assert [[ $# -eq 2 ]]
  # $1 -- serviceName
  # $2 -- Line

  integer thisRetVal=0
  opSyslogLineVerify $1 "$2" || thisRetVal=$?

  if [[ ${thisRetVal} -ne 0 ]] ; then
    opSyslogLineDelete $1
    FN_lineAddToFile "^$1"  "$2" ${opSyslogFile}
  fi
}

function opSyslogLineDelete {
  EH_assert [[ $# -eq 1 ]]
  # $1 -- serviceName

  # FN_lineRemoveFromFile keep the old file with a datetag.
  opDoComplain FN_lineRemoveFromFile "^$1" ${opSyslogFile}
}


