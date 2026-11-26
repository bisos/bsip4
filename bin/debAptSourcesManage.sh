#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/debAptSourcesManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Manage deb-src: sources.list, .list and deb822 .sources" )
${G_myName} ${extraInfo} -i verifyDebSrc
${G_myName} ${extraInfo} -i enableDebSrc
${G_myName} ${extraInfo} -i disableDebSrc
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_verifyDebSrc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Returns 0 when a deb-src source is configured: a deb-src line in sources.list or a
sources.list.d/*.list, or Types with deb-src in a deb822 sources.list.d/*.sources (Debian 13).
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local aptDir="/etc/apt"
    local retVal=1
    local each

    for each in ${aptDir}/sources.list ${aptDir}/sources.list.d/*.list ; do
        if [ -f "${each}" ] && egrep -q '^deb-src ' "${each}" ; then
            ANT_raw "deb-src lines detected in ${each}"
            retVal=0
        fi
    done
    for each in ${aptDir}/sources.list.d/*.sources ; do
        if [ -f "${each}" ] && egrep -q '^Types:.*\bdeb-src\b' "${each}" ; then
            ANT_raw "deb-src Types detected in ${each}"
            retVal=0
        fi
    done

    if [ ${retVal} == 0 ]  ; then
        ANT_raw "deb-src is configured -- returning ${retVal}"
    else
        ANT_raw "deb-src is missing in ${aptDir}/sources.list{,.d/} -- returning ${retVal}"
    fi

    lpReturn ${retVal}
}


function vis_enableDebSrc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    local aptSourcesFile="/etc/apt/sources.list"
    local deb822File="/etc/apt/sources.list.d/debian.sources"

    if [ -f ${aptSourcesFile} ] && grep -qi ubuntu.com ${aptSourcesFile} ; then
        opDo FN_fileSafeCopy ${aptSourcesFile} ${aptSourcesFile}.${dateTag}

        egrep '^deb ' ${aptSourcesFile}  | egrep 'restricted|universe' | grep -i ubuntu.com | grep -v backports  |
            while read thisLine ; do
                echo Running: $( echo add-apt-repository --enable-source \'${thisLine}\' )
                eval          $( echo add-apt-repository --enable-source \'${thisLine}\' )
            done
    else
        # Debian, as raw-bisos.sh's aptSourcesDebSrcEnable (bxGenesis/start) does at install time.
        # Only the Debian archive: a third-party repository may publish no sources.
        if [ -f ${deb822File} ] ; then
            opDo FN_fileSafeCopy ${deb822File} ${deb822File}.${dateTag}
            opDo sed -i 's/^Types:[[:space:]]*deb[[:space:]]*$/Types: deb deb-src/' ${deb822File}
            opDo grep '^Types:' ${deb822File}
        fi
        if [ -f ${aptSourcesFile} ] ; then
            local twinsAwk='/^deb-src /{have[$0]=1} {print} /^deb / && /[./]debian\.org\// && !/cdrom:/ {n++; want[n]="deb-src " substr($0,5)} END{for(i=1;i<=n;i++) if(!(want[i] in have)) print want[i]}'
            awk "${twinsAwk}" ${aptSourcesFile} > /tmp/sources.list.debSrc.$$
            if ! cmp -s /tmp/sources.list.debSrc.$$ ${aptSourcesFile} ; then
                opDo FN_fileSafeCopy ${aptSourcesFile} ${aptSourcesFile}.${dateTag}
                opDo cp /tmp/sources.list.debSrc.$$ ${aptSourcesFile}
            fi
            rm -f /tmp/sources.list.debSrc.$$
        fi
    fi

    opDo apt-get update

    vis_verifyDebSrc

    lpReturn
}


function vis_disbaleDebSrc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Has not been test yet. 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    local aptSourcesFile="/etc/apt/sources.list"

    opDo FN_fileSafeCopy ${aptSourcesFile} ${aptSourcesFile}.${dateTag}    

    egrep '^deb-src ' ${aptSourcesFile}  |
        while read thisLine ; do
            echo Running: $( echo add-apt-repository --remove \'${thisLine}\' )
            eval          $( echo add-apt-repository --remove \'${thisLine}\' )
        done

    opDo apt-get update

    opDo ls -l ${aptSourcesFile}
    
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
