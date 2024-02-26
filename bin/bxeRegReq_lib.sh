#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxe_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxe_lib :: Loading Library -- /bisos/bsip/bin/bxe_lib.sh"
else
    TM_trace 7 "bxe_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxe_lib.sh" ; return
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
** Creates a REGREQ (Bystar Account Request Container) based on command line.
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

typeset -t privacy=""
typeset -t kind=""
typeset -t type=""

# PRE parameters for bymemory
typeset -t firstName=MANDATORY
typeset -t lastName=MANDATORY

typeset -t corpName=MANDATORY
typeset -t sysName=MANDATORY

typeset -t email=""

typeset -t originationMethod=""

typeset -t name=""

typeset -t parent=""



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_regReqInfoBasePath_obtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Check for ~/bpos/sites/selected/rbxe/bxeDesc/
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local sitePath="$( FN_absolutePathGet ~ )/bpos/sites/selected/bxe/regReq"
    local sysVarPath="/bisos/var/bxe/regReq"

    if [ -d "${sitePath}" ] ; then
        echo "${sitePath}"
    elif [ -d "${sysVarPath}" ] ; then
        echo "${sysVarPath}"
    else
        EH_problem "Missing ${sitePath} and ${sysVarPath}"
    fi

    lpReturn
}       

function vis_examplesRegReqBases {
    cat  << _EOF_
$( examplesSeperatorChapter "RegReq Bases" )
${G_myName} ${extraInfo} -i regReqInfoBasePath_obtain
_EOF_
}



function vis_examplesBxRealIndiv {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" -p email=\"email\" "    
}

function vis_examplesBxRealCorp {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"corp\" -p corpName=\"corpName\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"corp\" -p corpName=\"corpName\" -p email=\"email\" "    
}
    
function vis_examplesBxRealSys {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"bisos\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"bisos\" "
}

function vis_examplesBxRealSysTest {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"test1\" "    
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"test1\" -p email=\"git-test1@byname.net\" "
}


function vis_examplesBxInfoRegistrar {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"registrar\" -p parent=\"${cur_bpoId_parent}\" -p name=\"privRegistrar\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"registrar\" -p parent=\"${cur_bpoId_parent}\" -p name=\"privRegistrar\" "
}

function vis_examplesBxInfoSite {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"site\" -p parent=\"${cur_bpoId_parent}\" -p name=\"privSite\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"site\" -p parent=\"${cur_bpoId_parent}\" -p name=\"privSite\" "    
}

function vis_examplesBxInfoSysChar {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"sysChar\" -p parent=\"${cur_bpoId_parent}\" -p name=\"gitlabServer\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"sysChar\" -p parent=\"${cur_bpoId_parent}\" -p name=\"gitlabServer\" "
}

function vis_examplesBxInfoPals {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"pals\" -p parent=\"${cur_bpoId_parent}\" -p name=\"ByN-000\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"pals\" -p parent=\"${cur_bpoId_parent}\" -p name=\"ByN-000\" "
}

function vis_examplesBxInfoScs {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"scs\" -p parent=\"${cur_bpoId_parent}\" -p name=\"DNSS-priv1\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"scs\" -p parent=\"${cur_bpoId_parent}\" -p name=\"DNSS-priv1\" "
}

function vis_examplesBxInfoUsgAcct {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"usg_name\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"usg_name\" "
}

function vis_examplesBxInfoUsage {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"full\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"full\" "
}

function vis_examplesBxInfoProject {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"project\" -p parent=\"${cur_bpoId_parent}\" -p name=\"home\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"project\" -p parent=\"${cur_bpoId_parent}\" -p name=\"home\" "
}

function vis_examplesBxInfoVirtGuest {
    bxeParamsMini="-p privacy=\"all\" -p kind=\"info\" -p type=\"virtGuest\" -p parent=\"${cur_bpoId_parent}\" -p name=\"ubCur\" "
    bxeParamsFull="-p privacy=\"all\" -p kind=\"info\" -p type=\"virtGuest\" -p parent=\"${cur_bpoId_parent}\" -p name=\"ubCur\" "
}

function vis_examplesBxSvcByname {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"byname\" -p parent=\"${cur_bpoId_parent}\" -p name=\"first.last\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"byname\" -p parent=\"${cur_bpoId_parent}\" -p name=\"first.last\" "
}

function vis_examplesBxSvcBysmb {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"bysmb\" -p parent=\"${cur_bpoId_parent}\" -p name=\"exampleCom\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"bysmb\" -p parent=\"${cur_bpoId_parent}\" -p name=\"exampleCom\" "
}

function vis_examplesBxContainerVmHost {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"vmHost\" -p parent=\"${cur_bpoId_parent}\" -p name=\"vmhc\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"vmHost\" -p parent=\"${cur_bpoId_parent}\" -p name=\"vmhc\" "    
}

