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



function networksBaseObtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    usgHome=$( FN_absolutePathGet ~ )
    # ~/bisos/sites/selected/siteBpos/networks.bpoFp
    local selectedNetworksPath="${usgHome}/bisos/sites/selected/siteBpos/networks.bpoFp"
    
    local networksBxoId=""

    if [ -d "${selectedNetworksPath}" ] ; then
	networksBxoId=$( fileParamManage.py -i fileParamReadPath ${selectedNetworksPath} )
	if [ -z "${networksBxoId}" ] ; then
	    EH_problem "Missing networksBxoId"
	    lpReturn 101
	fi
	if ! vis_bxoAcctVerify "${networksBxoId}" ; then
	    EH_problem "Missing networksBxoId"
	    lpReturn 101
	fi
     else
	EH_problem "Missing ${selectedNetworksPath}"
	lpReturn 101
    fi

    # 
    local networksBase=$( FN_absolutePathGet ~${networksBxoId} )/networks
    EH_assert [ -d "${networksBase}" ]

    echo "${networksBase}"

    lpReturn
}	



function vis_netsReport {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 0 ]]

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   # Use readDeep instead
   find ${networksBase} -print | grep value | xargs egrep ^.
}

function vis_netAddr {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   # local netBase=${networksBase}/netDefinitions.fv/${netName}
   local netBase=${networksBase}/${netName}/net.fps  

   local netAddr=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} netAddr )

   echo ${netAddr}
}

function vis_netmask {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   local netBase=${networksBase}/${netName}/net.fps  

   local netmask=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} netmask )

   echo ${netmask}
}

function vis_routerDefault {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )

   EH_assert [ ! -z "${networksBase}" ]

   local netBase=${networksBase}/${netName}/net.fps  

   local routerDefault=$( fileParamManage.py -v 30 -i fileParamRead  ${netBase} routerDefault )
   EH_assert [ -d "${routerDefault}" ]
   
   echo ${routerDefault}
}

function vis_netSiteFpsPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local netName="$1"

   local networksBase=$( networksBaseObtain )
   EH_assert [ ! -z "${networksBase}" ]

   local netsBase=${networksBase}/${netName}/net.fps
   EH_assert [ -d "${netsBase}" ]

   echo ${netsBase}
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
