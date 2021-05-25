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

function vis_siteBisosBase {
    # /bisos/var/sites/selected
    echo /bisos/var/sites
}

function vis_siteBisosAdd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1
    
    local siteBisosBase=$( vis_siteBisosBase )
    local siteBxoIdHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo FN_fileSymlinkUpdate ${siteBxoIdHome} ${siteBisosBase}/${siteBxoId}
}

function vis_siteBisosSelect {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
    }
    local siteBxoId=$1
    
    local siteBisosBase=$( vis_siteBisosBase )
    local siteBxoIdHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo FN_fileSymlinkUpdate ${siteBxoIdHome} ${siteBisosBase}/selected
}

function vis_siteUsgBase {
    G_funcEntry; function describeF {  G_funcEntryShow;
				       cat  << _docStringEnd_
** Defaults to ~/bisos/sites
_docStringEnd_
				    }

    EH_assert [[ $# -lt 2 ]]
    local usgHome=""
    
    if [ $# -eq 0 ] ; then
	usgHome=$( FN_absolutePathGet ~ )
    else
	usgHome="$1"
    fi

    if [ ! -d "${usgHome}/bisos/sites" ] ; then
	# to avoid verbose messages and for efficiency
	lpDo FN_dirCreatePathIfNotThere ${usgHome}/bisos/sites
    fi
     
    echo ${usgHome}/bisos/sites
}


function vis_siteUsgAdd {
    G_funcEntry; function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate the specified bxoId 
_EOF_
				    }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1
    
    local siteUsgBase=$( vis_siteUsgBase )
    local siteBxoIdHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo FN_fileSymlinkUpdate ${siteBxoIdHome} ${siteUsgBase}/${siteBxoId}
}

function vis_siteUsgSelect {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate the specified bxoId 
_EOF_
		       }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1
    
    local siteUsgBase=$( vis_siteUsgBase )
    local siteBxoIdHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo FN_fileSymlinkUpdate ${siteBxoIdHome} ${siteUsgBase}/selected
}


function vis_selectedSiteBxoId {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** With stdout return: bxoId of selected site based for current user (usgHome).
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/containers.bpoFp/bpoId
    local selectedSitePath="$( vis_siteUsgBase ${usgHome} )/selected"

    if [ ! -e "${selectedSitePath}" ] ; then
	selectedSitePath="$( vis_siteBisosBase )/selected"
	if [ ! -e "${selectedSitePath}" ] ; then
	    EH_problem "Missing selectedSitePath=${selectedSitePath}"
	    lpReturn 101
	fi
    fi
    
    local selectedSiteBxoId="$( FN_nonDirsPart $( readlink -f ${selectedSitePath} ) )"

    if ! vis_bxoAcctVerify "${selectedSiteBxoId}" ; then
	EH_problem "Missing selectedSiteBxoId"
	lpReturn 101
    fi

    echo "${selectedSiteBxoId}"

    lpReturn
}	


function vis_activate_siteBxoPlus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Activate the specified bxoId 
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local siteBxoId=$1

    if vis_bxoAcctVerify "${siteBxoId}" ; then
	ANT_cooked "WARNING: Did not expect ${siteBxoId} to exist -- Activation skipped"
    else
	lpDo bxoManage.sh -p bxoId="${siteBxoId}" -i fullConstruct
    fi

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    bxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    local boxesBxoId=$( vis_fromSiteBxoIdGet_boxesBxoId "${siteBxoId}")
    EH_assert [ ! -z "${boxesBxoId}" ]
    if vis_bxoAcctVerify "${boxesBxoId}" ; then
	ANT_cooked "WARNING: Did not expect ${boxesBxoId} to exist -- Activation skipped"
    else
	lpDo bxoManage.sh -p bxoId="${boxesBxoId}" -i fullConstruct
    fi

    local containersBxoId=$( vis_fromSiteBxoIdGet_containersBxoId "${siteBxoId}")
    EH_assert [ ! -z "${containersBxoId}" ]
    if vis_bxoAcctVerify "${containersBxoId}" ; then
	ANT_cooked "WARNING: Did not expect ${containersBxoId} to exist -- Activation skipped"
    else
	lpDo bxoManage.sh -p bxoId="${containersBxoId}" -i fullConstruct
    fi

    local networksBxoId=$( vis_fromSiteBxoIdGet_networksBxoId "${siteBxoId}")
    EH_assert [ ! -z "${networksBxoId}" ]
    if vis_bxoAcctVerify "${networksBxoId}" ; then
	ANT_cooked "WARNING: Did not expect ${networksBxoId} to exist -- Activation skipped"
    else
	lpDo bxoManage.sh -p bxoId="${networksBxoId}" -i fullConstruct
    fi

    local domainsBxoId=$( vis_fromSiteBxoIdGet_domainsBxoId "${siteBxoId}")
    # process domainsBxoId -- NOTYET

    lpReturn
}


