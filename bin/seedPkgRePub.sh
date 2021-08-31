#!/bin/bash

IimBriefDescription="Seed For Package Re-Publication (PRP) Preparation"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedPkgRePub.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/seedPkgRePub.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Vis]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][1 Win]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]]

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ################  CONTENTS-LIST ##############
*      ======[[elisp:(org-cycle)][More]]====== *[Info]* General TODO List
_CommentEnd_

function vis_describe {  cat  << _EOF_
**     ============ Essential Features TODO
*** TODO [#A] ======== Improve G_commonExamples.
    SCHEDULED: <2014-02-03 Mon>
*** TODO ======== Add the EH_ module.


RPS_ = Re-Publication-Specification

This script is not to be run as part of the 
genesis process. It publishes a pkg that 
is used in the genesis process.

Scope of this script is:
   - Obtain a package (either source or binary)
   - Optionally Build the source package # 
   - Generate a DebianBinary or other (tar/etc) package
   - Possibly remove the sources and source package
   - Publish the DebianBinary or other (tar/etc) package

Outside of the scope of this script is:
   - Obtaining the binary package for installation
   - Installing the binary package
   
Obtaining and Installing the binary package is done with the 
corresponding lcaXXDebPkgBinsPrep.sh

TODO: sudo chown lsipusr:employee /var/osmt/distPkgs/all

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh

. ${opBinBase}/distHook.libSh

. ${opBinBase}/mmaLib.sh
. ${opBinBase}/mmaBinsPrepLib.sh

. ${opBinBase}/lpInBaseDirDo.libSh

binPublishToServer="www.bybinary.org"
binObtainFromServer="www.bybinary.org"


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Examples
_CommentEnd_


function prp_elimFront { 
    echo ${1#*prp_}
}


function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  visLibExamplesOutput ${G_myName} 

  listOf_prpLists=( $( bashNamespaceIndexedArraysList | grep -i prpList_ ) )
  one_prpList=${listOf_prpLists[0]}

  listOf_prps=( $( bashNamespaceAssociativeArraysList | grep -i prp_ ) )
  prpPathList=( )
  for this in ${listOf_prps[@]} ; do
      thisPath=$( underscoresToSlashes $( prp_elimFront ${this} ) )
      prpPathList=( ${prpPathList[@]} ${thisPath} )
  done
  one_prp=${listOf_prps[0]}
  one_prpPath=$( underscoresToSlashes $( prp_elimFront ${one_prp} ) )

  cat  << _EOF_
---- Platform Base Dirs UPDATE  ----
--- (0) RePublish Full Update ---
${G_myName} ${extraInfo} -i prpFullUpdate   ${prpPathList[@]}     # Obtain + Publish
${G_myName} ${extraInfo} -i prpListFullUpdate  ${listOf_prpLists[@]}   # Obtain + Publish
${G_myName} ${extraInfo} -i prpListFullUpdate   # Obtain + Publish
--- (1) Package RePublish (PRP) Information ---
${G_myName} ${extraInfo} -i prpName   ${prpPathList[@]}    
${G_myName} ${extraInfo} -i prpListName  ${listOf_prpLists[@]} 
${G_myName} ${extraInfo} -i prpLocalPath   ${prpPathList[@]}   
${G_myName} ${extraInfo} -i prpListLocalPath  ${listOf_prpLists[@]} 
${G_myName} ${extraInfo} -i prpStableUrl   ${prpPathList[@]}     # Original Source Publisher URL
${G_myName} ${extraInfo} -i prpListStableUrl  ${listOf_prpLists[@]}    # Original Source Publisher URL
${G_myName} ${extraInfo} -i prpBxDstUrl   ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpListBxDstUrl  ${listOf_prpLists[@]}
--- (2) Src Obtain From Original Publisher ---
${G_myName} ${extraInfo} -i prpLocalBasePrep   ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpSrcObtain   ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpListSrcObtain  ${listOf_prpLists[@]}
${G_myName} ${extraInfo} -i prpListSrcObtain
--- (3) Publish (RePublish to ByStar) ---
${G_myName} ${extraInfo} -i prpBxPublish   ${prpPathList[@]} 
${G_myName} ${extraInfo} -p srcFile=~/Downloads/Impressive-0.10.4.tar -i prpBxPublish  ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpListBxPublish  ${listOf_prpLists[@]}
${G_myName} ${extraInfo} -i prpListBxPublish
--- (4) Verify Package (From ByStar)
${G_myName} ${extraInfo} -i prpBxVerify   ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpListBxVerify  ${listOf_prpLists[@]}
${G_myName} ${extraInfo} -i prpListBxVerify
--- (5) Obtain  (From ByStar) -- Obtain Is Used By BinsPrep ---
${G_myName} ${extraInfo} -i prpBxObtain   ${prpPathList[@]} 
${G_myName} ${extraInfo} -i prpListBxObtain  ${listOf_prpLists[@]}
${G_myName} ${extraInfo} -i prpListBxObtain
_EOF_
  hookRun "examplesHookPost"
}


noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ################  Module Functions  ##############
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Common Preparations
_CommentEnd_


function prpPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset name="$1"
  
    thisItem="prp_${name}"

    #echo ${thisItem}

    #echo '$'{${thisItem}[pkgRePubSrcStableUrl]}

    prp_pkgRePubName=$( eval echo '$'{${thisItem}[pkgRePubName]} )
    prp_pkgRePubSrcStableUrl=$( eval echo '$'{${thisItem}[pkgRePubSrcStableUrl]} )
    prp_pkgRePubArchType=$( eval echo '$'{${thisItem}[pkgRePubArchType]} )
    prp_pkgRePubDistDests=$( eval echo '$'{${thisItem}[pkgRePubDistDests]} )

    lpReturn 0
}


function vis_prpListApplyFunc {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    typeset name=""

    typeset argsList="$@"

    if [ $# -eq 0 ] ; then
       argsList="prpList_main"
    fi	

    for name in "${argsList}" ; do
	typeset nameEvaled=$( eval echo '$'{${name}[@]} )

	if [ -z "${nameEvaled}" ] ; then
	    EH_problem "Empty ${name} -- Skipped"
	    continue
	else
	    ANT_raw "name=${name} -- nameEvaled=${nameEvaled}"
	fi

	typeset thisItem
	for thisItem in ${nameEvaled} ; do
	    opDo ${applyFunc} "${thisItem}"
	done
    done
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Full Update = Origin Obtain and BxRePub
_CommentEnd_


function vis_prpFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Need to be augmented with G_forceMode.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"

	typeset localPath=$( vis_prpLocalPath ${name} )
	typeset localBaseDir=$( FN_dirsPart ${localPath} )
	typeset thisPkgName=$( vis_prpName ${name} )

	typeset thisBaseDir=${opVarBase}/distPkgs/${prp_pkgRePubArchType}

	g_resultsCapture  vis_prpBxVerify ${name}

	if [ "${g_resultsExitValue}" == 0 ] ; then
	    EH_problem_g_resultsShow 
	    ANT_raw "${G_myName} $0: There seems to be in place a good:"
	    ANT_raw "http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}"
	    continue
	fi

	ANT_raw "${G_myName} $0 -- About to get the package from src publisher" 
	continueAfterThis
	opDo vis_prpSrcObtain ${name}

	ANT_raw "Will next Publish the binaries" 
	continueAfterThis
	opDo vis_prpBxPublish ${name}
	opDo vis_prpBxVerify ${name}

    done
    lpReturn
}


function vis_prpFullUpdateOrig {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Need to be augmented with G_forceMode.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"

	typeset localPath=$( vis_prpLocalPath ${name} )
	typeset localBaseDir=$( FN_dirsPart ${localPath} )
	typeset thisPkgName=$( vis_prpName ${name} )

	typeset thisBaseDir=${opVarBase}/distPkgs/${prp_pkgRePubArchType}

	vis_prpBxVerify ${name} > /dev/null 2>&1 ;   retVal=$?
	if [[ ${retVal} -eq 0 ]] ; then
	    ANT_raw "${G_myName} $0: There seems to be in place a good:"
	    ANT_raw "http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}"
	    ANT_raw "Are you sure you want to run this?"
	    continueAfterThis
	fi 

	ANT_raw "${G_myName} $0 -- About to get the package from src publisher" 
	continueAfterThis
	opDo vis_prpSrcObtain ${name}

	ANT_raw "Will next Publish the binaries" 
	continueAfterThis
	opDo vis_prpBxPublish ${name}
	opDo vis_prpBxVerify ${name}

    done
    lpReturn
}


function vis_prpListFullUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpFullUpdate"
    vis_prpListApplyFunc "$@"
}



function vis_pkgRePubFullUpdateObsoleted {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    vis_binPkgVerify > /dev/null 2>&1 ;   retVal=$?
    if [[ ${retVal} -eq 0 ]] ; then
	ANT_raw "${G_myName} $0: There seems to be in place a good:"
	ANT_raw "http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${pkgRePubArchType}/${thisPkgName}"
	ANT_raw "Are you sure you want to run this?"
	continueAfterThis
    fi 

    ANT_raw "${G_myName} $0 -- About to get the package from src publisher" 
    continueAfterThis
    opDo vis_pkgRePubSrcObtain

    ANT_raw "Will next Publish the binaries" 
    continueAfterThis
    opDo vis_pkgRePubBxPublish
    opDo vis_pkgRePubBxVerify
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Information  -- Package RePublish 
_CommentEnd_


function vis_prpStableUrl {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"
	echo ${prp_pkgRePubSrcStableUrl}
    done
}

function vis_prpListStableUrl {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpStableUrl"
    vis_prpListApplyFunc "$@"
}


function vis_prpName {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"
	echo ${prp_pkgRePubName}
    done
}

function vis_prpListName {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpName"
    vis_prpListApplyFunc "$@"
}


function vis_prpLocalPath {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"
	thisPkgName=$( vis_prpName ${name} )
	echo ${opVarBase}/distPkgs/${prp_pkgRePubArchType}/${thisPkgName}
    done
}

function vis_prpListLocalPath {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpLocalPath"
    vis_prpListApplyFunc "$@"
}


function vis_prpBxDstUrl {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"
	thisPkgName=$( vis_prpName ${name} )
	echo http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}
    done
}

function vis_prpListBxDstUrl {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpBxDstUrl"
    vis_prpListApplyFunc "$@"
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Obtain From Source and Local Prepare
_CommentEnd_


function vis_prpLocalBasePrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"
	opDo mkdir -p ${opVarBase}/distPkgs/${prp_pkgRePubArchType}
	opDo sudo chown lsipusr:employee ${opVarBase}/distPkgs/${prp_pkgRePubArchType}
    done
}

 
function vis_prpSrcObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"

	vis_prpLocalBasePrep ${name}

	typeset localPath=$( vis_prpLocalPath ${name} )
	typeset localBaseDir=$( FN_dirsPart ${localPath} )
	typeset localName=$( vis_prpName ${name} )
	typeset srcUrl=$( vis_prpStableUrl ${name} )

	typeset firstChar=${srcUrl::1}

	if [ "${firstChar}" == "/" ] ; then
	    downloadedFile=${srcUrl}
	    if [ ! -f ${downloadedFile} ] ; then
		EH_problem "Missing ${downloadedFile}"
		lpReturn 101
	    fi
	    opDo cp ${downloadedFile} ${localBaseDir}/${localName}
	else
	    inBaseDirDo  ${localBaseDir}  wget -O ${localPath} ${srcUrl}
	fi
	
	opDo ls -l ${localPath}
    done
    lpReturn
}


