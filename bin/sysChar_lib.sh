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


function vis_sysCharReport {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]

    EH_assert  vis_userAcctExists "${bxoId}"

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome} | grep -v bxeTree | grep -v bxeDesc
    
    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/assign

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo

    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/stable/net/networks
    fileParamManage.py -i fileParamDictReadDeep ${bxoHome}/siteContainersRepo/stable/net/routes        
    
    lpReturn
}	


function vis_containerAssignRead {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${bxoId}" ]

   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
   local containerAssignBase=${bxoHome}/siteContainersRepo/assign

   containerAssign_containerId=$( fileParamManage.py -v 30 -i fileParamRead  ${containerAssignBase} containerId )
   containerAssign_boxId=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} boxId )   
   containerAssign_abode=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} abode )
   containerAssign_function=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} function )
   containerAssign_model=$( fileParamManage.py -i fileParamRead  ${containerAssignBase} model )         
}


function vis_containerStableRead {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${bxoId}" ]

   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
   local containerStableBase=${bxoHome}/siteContainersRepo/stable

   containerStable_privA_addr=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/ipv4/privA.fps addr )
   containerStable_privA_gateway=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/ipv4/privA.fps gateway )

   containerStable_privA_netmask=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/networks/privA/net.fps netmask )   

   containerStable_privA_pubA_router=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/routes/privA-pubA.fps router )   
   containerStable_privA_pubA_upCommand=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/routes/privA-pubA.fps upCommand )
   containerStable_privA_pubA_downCommand=$( fileParamManage.py -i fileParamRead  ${containerStableBase}/net/routes/privA-pubA.fps downCommand )   
}

function vis_sysCharRead {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   EH_assert [ ! -z "${bxoId}" ]

   EH_assert vis_bxoAcctVerify "${bxoId}"
   bxoHome=$( FN_absolutePathGet ~${bxoId} )
  
   local sysCharBase=${bxoHome}/sysChar

   sysChar_privA_if=$( fileParamManage.py -i fileParamRead  ${sysCharBase}/netInterface.fps privA )

   sysChar_vmSpec_baseBox=$( fileParamManage.py -i fileParamRead  ${sysCharBase}/vmSpec.fps baseBox )
   sysChar_vmSpec_sizing=$( fileParamManage.py -i fileParamRead  ${sysCharBase}/vmSpec.fps sizing )   
   
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
