#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lpCurrentsAdmin.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $"
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
*  /This File/ :: /bisos/bsip/bin/bisosCurrentsAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*

_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/platformBases_lib.sh
. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteRegistrar_lib.sh


# PRE parameters
typeset -t registrar=""
typeset -t id=""
typeset -t password=""


function G_postParamHook {
        
    return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local siteBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )    

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "FULL Site Deployment" )
${G_myName} ${extraInfo} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -i fullUpdate  # currents + siteFullUpdate
${G_myName} ${extraInfo} -i fullUpdate   # currents + siteFullUpdate
${G_myName} ${extraInfo} -p bpoId="${siteBxoId}" -i activate_siteBxoPlusAndSelect 
$( examplesSeperatorChapter "Full Operations" )
${G_myName} ${extraInfo} -i siteFullUpdate
${G_myName} ${extraInfo} -p registrar=TBD -p id=TBD -p password=TBD -i siteFullUpdate
$( examplesSeperatorChapter "Temporary Site" )
${G_myName} ${extraInfo} -i obtainTmpSite
${G_myName} ${extraInfo} -p registrar=TBD -p id=TBD -p password=TBD -i obtainTmpSite
$( examplesSeperatorChapter "Initial Known Hosts Setup" )
${G_myName} ${extraInfo} -i knownHostsAddSiteGitServer  # Runs after obtainTmpSite
${G_myName} ${extraInfo} -p id=bystar -i knownHostsAddSiteGitServer
_EOF_
}

noArgsHook() {
  vis_examples
}


function vis_fullUpdate {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo bisosCurrentsManage.sh ${G_commandOptions} -i fullUpdate

    lpDo bisosSiteSetup.sh ${G_commandOptions} -p registrar="${registrar}" -p id="${id}" -p password="${password}" -i siteFullUpdate
}


function vis_siteFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
First ${HOME}/tmp/tmp-site/bin is obtained.
/bisos/var/sites/selected/bin/siteBisosSetup.sh -i fullUpdate sets up a gitServer
With that gitServer, we then
- activate "bisos" Real-System BxO
- activate "defaultSite" BxO
We then symlink ~pis_defaultSite to /bisos/var/sites/selected
And git rid of ${HOME}/tmp/tmp-site
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset extraInfo="-h -v -n showRun"  #   ${G_commandOptions}

    local curDir=$( pwd )

    lpDo vis_obtainTmpSite    # registrar, id, password are icm params

    if [ ! -d "${HOME}/tmp/tmp-site" ] ; then
        EH_problem "Missing ${HOME}/tmp/tmp-site"
        lpReturn 101
    fi
    
    lpDo FN_dirCreatePathIfNotThere /bisos/var/sites
    
    lpDo FN_fileSymlinkUpdate ${HOME}/tmp/tmp-site /bisos/var/sites/selected

    lpDo vis_knownHostsAddSiteGitServer  # Needs to happen before any git clones and after var/sites/selected
    
    inBaseDirDo /bisos/var/sites/selected/sys/bin siteBisosSetup.sh -h -v -n showRun -i fullUpdate

    # Activate "bisos" Real-System BxO
    lpDo bpoManage.sh -h -v -n showRun -p privacy="priv" -p bpoId="prs_bisos" -i fullConstruct

    # Activate "defaultSite" BxO
    lpDo bpoManage.sh -h -v -n showRun -p privacy="priv" -p bpoId="pis_defaultSite" -i fullConstruct

    local siteBootstrapDir=$( FN_absolutePathGet ~pis_defaultSite/bootstrap )

    if [ ! -d "${siteBootstrapDir}" ] ; then
        EH_problem "Missing siteBootstrapDir=${siteBootstrapDir}"
        lpReturn 101
    fi

    lpDo FN_fileSymlinkUpdate $(FN_absolutePathGet ~pis_defaultSite) /bisos/var/sites/selected

    lpDo cd ${curDir}
    
    # lpDo rm -r -f ${HOME}/tmp/tmp-site

    lpDo /bisos/var/sites/selected/sys/bin/siteBisosGitServer.sh ${extraInfo} -i initialize

    lpDo /bisos/var/sites/selected/sys/bin/siteBisosDefaults.sh ${extraInfo} -i initialize
    
    lpReturn
}



function vis_activate_siteBxoPlusAndSelect {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Create the specified bpoId 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # EH_assert [ ! -z "${bpoId}" ]
    # EH_assert vis_bxoAcctVerify "${bpoId}"
    # bpoHome=$( FN_absolutePathGet ~${bpoId} )

    local siteBxoId="${bpoId}"

    lpDo vis_activate_siteBxoPlus "${siteBxoId}"

    # BISOS Selected Site 
    lpDo siteManage.sh -h -v -n showRun -i siteBisosAdd ${siteBxoId}
    lpDo siteManage.sh -h -v -n showRun -i siteBisosSelect ${siteBxoId}

    # USG Selected Site
    lpDo siteManage.sh -h -v -n showRun -i siteUsgAdd ${siteBxoId}
    lpDo siteManage.sh -h -v -n showRun -i siteUsgSelect ${siteBxoId}    
}



function vis_obtainTmpSite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${registrar}" ] ; then
        registrar=$( siteRegistrarInfo.sh -i registrarHostName )
    fi
    if [ -z "${id}" ] ; then
        id=$( siteRegistrarInfo.sh -i registrarUserName )
    fi
    if [ -z "${password}" ] ; then
        password=$( siteRegistrarInfo.sh -i registrarUserPassword )
    fi

    local passwdFile="/tmp/bisosPasswdFile"

    echo ${password} > "${passwdFile}"
    
    if [ ! -f "${passwdFile}" ] ; then
        EH_problem "Missing passwdFile"
        lpReturn 101
    fi
    
    lpDo FN_dirCreatePathIfNotThere ${HOME}/tmp

    if [ -d "${HOME}/tmp/tmp-site" ] ; then
        EH_problem "${HOME}/tmp/tmp-site already exists"
        lpReturn 101
    fi

    #local siteBootstrapDir="/bxo/r3/iso/pis_defaultSite/bootstrap"  # OBSOLETED
    local siteBootstrapDir="/bxo/r3/iso/pis_defaultSite"
    
    lpDo sshpass -f "${passwdFile}" scp -o StrictHostKeyChecking=no -r ${id}@${registrar}:${siteBootstrapDir} ${HOME}/tmp/tmp-site

    lpDo rm "${passwdFile}"

    lpReturn
}


function vis_knownHostsAddSiteGitServer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${id}" ] ; then
        id=$( siteRegistrarInfo.sh -i registrarUserName )
    fi
    local siteGitServerInfoBaseDir=$( bisosSiteGitServer.sh -i gitServerInfoBaseDir )

    echo NOTYET fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName
    
    local site_gitServerName=$( fileParamManage.py -i fileParamRead ${siteGitServerInfoBaseDir} gitServerName )
    EH_assert [ ! -z "${site_gitServerName}" ]

    lpDo lcaSshAdmin.sh ${G_commandOptions} -i knownHostsAddSystem "${id}" "${site_gitServerName}"
    
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
