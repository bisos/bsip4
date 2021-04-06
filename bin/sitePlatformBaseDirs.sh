#!/bin/bash

IimBriefDescription="Site Platforms Base Dirs Setup. Matches and is invoked by sitePlatformBaseDirs.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: sitePlatformBaseDirs.sh,v 1.8 2016-12-07 05:47:33 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedPlatformBaseDirs.sh"
SEED="
*  /[dblock]/ /Seed/: [[file:/opt/public/osmt/bin/seedPlatformBaseDirs.sh]] | 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedPlatformBaseDirs.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_


_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/private/site/activeDocs/libreCenter/disks/fullUsagePanel-en.org::Xref-][MODULE Panel]]  [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
sitePlatformBaseDirs.sh works with and is invoked by charPlatformBaseDirs.sh

Provides definition information for the following file hierarchies.

Relative Path -- destPathRel
              -- destPathBaseDefault
Source Path   -- srcPath

function vis_disksImportMount  {
    EH_assert [[ $# -eq 0 ]]


    if [ ! -d /dd/net/bisp0003/c/0 ] ; then
	opDo mkdir /dd/net/bisp0003/c/0
    fi
    opDo mount 192.168.0.183:/dd/this/c/0 /dd/net/bisp0003/c/0

Then edit /etc/exports to configure your shares. Here's a line from my live version that shares my music:

/media/ned/music        192.168.0.0/255.255.255.0(ro,sync,no_subtree_check)

This shares that path with anybody on 192.168.0.* in a readonly (notice the ro) way.

When you've finished editing, restart NFS:

sudo /etc/init.d/nfs-kernel-server restart

To connect a client, you need the NFS gubbins (not installed by default):

sudo apt-get install nfs-common

And then add a line to /etc/fstab

192.168.0.4:/media/ned/music  /media/music  nfs ro,hard,intr 0 0
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Specific Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Import  [[file:/opt/public/osmt/bin/commonPlatformBaseDirs.libSh][commonPlatformBaseDirs.libSh]] |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

# /opt/public/osmt/bin/commonPlatformBaseDirs.libSh
. ${opBinBase}/commonPlatformBaseDirs.libSh

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: examplesHookPost [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesHookPost {
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} -- ADDITIONS" )
$( examplesSeperatorChapter "Full Remote Update" )
${G_myName} ${extraInfo} -p baseDir=/dd/this/b -i fullUpdate
${G_myName} ${extraInfo} -i siteNfsMounts
${G_myName} ${extraInfo} -i siteNfsUnMounts
${G_myName} ${extraInfo} -i siteNfsFstabLines
${G_myName} ${extraInfo} -i siteUniformLinksUpdate
$( examplesSeperatorChapter "Verify" )
${G_myName} ${extraInfo} -p baseDir=/dd/this/b -i pbdListVerify  pbdList_dd
$( examplesSeperatorChapter "Update" )
${G_myName} ${extraInfo} -p baseDir=/dd/this/b -i pbdListUpdate  pbdList_dd
$( examplesSeperatorChapter "Typical Site Common Usages" )
${G_myName} ${extraInfo} -p baseDir="/dd/this/XJ" -i ddPrivScopePrep
${G_myName} ${extraInfo} -p baseDir="/tmp" -i pbdListUpdate pbdList_ddPrivScopeBases
${G_myName} ${extraInfo} -p baseDir="/tmp" -i pbdListUpdate pbdList_ddPrivScopeLinks
$( examplesSeperatorChapter "Remote Mount Mount Points" )
sudo mkdir -p /dd/net/bisp0003/c
${G_myName} ${extraInfo} -p baseDir="/dd/net/bisp0003/c" -i pbdListUpdate pbdList_ddPrivScopeBases
sudo mkdir -p /dd/net/bisp0017/d1
sudo mkdir -p /dd/net/bisp0017/md0
${G_myName} ${extraInfo} -p baseDir="/dd/net/bisp0017/d1" -i pbdListUpdate pbdList_ddPrivScopeBases
$( examplesSeperatorChapter "/uniform Provider Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderLinks
$( examplesSeperatorChapter "/uniform PrivScope Remote Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -p linkEndBase="/dd/net/bisp0014" -i pbdListUpdate pbdList_uniformRemoteLinks
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteLinks
$( examplesSeperatorChapter "/uniform PrivScope Local Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformLocalLinks
$( examplesSeperatorChapter "/uniform Audio, Video, Images Provider Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks_contents
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks_vms
$( examplesSeperatorChapter "/uniform Audio, Video, Images Remote Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks_contents
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks_vms
$( examplesSeperatorChapter "/uniform Audio, Video, Images Local Links" )
${G_myName} ${extraInfo} -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformLocalMediaLinks
$( examplesSeperatorChapter "Prep Functions" )
${G_myName} ${extraInfo} -p baseDir=/tmp -i pbdListUpdate  pbdList_ddPrivScope
${G_myName} ${extraInfo} -p baseDir=/tmp -i ddPrivScopePrep
_EOF_
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Full Service Operations*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Full          :: Full Update [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET, when remote, do a nfs mount + uniformLinksUpdate
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo echo NOTYET ${G_myName} ${extraInfo} -p baseDir=/ -i pbdListUpdate  pbdList_dd

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Site          :: Site NFS Setup And Mount -- vis_siteNfsMounts [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_siteNfsMountsOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    remPlatformName="bisp0017"
    remAddr=192.168.0.197

    baseDir="/dd/net/${remPlatformName}/d1"
    remBaseDir="/dd/this/d1"

    # 0-2
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_ddPrivScopeBases_Public  

    # 3-5
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_ddPrivScopeBases_Limited  

    baseDir="/dd/net/${remPlatformName}/md0"
    remBaseDir="/dd/this/md0"

    # 6-8
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_ddPrivScopeBases_ExternalConfidential  

    # 9-11
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_ddPrivScopeBases_ClientConfidential  

    # 12-14
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_ddPrivScopeBases_ClusterConfidential  

    lpReturn
}


function vis_siteNfsMounts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    remPlatformName="bisp0017"
    remAddr=192.168.0.197

    # 
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="default" -p remBaseDir="default" -p remAddr=${remAddr} -i withParamsNfsMount  pbdList_uniformRemoteLinks

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Site          :: Site NFS UnMount -- vis_siteNfsUnMounts [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_siteNfsUnMounts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    remPlatformName="bisp0017"
    remAddr=192.168.0.197

    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="default" -p remBaseDir="default" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_uniformRemoteLinks    

    lpReturn
}


function vis_siteNfsUnMountsOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    remPlatformName="bisp0017"
    remAddr=192.168.0.197

    baseDir="/dd/net/${remPlatformName}/d1"
    remBaseDir="/dd/this/d1"

    # 0-2
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_ddPrivScopeBases_Public  

    # 3-5
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_ddPrivScopeBases_Limited  

    baseDir="/dd/net/${remPlatformName}/md0"
    remBaseDir="/dd/this/md0"

    # 6-8
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_ddPrivScopeBases_ExternalConfidential  

    # 9-11
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_ddPrivScopeBases_ClientConfidential  

    # 12-14
    opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsUnMount  pbdList_ddPrivScopeBases_ClusterConfidential  

    lpReturn
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Site          :: Site Uniform Links Update -- vis_siteUniformLinksUpdate (Applies to Both Provider and Remotes) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_siteUniformLinksUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET, Check to see if we are running on local or on remote and do accordingly.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [[ "${opRunHostName}" == "bisp0017" ]] ; then
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderLinks
	
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks_contents
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformProviderMediaLinks_vms
    else
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteLinks

	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks_contents
	opDo sitePlatformBaseDirs.sh -h -v -n showRun -p baseDir="/uniform" -i pbdListUpdate pbdList_uniformRemoteMediaLinks_vms
    fi
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Site          :: Site NFS FstabLines -- vis_siteNfsFstabLines  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_siteNfsFstabLines {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    remPlatformName="bisp0017"
    remAddr=192.168.0.197

    ###############

    baseDir="/dd/net/${remPlatformName}/d1"
    remBaseDir="/dd/this/d1"
 
    # 0-2
    opDo sitePlatformBaseDirs.sh -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsFstabLines  pbdList_ddPrivScopeBases_Public 

    # 3-5
    opDo sitePlatformBaseDirs.sh -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsFstabLines  pbdList_ddPrivScopeBases_Limited  

    ###############

    baseDir="/dd/net/${remPlatformName}/md0"
    remBaseDir="/dd/this/md0"

    # 6-8
    opDo sitePlatformBaseDirs.sh -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsFstabLines  pbdList_ddPrivScopeBases_ExternalConfidential  

    # 9-11
    opDo sitePlatformBaseDirs.sh -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsFstabLines  pbdList_ddPrivScopeBases_ClientConfidential  

    # 12-14
    opDo sitePlatformBaseDirs.sh -p baseDir="${baseDir}" -p remBaseDir="${remBaseDir}" -p remAddr=${remAddr} -i withParamsNfsFstabLines  pbdList_ddPrivScopeBases_ClusterConfidential 

    ###############

    # 15-17
    # Personal Confidentials Are Not Exported, Because They Are Personal

    lpReturn
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Platform Base Dirs (pbd) Lists -- PdbLists*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List          :: pbd List uniformProviderLinks for ddPrivScope [[elisp:(org-cycle)][| ]]
_CommentEnd_


pbdList_uniformProviderLinks=( 
    "uniformProvider/Public"
    "uniformProvider/ArchivePublic"
    "uniformProvider/BackupPublic"
    "uniformProvider/Limited"
    "uniformProvider/ArchiveLimited"
    "uniformProvider/BackupLimited"
    "uniformProvider/ExternalConfidential"
    "uniformProvider/ArchiveExternalConfidential"
    "uniformProvider/BackupExternalConfidential"
    "uniformProvider/ClientConfidential"
    "uniformProvider/ArchiveClientConfidential"
    "uniformProvider/BackupClientConfidential"
    "uniformProvider/ClusterConfidential"
    "uniformProvider/ArchiveClusterConfidential"
    "uniformProvider/BackupClusterConfidential"
    "uniformProvider/PersonalConfidential"
    "uniformProvider/ArchivePersonalConfidential"
    "uniformProvider/BackupPersonalConfidential"
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List          :: pbd List uniformRemoteLinks for ddPrivScope [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformRemoteLinks=( 
    "uniformRemote/Public"
    "uniformRemote/ArchivePublic"
    "uniformRemote/BackupPublic"
    "uniformRemote/Limited"
    "uniformRemote/ArchiveLimited"
    "uniformRemote/BackupLimited"
    "uniformRemote/ExternalConfidential"
    "uniformRemote/ArchiveExternalConfidential"
    "uniformRemote/BackupExternalConfidential"
    "uniformRemote/ClientConfidential"
    "uniformRemote/ArchiveClientConfidential"
    "uniformRemote/BackupClientConfidential"
    "uniformRemote/ClusterConfidential"
    "uniformRemote/ArchiveClusterConfidential"
    "uniformRemote/BackupClusterConfidential"
    "uniformRemote/PersonalConfidential"
    "uniformRemote/ArchivePersonalConfidential"
    "uniformRemote/BackupPersonalConfidential"
    
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List          :: pbd List uniformRemotePersonalLinks for ddPrivScope [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformRemotePersonalLinks=( 
    "uniformRemote/PersonalConfidential"
    "uniformRemote/ArchivePersonalConfidential"
    "uniformRemote/BackupPersonalConfidential"
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List          :: pbd List uniformProviderMediaLinks [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformProviderMediaLinks=( 
    "uniformProvider/mediaTypeAudio"
    "uniformProvider/mediaTypeAudioBooks"
    "uniformProvider/mediaTypeVideo"
    "uniformProvider/mediaTypeDocuments"
    "uniformProvider/mediaTypeComics"
    "uniformProvider/mediaTypeDistros"
    "uniformProvider/mediaTypeDistros/Public"
    "uniformProvider/mediaTypeDistros/Limited"
    "uniformProvider/mediaTypeVMs"
    "uniformProvider/mediaTypeVMs/Public"
    "uniformProvider/mediaTypeVMs/Limited"
    "uniformProvider/mediaTypeVMs/ClusterConfidential"

)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Subject      ::  pbd List uniformProviderMediaLinks / Content (Audio, ..., Documents) [[elisp:(org-cycle)][| ]]
_CommentEnd_


pbdList_uniformProviderMediaLinks_content=( 
    "uniformProvider/mediaTypeAudio"
    "uniformProvider/mediaTypeAudioBooks"
    "uniformProvider/mediaTypeVideo"
    "uniformProvider/mediaTypeDocuments"
    "uniformProvider/mediaTypeComics"
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Subject      ::  pbd List uniformProviderMediaLinks / VMs [[elisp:(org-cycle)][| ]]
_CommentEnd_


pbdList_uniformProviderMediaLinks_vms=( 
    "uniformProvider/mediaTypeVMs"
    "uniformProvider/mediaTypeVMs/Public"
    "uniformProvider/mediaTypeVMs/Limited"
    "uniformProvider/mediaTypeVMs/ClusterConfidential"
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  List          :: pbd List uniformRemoteMediaLinks [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformRemoteMediaLinks=( 
    "uniformRemote/mediaTypeAudio"
    "uniformRemote/mediaTypeAudioBooks"
    "uniformRemote/mediaTypeVideo"
    "uniformRemote/mediaTypeDocuments"
    "uniformRemote/mediaTypeComics"
    "uniformRemote/mediaTypeVMs"
    "uniformRemote/mediaTypeVMs/Public"
    "uniformRemote/mediaTypeVMs/Limited"
    "uniformRemote/mediaTypeVMs/ClusterConfidential"
)

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Subject      ::  pbd List uniformRemoteMediaLinks / Content (Audio, ..., Documents) [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformRemoteMediaLinks_content=( 
    "uniformRemote/mediaTypeAudio"
    "uniformRemote/mediaTypeAudioBooks"
    "uniformRemote/mediaTypeVideo"
    "uniformRemote/mediaTypeDocuments"
    "uniformRemote/mediaTypeComics"
)

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Subject      ::  pbd List uniformRemoteMediaLinks / VMs [[elisp:(org-cycle)][| ]]
_CommentEnd_

pbdList_uniformRemoteMediaLinks_vms=( 
    "uniformRemote/mediaTypeVMs"
    "uniformRemote/mediaTypeVMs/Public"
    "uniformRemote/mediaTypeVMs/Limited"
    "uniformRemote/mediaTypeVMs/ClusterConfidential"
)


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Platform Base Directory (pbd) Hierarchies*
_CommentEnd_


_CommentBegin_
*      pbd Prov Defs :: /uniform =Provider ddPrivScopeLinks= -- bisp0017 providerDirBase_public_{current,archive,backup}="/dd/this/d1"
*      pbd Prov Defs ::  ddPrivScopeLinks -- bisp0017  providerDirBase_limited_{current,archive,backup}="/dd/this/d1"
*      pbd Prov Defs ::  ddPrivScopeLinks -- bisp0017  providerDirBase_{External,Client,Cluster,Personal}Confidential_current="/dd/this/md0"
*  [[elisp:(org-cycle)][| ]]  pbd Prov Defs ::  ddPrivScopeLinks -- bisp0017  providerDirBase_{External,Client,Cluster,Personal}Confidential_{archive,backup}="/dd/this/XJ" [[elisp:(org-cycle)][| ]]
_CommentEnd_

providerDirBase_0_5="/dd/this/d1"             # 4T  Internal Drive
providerDirBase_public_current="/dd/this/d1"
providerDirBase_public_archive="/dd/this/d1"
providerDirBase_public_backup="/dd/this/d1"

providerDirBase_limited_current="/dd/this/d1"
providerDirBase_limited_archive="/dd/this/d1"
providerDirBase_limited_backup="/dd/this/d1"

providerDirBase_6_17="/dd/this/md0"           # 2T  Raid1
providerDirBase_priv_current="/dd/this/md0"   # 2T  Raid1
providerDirBase_priv_archive="/dd/this/XJ"    # 4T  External USB3
providerDirBase_priv_backup="/dd/this/XJ"     # 4T  External USB3

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 0:  uniformProvider/Public [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_Public=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Public"
    [srcPath]="${providerDirBase_0_5}/0"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 1:  uniformProvider/ArchivePublic [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchivePublic=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchivePublic"
    [srcPath]="${providerDirBase_0_5}/1"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 2:  uniformProvider/BackupPublic [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupPublic=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupPublic"
    [srcPath]="${providerDirBase_0_5}/2"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 3:  uniformProvider/Limited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_Limited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Limited"
    [srcPath]="${providerDirBase_0_5}/3"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 4:  uniformProvider/ArchiveLimited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchiveLimited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveLimited"
    [srcPath]="${providerDirBase_0_5}/4"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 5:  uniformProvider/BackupLimited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupLimited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupLimited"
    [srcPath]="${providerDirBase_0_5}/5"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 6:  uniformProvider/ExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ExternalConfidential"
    [srcPath]="${providerDirBase_6_17}/6"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 7:  uniformProvider/ArchiveExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchiveExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveExternalConfidential"
    [srcPath]="${providerDirBase_priv_archive}/7"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 8:  uniformProvider/BackupExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupExternalConfidential"
    [srcPath]="${providerDirBase_priv_backup}/8"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 9:  uniformProvider/ClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ClientConfidential"
    [srcPath]="${providerDirBase_6_17}/9"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 10: uniformProvider/ArchiveClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchiveClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveClientConfidential"
    [srcPath]="${providerDirBase_priv_archive}/10"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 11: uniformProvider/BackupClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupClientConfidential"
    [srcPath]="${providerDirBase_priv_backup}/11"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 12: uniformProvider/ClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ClusterConfidential"
    [srcPath]="${providerDirBase_6_17}/12"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 13: uniformProvider/ArchiveClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchiveClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveClusterConfidential"
    [srcPath]="${providerDirBase_priv_archive}/13"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 14: uniformProvider/BackupClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupClusterConfidential"
    [srcPath]="${providerDirBase_priv_backup}/14"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 15: uniformProvider/PersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_PersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="PersonalConfidential"
    [srcPath]="${providerDirBase_6_17}/15"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 16: uniformProvider/ArchivePersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_ArchivePersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchivePersonalConfidential"
    [srcPath]="${providerDirBase_priv_archive}/16"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: 17: uniformProvider/BackupPersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_BackupPersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupPersonalConfidential"
    [srcPath]="${providerDirBase_priv_backup}/17"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
*      pbd Rem Defs  :: /uniform =Remote ddPrivScopeLinks= --  providerDirBase_public_{current,archive,backup}="/dd/net/bisp0017/d1"
*      pbd Rem Defs  ::  ddPrivScopeLinks -- providerDirBase_limited_{current,archive,backup}="/dd/net/bisp0017/d1"
*      pbd Rem Defs  ::  ddPrivScopeLinks -- providerDirBase_{External,Client,Cluster,Personal}Confidential_current="/dd/net/bisp0017/md0"
*  [[elisp:(org-cycle)][| ]]  pbd Rem Defs  ::  ddPrivScopeLinks -- providerDirBase_{External,Client,Cluster,Personal}Confidential_{archive,backup}="/dd/net/bisp0017/XJ" [[elisp:(org-cycle)][| ]]

_CommentEnd_

#remoteDirBase="/dd/net/bisp0014"
#remoteDirBase="/dd/net/bisp0017"

remoteDirBase_0_5="/dd/net/bisp0017/d1"                    # 4T  Internal
remoteDirBase_6_17="/dd/net/bisp0017/md0"                  # 2T  Raid1
remoteDirBase_priv_current="/dd/net/bisp0017/md0"          # 2T  Raid1
remoteDirBase_priv_archive="/dd/net/bisp0017/XJ"           # 4T  External USB3
remoteDirBase_priv_backup="/dd/net/bisp0017/XJ"            # 4T  External USB3


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 0:  uniformRemote/Public [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_Public=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Public"
    [srcPath]="${remoteDirBase_0_5}/0"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 1:  uniformRemote/ArchivePublic [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchivePublic=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchivePublic"
    [srcPath]="${remoteDirBase_0_5}/1"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 2:  uniformRemote/BackupPublic [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupPublic=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupPublic"
    [srcPath]="${remoteDirBase_0_5}/2"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 3:  uniformRemote/Limited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_Limited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Limited"
    [srcPath]="${remoteDirBase_0_5}/3"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 4:  uniformRemote/ArchiveLimited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchiveLimited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveLimited"
    [srcPath]="${remoteDirBase_0_5}/4"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 5:  uniformRemote/BackupLimited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupLimited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupLimited"
    [srcPath]="${remoteDirBase_0_5}/5"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 6:  uniformRemote/ExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ExternalConfidential"
    [srcPath]="${remoteDirBase_6_17}/6"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 7:  uniformRemote/ArchiveExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchiveExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveExternalConfidential"
    [srcPath]="${remoteDirBase_priv_archive}/7"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 8:  uniformRemote/BackupExternalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupExternalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupExternalConfidential"
    [srcPath]="${remoteDirBase_priv_backup}/8"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 9:  uniformRemote/ClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ClientConfidential"
    [srcPath]="${remoteDirBase_6_17}/9"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 10: uniformRemote/ArchiveClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchiveClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveClientConfidential"
    [srcPath]="${remoteDirBase_priv_archive}/10"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 11: uniformRemote/BackupClientConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupClientConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupClientConfidential"
    [srcPath]="${remoteDirBase_priv_backup}/11"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 12: uniformRemote/ClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ClusterConfidential"
    [srcPath]="${remoteDirBase_6_17}/12"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 13: uniformRemote/ArchiveClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchiveClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchiveClusterConfidential"
    [srcPath]="${remoteDirBase_priv_archive}/13"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 14: uniformRemote/BackupClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupClusterConfidential"
    [srcPath]="${remoteDirBase_priv_backup}/14"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 15: uniformRemote/PersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_PersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="PersonalConfidential"
    [srcPath]="${remoteDirBase_6_17}/15"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 16: uniformRemote/ArchivePersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_ArchivePersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="ArchivePersonalConfidential"
    [srcPath]="${remoteDirBase_priv_archive}/16"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: 17: uniformRemote/BackupPersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_BackupPersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="BackupPersonalConfidential"
    [srcPath]="${remoteDirBase_priv_backup}/17"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  pbd Prov Defs :: /uniform =Provider mediaTypes Links= [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeAudio [[elisp:(org-cycle)][| ]]
_CommentEnd_

#providerDirBase="/dd/this/a"

typeset -A pbd_uniformProvider_mediaTypeAudio=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Audio"
    [srcPath]="${providerDirBase_0_5}/3/Audio"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeAudioBooks [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformProvider_mediaTypeAudioBooks=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="AudioBooks"
    [srcPath]="${providerDirBase_0_5}/3/AudioBooks"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeVideo [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformProvider_mediaTypeVideo=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Video"
    [srcPath]="${providerDirBase_0_5}/3/Video"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeDocuments [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformProvider_mediaTypeDocuments=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Documents"
    [srcPath]="${providerDirBase_0_5}/3/Documents"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeComics [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeComics=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Comics"
    [srcPath]="${providerDirBase_0_5}/3/Comics"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeDistros [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeDistros=(
    [type]=directory
    [destPathBaseDefault]="/uniform"
    [destPathRel]="distros"
    [srcPath]=""
    [owner]=lsipusr
    [group]=employee
    [permissions]=775
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Provider    :: uniformProvider/mediaTypeDistros/Public [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeDistros_Public=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="distros/public"
    # /dd/this/d1/0/lh/vm
    [srcPath]="${providerDirBase_0_5}/0/lh/distro"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Provider    :: uniformProvider/mediaTypeDistros/Limited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeDistros_Limited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="distros/limited"
    # /dd/this/a/3/lh/vm
    [srcPath]="${providerDirBase_0_5}/3/distro"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Provider     :: uniformProvider/mediaTypeVMs [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeVMs=(
    [type]=directory
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs"
    [srcPath]=""
    [owner]=lsipusr
    [group]=employee
    [permissions]=775
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Provider    :: uniformProvider/mediaTypeVMs/Public [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeVMs_Public=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/Public"
    # /dd/this/d1/0/lh/vm
    [srcPath]="${providerDirBase_0_5}/0/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Provider    :: uniformProvider/mediaTypeVMs/Limited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeVMs_Limited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/Limited"
    # /dd/this/a/3/lh/vm
    [srcPath]="${providerDirBase_0_5}/3/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Provider    :: uniformProvider/mediaTypeVMs/ClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformProvider_mediaTypeVMs_ClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/ClusterConfidential"
    # /dd/this/a/12/lh/vm
    [srcPath]="${providerDirBase_6_17}/12/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  pbd Rem Defs  :: /uniform =Remote mediaTypes Links= [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeAudio [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeAudio=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Audio"
    [srcPath]="${remoteDirBase_0_5}/3/Audio"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeAudioBooks [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformRemote_mediaTypeAudioBooks=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="AudioBooks"
    [srcPath]="${remoteDirBase_0_5}/3/AudioBooks"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeVideo [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformRemote_mediaTypeVideo=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Video"
    [srcPath]="${remoteDirBase_0_5}/3/Video"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeDocuments [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -A pbd_uniformRemote_mediaTypeDocuments=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Documents"
    [srcPath]="${remoteDirBase}/3/Documents"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeComics [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeComics=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="Comics"
    [srcPath]="${remoteDirBase_0_5}/3/Comics"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  Remote       :: uniformRemote/mediaTypeVMs [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeVMs=(
    [type]=directory
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs"
    [srcPath]=""
    [owner]=lsipusr
    [group]=employee
    [permissions]=775
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Remote      :: uniformRemote/mediaTypeVMs/Public [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeVMs_Public=(
    [type]=symlink  # symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/Public"
    [srcPath]="${remoteDirBase_0_5}/0/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)

_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Remote      :: uniformRemote/mediaTypeVMs/Limited [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeVMs_Limited=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/Limited"
    [srcPath]="${remoteDirBase_0_5}/3/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Remote      :: uniformRemote/mediaTypeVMs/ClusterConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeVMs_ClusterConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/ClusterConfidential"
    [srcPath]="${remoteDirBase}/12/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
***  [[elisp:(org-cycle)][| ]]  Remote      :: uniformRemote/mediaTypeVMs/PersonalConfidential [[elisp:(org-cycle)][| ]]
_CommentEnd_

typeset -A pbd_uniformRemote_mediaTypeVMs_PersonalConfidential=(
    [type]=symlink
    [destPathBaseDefault]="/uniform"
    [destPathRel]="VMs/ClusterConfidential"
    [srcPath]="${remoteDirBase}/15/lh/vm"  # SymLinkPath Relative to destPathBase
    [owner]=lsipusr
    [group]=employee
    [permissions]=777
    [basePrepFunc]=noOp
    [baseCleanFunc]=noOp
    [description]=""
)


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *To Consider For Later*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Future        :: Function For Selection List Of BASH 4.X Assoc Array [[elisp:(org-cycle)][| ]]
_CommentEnd_


# function vis_thisPlatformLists {
#     G_funcEntry
#     function describeF {  G_funcEntryShow; cat  << _EOF_
# Check to see if hostis bisp0013 or bisp004, adjust mounts and links based on 
# common vars that will be set
# platformExportsList=
# platformImportsList=
# platformUniformsList=
# Given the above, we can run everything.
# _EOF_
#     }
#     EH_assert [[ $# -eq 0 ]]


# _CommentBegin_
# *     ====[[elisp:(org-cycle)][Fold]]==== Pkgs List
# _CommentEnd_

#     if [ "${opRunMachineArch}" == "x86_64" ] ; then
# 	prpList_main=( 
# 	    "basePkg_64bit"
# 	)
#     else
# 	prpList_main=( 
# 	    "basePkg_32bit"
# 	)
#     fi

#     #
#     # In BASH 4.x Associative Arrays From Within A Function Can Not Be Made Global.
#     # But prpList_main is dist+gen specific. So multiple generations are maintained based on the list.
#     #

#     lpReturn
# }



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:




