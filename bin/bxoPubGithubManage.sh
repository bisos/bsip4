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
*  /This File/ :: /bisos/bsip/bin/bxoAllManage.sh 
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

. ${opBinBase}/bxo_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

# PRE parameters

typeset -t bxoId=""
typeset -t privacy=""
# usg=""

function G_postParamHook {
    # lpCurrentsGet

    if [ ! -z "${bxoId}" ] ; then
	if vis_userAcctExists "${bxoId}" ; then
     	    bxoHome=$( FN_absolutePathGet ~${bxoId} )
	else
	    bxoHome=$( echo ~${bxoId} )
	fi
    fi

    lpCurrentsGet

    lpReturn 0
}


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
    
    #local privacy="priv"
    local priv="allGithub"    

    #local oneBxoId=${currentBxoId}
    local oneBxoId="aip_vagrantBaseBoxes"
    
    #oneBxoHome=$( FN_absolutePathGet ~${oneBxoId} )
    oneBxoHome=$( echo ~${oneBxoId} )        

    visLibExamplesOutput ${G_myName}

  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Currents And BxO Management Information" )
bisosCurrentsManage.sh
bisosCurrentsManage.sh  ${extraInfo} -i setParam currentBxoId ${oneBxoId}
${G_myName} ${extraInfo} -i bxoConstructBaseDir_obtain "${priv}"
$( examplesSeperatorChapter "Delete A BxO Local Acct" )
bxoAcctManage.sh
bxoAcctManage.sh ${extraInfo} -i bxoAcctDelete ${oneBxoId}
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fullRemove $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home # noAcct
${G_myName} ${extraInfo} -p bxoId="${oneBxoId}" -i fullRemove # Delete Acct and remove ${oneBxoHome}
$( examplesSeperatorChapter "Construct A BxO From Its Realized BxE" )
$( examplesSeperatorSection "Obtain A Snapshot Of RBxE At $(vis_bxoConstructBaseDir_obtain priv)" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bxoId="${oneBxoId}" -i obtainRepoSnapshot rbxe
$( examplesSeperatorSection "BxO Creation Based On ISO Info" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bxoId="${oneBxoId}" -i bxoAcctCreate
${G_myName} ${extraInfo} -p privacy="${priv}" -p bxoId="${oneBxoId}" -i initialReposClone
$( examplesSeperatorSection "BxO Construct Full Update -- All Of The Above" )
${G_myName} ${extraInfo} -p privacy="${priv}" -p bxoId="${oneBxoId}" -i fullConstruct $(vis_bxoConstructBaseDir_obtain priv)/${oneBxoId}/home # noAcct
${G_myName} ${extraInfo} -p privacy="${priv}" -p bxoId="${oneBxoId}" -i fullConstruct # Creats Acct & git clones in ${oneBxoHome}
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_bxoAcctCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With bxeDesc obtained from the snapShotObtain, create the bxo
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bxoId}" ]
    EH_assert [ ! -z "${privacy}" ]    

    if vis_userAcctExists "${bxoId}" ; then
	ANT_raw "${bxoId} account already exists."
	lpReturn 101
    fi
    
    local bxeDesc="$(vis_bxoConstructBaseDir_obtain ${privacy})/${bxoId}/rbxe/bxeDesc"

    lpDo bxeRealize.sh ${G_commandOptions} -p bxeDesc="${bxeDesc}" -i bxoAcctCreate    

    lpReturn
}



function vis_initialReposClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Get a list of repos for the specified bxoId.
Then clone those repos at the specified base or bxoHome if not specified.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [[ ! -z "${bxoId}" ]]

    if ! vis_userAcctExists "${bxoId}" ; then
	ANT_raw "${bxoId} account is not valid."
	lpReturn 101
    fi

    bxoHome=$( FN_absolutePathGet ~${bxoId} )    
    
    local gitCloneDest=""
    
    if [ $# -eq 0 ] ; then
	gitCloneDest=${bxoHome}
    elif [ $# -eq 1 ] ; then
	gitCloneDest=$1
    else
	EH_oops ""
	lpReturn
    fi
    
    #local reposList="rbxe bxeTree mapFiles vagrants"
    local reposList="rbxe mapFiles vagrants"

    local eachRepo=""
    local gitServerUrl=""

    opDo FN_dirCreatePathIfNotThere "${gitCloneDest}"  # NOTYET
    
    for eachRepo in ${reposList} ; do
	lpDo git clone git://github.com/bxObjects/${bxoId}.${eachRepo}.git "${gitCloneDest}/${eachRepo}"
    done

    lpReturn
}



function vis_fullConstruct {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Get a snapshot for the specified bxoId.
Setup the ~usg/.ssh/config.
Clone the repos in bxoHome or where specified.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bxoId}" ]
    EH_assert [ ! -z "${privacy}" ]

    if vis_userAcctExists "${bxoId}" ; then
	ANT_raw "${bxoId} account already exists."
	lpReturn 101
    fi


    local gitCloneDest=""

    lpDo vis_obtainRepoSnapshot rbxe

    #lpDo vis_usgSshConfigUpdate

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


function vis_fullRemove {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Removes everything related to specified bxoId on local system.
- usgBxoFullDelete
- bxoAcctDelete
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bxoId}" ]
    #EH_assert [ ! -z "${privacy}" ]

    if ! vis_userAcctExists "${bxoId}" ; then
	ANT_raw "${bxoId} account is not valid." ; lpReturn 101
    fi

    local gitCloneDest=""

    lpDo usgBxoSshManage.sh ${G_commandOptions}  -p bxoId=${bxoId} -i usgBxoFullDelete
    
    if [ $# -eq 0 ] ; then
	lpDo echo NOTYET instead of vis_initialReposClone
	
    elif [ $# -eq 1 ] ; then
	gitCloneDest=$1

	lpDo echo NOTYET instead of vis_initialReposClone ${gitCloneDest}	
	
    else
	EH_oops ""
	lpReturn
    fi

    lpDo vis_userHomeAcctsDelete "${bxoId}"    

    lpDo vis_bxoAcctDelete "${bxoId}"
    
    lpReturn
}


function vis_fullDelete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
FullRemove + bxoGitServerFullDelete
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [ ! -z "${bxoId}" ]
    #EH_assert [ ! -z "${privacy}" ]

    if ! vis_userAcctExists "${bxoId}" ; then
	ANT_raw "${bxoId} account is not valid." ; lpReturn 101
    fi

    lpDo vis_fullRemove $@
    
    lpDo vis_bxoGitServerFullDelete
    
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
