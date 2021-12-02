#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bpoId_lib:-}" ] ; then
    bpoId_lib="LOADED" ; TM_trace 7 "bpoId_lib :: Loading Library -- /bisos/git/auth/bxRepos/bisos/bsip4/bin/bpoId_lib.sh"
else
    TM_trace 7 "bpoId_lib :: Prviously Loaded -- Skipping /bisos/git/auth/bxRepos/bisos/bsip4/bin/bpoId_lib.sh" ; return
fi
####+END:


# a bxoNameExists when a bxo has been realized. It is the account in gitLab.

function vis_bxoNameExists {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Could also be called bxoHasBeenRealizedP
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]

    local bxoName="$1"
    local bxoNamesList=$( bxoGitlab.py -v 30 -i acctList )
    
    if LIST_isIn "${bxoName}" "${bxoNamesList}"  ; then
        lpReturn 0
    else
        lpReturn 1
    fi
}       




function vis_bpoIdFpsBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]
    echo /bisos/var/bpoId
    lpReturn
}       


function vis_bpoIdFpsReadDeep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    lpDo fileParamManage.py -i fileParamDictReadDeep $(vis_bpoIdFpsBase)
    
    lpReturn
}       

function vis_bpoIdFpsWrite {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 2 ]]

    local canonName="$1"
    local bpoId="$2"

    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bpoIdFpsBase) "${canonName}.fp" "${bpoId}"
    
    lpReturn
}       

function vis_bpoIdFpsRead {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 1 ]]

    local canonName="$1"

    lpDo fileParamManage.py -i fileParamRead $(vis_bpoIdFpsBase) "${canonName}.fp"
    
    lpReturn
}       

function vis_bpoIdFpsInit_all {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** NOTYET -- When should this be called 
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_bpoIdFpsInit_sysChar
    lpDo vis_bpoIdFpsInit_site
    
    lpReturn
}       

function vis_bpoIdFpsInit_sysChar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    local canonName="sysChar"
    
    local bpoId=$( lpDo fileParamManage.py -i fileParamRead $(vis_bpoIdFpsBase) "${canonName}.fp" )

    if [ ! -z "${bpoId}" ] ; then
        if [[ "${G_forceMode}" == "force" ]] ; then
            ANT_raw "Already set ${canonName}=${bpoId} -- forceMode specified -- will overwrite."
        else
            ANT_raw "Already set ${canonName}=${bpoId} -- use -f to force it."
            lpReturn
        fi
    fi

    local effectiveContainerBxoId=""
    local selectedContainerBxoId=$( vis_selectedContainerBxoId 2> /dev/null )

    if [ -z "${selectedContainerBxoId}" ] ; then

        local containerAssignBase=$( siteContainerAssign.sh -i forThisSysFindContainerBase )
        if [ -z "${containerAssignBase}" ] ; then
            effectiveContainerBxoId="${selectedContainerBxoId}"
        else
            local sysCharContainerBxoId=$( vis_sysCharContainerBxoIdName ${containerAssignBase} )

            effectiveContainerBxoId="${sysCharContainerBxoId}"
        fi
    else
        effectiveContainerBxoId="${selectedContainerBxoId}"
    fi

    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bpoIdFpsBase) "${canonName}.fp" "${effectiveContainerBxoId}"
    
    lpReturn
}       


function vis_bpoIdFpsInit_site {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    local canonName="site"
    
    local bpoId=$( lpDo fileParamManage.py -i fileParamRead $(vis_bpoIdFpsBase) "${canonName}.fp" )

    if [ ! -z "${bpoId}" ] ; then
        if [[ "${G_forceMode}" == "force" ]] ; then
            ANT_raw "Already set ${canonName}=${bpoId} -- forceMode specified -- will overwrite."
        else
            ANT_raw "Already set ${canonName}=${bpoId} -- use -f to force it."
            lpReturn
        fi
    fi

    local determinedBxoId=$( sysCharRealize.sh -i selectedSiteBxoId )
    
    lpDo fileParamManage.py -v 20 -i fileParamWrite $(vis_bpoIdFpsBase) "${canonName}.fp" "${determinedBxoId}"
    
    lpReturn
}       


function vis_bpoIdShow {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Update Everything.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    EH_assert bpoIdPrep

    lpDo echo ${bpoId}
    lpDo echo ${bpoHome}    
}

function vis_bpoIdPrep {
    bpoIdPrep $@
}
    

function bpoIdPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Looks at the global bpoId and replaces it accordingly. Returns none-zero for assertion.
_EOF_
                       }

    EH_assert [[ $# -lt 2 ]]

    local inBxoId=""
    local inAsArg=""
    local interactiveBxoId=""
    local gotBxoId=""    
    
    if [ $# -eq 1 ] ; then
        inBxoId="$1"
        inAsArg="$1"
    else
        inBxoId=${bpoId}
    fi

    function setOutBxoId {
        EH_assert [[ $# -eq 1 ]]
        local outBxoId="$1"

        if [ -z "${inAsArg}" ] ; then
            bpoId=${outBxoId}
            bpoHome=$( FN_absolutePathGet ~${bpoId} )
        else
            echo ${outBxoId}
        fi
    }
        
    case ${inBxoId} in 
      "")
          EH_problem "bpoId=\"\" -- empty/blank -- invalid bpoId"
          lpReturn 101
          ;;
      "INVALID"|"MANDATORY")
          EH_problem "bpoId=${bpoId} -- needs to be specified -- invalid bpoId"
          lpReturn 101
          ;;
      "current")
          lpCurrentsGet
          if [ "${currentBxoId}" != "" ] ; then
              lpDo setOutBxoId "${currentBxoId}"
          else
              EH_problem "bpoId=current But current is unset -- invalid bpoId"
              lpReturn 101
          fi    
          ;;
      "prompt")
          echo -n "Specify bpoId: "
          read interactiveBxoId
          interactiveBxoId=$( bpoIdPrep "${interactiveBxoId}" )
          lpDo setOutBxoId "${interactiveBxoId}"
          ;;
      "palsByDomain")
          gotBxoId=$(vis_usgBpos_pals_bydomain_bpoId_fpRead)
          lpDo setOutBxoId "${gotBxoId}"
          ;;    
      "palsByName")
          gotBxoId=$(vis_usgBpos_pals_byname_bpoId_fpRead)
          lpDo setOutBxoId "${gotBxoId}"
          ;;
      "sysChar")
          gotBxoId=$( vis_bpoIdFpsRead "sysChar" )
          lpDo setOutBxoId "${gotBxoId}"
          ;;

      "site")
          gotBxoId=$( vis_bpoIdFpsRead "site" )
          lpDo setOutBxoId "${gotBxoId}"
          ;;    
      "siteBoxes")
          lpDo setOutBxoId pmp_HSS-1003
          ;;    
      "default")   # e.g., first applicable entry in /etc/passwd
          doNothing
          ;;    
      "all")
          doNothing
          ;;    
      *)
          # See if it is a path, and locate bpoId based on path
          # bpoId=$( vis_bpoIdObtainForPath "${bxoPath}" )
          lpDo setOutBxoId "${inBxoId}"
          ;;
    esac

    #lpDo bpoIdCentralIsValid 
    bxoCentralIsValid 
    EH_retOnFail

    lpReturn 0
}
