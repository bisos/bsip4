#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

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
*  /This File/ :: /bisos/core/bsip/bin/convertOsmt2Bsip.sh 
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
$( examplesSeperatorChapter "Convert And Update" )
$( examplesSeperatorSection "All Repos" )
find /bisos/git/auth/bxRepos -type f -print | egrep '/ftoProc\.sh$' | wc
find /bisos/git/auth/bxRepos -type f -print | egrep '/ftoProc\.sh$' | ${G_myName} -i report
find /bisos/git/auth/bxRepos -type f -print | egrep '/ftoProc\.sh$' | ${G_myName} ${extraInfo} -i commonAspects
find /bisos/git/auth/bxRepos -type f -print | egrep '/ftoProc\.sh$' | bx-dblock -i dblockUpdateFiles
find /bisos/git/auth/bxRepos -type f -print | egrep '/ftoProc\.sh\.2020[0-9]+$' | wc
$( examplesSeperatorSection "Current Dir And Below" )
find . -type f -print | egrep '/ftoProc\.sh$' | wc
find . -type f -print | egrep '/ftoProc\.sh$' | ${G_myName} -i report
find . -type f -print | grep -v '/\.git' | grep -v ${G_myName} | ${G_myName} ${extraInfo} -i miscFix
find . -type f -print | grep -v ${G_myName} | ${G_myName} ${extraInfo} -i libreByStar
echo /bisos/panels/bisos-dev/_nodeBase_/fullUsagePanel-en.org | ${G_myName} ${extraInfo} -i miscFix
find /bisos/panels/ -type f -print | xargs grep -l /bisos/panels/bisos/ | ${G_myName} ${extraInfo} -i miscFix
find . -type f -print | egrep '/ftoProc\.sh$' | ${G_myName} ${extraInfo} -i commonAspects
find . -type f -print | egrep '/ftoProc\.sh$' | bx-dblock -i dblockUpdateFiles
find . -type f -print | egrep '/ftoProc\.sh\.2020[0-9]+$' | wc
$( examplesSeperatorSection "Current Dir" )
${G_myName} ${extraInfo} -i commonAspects *
find . -type f -print | grep -v ${G_myName} | ${G_myName} ${extraInfo} -i commonAspects
$( examplesSeperatorSection "Report" )
${G_myName} ${extraInfo} -i report *
find . -type f -print | grep -v ${G_myName} | ${G_myName} -i report
${G_myName} -i report *
$( examplesSeperatorSection "Cleanup" )
find . -type f -print |  egrep '\.2020[0-9]+$' 
find . -type f -print |  egrep '\.2020[0-9]+$' | xargs /bin/rm
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_report {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Function description.
Design Pattern: processEach based on args or stdin.
Examples:
      ${G_myName} -i userAcctsReport bisos
      echo bisos bystar | ${G_myName} -i userAcctsReport
_EOF_
    }
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local each="$1"

        echo "Processing ${thisFunc}:: ${each}"

        lpDo egrep "^IimBriefDescription=" ${each}
        lpDo egrep bx:dblock:lsip:bash:seed-spec ${each}
        lpDo egrep bx:dblock:bash:top-of-file ${each}
        lpDo egrep lpCurrents.libSh ${each}
        lpDo egrep bystarLib.sh ${each} 

        lpReturn 0
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}


