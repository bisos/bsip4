#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxeProvision_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxeProvision_lib :: Loading Library -- /bisos/bsip/bin/bxeProvision_lib.sh"
else
    TM_trace 7 "bxeProvision_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxeProvision_lib.sh" ; return
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
** Creates a BARC (Bystar Account Request Container) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

# PRE parameters

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_selectedSiteBxoId {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** With stdout, return the bxoId of selected sited based for current user (usgHome).
** TODO This should go into a library.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId
    local selectedSitePath="${usgHome}/bisos/sites/selected"
    
    local selectedSiteBxoId="$( FN_nonDirsPart $( readlink -f ${selectedSitePath} ) )"

    if ! vis_bxoAcctVerify "${selectedSiteBxoId}" ; then
	EH_problem "Missing selectedSiteBxoId"
	lpReturn 101
    fi

    echo "${selectedSiteBxoId}"

    lpReturn
}	


function vis_sysCharContainerBxoIdName {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout, bxoId of container corresponding to \$1 as a containerPath.
*** Typical usage is \$1=container base of this system obtained from siteContainerAssign.sh -i forThisSysFindContainerBase
*** The sysCharContainerBxoId is just a bxoId derived from containerId assignment. It may or may not exist
*** The sysCharContainerBxoId may or may not have been realized or activated.
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerAssignBase=$1
   local containerId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} containerId )
   EH_assert [ ! -z "${containerId}" ]

   echo pmp_${containerId}
}


function vis_containersBaseObtain {
    containersBaseObtain
}

function containersBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId
    local selectedContainersPath="${usgHome}/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId"
    
    local containersBxoId=""

    if [ -d "${selectedContainersPath}" ] ; then
	containersBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedContainersPath} )
	if [ -z "${containersBxoId}" ] ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${containersBxoId}" ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedContainersPath}"
	lpReturn 101
    fi

    local containersBase=$( FN_absolutePathGet ~${containersBxoId} )
    EH_assert [ -d "${containersBase}" ]

    echo "${containersBase}"

    lpReturn
}	


function vis_containersAssignBaseObtain {
    containersAssignBaseObtain
}

function containersAssignBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId
    local selectedContainersPath="${usgHome}/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId"
    
    local containersBxoId=""

    if [ -d "${selectedContainersPath}" ] ; then
	containersBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedContainersPath} )
	if [ -z "${containersBxoId}" ] ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${containersBxoId}" ; then
	    EH_problem "Missing containersBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedContainersPath}"
	lpReturn 101
    fi

    local containersBase=$( FN_absolutePathGet ~${containersBxoId} )/assign
    EH_assert [ -d "${containersBase}" ]

    echo "${containersBase}"

    lpReturn
}	

function vis_containersGenericsAssignList {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersBaseObtain )

   #find ${containersBase} -type d -print | egrep '/Generic/.*[^/]$'
   local genericBasesList=( $(find ${containersBase} -type d -print | egrep '/Generic/[a-z|0-9]*$') )

   for each in ${genericBasesList[@]} ;  do
       echo $each
   done
   
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
