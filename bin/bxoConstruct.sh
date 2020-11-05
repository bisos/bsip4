#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bxeRealize.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

# . ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bxoId=""
# usg=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi

}

function bxoConstructBaseDir_obtain { echo /bisos/var/bxo/construct; }


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    oneBxeDesc="/bisos/var/bxae/bxeDesc/A/system/as-bisos"

    oneBxoId="as-bisos"
    #oneBxoId="as-test1_5"    
    
    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Construct A BxO From Its Realized BxE" )
$( examplesSeperatorSection "Obtain A Snapshot Of RBxE At $(bxoConstructBaseDir_obtain)" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i obtainRepoSnapshot rbxe
$( examplesSeperatorSection "BxO Ssh Config Update" )
usgBxoSshManage.sh
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -p usg=current -i usgSshConfigUpdate   # Sets up ~usg/.ssh/config
$( examplesSeperatorSection "BxO Creation Based On ISO Info" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i bxoAcctCreate
$( examplesSeperatorSection "BxO Repos Clone Map" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i initialReposClone $(bxoConstructBaseDir_obtain)/${oneBxoId}/home
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i initialReposClone
$( examplesSeperatorSection "BxO Construct Full Update -- All Of The Above" )
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fullUpdate $(bxoConstructBaseDir_obtain)/${oneBxoId}/home
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fullUpdate
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_obtainRepoSnapshot {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local repoName=$1
    
    local bxoConstructBaseDir=$(bxoConstructBaseDir_obtain)

    local repoTarFile="${bxoConstructBaseDir}/${bxoId}/${repoName}-gitSnapot.tar"
    local gitRepoBaseDir="${bxoConstructBaseDir}/${bxoId}/${repoName}.git"

    opDo FN_dirCreatePathIfNotThere "${bxoConstructBaseDir}/${bxoId}"
    
    lpDo bxoGitlab.py -v 20 --bxoId=${bxoId} --outFile="${repoTarFile}"  -i repoSnapshot ${repoName}

    lpDo mkdir "${gitRepoBaseDir}"

    inBaseDirDo "${gitRepoBaseDir}" tar xf "${repoTarFile}"

    lpDo git clone "${gitRepoBaseDir}" "${bxoConstructBaseDir}/${bxoId}/${repoName}"
    
    lpReturn
}


function vis_usgSshConfigUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]    

    local usg=$( id -u -n )

    lpDo usgBxoSshManage.sh ${G_commandOptions} -p usg=${usg} -p bxoId=${bxoId} -p bxosBase=$(bxoConstructBaseDir_obtain) -i usgBxoFullUpdate

    lpReturn
}

function vis_bxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local bxeDesc="$(bxoConstructBaseDir_obtain)/${bxoId}/rbxe/bxeDesc"

    lpDo bxeRealize.sh ${G_commandOptions} -p bxeDesc="${bxeDesc}" -i bxoAcctCreate    

    lpReturn
}

function vis_initialReposClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local gitCloneDest=""
    
    if [ $# -eq 0 ] ; then
	gitCloneDest=${bxoHome}
    elif [ $# -eq 1 ] ; then
	gitCloneDest=$1
    else
	EH_oops ""
	lpReturn
    fi
    
    local reposList=$( bxoGitlab.py -v 20 --bxoId="${bxoId}"  -i reposList )

    local eachRepo=""
    local gitServerUrl=""

    opDo FN_dirCreatePathIfNotThere "${gitCloneDest}"
    
    for eachRepo in ${reposList} ; do
	gitServerUrl=git@bxoPriv_${bxoId}:${bxoId}/${eachRepo}.git
	lpDo git clone "${gitServerUrl}" "${gitCloneDest}/${eachRepo}"    	
    done

    lpReturn
}


function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    local gitCloneDest=""

    lpDo vis_obtainRepoSnapshot rbxe

    lpDo vis_usgSshConfigUpdate

    if [ $# -eq 0 ] ; then
	lpDo vis_bxoAcctCreate

	lpDo vis_initialReposClone
	
    elif [ $# -eq 1 ] ; then
	gitCloneDest=$1

	lpDo vis_initialReposClone ${gitCloneDest}	
	
    else
	EH_oops ""
	lpReturn
    fi


    
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