function vis_withSiteBxoId_write_boxesBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 2 ]]
    local siteBxoId=$1
    local bxoIdValue=$2

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo fileParamManage.py -i fileParamRead  ${siteBxoHome}/siteBpos/boxes.bpoFp bpoId ${bxoIdValue}
}


function vis_withSiteBxoId_write_containersBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 2 ]]
    local siteBxoId=$1
    local bxoIdValue=$2

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo fileParamManage.py -i fileParamWrite  ${siteBxoHome}/siteBpos/containers.bpoFp bpoId ${bxoIdValue}
}

function vis_withSiteBxoId_write_networksBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 2 ]]
    local siteBxoId=$1
    local bxoIdValue=$2        

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo fileParamManage.py -i fileParamWrite  ${siteBxoHome}/siteBpos networks.bpoFp ${bxoIdValue}
}

function vis_withSiteBxoId_write_domainsBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 2 ]]
    local siteBxoId=$1
    local bxoIdValue=$2            

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    lpDo fileParamManage.py -i fileParamWrite ${siteBxoHome}/siteBpos domains.bpoFp ${bxoIdValue}
}


function vis_fromSiteBxoIdGet_boxesBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    local boxesBxoId=$( fileParamManage.py -i fileParamRead  ${siteBxoHome}/siteBpos/boxes.bpoFp bpoId )
    EH_assert [ ! -z "${boxesBxoId}" ]

    echo ${boxesBxoId}
}


function vis_fromSiteBxoIdGet_containersBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    local containersBxoId=$( fileParamManage.py -i fileParamRead  ${siteBxoHome}/siteBpos/containers.bpoFp bpoId )
    EH_assert [ ! -z "${containersBxoId}" ]

    echo ${containersBxoId}
}


function vis_fromSiteBxoIdGet_networksBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    local networkBxoId=$( fileParamManage.py -i fileParamRead  ${siteBxoHome}/siteBpos networks.bpoFp )
    EH_assert [ ! -z "${networkBxoId}" ]

    echo ${networkBxoId}
}

function vis_fromSiteBxoIdGet_domainsBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local siteBxoId=$1

    EH_assert vis_bxoAcctVerify "${siteBxoId}"
    siteBxoHome=$( FN_absolutePathGet ~${siteBxoId} )

    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${siteBxoHome}/siteBpos domains.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}




function vis_sysCharContainerBxoIdName {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: bxoId of container corresponding to \$1 as a containerPath.
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

function withContainerIdGetBxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout, bxoId of container corresponding to \$1 as containerId
*** The sysCharContainerBxoId may or may not have been realized or activated.
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local containerId=$1

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
    local selectedSiteBxoId=$( vis_selectedSiteBxoId )
    
    local selectedContainersPath="$( FN_absolutePathGet ~${selectedSiteBxoId} )/siteBpos/containers.bpoFp/bpoId"
    
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

function container_modelAbodeFunctionBase {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersAssignBaseObtain )
   EH_assert [ ! -z "${containersBase}" ]
   
   EH_assert [ ! -z "${model}" ]
   EH_assert [ ! -z "${abode}" ]
   EH_assert [ ! -z "${function}" ]
   
   echo "${containersBase}/${model}/${abode}/${function}"
}




function vis_containersGenericsAssignList {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local containersBase=$( containersBaseObtain )

   #find ${containersBase} -type d -print | egrep '/Generic/.*[^/]$'
   local genericBasesList=( $(find ${containersBase} -type d -print | egrep '/Generic/[a-z|0-9|_]*$') )

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