function vis_examplesBxContainerExposed {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"exposed\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bacs\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"exposed\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bacs\" "    
}

function vis_examplesBxContainerPerimeter {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"perimeter\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bpsc\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"perimeter\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bpsc\" "    
}

function vis_examplesBxContainerIntra {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"intra\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bisp\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"intra\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bisp\" "    
}

function vis_examplesBxContainerUsage {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bue\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"usage\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bue\" "    
}

function vis_examplesBxContainerDev {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"dev\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bdev\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"dev\" -p parent=\"${cur_bpoId_parent}\" -p name=\"bdev\" "    
}


function vis_examplesBxContainerAndroid {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"container\" -p type=\"Android\" -p parent=\"${cur_bpoId_parent}\" -p name=\"andrd\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"container\" -p type=\"Android\" -p parent=\"${cur_bpoId_parent}\" -p name=\"andrd\" "    
}

function vis_examplesBxMaterializationSite {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"site\" -p parent=\"${cur_bpoId_parent}\" -p name=\"clusterName\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationNets {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"nets\" -p parent=\"${cur_bpoId_parent}\" -p name=\"clusterName-nets\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationDomains {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"domains\" -p parent=\"${cur_bpoId_parent}\" -p name=\"clusterName-domains\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationBoxes {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"boxes\" -p parent=\"${cur_bpoId_parent}\" -p name=\"clusterName-boxes\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationContainers {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"containers\" -p parent=\"${cur_bpoId_parent}\" -p name=\"clusterName-containers\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationSysChar {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"sysChar\" -p parent=\"${cur_bpoId_parent}\" -p name=\"HSS-1001\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationPals {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"pals\" -p parent=\"${cur_bpoId_parent}\" -p name=\"ByN-000\" "
    bxeParamsFull=${bxeParamsMini}
}

function vis_examplesBxMaterializationScs {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"materialization\" -p type=\"scs\" -p parent=\"${cur_bpoId_parent}\" -p name=\"DNSS-priv1\" "
    bxeParamsFull=${bxeParamsMini}
}


function vis_regReqStdout {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # ANT_raw "creating a RegReq Container"
    
    bxeKindTypeHookParamsSet ${kind} ${type}
 
    if [ "${originationMethod}" == "" ] ; then
        originationMethod="cmdLine"
    fi

    if [ -z "${email}" ] ; then
        email="NA"
    fi
    
 
 cat  << _EOF_
function regReqContainer {
    function regReqContainerCommon {
      bc_privacy="${privacy}"
      bc_kind="${kind}"
      bc_type="${type}"

      bc_parentBxoId="${parent}"

      bc_email="${email}"

      bc_originationDate="${dateTag}"
      bc_originationMethod="${originationMethod}"
      bc_originatorHost="${opRunHostName}"
      bc_originatorId="${opRunAcctName}"
    }
_EOF_


  bxeKindTypeHookRun regReqContainerStdoutSpecific "active"


  cat  << _EOF_
  regReqContainerCommon
  regReqContainer_${kind}_${type}
}
_EOF_
}


regReqContainerStdoutSpecific_real_individual () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${lastName}_${firstName}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_firstName="${firstName}"
      bc_lastName="${lastName}"
    }
_EOF_
}

regReqContainerStdoutSpecific_real_corp () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${corpName}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_corpName="${corpName}"
    }
_EOF_
}


regReqContainerStdoutSpecific_real_system () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${sysName}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_sysName="${sysName}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_registrar () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_site () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_sysChar () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_pals () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}


regReqContainerStdoutSpecific_info_scs () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}


regReqContainerStdoutSpecific_info_usage () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"              
    }
_EOF_
}

regReqContainerStdoutSpecific_info_project () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_virtGuest () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_svc_byname () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_svc_bysmb () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_container_exposed () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_container_intra () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_container_usage () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_container_dev () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}


regReqContainerStdoutSpecific_container_android () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_site () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_nets () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_domains () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_boxes () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_containers () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_sysChar () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_materialization_pals () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}


regReqContainerStdoutSpecific_materialization_scs () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
        regReqTag="${kind}_${type}_${name}"
        return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}



