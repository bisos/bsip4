#!/bin/bash

IimBriefDescription="Seed For PlatformBaseDirs (PBD) Preparation"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedPlatformBaseDirs.sh,v 1.5 2016-12-07 05:47:33 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/seedPlatformBaseDirs.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] | 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ################  CONTENTS-LIST ##############
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* General TODO List
_CommentEnd_

function vis_describe {  cat  << _EOF_
** <<Xref-Here->>
**     ============ Essential Features TODO
*** TODO [#A] ======== Improve G_commonExamples.
    SCHEDULED: <2014-02-03 Mon>
*** TODO ======== Add the EH_ module.
_EOF_
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== See Also: [[file:/opt/public/osmt/bin/commonPlatformBaseDirs.libSh][commonPlatformBaseDirs.libSh]]  [[file:/opt/public/osmt/bin/bystarPlatformBaseDirs.sh][bystarPlatformBaseDirs.sh]]  [[file:/opt/public/osmt/bin/sitePlatformBaseDirs.sh][sitePlatformBaseDirs.sh]]
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh

. ${opBinBase}/lpReRunAs.libSh

# ./bystarPlatformBaseDirs.libSh
#. ${opBinBase}/bystarPlatformBaseDirs.libSh

# PRE parameters

typeset -t baseDir="MANDATORY"

function G_postParamHook {
     return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function pbd_elimFront { 
    echo ${1#*pbd_}
}


function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  visLibExamplesOutput ${G_myName} 

  listOf_pbdLists=( $( bashNamespaceIndexedArraysList | grep -i pbdList_ ) )
  one_pbdList=${listOf_pbdLists[0]}

  listOf_pbds=( $( bashNamespaceAssociativeArraysList | grep -i pbd_ ) )
  pbdPathList=( )
  for this in ${listOf_pbds[@]} ; do
      thisPath=$( underscoresToSlashes $( pbd_elimFront ${this} ) )
      pbdPathList=( ${pbdPathList[@]} ${thisPath} )
  done
  one_pbd=${listOf_pbds[0]}
  one_pbdPath=$( underscoresToSlashes $( pbd_elimFront ${one_pbd} ) )

  remPlatformName="bisp0017"

  cat  << _EOF_
$( examplesSeperatorChapter "Examples Lists" )
${G_myName} ${extraInfo} -i examplesLists
$( examplesSeperatorChapter "Platform Base Dirs (pbd) VERIFY" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdVerify  ${one_pbdPath}
$( examplesSeperatorChapter "Platform Base Dirs (pbd) LIST SHOW" )
${G_myName} -i pbdListShow ${one_pbdList}
$( examplesSeperatorChapter "Platform Base Dirs (pbd) LIST VERIFY" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListVerify ${one_pbdList}
$( examplesSeperatorChapter "Platform Base Dirs UPDATE" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdUpdate ${one_pbdPath}
$( examplesSeperatorChapter "Platform Base Dirs (pbd) LIST UPDATE" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListUpdate ${one_pbdList}
$( examplesSeperatorChapter "PrivScope -- SymLinks" )
${G_myName} ${extraInfo} -p baseDir=/uniform -p endBaseDir="/dd/this/a"  -i withParamsLinksUpdate  pbdList_ddPrivScopeLinks
${G_myName} ${extraInfo} -p baseDir=/uniform -p endBaseDir="/dd/net/${remPlatformName}/a"  -i withParamsLinksUpdate  pbdList_ddPrivScopeLinks_Public
${G_myName} ${extraInfo} -p baseDir=/uniform -p endBaseDir="/dd/this/a"  -i applyFirstToRestAsList vis_withParamsLinksUpdateItem  pbdList_ddPrivScopeLinks_Public
$( examplesSeperatorChapter "Media To PrivScope -- SymLinks" )
${G_myName} ${extraInfo} -p baseDir=/uniform -p endBaseDir=/dd/this/a  -i withParamsLinksUpdate  pbdList_uniformRelMediaLinks
${G_myName} ${extraInfo} -p baseDir="/uniform" -p endBaseDir="/dd/net/${remPlatformName}/a"  -i withParamsLinksUpdate  pbdList_uniformRelMediaLinks
$( examplesSeperatorChapter "PrivScope -- NFS Remote File System Mount/Unmout (IMPORTS)" )
${G_myName} ${extraInfo} -p baseDir="/dd/net/${remPlatformName}/a" -p remBaseDir="/dd/this/a" -p remAddr=192.168.0.0 -i withParamsNfsMount  pbdList_ddPrivScopeBases
${G_myName} ${extraInfo} -p baseDir="/dd/net/${remPlatformName}/d1" -p remBaseDir="/dd/this/d1" -p remAddr=192.168.0.0 -i withParamsNfsMount  pbdList_ddPrivScopeBases
${G_myName} ${extraInfo} -p baseDir="/dd/net/${remPlatformName}/md0" -p remBaseDir="/dd/this/md0" -p remAddr=192.168.0.0 -i withParamsNfsMount  pbdList_ddPrivScopeBases
${G_myName} ${extraInfo} -p baseDir="/dd/net/${remPlatformName}/a" -i withParamsNfsUnMount  pbdList_ddPrivScopeBases
$( examplesSeperatorChapter "PrivScope -- SAMBA Remote File System Mount/Unmout (IMPORTS)" )
${G_myName} ${extraInfo} -p baseDir="/dd/net/${remPlatformName}/a" -p remBaseDir="/dd/this/a" -p remAddr=192.168.0.0 -i withParamsSambaMount  pbdList_ddPrivScopeBases
$( examplesSeperatorChapter "PrivScope -- Remote File System EXPORTS" )
${G_myName} ${extraInfo}  -p baseDir="/dd/this/a" -p exportOptions="192.168.0.0/255.255.255.0(rw,sync,no_subtree_check)" -i withParamsNfsExportLines  pbdList_ddPrivScopeBases
_EOF_
  hookRun "examplesHookPost"
}

noArgsHook() {
  vis_examples
}


function vis_examplesLists {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  visLibExamplesOutput ${G_myName} 

  listOf_pbdLists=( $( bashNamespaceIndexedArraysList | grep -i pbdList_ ) )
  one_pbdList=${listOf_pbdLists[0]}

  listOf_pbds=( $( bashNamespaceAssociativeArraysList | grep -i pbd_ ) )
  pbdPathList=( )
  for this in ${listOf_pbds[@]} ; do
      thisPath=$( underscoresToSlashes $( pbd_elimFront ${this} ) )
      pbdPathList=( ${pbdPathList[@]} ${thisPath} )
  done
  one_pbd=${listOf_pbds[0]}
  one_pbdPath=$( underscoresToSlashes $( pbd_elimFront ${one_pbd} ) )

  cat  << _EOF_
$( examplesSeperatorChapter "Platform Base Dirs (pbd) VERIFY" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdVerify  ${one_pbdPath}
${G_myName} ${extraInfo} -p baseDir=/ -i pbdVerify ${pbdPathList[@]}
$( examplesSeperatorChapter "Platform Base Dirs (pbd) LIST VERIFY" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListVerify ${one_pbdList}
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListVerify ${listOf_pbdLists[@]}
$( examplesSeperatorChapter "Platform Base Dirs UPDATE" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdUpdate ${one_pbdPath}
${G_myName} ${extraInfo} -p baseDir=/ -i pbdUpdate ${pbdPathList[@]}
$( examplesSeperatorChapter "Platform Base Dirs (pbd) LIST UPDATE" )
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListUpdate ${one_pbdList}
${G_myName} ${extraInfo} -p baseDir=/ -i pbdListUpdate ${listOf_pbdLists[@]}
_EOF_
}


_CommentBegin_
*      ################      *Platform Base Dirs (pbd) Operations*
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== vis_applyFirstToRestAsList
_CommentEnd_

function vis_applyFirstToRestAsList {
    G_funcEntry
    function describeF {  cat  << _EOF_
FIRST arg is a function.
REST is a list of name of lists.
Each name of list is expanded. Then FIRST is applied to each element of each list.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset first=$1
    
    shift

    typeset name=""
    for name in "$@" ; do
        typeset nameEvaled=$( eval echo '$'{${name}[@]} )

        if [ -z "${nameEvaled}" ] ; then
            EH_problem "Empty ${name} -- Skipped"
            continue
        else
            ANT_raw "${G_thisFunc}: func=${first} -- list=${name} -- nameEvaled=${nameEvaled}"
        fi

        typeset thisItem
        for thisItem in ${nameEvaled} ; do
            opDo ${first} "${thisItem}"
        done
    done
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== pbd (Platform Base Dirs)  -- pbdPrep, pbdVerify, etc
_CommentEnd_


function pbdPrep {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset name="$1"

    typeset internalName=$( slashesToUnderscores "${name}" )
    
    typeset thisItemName=$( eval echo '$'{pbd_${internalName}[destPathRel]} )
    if [ -z "${thisItemName}" ] ; then
        EH_problem "Invalid Item Name=$1"
        lpReturn 101
    fi
  
    thisItem="pbd_${internalName}"

    pbd_type=$( eval echo '$'{${thisItem}[type]} )
    pbd_destPathBaseDefault=$( eval echo '$'{${thisItem}[destPathBaseDefault]} )
    pbd_destPathRel=$( eval echo '$'{${thisItem}[destPathRel]} )
    pbd_srcPath=$( eval echo '$'{${thisItem}[srcPath]} )
    pbd_owner=$( eval echo '$'{${thisItem}[owner]} )
    pbd_group=$( eval echo '$'{${thisItem}[group]} )
    pbd_permissions=$( eval echo '$'{${thisItem}[permissions]} )
    pbd_basePrepFunc=$( eval echo '$'{${thisItem}[basePrepFunc]} )
    pbd_baseCleanFunc=$( eval echo '$'{${thisItem}[baseCleanFunc]} )
    pbd_description=$( eval echo '$'{${thisItem}[description]} )
    #pbd_description=$( eval echo '$'{${thisItem}[urlDescription]} )    

    lpReturn 0
}


function vis_pbdShow {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        printf 2>&1 "* name=${name}\n"
        printf 2>&1 "** $(varNameValueStdout pbd_type)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_destPathBaseDefault)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_destPathRel)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_srcPath)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_owner)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_group)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_permissions_group)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_basePrepFunc)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_baseCleanFunc)\n"
        printf 2>&1 "** $(varNameValueStdout pbd_description)\n"
    done
}


function vis_pbdVerify {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem ""
            continue
        fi
        opDo ls -ld "${destFullPath}"
    done
}

function destFullPathGet {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset destFullPath=""

    if [ -z "${pbd_destPathBaseDefault}" ] ; then 
        EH_problem "Missing destPathBaseDefault"
        lpReturn 101
    fi

    if [ -z "${baseDir}" ] ; then
        if [ "${pbd_destPathBaseDefault}" == "/" ] ; then
            destFullPath=/"${pbd_destPathRel}"
        else
            destFullPath="${pbd_destPathBaseDefault}"/"${pbd_destPathRel}"
        fi
    else
        if [ "${baseDir}" == "/" ] ; then
            destFullPath=/"${pbd_destPathRel}"
        else
            destFullPath="${baseDir}"/"${pbd_destPathRel}"
        fi
    fi

    echo "${destFullPath}"
    
    lpReturn 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== pbdUpdate, pbdListVerify, pbdListUpdate
_CommentEnd_



function vis_pbdUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem ""
            continue
        fi

        case ${pbd_type} in
            "directory")
                if [ -d "${destFullPath}" ] ; then
                    # Check that ownership and permissions Match
                    ANT_raw "${destFullPath} Exists -- mkdir Skipped"
                else
                    opDo mkdir -p "${destFullPath}"
                    opDo chown ${pbd_owner} "${destFullPath}"
                    opDo chgrp ${pbd_group} "${destFullPath}"
                    opDo chmod ${pbd_permissions} "${destFullPath}"
                fi
                ;;
            "symlink")
                typeset destFullBase=$( FN_dirsPart ${destFullPath} )
                srcFullPath=$( inBaseDirDo ${destFullBase} FN_absolutePathGet ${pbd_srcPath} )  # endOfLink

                opDo FN_fileSymlinkUpdate ${srcFullPath} ${destFullPath}
            
                #opDo chown ${pbd_owner} "${destFullPath}"
                #opDo chgrp ${pbd_group} "${destFullPath}"
                #opDo chmod ${pbd_permissions} "${destFullPath}"
                ;;
            "gitClone")
                doNothing  # Everything Happens In basePrepFunc
                
                ;;
            *)
                
        esac

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done
}


function vis_pbdListShow {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
        typeset nameEvaled=$( eval echo '$'{${name}[@]} )

        if [ -z "${nameEvaled}" ] ; then
            EH_problem "Empty ${name} -- Skipped"
            continue
        fi

        typeset thisItem
        for thisItem in ${nameEvaled} ; do
            opDo vis_pbdShow "${thisItem}"
        done
    done
}



function vis_pbdListVerify {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
        typeset nameEvaled=$( eval echo '$'{${name}[@]} )

        if [ -z "${nameEvaled}" ] ; then
            EH_problem "Empty ${name} -- Skipped"
            continue
        fi

        typeset thisItem
        for thisItem in ${nameEvaled} ; do
            opDo vis_pbdVerify "${thisItem}"
        done
    done
}

function vis_pbdListUpdate {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    
    typeset name=""
    for name in "$@" ; do
        typeset nameEvaled=$( eval echo '$'{${name}[@]} )

        if [ -z "${nameEvaled}" ] ; then
            EH_problem "Empty ${name} -- Skipped"
            continue
        else
            ANT_raw "name=${name} -- nameEvaled=${nameEvaled}"
        fi

        typeset thisItem
        for thisItem in ${nameEvaled} ; do
            opDo vis_pbdUpdate "${thisItem}"
        done
    done
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== withParams -- withParamsLinksUpdate, withParamsNfsMount, withParamsSambaMount, withParamsNfsExport
_CommentEnd_


_CommentBegin_
**      ====[[elisp:(org-cycle)][Fold]]==== vis_withParamsLinksUpdate
_CommentEnd_


function vis_withParamsLinksUpdate { opDo vis_applyFirstToRestAsList vis_withParamsLinksUpdateItem "$@"; }

function vis_withParamsLinksUpdateItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem ""
        lpReturn
    fi

    if [ -z "${endBaseDir}" ] ; then
        EH_problem ""
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem ""
            continue
        fi

        if [ -z ${pbd_srcPath} ] ; then
            # Not A Symlink --- Actual Base To Creates
            EH_problem ""
        else
            # Create A Symlink To Path
            typeset destFullBase=$( FN_dirsPart ${destFullPath} )
            #srcPathHead=$( FN_nonDirsPart ${pbd_srcPath} )
            #endOfLinkPath=$( inBaseDirDo ${endBaseDir} FN_absolutePathGet ${srcPathHead} )

            endOfLinkPath=$( inBaseDirDo ${endBaseDir} FN_absolutePathGet ${pbd_srcPath} )

            opDo FN_fileSymlinkUpdate ${endOfLinkPath} ${destFullPath}
            #opDo chown ${pbd_owner} "${destFullPath}"
            #opDo chgrp ${pbd_group} "${destFullPath}"
            #opDo chmod ${pbd_permissions} "${destFullPath}"
        fi

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done
}


_CommentBegin_
**      ====[[elisp:(org-cycle)][Fold]]==== vis_withParamsNfsMount
_CommentEnd_


function vis_withParamsNfsMount { opDo vis_applyFirstToRestAsList vis_withParamsNfsMountItem "$@"; }

function vis_withParamsNfsMountItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
192.168.0.4:/media/ned/music  /media/music  nfs ro,hard,intr 0 0
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem "Missing baseDir"
        lpReturn
    fi

    if [ -z "${remBaseDir}" ] ; then
        EH_problem "Missing remBaseDir"
        lpReturn
    fi

    if [ -z "${remAddr}" ] ; then
        EH_problem "Missing remAddr"
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset localFullPath=""
        opDoRet  pbdPrep "${name}"
        localFullPath=${pbd_srcPath}
        if [ -z "${localFullPath}" ] ; then
            EH_problem ""
            continue
        fi

        if [ ! -d "${localFullPath}" ] ; then
            opDo mkdir -p "${localFullPath}"
            opDo chown ${pbd_owner} "${localFullPath}"
            opDo chgrp ${pbd_group} "${localFullPath}"
            opDo chmod ${pbd_permissions} "${localFullPath}"
        fi
        typeset remPathHead=$( FN_nonDirsPart ${localFullPath} )
        typeset remPathBase=$( FN_dirsPart ${localFullPath} )
        typeset remPathBeforeHead=$( FN_nonDirsPart ${remPathBase} )
        
        #remFullPath=$( inBaseDirDo ${remBaseDir} FN_absolutePathGet ${destPathHead} )
        if [ "${remBaseDir}" == "default" ] ; then
            remFullPath="/dd/this/${remPathBeforeHead}/${remPathHead}"
        else
            remFullPath=${remBaseDir}/${destPathHead}
        fi

        #opDo echo ${remAddr}:${remFullPath}  ${destFullPath}  nfs ro,hard,intr 0 0
        #mountOptions="-o soft,bg"
        opDo mount -t nfs ${remAddr}:${remFullPath}  ${localFullPath} 

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done

    lpReturn
}

function vis_withParamsNfsMountItemOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
192.168.0.4:/media/ned/music  /media/music  nfs ro,hard,intr 0 0
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem "Missing baseDir"
        lpReturn
    fi

    if [ -z "${remBaseDir}" ] ; then
        EH_problem "Missing remBaseDir"
        lpReturn
    fi

    if [ -z "${remAddr}" ] ; then
        EH_problem "Missing remAddr"
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem ""
            continue
        fi

        if [ ! -d "${destFullPath}" ] ; then
            opDo mkdir -p "${destFullPath}"
            opDo chown ${pbd_owner} "${destFullPath}"
            opDo chgrp ${pbd_group} "${destFullPath}"
            opDo chmod ${pbd_permissions} "${destFullPath}"
        fi
        typeset destPathHead=$( FN_nonDirsPart ${destFullPath} )
        typeset destPathBase=$( FN_dirsPart ${destFullPath} )
        typeset destPathBeforeHead=$( FN_nonDirsPart ${destPathBase} )
        
        #remFullPath=$( inBaseDirDo ${remBaseDir} FN_absolutePathGet ${destPathHead} )
        if [ "${remBaseDir}" == "default" ] ; then
            remFullPath="/dd/this/${destPathBeforeHead}/${destPathHead}"
        else
            remFullPath=${remBaseDir}/${destPathHead}
        fi

        #opDo echo ${remAddr}:${remFullPath}  ${destFullPath}  nfs ro,hard,intr 0 0
        #mountOptions="-o soft,bg"
        opDo mount -t nfs ${remAddr}:${remFullPath}  ${destFullPath} 

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done

    lpReturn
}


_CommentBegin_
**      ====[[elisp:(org-cycle)][Fold]]==== vis_withParamsNfsFstabLines
_CommentEnd_


function vis_withParamsNfsFstabLines { opDo vis_applyFirstToRestAsList vis_withParamsNfsFstabLineItem "$@"; }

function vis_withParamsNfsFstabLineItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
192.168.0.4:/media/ned/music  /media/music  nfs ro,hard,intr 0 0
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem "Missing baseDir"
        lpReturn
    fi

    if [ -z "${remBaseDir}" ] ; then
        EH_problem "Missing remBaseDir"
        lpReturn
    fi

    if [ -z "${remAddr}" ] ; then
        EH_problem "Missing remAddr"
        lpReturn
    fi

    #if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem "Missing destFullPath"
            continue
        fi

        if [ ! -d "${destFullPath}" ] ; then
            opDo mkdir -p "${destFullPath}"
            opDo chown ${pbd_owner} "${destFullPath}"
            opDo chgrp ${pbd_group} "${destFullPath}"
            opDo chmod ${pbd_permissions} "${destFullPath}"
        fi
        typeset destPathHead=$( FN_nonDirsPart ${destFullPath} )
        #remFullPath=$( inBaseDirDo ${remBaseDir} FN_absolutePathGet ${destPathHead} )
        remFullPath=${remBaseDir}/${destPathHead}

        #opDo echo ${remAddr}:${remFullPath}  ${destFullPath}  nfs ro,hard,intr 0 0
        #mountOptions="-o soft,bg"
        opDo printf "${remAddr}:${remFullPath}\t${destFullPath}\tnfs\tdefaults,rsize=8192,wsize=8192,intr,hard,bg\t0\t0\n"
        #opDo mount -t nfs ${remAddr}:${remFullPath}  ${destFullPath} 

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done

    lpReturn
}

_CommentBegin_
**      ====[[elisp:(org-cycle)][Fold]]==== vis_withParamsNfsUnMount
_CommentEnd_



function vis_withParamsNfsUnMount { opDo vis_applyFirstToRestAsList vis_withParamsNfsUnMountItem "$@"; }

function vis_withParamsNfsUnMountItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem ""
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        #destFullPath=$( destFullPathGet )
        destFullPath=${pbd_srcPath}
        if [ -z "Skipped $(ls -ld ${destFullPath})" ] ; then
            EH_problem ""
            continue
        fi

        if [ ! -d "${destFullPath}" ] ; then
            EH_problem "Skipped $(ls -ld ${destFullPath})"
            continue
        fi

        opDo umount ${destFullPath} 

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done

    lpReturn
}


function vis_withParamsNfsUnMountItemOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem ""
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "Skipped $(ls -ld ${destFullPath})" ] ; then
            EH_problem ""
            continue
        fi

        if [ ! -d "${destFullPath}" ] ; then
            EH_problem "Skipped $(ls -ld ${destFullPath})"
            continue
        fi

        opDo umount ${destFullPath} 

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done

    lpReturn
}


_CommentBegin_
**      ====[[elisp:(org-cycle)][Fold]]==== vis_withParamsSambaMount
_CommentEnd_

function vis_withParamsSambaMount { opDo vis_applyFirstToRestAsList vis_withParamsNfsMountItem "$@"; }

function vis_withParamsSambaMountItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    describeF
}

function vis_withParamsNfsExportLines { opDo vis_applyFirstToRestAsList vis_withParamsNfsExportLinesItem "$@"; }

function vis_withParamsNfsExportLinesItem {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    if [ -z "${baseDir}" ] ; then
        EH_problem ""
        lpReturn
    fi

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    typeset name=""
    for name in "$@" ; do
        typeset destFullPath=""
        opDoRet  pbdPrep "${name}"
        destFullPath=$( destFullPathGet )
        if [ -z "${destFullPath}" ] ; then
            EH_problem ""
            continue
        fi

        if [ -z ${pbd_srcPath} ] ; then
            # Not A Symlink --- Actual Base To Creates
            if [ ! -d "${destFullPath}" ] ; then
                opDo mkdir -p "${destFullPath}"
                opDo chown ${pbd_owner} "${destFullPath}"
                opDo chgrp ${pbd_group} "${destFullPath}"
                opDo chmod ${pbd_permissions} "${destFullPath}"
            fi
            #
            # opDo echo   ${destFullPath}    "192.168.0.0/255.255.255.0(ro,sync,no_subtree_check)"
            # Then edit /etc/exports to configure your shares.
            #
            opDo echo   ${destFullPath}    ${exportOptions}
        else
            # Create A Symlink To Path
            EH_problem ""
        fi

        if [ "${pbd_basePrepFunc}" == "" ] ; then
            doNothing
        elif [ "${pbd_basePrepFunc}" == "noOp" ] ; then
            doNothing
        else
            opDo eval "${pbd_basePrepFunc}"
        fi
    done


    lpReturn
}


function basePrep_gitClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    
    typeset gitServer="$1"
    typeset gitAccessMode="$2"
    shift; shift

    #echo "${pbd_type} - ${pbd_destPathBaseDefault} -  ${pbd_destPathRel} - ${pbd_srcPath}  -   ${pbd_owner}   -  ${pbd_group}  -   ${pbd_permissions}"

    typeset destFullPath=""
    destFullPath=$( destFullPathGet )
    if [ -z "${destFullPath}" ] ; then
        EH_problem ""
        lpReturn
    fi

    case "${gitAccessMode}" in
        "anonGitDaemon"|"anonHttp"|"anonHttps")
            EH_assert [[ $# -eq 0 ]]
            opDo sudo -u lsipusr /opt/public/osmt/bin/bx-gitAccess.sh -h -v -n showRun -p localDest="${destFullPath}" -p gitServer=${gitServer} -p repoBase=${pbd_srcPath} -f -i repoClone "${gitAccessMode}"
            ;;

        "authHttp"|"authHttps")
            EH_assert [[ $# -le 2 ]]
            typeset gitUser=$1
            typeset gitPasswd=""
            if [ "${gitUser}" == "uaso" ] ; then
                gitUser=$( fileParamManage.py -i fileParamReadPath ~/gitAuth/${gitServer}/userName )
                if [ -z "${gitUser}" ] ; then
                    EH_problem ""
                    lpReturn
                fi
                gitPasswd=$( fileParamManage.py -i fileParamReadPath ~/gitAuth/${gitServer}/userPasswd )
            else
                gitPasswd=$2
            fi
            opDo sudo -u lsipusr /opt/public/osmt/bin/bx-gitAccess.sh -h -v -n showRun -p localDest="${destFullPath}" -p gitServer=${gitServer} -p repoBase=${pbd_srcPath} -f -i repoClone "${gitAccessMode}" ${gitUser} ${gitPasswd}       
            ;;

        "authSsh")
            EH_assert [[ $# -eq 1 ]]
            typeset gitUser=$1
            if [ "${gitUser}" == "uaso" ] ; then
                gitUser=$( bueAcctCurrent.sh -i currentAssociatedShow 2> /dev/null )
                if [ -z "${gitUser}" ] ; then
                    EH_problem ""
                    lpReturn
                else
                    gitUser="${gitUser}.${gitServer}"
                fi
            fi
            opDo sudo -u lsipusr /opt/public/osmt/bin/bx-gitAccess.sh -h -v -n showRun -p localDest="${destFullPath}" -p gitServer=${gitServer} -p repoBase=${pbd_srcPath} -f -i repoClone "${gitAccessMode}" ${gitUser}
            ;;

        *)
            EH_problem "gitAccessMode=${gitAccessMode}"
            lpReturn
    esac

    lpReturn
}


_CommentBegin_
*      ################      *End Of Editable Text*
_CommentEnd_


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
