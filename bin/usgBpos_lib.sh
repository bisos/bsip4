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
typeset -t XX=""


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_curUsgAcctHome {
    FN_absolutePathGet ~
}

function vis_curUsgBposBase {
   local curUsgAcctHome=$( vis_curUsgAcctHome )
   echo ${curUsgAcctHome}/bpos
}

function vis_usgBposInit {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   lpDo vis_usgBposFpsPrep
   
   local thisBisosDevBxoId=$( vis_usgBposUsageEnvs_bisosDevBxoId_read )
   if [ -z "${thisBisosDevBxoId}" ] ; then
       ANT_raw "bisosDevBxoId Has Not Been Conveyed -- Skipping full initialization"
       lpReturn
   fi

   lpDo vis_usgBposUsageEnvs_bisosDev_update ${thisBisosDevBxoId}
}


function vis_usgBposFpsPrep {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local curUsgBposBase=$( vis_curUsgBposBase )
   
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/sites
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/usageEnvs
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/projs   
}


function vis_usgBposUsageEnvs_bisosDevBxoId_write {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    # NOTYET bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )

    lpDo mkdir -p ${curUsgBposBase}/usageEnvs
    
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/usageEnvs bisosDevel.bpoFp ${bxoIdValue}
}


function vis_usgBposUsageEnvs_bisosDevBxoId_read {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/usageEnvs bisosDevel.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}



function vis_usgBposUsageEnvs_bisosDev_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]

   local bisosDevBpoPath="$1"

   local curUsgBposBase=$( vis_curUsgBposBase )

   lpDo vis_usgBposFpsPrep   

   lpDo mkdir -p ${curUsgBposBase}/usageEnvs

   lpDo FN_fileSymlinkUpdate ${bisosDevBpoPath} ${curUsgBposBase}/usageEnvs/bisosDev
}

function vis_usgBposUsageEnvs_bisosDev_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local curUsgBposBase=$( vis_curUsgBposBase )   

   EH_assert [ -e ${curUsgBposBase}/usageEnvs/bisosDev ]
   
   echo ${curUsgBposBase}/usageEnvs/bisosDev
}

function vis_usgBposUsageEnvs_bisosDev_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]

   local bxoId=$( vis_bxoIdObtainForPath $( vis_usgBposUsageEnvs_bisosDev_bxoPath ) )

   echo ${bxoId}
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