function vis_commonAspects {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Function description.
Design Pattern: processEach based on args or stdin.
Examples:
      ${G_myName} -i userAcctsReport bisos
      echo bisos bystar | ${G_myName} -i userAcctsReport
_EOF_
    }
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local each="$1"
        local eachDateTag="${dateTag}"

        #echo "${thisFunc}" "${each}"   
        lpDo FN_fileSafeCopy "${each}" "${each}.${eachDateTag}"

        # TODOs:
        # icm.ANN_here, icm.ANN_write, icm.OUT_write

        cat ${each}.${eachDateTag} | \
            sed \
            -e "s/@icm.subjectToTracking/@io.track.subjectToTracking/g" \
            -e "s@icm.Cmnd@cs.Cmnd@g" \
            -e "s@icm.OpOutcome@bpf.op.Outcome@g" \
            -e "s@icm.g_icmMain@cs.g_csMain@g" \
            -e "s@bx:icm:py3:method@bx:cs:py3:method@g" \
            -e "s@bx:icm:py3:func@bx:cs:py3:func@g" \
            -e "s@G = IcmGlobalContext()@G = cs.globalContext.get()@g" \
            -e "s@G = icm.IcmGlobalContext()@G = cs.globalContext.get()@g" \
            -e "s@icm.ICM_ParamDict()@cs.ICM_ParamDict()@g" \
            -e "s@icm.ex_gCmndMenuItem@cs.examples.cmndInsert@g" \
            -e "s@icm.ex_gExecMenuItem@cs.examples.execInsert@g" \
            -e "s@icm.icmExampleMyName@cs.examples.myName@g" \
            -e "s@icm.G_commonBriefExamples@cs.examples.commonBrief@g" \
            -e "s@icm.cmndExampleMenuChapter@cs.examples.menuChapter@g" \
            -e "s@icm.argsparseBasedOnIcmParams@cs.argsparseBasedOnIcmParams@g" \
            -e "s@icm:py3:cmnd:classHead@bx:cs:py3:cmnd:classHead@g" \
            -e "s@bx:dblock:python:icm:cmnd:classHead@bx:cs:py3:cmnd:classHead@g" \
            -e "s@bx:icm:python:cmnd:classHead@bx:cs:py3:cmnd:classHead@g" \
            -e "s@bx:icm:python:method@bx:cs:py3:method@g" \
            -e "s@icm.LOG_Control@io.log.Control@g" \
            -e "s@LOG_Control@io.log.Control@g" \
            -e "s@icm.OpError.Success@cs.OpError.Success@g" \
            -e "s@argsparseBasedOnIcmParams@argsparseBasedOnCsParams@g" \
            -e "s@ucf.stackFrameInfoGet@bpf.ast.stackFrameInfoGet@g" \
            -e "s@ucf.FUNC_currentGet@bpf.ast.FUNC_currentGet@g" \
            -e "s@ucf.FUNC_argsLength@bpf.ast.FUNC_argsLength@g" \
            -e "s@icm.EH_@io.eh.@g" \
            -e "s@EH_@io.eh.@g" \
            -e "s@icm.CmndArgsSpecDict@cs.arg.CmndArgsSpecDict@g" \
            -e "s@icmInfo@csInfo@g" \
            -e "s@bx:icm:py@bx:cs:py@g" \
            -e "s@ICM_Param@CmndParam@g" \
            -e "s@FILE_ParamWriteTo@bpf.fp.FileParamWriteTo@g" \
            -e "s@FILE_ParamWriteToPath@bpf.fp.FileParamWriteToPath@g" \
            -e "s@FV_writeToFilePathAndCreate@bpf.fv.writeToFilePathAndCreate@g" \
            -e "s@FV_writeToBaseDirAndCreate@bpf.fv.writeToBaseDirAndCreate@g" \
            -e "s@+BEGIN: bx:cs:python:section :title \"End Of Editable Text\"@+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title \" ~End Of Editable Text~ \"@g" \
            -e "s@ :interactiveP \"\"@@g" \
            -e "s@\" :asFunc@ :pyInv@g" \
            -e "s@:argsMin \"@:argsMin @g" \
            -e "s@\" :argsMax \"@ :argsMax @g" \
            -e "s@bx:cs:py3:cmnd:classHead@b:py3:cs:cmnd/classHead@g" \
            -e "s@bx:icm:python:func@bx:cs:python:func@g" \
            -e "s@icm.cmndCallParamsValidate@cs.cmndCallParamsValidate@g" \
            -e "s@bpf@b@g"\
            -e "s@bx:cs:py3:func@b:py3:cs:func/typing@g" \
            -e "s@bx:dblock:python:class@b:py3:class/decl@g" \
            -e "s@bx:icm:py3:method@b:py3:cs:method/typing@g" \
            -e "s@bx:cs:py3:method@b:py3:cs:method/typing@g" \
            -e "s@^from bisos import cs@from bisos.b import cs@g" \
            -e "s@^from bisos import io@from bisos.b import b_io@g" \
            -e "s@icmParams@csParams@g" \
            -e "s@icmCmnds@csCmnds@g" \
            -e "s@b:py3t:cs:method@b:py3:cs:method/typing@g" \
            -e "s@\([ \t]\)io.log.@\1b_io.log.@g"\
            -e "s@(io.log.@(b_io.log.@g"\
            -e "s@\([ \t]\)io.eh.@\1b_io.eh.@g"\
            -e "s@icm.LOG_here@b_io.tm.here@g"\
            -e "s@icm.TM_here@b_io.tm.here@g"\
            -e "s@icm.notAsFailure@b.op.notAsFailure@g"\
            -e "s@cs.OpError.Success@b.OpError.Success@g"\
            -e "s@if interactive:@if rtInv.outs:@g"\
            -e "s@icm.eh_problem_usageError@icm.eh_problem_usageError_wOp@g"\
            -e "s@icm.cmndExampleMenuSection@cs.examples.menuSection@g"\
            -e "s@icm.cmndExampleMenuChapter@cs.examples.menuChapter@g"\
            -e "s@icm.ANN_write@b_io.ann.write@g"\
            -e "s@icm.ANN_here@b_io.ann.here@g"\
            -e "s@effectiveArgsList)@argsList)@g"\
            -e "s@icm.FILE_ParamValueReadFrom@b.fp.FileParamValueReadFrom@g"\
            -e "s@FILE_ParamValueReadFrom@FileParamValueReadFrom@g"\
            -e "s@icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)@@g"\
            -e "s@(G.icmMyName()@(cs.G.icmMyName()@g"\
            -e "s@ G.icmMyFullName@ cs.G.icmMyFullName@g"\
            > ${each}
        
        lpReturn 0
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}


