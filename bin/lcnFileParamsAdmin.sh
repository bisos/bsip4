#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/usgAcctCurrents.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

vis_help () {
  cat  << _EOF_
See lcnFileParams.libSh

_EOF_
  return 0
}


typeset -t fileParamsBaseDir="MANDATORY"

function vis_examples {
  #typeset extraInfo="-h -c fast -v -n showRun"
  typeset extraInfo=""
  oneFileParamsBaseDir="/libre/ByStar/InfoBase/RBAE/BYSMB/ea/59040"
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- HELP / MODEL / CONVENTIONS ---
${G_myName} -i fileParamsHelp
--- File Parameter Load ---
${G_myName} ${extraInfo} -p fileParamsBaseDir=${oneFileParamsBaseDir} -i codeGenOutput

--- File Parameter Show Verify ---
${G_myName} ${extraInfo} -p fileParamsBaseDir=${oneFileParamsBaseDir} -i fileParamsShow

--- File Parameter WRITE/TRANSFER ---
${G_myName} ${extraInfo} -p fileParamsBaseDir=${oneFileParamsBaseDir} -p destBaseDir=/tmp/t1 -i fileParamsWrite

--- File Parameter Edit ---
${G_myName} ${extraInfo} -p fileParamsBaseDir=${oneFileParamsBaseDir} -i filesList

--- Misc ---
${G_myName} ${extraInfo} -i absoluteFilesListStdout ./galleriaPhotoSample.jpg
echo ./galleriaPhotoSample.jpg | ${G_myName} ${extraInfo} -i absoluteFilesListStdout

_EOF_
}


noSubjectHook() {
  return 0
}

noArgsHook() {
  vis_examples
}

function vis_filesList {
    EH_assert [[ "${fileParamsBaseDir}_" != "MANDATORY_" ]]
    EH_assert [[ -d ${fileParamsBaseDir} ]]

    opDo ls ${fileParamsBaseDir}/*
}



function vis_codeGenOutput {
    EH_assert [[ "${fileParamsBaseDir}_" != "MANDATORY_" ]]
    EH_assert [[ -d ${fileParamsBaseDir} ]]

    opDo fileParamsCodeGenOutput ${fileParamsBaseDir}
}



function vis_fileParamsShow {
    EH_assert [[ "${fileParamsBaseDir}_" != "MANDATORY_" ]]
    EH_assert [[ -d ${fileParamsBaseDir} ]]

    opDo fileParamsCodeGenToFile  ${fileParamsBaseDir}
    opDo fileParamsLoadVarsFromBaseDir  ${fileParamsBaseDir}

    opDo fileParamsShow ${fileParamsBaseDir}
}

function vis_fileParamsWrite {
#set -x
    EH_assert [[ "${fileParamsBaseDir}_" != "MANDATORY_" ]]
    EH_assert [[ -d ${fileParamsBaseDir} ]]
    EH_assert [[ "${destBaseDir}_" != "MANDATORY_" ]]
    EH_assert [[ -d ${destBaseDir} ]]

    opDo fileParamsCodeGenToFile  ${fileParamsBaseDir}
    opDo fileParamsLoadVarsFromBaseDir  ${fileParamsBaseDir}

    opDo fileParamsWrite ${fileParamsBaseDir} ${destBaseDir}
}


function vis_absoluteFilesListStdout {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
    }

    if [ $# -gt 0 ] ; then
	typeset thisOne=""
	for thisOne in ${@} ; do
	    typeset thisFile=$( FN_absolutePathGet ${thisOne} )
	    echo ${thisFile}
	done
    else
	typeset thisLine=""
    
	while read thisLine ; do
	    if [ "${thisLine}" != "" ] ; then
		typeset thisFile=$( FN_absolutePathGet ${thisLine} )
		echo ${thisFile}
	    fi
	done
    fi

    lpReturn
}