function vis_prpListSrcObtain {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpSrcObtain"
    vis_prpListApplyFunc "$@"
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== RePublish To ByStar  -- prpBxPublish - prpListBxPublish
_CommentEnd_

 
function vis_prpBxPublish {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
\$@ specifies name of AssocArray as prp_\$@.
If -p srcFile=fileName  is specified, then \$# must be 1
and srcFile over-writes prpLocalPath.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset name=""

    if [ ! -z "${srcFile}" ] ; then 
	if [ ! -f "${srcFile}" ] ; then
	    EH_problem "Missing ${srcFile}"
	    lpReturn 101
	fi	    

	EH_assert [[ $# -eq 1 ]]
	name=$1
    	prpPrep "${name}"

	vis_prpLocalBasePrep ${name}

	typeset thisPkgName=$( vis_prpName ${name} )

	opDo echo distPkgPublish.sh -v -n showRun -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}" -i pkgPublish ${srcFile}

    else
	for name in "$@" ; do
	    prpPrep "${name}"

	    vis_prpLocalBasePrep ${name}

	    typeset localPath=$( vis_prpLocalPath ${name} )
	    typeset localBaseDir=$( FN_dirsPart ${localPath} )
	    typeset thisPkgName=$( vis_prpName ${name} )

	    opDo distPkgPublish.sh -v -n showRun -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}" -i pkgPublish ${localPath}
	    
	done
    fi
		
    lpReturn
}


function vis_prpListBxPublish {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpBxPublish"
    vis_prpListApplyFunc "$@"
}



function vis_pkgRePubBxPublishObsoleted {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Left over -- Specify source on command line for a given package.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    typeset localPath
    if [ $# -eq 1 ] ; then 
	typeset localPath=$1
    else
	typeset localPath=$( vis_pkgRePubLocalPath )
    fi

    typeset thisPkgName=$( vis_pkgRePubName )

    if [ ! -f ${localPath} ] ; then
	EH_problem "Missing ${localPath} -- Aborting"
	lpReturn
    fi

    opDo distPkgPublish.sh -v -n showRun -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}" -i pkgPublish ${localPath}

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Verfiy At ByStar -- prpBxVerify and prpListBxVerify
_CommentEnd_


function vis_prpBxVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset funcRetVal=0
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"

	typeset localPath=$( vis_prpLocalPath ${name} )
	typeset localBaseDir=$( FN_dirsPart ${localPath} )
	typeset thisPkgName=$( vis_prpName ${name} )

    
	opDo wget --spider http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}

	retVal=$?

	if [[ ${retVal} -ne 0 ]] ; then
	    EH_problem "Missing http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}"
	    funcRetVal=${retVal}
	else
	    ANT_raw "In Place: http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}"
	fi 
    
    done
    lpReturn ${funcRetVal}
}