function vis_miscFix {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Function description.
Design Pattern: processEach based on args or stdin.
Examples:
      ${G_myName} -i userAcctsReport bisos
      echo bisos bystar | ${G_myName} -i userAcctsReport
_EOF_
    }
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local each="$1"
        local eachDateTag="${dateTag}"

        #echo "${thisFunc}" "${each}"   
        lpDo FN_fileSafeCopy "${each}" "${each}.${eachDateTag}"

        cat ${each}.${eachDateTag} | \
            sed \
            -e "s@fileParamManage.py@fileParamManage.cs@g"\
            > ${each}

            # sed -e "s@unisos.marme@bisos.marmee@g" > ${each}
            #sed -e "s@bx:bsip:bash/processArgsAndStdin \$@bx:bsip:bash/processArgsAndStdin :noParams t@g" > ${each}
        
        lpReturn 0
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}


function vis_miscFixMtdt {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Function description.
Design Pattern: processEach based on args or stdin.
Examples:
      ${G_myName} -i userAcctsReport bisos
      echo bisos bystar | ${G_myName} -i userAcctsReport
_EOF_
    }
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local each="$1"
        local eachDateTag="${dateTag}"

        #echo "${thisFunc}" "${each}"
        lpDo FN_fileSafeCopy "${each}" "${each}.${eachDateTag}"

        cat ${each}.${eachDateTag} | \
            sed \
            -e "s@b:mtdt:compose:fashion@b:mtdt:compose:framework@g"\
            > ${each}

            # sed \
            # -e "s@b:mtdt:recipients|curSet@b:mtdt:recipients|select@g"\
            # -e "s@b:mtdt:mailings|curSet@b:mtdt:mailings|select@g"\
            # -e "s@b:mtdt:distr|applyRecipientsCurSetListToMailings@b:mtdt:distr|applyRecipientsSelectedListToMailings@g"\
            # -e "s@curSetForms@selectedForms@g"\
            # -e "s@b:mtdt:derive/withFileAndCurSet@b:mtdt:derive/withFileAndSelect@g"\
            # -e "s@CurRecipients@SelRecipients@g"\
            # > ${each}


            # sed -e "s@unisos.marme@bisos.marmee@g" > ${each}
            #sed -e "s@bx:bsip:bash/processArgsAndStdin \$@bx:bsip:bash/processArgsAndStdin :noParams t@g" > ${each}

        lpReturn 0
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:

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