function vis_regReqFileName {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bpoHome=""
    local bxeTreeDir=""
    local regReqBaseDir=""    

    if [ -z "${parent}" ] ; then
        local regReqInfoBasePath=$(vis_regReqInfoBasePath_obtain)
    
        opDo FN_dirCreatePathIfNotThere ${regReqInfoBasePath}

        regReqBaseDir="${regReqInfoBasePath}/${kind}/${type}"
    else
        if ! unisosAccts.sh -i userAcctExists "${parent}" ; then
            EH_problem "Missing bpoId -- parent=${parent}"
            lpReturn 101
        fi
        bpoHome=$( FN_absolutePathGet ~${parent} )
        if [ -z "${bpoHome}" ] ; then
            EH_problem "Missing bpoHome -- parent=${parent}"
            lpReturn 101
        fi
        bxeTreeDir="${bpoHome}/bxeTree"
        if [ ! -d "${bxeTreeDir}" ] ; then
            EH_problem "Missing bxeTreeDir=${bxeTreeDir}"
            lpReturn 101
        fi
        regReqBaseDir="${bxeTreeDir}/regReq/${kind}/${type}"
    fi

    echo ${regReqBaseDir}
}


function vis_regReqFileNameOrTag {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local nameOrTag="$1"

    local bpoHome=""
    local bxeTreeDir=""
    local regReqBaseDir=""    

    if [ -z "${parent}" ] ; then
        local regReqInfoBasePath=$(vis_regReqInfoBasePath_obtain)
    
        lpDo FN_dirCreatePathIfNotThere ${regReqInfoBasePath}

        regReqBaseDir="${regReqInfoBasePath}/${kind}/${type}"
    else
        if ! unisosAccts.sh -i userAcctExists "${parent}" ; then
            EH_problem "Missing bpoId -- parent=${parent}"
            lpReturn 101
        fi
        bpoHome=$( FN_absolutePathGet ~${parent} )
        if [ -z "${bpoHome}" ] ; then
            EH_problem "Missing bpoHome -- parent=${parent}"
            lpReturn 101
        fi
        bxeTreeDir="${bpoHome}/bxeTree"
        if [ ! -d "${bxeTreeDir}" ] ; then
            EH_problem "Missing bxeTreeDir=${bxeTreeDir}"
            lpReturn 101
        fi
        regReqBaseDir="${bxeTreeDir}/regReq/${kind}/${type}"
    fi

    bxeKindTypeHookParamsSet ${kind} ${type}

    bxeKindTypeHookRun regReqContainerStdoutSpecific "passive"  # sets up regReqTag based on kind+type
    
    lpDo FN_dirCreatePathIfNotThere "${regReqBaseDir}"

    local regReqFileName=""
    local regReqFilePath=""

    if [ "${nameOrTag}" == "name" ] ; then
        regReqFileName=${regReqTag}.${dateTag}.REGREQ
        regReqFilePath="${regReqBaseDir}/${regReqFileName}"
    elif [ "${nameOrTag}" == "tag" ] ; then
        regReqFileName=${regReqTag}
        regReqFilePath="${regReqBaseDir}/${regReqFileName}"
    else
        EH_problem "Neither name nor tag -- nameOrTag=${nameOrTag}"
        lpReturn 101
    fi
    
    echo ${regReqFilePath}
}

function vis_regReqFileCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Creates a regReq file if the existing one is not same as this request.
forceMode creates the file without regard to existance of others.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local regReqFileNamePath=$( vis_regReqFileNameOrTag "name" )
    local regReqFileTagPath=$( vis_regReqFileNameOrTag "tag" )    
    local tmpFile=$( FN_tempFile )
    local tmpFile2=$( FN_tempFile )
    local existingFile=$( ls ${regReqFileTagPath}* 2> /dev/null | head -1 )
    local diffResult=""

    if [ -z "${regReqFileNamePath}" ] ; then
        EH_problem "Missing regReqFilePath=${regReqFileNamePath}"
        lpReturn 101
    fi

    if [ "${G_forceMode}" != "force" ] ; then
        if [ ! -z "${existingFile}" ] ; then
            lpDo eval vis_regReqStdout \| grep -v bc_originationDate= \> ${tmpFile}
            lpDo eval cat "${existingFile}" \| grep -v bc_originationDate= \| grep -v 'regReqFileName=' \| grep -v 'date=' \| grep -v 'BxeDesc='  \> ${tmpFile2}
            diffResult=$( diff ${tmpFile} ${tmpFile2} )

            if [ -z "${diffResult}" ] ; then
                # The existing file is same this request, there is nothing to do.
                lpDo rm ${tmpFile} ${tmpFile2}
                echo ${existingFile}
                lpReturn
            else
                ANT_cooked "existingFile and This request are different"
                lpDo diff ${tmpFile} ${tmpFile2}
            fi
        fi
    fi
    
    #
    # Existing file is different from this registration request,
    # So, we create a new file.
    # 
    
    lpDo eval echo regReqFileName=${regReqFileNamePath} \> ${regReqFileNamePath}

    vis_regReqStdout 1>> ${regReqFileNamePath}

    opDo ls -l ${regReqFileNamePath} 1>&2

    echo ${regReqFileNamePath}
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