function vis_prpListBxVerify {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpBxVerify"
    vis_prpListApplyFunc "$@"
}



vis_pkgRePubBxVerify () {
    thisPkgName=$( vis_pkgRePubName )
    
    opDo wget --spider http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${pkgRePubArchType}/${thisPkgName}

    retVal=$?

    if [[ ${retVal} -ne 0 ]] ; then
	EH_problem "Missing http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${pkgRePubArchType}/${thisPkgName}"
else
	ANT_raw "In Place: http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${pkgRePubArchType}/${thisPkgName}"
    fi 
    
    return ${retVal}
}




_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== Obtain From ByStar -- prpBxObtain
_CommentEnd_



function vis_prpBxObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
	prpPrep "${name}"

	typeset localPath=$( vis_prpLocalPath ${name} )
	typeset localBaseDir=$( FN_dirsPart ${localPath} )
	typeset thisPkgName=$( vis_prpName ${name} )

	typeset thisBaseDir=${opVarBase}/distPkgs/${prp_pkgRePubArchType}
    
	#inBaseDirDo  ${thisBaseDir} wget http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${prp_pkgRePubArchType}/${thisPkgName}
    inBaseDirDo  ${thisBaseDir} wget http://www.bybinary.org/republish/ubuntu/1804/all/${thisPkgName}

	opDo ls -l ${thisBaseDir}/${thisPkgName}
    done
    lpReturn
}


function vis_prpListBxObtain {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    applyFunc="vis_prpBxObtain"
    vis_prpListApplyFunc "$@"
}



vis_pkgRePubBxObtain () {
    #vis_pkgRePubLocalBasePrep
    typeset thisPkgName=$( vis_pkgRePubName )

    typeset thisBaseDir=${opVarBase}/distPkgs/${pkgRePubArchType}
    
    inBaseDirDo  ${thisBaseDir} wget http://${binObtainFromServer}/republish/${cononDistFamily}/${cononDistGeneration}/${pkgRePubArchType}/${thisPkgName}

    opDo ls -l ${thisBaseDir}/${thisPkgName}
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][More]]====== *[dblock]*  End-Of-File
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
