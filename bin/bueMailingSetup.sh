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
*  /This File/ :: /bisos/core/bsip/bin/bueMailStatic.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes          :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs          :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel         :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info           :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports        :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# PRE parameters

pdf="noPdf"
baseDir=""
header=""
#type="compose"  # or, one of: "redraft", "static", "dynamic"

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples       :: Examples  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local selectedBxoBase="~/bxo/usageEnv/selected"
    local mailingDefaultsBase="/bisos/apps/defaults/mailing"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Static Mailings Starting Point Generator" )
$( examplesSeperatorSection "Start -- With Default Parameters" )
${G_myName} ${extraInfo} -i composeStart                    # Mailing Name Will Be Date Tagged
${G_myName} ${extraInfo} -i composeStart dated                   # Mailing Name Will Be Date Tagged
${G_myName} ${extraInfo} -i composeStart mailingName ""       # mailingName is specified
${G_myName} ${extraInfo} -p base=. -i composeStart mailingName ""       # mailingName is specified
${G_myName} ${extraInfo} -p base=~/bxo/usageEnv/selected/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName
${G_myName} ${extraInfo} -p base=~/bxo/usageEnv/selected/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName ""
${G_myName} ${extraInfo} -p pdf=pdf -p base=~/bxo/usageEnv/selected/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName "qualifier"
${G_myName} ${extraInfo} -p base=. -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName
${G_myName} ${extraInfo} -p base=. -p template="/bisos/apps/defaults/mailing/compose/faEn/generic" -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName
$( examplesSeperatorSection "Start Globish -- EnFa -- With Specified Parameters" )
${G_myName} ${extraInfo} -p base=~/bxo/usageEnv/selected/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -p header="~/bxo/usageEnv/selected/mailings/headers/enFa-office.mail" -i composeStart mailingName 
${G_myName} ${extraInfo} -p base=~/bxo/usageEnv/selected/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -i composeStart mailingName ""
${G_myName} ${extraInfo} -p pdf=pdf -p base=. -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -i composeStart basicLaTeX pdf
${G_myName} ${extraInfo} -p base=. -p template="/bisos/apps/defaults/mailing/compose/enFa/generic" -i composeStart basicLaTeX ""
$( examplesSeperatorSection "Start Farsi -- FaEn -- With Specified Parameters" )
${G_myName} ${extraInfo} -p base=${selectedBxoBase}/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/faEn/generic" -i composeStart mailingName 
${G_myName} ${extraInfo} -p base=${selectedBxoBase}/mailings/compose -p template="/bisos/apps/defaults/mailing/compose/faEn/generic" -i composeStart mailingName ""
${G_myName} ${extraInfo} -p pdf=pdf -p base=. -p template="/bisos/apps/defaults/mailing/compose/faEn/generic" -i composeStart basicLaTeX pdf
${G_myName} ${extraInfo} -p base=. -p template="/bisos/apps/defaults/mailing/compose/faEn/generic" -i composeStart basicLaTeX ""
_EOF_
}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF            :: vis_composeStart |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_composeStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Example:  ${G_myName} -p base=~/bxo/usageEnv/selected/mailings/com/example/statics -p header=~/bxo/usageEnv/selected/mailings/com/example/pabloLopez/content.mail -p template=baseDir -i composeStart mailName
** 
** -p base=~/bxo/usageEnv/selected/mailings/compose  -- Specifies where the mailing will be created in
** -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/common/content.mail  -- Mail header fields will be extracted from this -- Body will be ignored
** -p template=~/bxo/usageEnv/selected/mailings/templates/static/enFa/generic  -- Starting point body as mailing.ttytex
** \$1 : Optional IIF Arg1 specifies the mailing name. If None, dateTag is used as name
** \$2 : Optional IIF Arg2 specifies the dateTag over-write name extention -- "" means just mailngName. If None, dateTag is appended to mailingName.
_EOF_
    }
    EH_assert [[ $# -le 2 ]]  # 0=dateTagIt 1=nameIt+datTag 2=nameIt+Qualifier

    local thisEmacsClient=$( vis_thisEmacsClient )  

    # Output base directory
    typeset baseDir="$( FN_absolutePathGet ~/bxo/usageEnv/selected/mailings/compose )"
    if [ ! -z "${base:-}" ] ; then
        baseDir="$( FN_absolutePathGet ${base} )"
    fi

    # mailingName and mailingBaseDir
    typeset mailingBaseDir
    typeset mailingName
    typeset dateTag=$( DATE_nowTag ) 
    if [ $# -gt  0 ] ; then
        mailingName=$1
        if [ -z mailingName ] ; then
            mailingName=${dateTag}
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${dateTag}  # The specified name is also date tagged.
        fi
    else  # Which means $# == 0
        mailingName=${dateTag}
        mailingBaseDir=${baseDir}/${mailingName}
    fi

    if [ $# == 2 ] ; then
        if [ -z "$2" ] ; then
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${2}
        fi
    fi


    ### Mailing Template

    typeset templateBaseDir="/bisos/apps/defaults/mailing/compose/enFa/generic"
    if [ ! -z "${template:-}" ] ; then
        templateBaseDir=${template}
    fi

    if [ ! -d "${templateBaseDir}" ] ; then
        EH_problem "Missing Template BaseDir: ${templateBaseDir}"
        lpReturn 101
    fi

    ### headerFile
    typeset headerFile="$( FN_absolutePathGet ${templateBaseDir}/content.mail )"
    if [ ! -z "${header}" ] ; then
        headerFile="$( FN_absolutePathGet ${header} )"
        if [ ! -f ${headerFile} ] ; then
            EH_problem "Missing Header File: ${headerFile}"
            lpReturn 101
        fi
    fi
    if [ ! -f "${headerFile}" ] ; then
        headerFile="$( FN_absolutePathGet /bisos/apps/defaults/mailing/compose/headers/blank.mail )"
        if [ ! -f ${headerFile} ] ; then
            EH_problem "Missing Header File: ${headerFile}"
            lpReturn 101
        fi
    fi
        
    if [ -d  "${mailingBaseDir}" ] ; then
        EH_problem "${mailingBaseDir} Already In Place -- Will Not Overwrite, Force It With:"
        ANT_raw "rm -r -f ${mailingBaseDir}"
        lpReturn
    else
        opDoRet mkdir -p ${mailingBaseDir}
    fi
    
    ls -ldt ${mailingBaseDir}
    ls -ldt ${templateBaseDir}
    ls -ldt ${headerFile}

    # inBaseDirDo ${templateBaseDir} eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imdv)"
    inBaseDirDo ${templateBaseDir} eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imd)"

    inBaseDirDo ${mailingBaseDir}  cp "${headerFile}" .

    if [ "${pdf}" == "pdf" ] ; then
        inBaseDirDo ${mailingBaseDir} lcntProc.sh -p pdf=pdf -v -n showRun -i bodyPartsRefresh
    else
        inBaseDirDo ${mailingBaseDir} lcntProc.sh -v -n showRun -i bodyPartsRefresh     
        
    fi

    #opDo ${thisEmacsClient} -n -e "(progn (find-file \"${mailingBaseDir}/mailing.ttytex\") (blee:ppmm:org-mode-content-list))"
    # opDo ${thisEmacsClient} -n -e "(progn (find-file \"${mailingBaseDir}/content.mail\"))"

    echo "===================="
    echo "$( FN_nonDirsPart ${mailingBaseDir} ) is ready to be configured."
    echo "+ ${mailingBaseDir}; lsf"    
    
    lpReturn
}


function vis_composeStartOLD {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Example:  ${G_myName} -p base=~/bxo/usageEnv/selected/mailings/com/example/statics -p header=~/bxo/usageEnv/selected/mailings/com/example/pabloLopez/content.mail -p template=baseDir -i composeStart mailName
** 
** -p base=~/bxo/usageEnv/selected/mailings/compose  -- Specifies where the mailing will be created in
** -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/common/content.mail  -- Mail header fields will be extracted from this -- Body will be ignored
** -p template=~/bxo/usageEnv/selected/mailings/templates/static/enFa/generic  -- Starting point body as mailing.ttytex
** \$1 : Optional IIF Arg1 specifies the mailing name. If None, dateTag is used as name
** \$2 : Optional IIF Arg2 specifies the dateTag over-write name extention -- "" means just mailngName. If None, dateTag is appended to mailingName.
_EOF_
    }
    EH_assert [[ $# -le 2 ]]  # 0=dateTagIt 1=nameIt+datTag 2=nameIt+Qualifier

    local thisEmacsClient=$( vis_thisEmacsClient )  
    

    # Output base directory
    typeset baseDir="$( FN_absolutePathGet ~/bxo/usageEnv/selected/mailings/compose )"
    if [ ! -z "${base}" ] ; then
        baseDir="$( FN_absolutePathGet ${base} )"
    fi

    # mailingName and mailingBaseDir
    typeset mailingBaseDir
    typeset mailingName
    typeset dateTag=$( DATE_nowTag ) 
    if [ $# -gt  0 ] ; then
        mailingName=$1
        if [ -z mailingName ] ; then
            mailingName=${dateTag}
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${dateTag}  # The specified name is also date tagged.
        fi
    else  # Which means $# == 0
        mailingName=${dateTag}
        mailingBaseDir=${baseDir}/${mailingName}
    fi

    if [ $# == 2 ] ; then
        if [ -z "$2" ] ; then
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${2}
        fi
    fi

    if [ -d  ${mailingBaseDir} ] ; then
        EH_problem "${mailingBaseDir} Already In Place -- Will Not Overwrite, Force It With:"
        ANT_raw "rm -r -f ${mailingBaseDir}"
        lpReturn
    else
        opDoRet mkdir -p ${mailingBaseDir}
    fi

    ### Mailing Template

    typeset templateBaseDir="/bisos/apps/defaults/mailing/compose/enFa/generic"
    if [ ! -z "${template}" ] ; then
        templateBaseDir=${template}
    fi

    if [ ! -d ${templateBaseDir} ] ; then
        EH_problem "Missing Template BaseDir: ${templateBaseDir}"
        lpReturn 101
    fi

    ### headerFile

    typeset headerFile="$( FN_absolutePathGet /bisos/apps/defaults/mailing/compose/headers/blank.mail )"
    if [ ! -z "${header}" ] ; then
        headerFile="$( FN_absolutePathGet ${header} )"
    fi

    if [ ! -f ${headerFile} ] ; then
        EH_problem "Missing Header File: ${headerFile}"
        lpReturn 101
    fi

    ls -ldt ${mailingBaseDir}
    ls -ldt ${templateBaseDir}
    ls -ldt ${headerFile}

    inBaseDirDo ${templateBaseDir} eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imdv)"



#${G_myName} ${extraInfo} -p base=~/bxo/usageEnv/selected/mailings/compose -p template=~/bxo/usageEnv/selected/mailings/templates/static/enFa/generic -p header=~/bxo/usageEnv/selected/mailings/mohsenProfessional/consulting/lookingForProjs/2013/content.mail -i composeStart mailingName

#~/bxo/usageEnv/selected/mailings/templates/static/enFa/generic/mailingStatic/mailingName

    opDo eval "sed '/--text follows this line--/q' ${headerFile} > ${mailingBaseDir}/mailingStatic/content.mail"

    cat  << _EOF_ >> ${mailingBaseDir}/mailingStatic/content.mail
<#part type="text/html" disposition=inline>
<!--  [[elisp:(find-file "../mailing.ttytex")][Visit ../mailing.ttytex]]  -->
<!-- ####+BEGIN: bx:dblock:global:file-insert-process :file "../rel/${mailingName}-html/index.html" :load "./dblockProcess.el" :exec "bx:dblock:body-process"
-->
<!-- ####+END: -->
<#/part>
_EOF_

    if [ "${pdf}" == "pdf" ] ; then
        cat  << _EOF_ >> ${mailingBaseDir}/mailingStatic/content.mail
<#part type="application/pdf" filename="../rel/${mailingName}.pdf" disposition=attachment description="Pdf File">
<#/part>
_EOF_
    fi

    opDo eval "echo ${mailingName} > ${mailingBaseDir}/mailingStatic/mailingName"
    
    opDo ${thisEmacsClient} -n -e "(progn (find-file \"${mailingBaseDir}/mailing.ttytex\") (blee:ppmm:org-mode-content-list))"

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF            :: vis_enFaGenericInitObsolete |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_enFaGenericInitObsolete {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO [[elisp:(org-cycle)][| ]]  NOTYETs  ::  A pre made mailing base dir comes as a parameter  [[elisp:(org-cycle)][| ]]
*** Body templates comes in as a parameter -- So, enFa vs faEn and other form letters can be pre-made
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset dateTag=$( DATE_nowTag )
    typeset mailingBaseDir="$( FN_absolutePathGet ~/bxo/usageEnv/selected/mailings/compose/${dateTag} )"
    local thisEmacsClient=$( vis_thisEmacsClient )  
    
    opDo mkdir -p ${mailingBaseDir}

    ls -ldt ${mailingBaseDir}

    #inBaseDirDo /bisos/apps/defaults/mailing/compose/enFa/generic eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imdv)"
    inBaseDirDo /bisos/apps/defaults/mailing/compose/enFa/generic eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imd)"

    echo "${thisEmacsClient} ${mailingBaseDir}/mailingEnFa.ttytex"

    lpReturn
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common         ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
