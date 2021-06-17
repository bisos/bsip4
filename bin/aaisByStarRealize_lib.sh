#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${aaisByStarRealize_lib:-}" ] ; then
    aaisByStarRealize_lib="LOADED" ; TM_trace 7 "aaisByStarRealize_lib :: Loading Library -- /bisos/bsip/bin/aaisByStarRealize_lib.sh"
else
    TM_trace 7 "aaisByStarRealize_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/aaisByStarRealize_lib.sh" ; return
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
** 
** Creates a BARC (Bystar Account Request Aabis) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_aabis_assignAndRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** Dispatches to BoxRealize or to VirtRealize.
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   EH_assert [ ! -z "${serviceType}" ]   
   EH_assert [ ! -z "${correspondingBxo}" ]

   local assignBase=""
   
   case "${serviceType}" in
       ByName|BySmb|ByFamily)
	   assignBase=$(lpDo vis_aabis_serviceTypeAssignCorespondingBxo)
	   lpDo vis_aabis_withAssignBaseRealize ${assignBase}
	   ;;
       *)
	   EH_problem "Bad Usage -- serviceType=${serviceType}"
	   ;;
   esac
}	



function vis_aabis_withAssignBaseRealize {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is bxoRepoScope -- \$2 is path to siteAabisAssignBase 
*** -p passive= instead of  EH_assert bxoRealizationScopeIsValid "${bxoRealizationScope}"
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local aabisAssignBase=$1
   EH_assert [ -d ${aabisAssignBase} ]

   lpReturn

   # sysCharAabisBxoId is just a bxoId derived from aabisId assignment. It may or may not exist
   local aabisBxoId=$( vis_withAssignBaseGetBxoIdName "${aabisAssignBase}" )
   EH_assert [ ! -z "${aabisBxoId}" ]

   local parentBxoId=$( vis_parentBxoId )   # used as parent for provisioning of sysCharAabisBxoId
   local aabisId=$( fileParamManage.py -i fileParamRead  "${aabisAssignBase}" aabisId )  # used as name for provisioning

   if vis_bxoAcctVerify "${aabisBxoId}" ; then
       ANT_raw "${aabisBxoId} account exists, already realized -- provisioning skipped"
   else
       ANT_raw "${aabisBxoId} will be realized"       
       #lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${aabisId}" -i startToPrivRealize
       lpDo bxmeProvision.sh -h -v -n showRun -p privacy="priv" -p kind="materialization" -p type="sysChar" -p parent="${selectedSiteBxoId}" -p name="${aabisId}" -i startToPrivRealize ${bxoRealizationScope}
   fi

   bxoId="${aabisBxoId}"
   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )

   # vis_basesFullCreate needs to run before vis_kindTypeRealizeRepoBases
   vis_aabis_basesFullCreate # Creates symlinks in ~bxo   

   vis_aabis_kindTypeRealizeRepoBases ${bxoRealizationScope}
}

function vis_aabis_repoBasesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    cat  << _EOF_
panel
deploymentRecords
sysChar
svcsSpec
_EOF_

    lpReturn
}

function vis_aabis_basesList {
    cat  << _EOF_
var
siteAabissRepo
_EOF_
}


function vis_aabis_baseCreate_var {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Create /bisos/var/bxoId/${bxoId} and symlink to it.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bxoHome}/${baseName}"
    
    local bisosVarBaseDir="/bisos/var/bxoId/${bxoId}"

    lpDo FN_dirCreatePathIfNotThere ${bisosVarBaseDir}
    
    lpDo FN_fileSymlinkUpdate ${bisosVarBaseDir} ${basePath}

    lpReturn
}	



function vis_aabis_baseCreate_siteAabissRepo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Symlink to site aabiss.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

    local baseName=${FUNCNAME##vis_baseCreate_}
    local basePath="${bxoHome}/${baseName}"

    local siteAabissBase=$( siteAabisRepo.sh -i aabissBaseObtain )
    local aabissRepoPath="${siteAabissBase}/${bxoId##pmp_}"
    EH_assert [ -d "${aabissRepoPath}" ]

    lpDo FN_fileSymlinkUpdate "${aabissRepoPath}" "${basePath}"

    lpReturn
}	

function vis_aabis_basesFullCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Creates bases (eg var) based on vis_basesList.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert vis_bxoAcctVerify "${bxoId}"

    for each in $(vis_basesList) ; do
	lpDo vis_baseCreate_${each}
    done

    lpReturn
}	

function vis_aabis_repoBaseCreate_deploymentRecords {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"
BxO Repo: ${repoBase} 
Placeholder for records/logs of materialization/deployment.
_EOF_

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}	


function vis_aabis_repoBaseCreate_svcsSpec {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
includes a list of BxSO's which provide the expected services
_EOF_

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/fps
    lpDo fileParamManage.py -i fileParamWrite ${repoBase}/fps bxoId UnSpecified

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}	


function vis_aabis_repoBaseCreate_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bxoIdPrep

    local repoName=${FUNCNAME##vis_repoBaseCreate_}
    local repoBase="${bxoHome}/${repoName}"

    lpDo FN_dirCreatePathIfNotThere "${repoBase}"

    lpDo eval cat  << _EOF_  \> "${repoBase}/README.org"    
BxO Repo: ${repoBase} 
for now just a bin directory
_EOF_

    # vis_sysCharWrite is in ./sysChar_lib.sh 
    lpDo vis_sysCharWrite

    lpDo FN_dirCreatePathIfNotThere ${repoBase}/bin
    lpDo touch ${repoBase}/bin/materialize.sh

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    lpReturn
}	


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
