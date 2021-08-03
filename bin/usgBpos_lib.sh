#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${usgBpos_lib:-}" ] ; then
    usgBpos_lib="LOADED" ; TM_trace 7 "usgBpos_lib :: Loading Library -- /bisos/bsip/bin/usgBpos_lib.sh"
else
    TM_trace 7 "usgBpos_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/usgBpos_lib.sh" ; return
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
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/aais
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/real
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/credentials
   lpDo FN_dirCreatePathIfNotThere ${curUsgBposBase}/controller   
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


function vis_usgBpos_real_indivBxoId_write {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/real
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/real realIndiv.bpoFp ${bxoIdValue}
}


function vis_usgBpos_real_indivBxoId_read {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/real realIndiv.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_real_indiv_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_real_indivBxoId_write ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/real/realIndiv
}


function vis_usgBpos_real_indiv_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/real/realIndiv ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/real/realIndiv
}


function vis_usgBpos_real_indiv_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_real_indivBxoId_read)
   echo ${bxoId}
}


function vis_usgBpos_usageEnvs_fullUse_write {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/usageEnvs
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/usageEnvs fullUse.bpoFp ${bxoIdValue}
}


function vis_usgBpos_usageEnvs_fullUse_read {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/usageEnvs fullUse.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_usageEnvs_fullUse_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoPath}" ]

   local curUsgAcctHome=$(vis_curUsgAcctHome)

   lpDo FN_fileSymlinkUpdate ${bxoPath}/blee ${curUsgAcctHome}/BUE
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_usageEnvs_fullUse_write ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/usageEnvs/fullUse
}


function vis_usgBpos_usageEnvs_fullUse_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/usageEnvs/fullUse ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/usageEnvs/fullUse
}


function vis_usgBpos_usageEnvs_fullUse_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_usageEnvs_fullUse_read)
   echo ${bxoId}
}



function vis_usgBpos_aais_byname_bxoId_fpWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/aais
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/aais byname.bpoFp ${bxoIdValue}
}


function vis_usgBpos_aais_byname_bxoId_fpRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/aais byname.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_aais_byname_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_aais_byname_bxoId_fpWrite ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/aais/byname
}


function vis_usgBpos_aais_byname_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/aais/byname ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/aais/byname
}


function vis_usgBpos_aais_byname_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_aais_byname_bxoId_fpRead)
   echo ${bxoId}
}


function vis_usgBpos_controller_bxoId_fpWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/controller
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/controller controller.bpoFp ${bxoIdValue}
}

function vis_usgBpos_controller_bxoId_fpRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/controller controller.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_controller_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_controller_bxoId_fpWrite ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/controller/controller
}


function vis_usgBpos_controller_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/controller/controller ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/controller/controller
}


function vis_usgBpos_controller_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_controller_bxoId_fpRead)
   echo ${bxoId}
}


function vis_usgBpos_credentials_bxoId_fpWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/credentials
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/credentials credentials.bpoFp ${bxoIdValue}
}

function vis_usgBpos_credentials_bxoId_fpRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/credentials credentials.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_credentials_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_credentials_bxoId_fpWrite ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/credentials/credentials
}


function vis_usgBpos_credentials_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/credentials/credentials ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/credentials/credentials
}


function vis_usgBpos_credentials_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_credentials_bxoId_fpRead)
   echo ${bxoId}
}


function vis_usgBpos_lcntBases_bxoId_fpWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/lcntBases
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/lcntBases lcntBases.bpoFp ${bxoIdValue}
}

function vis_usgBpos_lcntBases_bxoId_fpRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/lcntBases lcntBases.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_lcntBases_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_lcntBases_bxoId_fpWrite ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/lcntBases/lcntBases
}


function vis_usgBpos_lcntBases_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/lcntBases/lcntBases ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/lcntBases/lcntBases
}


function vis_usgBpos_lcntBases_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_lcntBases_bxoId_fpRead)
   echo ${bxoId}
}


function vis_usgBpos_siteConfigs_bxoId_fpWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** 
_EOF_
		      }
    EH_assert [[ $# -eq 1 ]]
    local bxoIdValue=$1

    bxoIdValue=$(bxoIdPrep ${bxoIdValue})
    EH_assert [ ! -z ${bxoIdValue} ]

    local curUsgBposBase=$( vis_curUsgBposBase )
    lpDo mkdir -p ${curUsgBposBase}/sites
    lpDo fileParamManage.py -i fileParamWrite ${curUsgBposBase}/sites siteConfigs.bpoFp ${bxoIdValue}
}

function vis_usgBpos_siteConfigs_bxoId_fpRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** returns on stdout: 
_EOF_
		      }
    EH_assert [[ $# -eq 0 ]]

    local curUsgBposBase=$( vis_curUsgBposBase )
    
    local resultBxoId=$( fileParamManage.py -i fileParamRead  ${curUsgBposBase}/sites siteConfigs.bpoFp )
    EH_assert [ ! -z "${resultBxoId}" ]

    echo ${resultBxoId}
}


function vis_usgBpos_siteConfigs_update {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 1 ]]
   local bxoIdValue=$1

   bxoIdValue=$(lpDo bxoIdPrep ${bxoIdValue})
   EH_assert [ ! -z "${bxoIdValue}" ]

   bxoPath=$(lpDo vis_bxoPathObtainForBxoId "${bxoIdValue}")
   EH_assert [ ! -z "${bxoIdValue}" ]
   
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)

   lpDo vis_usgBpos_siteConfigs_bxoId_fpWrite ${bxoIdValue}
   lpDo FN_fileSymlinkUpdate ${bxoPath} ${curUsgBposBase}/sites/siteConfigs
}


function vis_usgBpos_siteConfigs_bxoPath {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local curUsgBposBase=$(lpDo vis_curUsgBposBase)   
   EH_assert [ -e ${curUsgBposBase}/sites/siteConfigs ]
   lpDo FN_absolutePathGet ${curUsgBposBase}/sites/siteConfigs
}


function vis_usgBpos_siteConfigs_bxoId {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }
   EH_assert [[ $# -eq 0 ]]
   local bxoId=$(lpDo vis_usgBpos_siteConfigs_bxoId_fpRead)
   echo ${bxoId}
}


function vis_usgAcctWithUsgBpoAssociate {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:
Safe to run multiple times.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local usgEnvBxoPath=$(lpDo vis_usgBpos_usageEnvs_fullUse_bxoPath)

    local curUsgAcctHome=$( vis_curUsgAcctHome )
    
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/bbdb/dotBbdbV9 ${curUsgAcctHome}/.bbdbV9
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/diary/diary ${curUsgAcctHome}/.emacs.d/diary
    lpDo FN_fileSymlinkUpdate ${usgEnvBxoPath}/blee/org ${curUsgAcctHome}/org
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
