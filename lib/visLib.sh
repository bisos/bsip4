#!/bin/bash # -*- mode: sh-mode; -*-

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: visLib.sh,v 1.15 2020-01-05 20:54:40 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
			       }



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Aux Invokations*
_CommentEnd_


alias iifAuxInvocation='if _iifAuxInvocation argsLen="${argsLen}" mandatoryParams="${mandatoryParams}" ; then return; fi;'

#
# Parallels Python Iif Class
#
# Initial Defaults
#
iifParamsMandatory=""
iifParamsOptional=""
iifArgsLen="0"
iifArgsDesc=""

iifVisibility="all"  # users, developers, internal
iifUsers=""           # lsipusr
iifGroups=""           # bystar
iifImpact=""           # read, modify    


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  _iifAuxInvocation    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function _iifAuxInvocation {
    if [ "${G_isRealInvokationP}" != "false" ] ; then
	return 1
    fi
    case "${G_auxAction}" in
	describeF)
	    describeF
	    ;;
	funcEntryShow)
	    G_funcEntryShow
	    ;;
	paramsMandatory)
	    echo NOTYET
	    ;;
	paramsMandatory)
	    echo NOTYET
	    ;;
	paramsOptional)
	    echo NOTYET
	    ;;
	argsLen)
	    echo NOTYET
	    ;;
	argsDesc)
	    echo NOTYET
	    ;;
	users)
	    echo NOTYET
	    ;;
	groups)
	    echo NOTYET
	    ;;
	impact)
	    echo NOTYET
	    ;;
	visibility)
	    echo NOTYET
	    ;;
	*)
	    EH_problem "Invalid G_auxAction=${G_auxAction}"
	    ;;
    esac
    return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iifAuxInvoke    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iifAuxInvoke {
    G_funcEntry
    function describeF { cat  << _EOF_
This is describeF of vis_iifAuxInvoke
_EOF_
    }
    
    EH_assert [[ $# -eq 2 ]]

    local auxAction=$1
    local iifName=$2
    
    G_isRealInvokationP="false"
    G_auxAction=${auxAction}
    opDo vis_${iifName}
    G_isRealInvokationP="true"
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Player Interface*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimBriefDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimBriefDescription {
    # $1=callingsName
    if [ "${iimPlayer}" = "blee" ] ; then
	cat  << _EOF_
${IimBriefDescription}
_EOF_
	return
    fi
	
    cat  << _EOF_
${IimBriefDescription}
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimDescription {
    # $1=callingsName
    vis_moduleDescription
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimLanguage    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimLanguage {
    echo "bash"
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lsIifs    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lsIifs {
    G_funcEntry
    function describeF { cat  << _EOF_
This is $FUNCNAME of ${G_thisFunc}.
_EOF_
    }
    local iifArgsLen=0 iifParamsMandatory="par1,par2"
    iifAuxInvocation

    typeset itemsList=""
    #itemsList=$( typeset +f | egrep '^vis_' )  # KSH
    itemsList=$( typeset +f | egrep '^vis_' | grep ' ()' ) # BASH
    typeset thisItem=""
    for thisItem in  ${itemsList} ; do
	# () shows up in bash
	if [ ${thisItem} == "()" ] ; then  continue; fi
	if [ ${thisItem} == "{" ] ; then  continue; fi
	print -- ${thisItem##vis_} 
    done
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Examples Support*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  visLibExamplesOutput    [[elisp:(org-cycle)][| ]]
_CommentEnd_

iimPlayer=""

function visLibExamplesOutput {
    # $1=callingsName
    if [ "${iimPlayer}" = "blee" ] ; then
	cat  << _EOF_
$1
_EOF_
	return
    fi
	
    cat  << _EOF_
$( examplesSeperatorChapter "COMMON SEEDED EXAMPLES" )
${1} -i examplesCommonSeeded
${G_myName} -i iimPanelUsages
${1} -i visit
${1} -i gotoPanel
${1} -i iifAuxInvoke describeF lsIifs
${1} -i lsIifs
${1} -i describe | emlVisit
${1} -i examples | emlOutFilter.sh
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examplesCommonSeeded    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examplesCommonSeeded {
 cat  << _EOF_
$( examplesSeperatorChapter "COMMON EXAMPLES" )
${G_myName} -i showMe
${G_myName} -i seedHelp
${G_myName} -n showOnly -T 9 -i help
${G_myName} -i runFunc func args
${G_myName} -i visit
lpCurrentsAdmin.sh
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimPanelUsages    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimPanelUsages {
 cat  << _EOF_
$( examplesSeperatorChapter "IIM Panel Usages" )
${G_myName} -i groupedPanel
${G_myName} -i groupedPanelPreps
${G_myName} -i pkgedPanel
${G_myName} -i pkgedPanelPreps
${G_myName} -i iimCmndPartList
_EOF_
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesSeperatorTopLabel    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesSeperatorTopLabel {
 cat  << _EOF_
###############################  $@  #################################
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesSeperatorChapter    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesSeperatorChapter {
 cat  << _EOF_
#################  $@  #################
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesSeperatorSection    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesSeperatorSection {
 cat  << _EOF_
=================  $@  =================
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesSeperatorSubSection    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesSeperatorSubSection {
 cat  << _EOF_
-----------------  $@  -----------------
_EOF_
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Environment Captures*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_runFunc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_runFunc {
  #EH_assert [[ $# -gt 0 ]]
  typeset func=$1
  shift
  ${func} "$@"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_myEnv    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_myEnv {
    #EH_assert [[ $# -le 1 ]]
    typeset outputBase="human"
    
    if  [ $# -eq 1 ] ; then
	outputBase="$1"
    fi

    myEnvParOutput ${outputBase} G_argsOrig "${G_argsOrig}"
    myEnvParOutput ${outputBase} G_progName "${G_progName}"
    myEnvParOutput ${outputBase} G_iimCapabilities "${G_iimCapabilities}"    
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  myEnvParOutput    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function myEnvParOutput {
#     G_funcEntry
#     function describeF {  G_funcEntryShow; cat  << _EOF_
# _EOF_
# 		       }
#     EH_assert [[ $# -eq 3 ]]

    typeset outputBase="$1"
    typeset parmName="$2"
    typeset parmValue="$3"        
    
    
    if [ "${outputBase}" = "human" ] ; then
	ANT_raw "${parmName}"="${parmValue}"
    else
	fileParam_write "${outputBase}" "${parmName}" "${parmValue}"
    fi
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Support*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_showMe    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_showMe {
    #RcsId=${RcsId}
    #opShellVersion=${.sh.version}    
      cat  << _EOF_
=== Program Parameters
"${G_myName}"
G_argsOrig=${G_argsOrig}
G_progName=${G_progName}
G_myName=${G_myName}
G_myInvokedName=${G_myInvokedName}
G_myFullName=${G_myFullName}
G_runMode=${G_runMode}
G_verbose=${G_verbose}
G_checkMode=${G_checkMode}
G_forceMode=${G_forceMode}
=== OSMT Configurable Parameters
opBase=${opBase}
=== User Parameters
opRunAcctName=${opRunAcctName}
opShellVersion=${BASH_VERSION}
_EOF_
      
      
# Also Trace Level
# NOTYET, Also show other relevant opBase and config parameters

  print -- "--- OSMT INFO ---"
  # NOTYET, test that it exists, use the right variable
  cat /etc/osmtInfo
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_seedHelp    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_seedHelp {
 cat  << _EOF_

The following features are available to all scripts based on
seedActions.sh and seedSubjectActions.sh

Tracing:     -T <runLevelNumber>  -- Ex: ${G_myName} -T 9 ...
Run Mode:    -n <runMode>         -- Ex: ${G_myName} -n runSafe ...
Verbose:     -v                   -- Ex: ${G_myName} -v
Elaborate:   -e                   -- Ex: ${G_myName} -e elaborationTextIsIgnored
Force Mode:  -f                   -- Ex: ${G_myName} -f
Check Mode:  -c                   -- Ex: ${G_myName} -c fast

Tracing
=======
            DEFAULT: -T 0

            Trace Number Conventions:

	    0: No Tracing
	    1: Application Basic Info
	    2: Application General Info
	    3: Application Function Entry and Exit
    	    4: Application Debugging
	    5: Wrappers Library
	    6: Seed Script
	    7: Seed Supporting Libraries (eg, doLib.sh)
	    8: ocp_library
	    9: Quick Debug, usually temporary

Run Mode:
=========
           DEFAULT: runOnly

G_runMode=
   showOnly:           at opDo* just show the args always return 0
   runOnly:            at opDo* just execute
   showRun:            at opDo both runOnly and showOnly
   runSafe:            at opDo both show and run, but if protected
                       then just show
   showProtected:      Run everything and don't show except for
                       show only protected
   showRunProtected:   Run everything and don't show except for
                       run and show rotected

runSafe = unprotected: showRun, protected: show
showProtected = unprotected: run, protected: show
showRunProtected = unprotected: run, protected: showRun 

Verbose Mode:
=============

G_verbose=
   verbose        When Set, verbose format (eg, line nu, time tag, ...)
                  of Tracing and RunMode are selected.

Force Mode:
=============

G_forceMode=
   force          When Set, force/overwrite mode of operation
                  is selected.

Check Mode:
===========

G_checkMode={fast,strict,full}
   fast:          1) Skip asserting and consistency checks.
                  2) Do less than default, invoker will 
                     compensate
   strict:        Do asserts and consistency checks.
   full:          1) Do more than default

_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  opParamIsSet    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function opParamIsSet {
  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi

  retVal=0

  dotMeParamTmpFile=/tmp/$$.dotme

  # When osmtKsh supports indirection we can get rid of this
      
  print "if [ \"\${$1}_\" == \"_\" ] \n then\n  retVal=1\n fi\n" > ${dotMeParamTmpFile}

  #cat ${dotMeParamTmpFile}
  . ${dotMeParamTmpFile}

  FN_fileRmIfThere ${dotMeParamTmpFile}

  return ${retVal}
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  indirectDollarSign    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function indirectDollarSign {
   # set -x
  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi

  retVal=0

  dotMeTmpFile=/tmp/$$.dotme

  # When osmtKsh supports indirection we can get rid of this
      
  print "echo \${$1}" > ${dotMeTmpFile}

  #echo ${dotMeTmpFile}
  #cat ${dotMeTmpFile}
  . ${dotMeTmpFile}
  retVal=$?

  FN_fileRmIfThere ${dotMeTmpFile}

  return ${retVal}
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Common IIFs*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_gotoPanel    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_gotoPanel {
    if [ -z "${G_myPanel}" ] ; then
	EH_problem "Missing G_myPanel Specification"
	return 101
    fi
    
    #emlVisit -i gotoPanel /libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git
    emlVisit -v -n showRun -i gotoPanel "${G_myPanel}"
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_visit    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_visit {
    if [ -z "${G_myFullName}" ] ; then
	EH_problem "Missing G_myFullName Specification"
	return 101
    fi
    
    emlVisit -v -n showRun -i gotoPanel "${G_myFullName}"
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IIF Params To FileParams*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimsInParamsUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimsInParamsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Perhaps add a -f forceMode, which would overwrite
   existing vars.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    declare  fpNodeBase="./iimsIn/paramsFp"

    opDo FN_dirCreatePathIfNotThere ${fpNodeBase}

    declare fpLeafParamName=""
    declare fpLeafParamValue=""    

    declare parsList=$( declare -t | sed -e s/"declare -At "// | grep -v iimControl_ | cut -d= -f1 )
    for thisParam in ${parsList} ; do
	fpLeafParamName=$(dictRead ${thisParam} "name")
	if [ -z "${fpLeafParamName}" ] ; then
	    EH_problem "Missing fpLeafParamName param=${thisParam}"
	    continue
	fi
	fpLeafParamValue=$(dictRead ${thisParam} "value")
	if [ -z "${fpLeafParamValue}" ] ; then
	    EH_problem "Missing fpLeafParamValue param=${thisParam}"
	    continue
	fi

_CommentBegin_
** TODO First Try A Read, If That Fails, Do The Write
_CommentEnd_

        opDo fileParam_write ${fpNodeBase} "${fpLeafParamName}" "${fpLeafParamValue}"


        iimParam_${thisParam} $(dictRead ${thisParam} "enums") | fileParam_writeEnums ${fpNodeBase} "${fpLeafParamName}"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "description" "$(dictRead ${thisParam} description)"
	
    done

    lpReturn
}	


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM General Paramaters*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_wrapper    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_wrapper {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_wrapper=(
	    [name]="wrapper"
	    [value]="None"
	    [default]="None"
	    [type]="string"
	    [description]="Command Wrapping IIM Exec (e.g. echo, time)"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
UserInput
time
echo
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_iimName    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_iimName {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_iimName=(
	    [name]="iimName"
	    [value]="${G_myName}"
	    [default]="${G_myName}"	    
	    [type]="string"
	    [description]="Interactively Invokable Module (IIM)"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
${G_myName}
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_iif    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_iif {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_iif=(
	    [name]="iif"
	    [value]="None"
	    [default]="examples"	    
	    [type]="string"
	    [description]="IIF (-i iif)"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_iifArgs    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_iifArgs {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_iifArgs=(
	    [name]="iifArgs"
	    [value]="None"
	    [default]="None"	    
	    [type]="string"
	    [description]="Command IIF Arguments ($@)"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_verbosity    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_verbosity {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_verbosity=(
	    [name]="verbosity"
	    [value]="-v"
	    [default]="-v"	    
	    [type]="string"
	    [description]="Level Of Verbosity"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
-v
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_forceMode    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_forceMode {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_forceMode=(
	    [name]="forceMode"
	    [value]="None"
	    [default]="None"	    
	    [type]="string"
	    [description]="Force Mode"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
-f
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_callTracking    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_callTracking {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_callTracking=(
	    [name]="callTracking"
	    [value]="-n showRun"
	    [default]="-n showRun"	    
	    [type]="string"
	    [description]="Call Tracking"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
-n showOnly
-n runOnly
-n showRun
-n runSafe
-n showProtected
-n showRunProtected
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_tracing    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_tracing {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_tracing=(
	    [name]="tracing"
	    [value]="None"
	    [default]="None"	    
	    [type]="string"
	    [description]="Trace Module (tracing level)"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
-T 0
-T 1
-T 2
-T 3
-T 4
-T 5
-T 6
-T 7
-T 8
-T 9
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimControl_recording    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimControl_recording {
    if [ $# -eq 0 ] ; then    
	IimParam iimControl_recording=(
	    [name]="recording"
	    [value]="None"
	    [default]="None"	    
	    [type]="string"
	    [description]="Results Recording Location"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
None
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Controls to FileParams Update*
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimsInControlsUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimsInControlsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Perhaps add a -f forceMode, which would overwrite
   existing vars.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]


    function iimParamFuncsInvoke {
	EH_assert [[ $# -eq 0 ]]
	declare iimParamFuncsList=$( declare -F | grep iimControl_ | sed -e s/"declare -f "// | cut -d= -f1 )
	for thisFunc in ${iimParamFuncsList} ; do
	    opDo ${thisFunc}
	done
    }

    iimParamFuncsInvoke

    declare  fpNodeBase="./iimsIn/commonControlFp"

    opDo FN_dirCreatePathIfNotThere ${fpNodeBase}

    declare fpLeafParamName=""
    declare fpLeafParamValue=""    

    declare parsList=$( declare -t | sed -e s/"declare -At "// | grep iimControl_ | cut -d= -f1 )
    for thisParam in ${parsList} ; do
	fpLeafParamName=$(dictRead ${thisParam} "name")
	if [ -z "${fpLeafParamName}" ] ; then
	    EH_problem "Missing fpLeafParamName param=${thisParam}"
	    continue
	fi

	fpLeafParamDefault=$(dictRead ${thisParam} "default")
	if [ -z "${fpLeafParamDefault}" ] ; then
	    EH_problem "Missing fpLeafParamDefault param=${thisParam}"
	    continue
	fi
	
	fpLeafParamValue=$(dictRead ${thisParam} "value")
	if [ -z "${fpLeafParamValue}" ] ; then
	    EH_problem "Missing fpLeafParamValue param=${thisParam}"
	    continue
	fi

_CommentBegin_
** TODO First Try A Read, If That Fails, Do The Write
_CommentEnd_

#dictRead ${thisParam} "value"

#echo

#echo ZZ ${fpLeafParamValue}

#continue

        opDo fileParam_write "${fpNodeBase}" "${fpLeafParamName}" "${fpLeafParamValue}"


        ${thisParam} $(dictRead ${thisParam} "enums") | fileParam_writeEnums "${fpNodeBase}" "${fpLeafParamName}"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "description" "$(dictRead ${thisParam} description)"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "default" "$(dictRead ${thisParam} default)"	
	
    done

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimLine_mode    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimLine_mode {
    if [ $# -eq 0 ] ; then    
	IimParam iimLine_mode=(
	    [name]="mode"
	    [value]="None"
	    [default]="show"	    
	    [type]="string"
	    [description]="Chooses iimLine run mode."
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
run
echo
show
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimsLineModeUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimsLineModeUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Perhaps add a -f forceMode, which would overwrite
   existing vars.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    function iimParamFuncsInvoke {
	EH_assert [[ $# -eq 0 ]]
	declare iimParamFuncsList=$( declare -F | grep iimLine_ | sed -e s/"declare -f "// | cut -d= -f1 )
	for thisFunc in ${iimParamFuncsList} ; do
	    opDo ${thisFunc}
	done
    }

    iimParamFuncsInvoke

    declare  fpNodeBase="./iimsIn/lineModeFp"

    opDo FN_dirCreatePathIfNotThere ${fpNodeBase}

    declare fpLeafParamName=""
    declare fpLeafParamValue=""    

    declare parsList=$( declare -t | sed -e s/"declare -At "// | grep iimLine_ | cut -d= -f1 )
    for thisParam in ${parsList} ; do
	fpLeafParamName=$(dictRead ${thisParam} "name")
	if [ -z "${fpLeafParamName}" ] ; then
	    EH_problem "Missing fpLeafParamName param=${thisParam}"
	    continue
	fi

	fpLeafParamDefault=$(dictRead ${thisParam} "default")
	if [ -z "${fpLeafParamDefault}" ] ; then
	    EH_problem "Missing fpLeafParamDefault param=${thisParam}"
	    continue
	fi
	
	fpLeafParamValue=$(dictRead ${thisParam} "value")
	if [ -z "${fpLeafParamValue}" ] ; then
	    EH_problem "Missing fpLeafParamValue param=${thisParam}"
	    continue
	fi

_CommentBegin_
** TODO First Try A Read, If That Fails, Do The Write
_CommentEnd_

#dictRead ${thisParam} "value"

#echo

#echo ZZ ${fpLeafParamValue}

#continue

        opDo fileParam_write "${fpNodeBase}" "${fpLeafParamName}" "${fpLeafParamValue}"


        ${thisParam} $(dictRead ${thisParam} "enums") | fileParam_writeEnums "${fpNodeBase}" "${fpLeafParamName}"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "description" "$(dictRead ${thisParam} description)"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "default" "$(dictRead ${thisParam} default)"	
	
    done

    lpReturn
}	


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Player Interface*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimsPkg_label    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimsPkg_label {
    iimsPkgLabel=$(FN_nonDirsPart $(FN_dirsPart ${G_myFullName}))
    if [ $# -eq 0 ] ; then    
	IimParam iimsPkg_label=(
	    [name]="label"
	    [value]="${iimsPkgLabel}"
	    [default]="${iimsPkgLabel}"	    
	    [type]="string"
	    [description]="A label for this iimsPkg"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
${iimsPkgLabel}
None
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  iimsPkg_dateVer    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimsPkg_dateVer {
    if [ $# -eq 0 ] ; then    
	IimParam iimsPkg_dateVer=(
	    [name]="dateVer"
	    [value]="uninitialized"
	    [default]="uninitialized"	    
	    [type]="string"
	    [description]="A label for this iimsPkg"
	    [enums]="my_enums" 
	)
    fi

    function my_enums { cat  << _EOF_
uninitialized
None
UserInput
_EOF_
		      }

    if [ $# -eq 1 ] ; then $1; lpReturn; fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimsPkgUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimsPkgUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Perhaps add a -f forceMode, which would overwrite
   existing vars.
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    function iimParamFuncsInvoke {
	EH_assert [[ $# -eq 0 ]]
	declare iimParamFuncsList=$( declare -F | grep iimsPkg_ | sed -e s/"declare -f "// | cut -d= -f1 )
	for thisFunc in ${iimParamFuncsList} ; do
	    opDo ${thisFunc}
	done
    }
    
    iimParamFuncsInvoke

    local  fpNodeBase="./iimsIn/paramsFp"    

    opDo FN_dirCreatePathIfNotThere ${fpNodeBase}

    declare fpLeafParamName=""
    declare fpLeafParamValue=""    

    declare parsList=$( declare -t | sed -e s/"declare -At "// | grep iimsPkg_ | cut -d= -f1 )
    for thisParam in ${parsList} ; do
	fpLeafParamName=$(dictRead ${thisParam} "name")
	if [ -z "${fpLeafParamName}" ] ; then
	    EH_problem "Missing fpLeafParamName param=${thisParam}"
	    continue
	fi

	fpLeafParamDefault=$(dictRead ${thisParam} "default")
	if [ -z "${fpLeafParamDefault}" ] ; then
	    EH_problem "Missing fpLeafParamDefault param=${thisParam}"
	    continue
	fi
	
	fpLeafParamValue=$(dictRead ${thisParam} "value")
	if [ -z "${fpLeafParamValue}" ] ; then
	    EH_problem "Missing fpLeafParamValue param=${thisParam}"
	    continue
	fi

_CommentBegin_
** TODO First Try A Read, If That Fails, Do The Write
_CommentEnd_

#dictRead ${thisParam} "value"

#echo

#echo ZZ ${fpLeafParamValue}

#continue

        opDo fileParam_write "${fpNodeBase}" "${fpLeafParamName}" "${fpLeafParamValue}"


        ${thisParam} $(dictRead ${thisParam} "enums") | fileParam_writeEnums "${fpNodeBase}" "${fpLeafParamName}"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "description" "$(dictRead ${thisParam} description)"

        opDo fileParam_writeAttr ${fpNodeBase} "${fpLeafParamName}" "default" "$(dictRead ${thisParam} default)"	
	
    done

    lpReturn
}	



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Grouped Panels*
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_groupedPanel  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_groupedPanel    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_groupedPanel {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Subject it to forcemode
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    #ANT_cooked "KKKK"
    if [ ! -d /libre/var/bisos/iimGroupedPanels/${G_myName} ] ; then
	#ANT_cooked "KKKK"
	opDo vis_groupedPanelPreps
	#ANT_cooked "KKKK"
    fi

    #ANT_cooked "KKKK"
    emlVisit -v -n showRun -i gotoPanel "/libre/var/bisos/iimGroupedPanels/${G_myName}/Panel.org"

    lpReturn
}	

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_groupedPanelPreps    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_groupedPanelPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Steps:
***  Create Dir If /libre/var/bisos/iimGroupedPanels/${G_myName} does not exist
***  In that BaseDir, create a grouped IIM panel
***  In BaseDir, create ./iimsIn/params and ./iimsIn/commonControl
***  Go to BaseDir/panel.org
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    #if [ ! -d /libre/var/bisos/iimGroupedPanels/${G_myName} ] ; then

    echo ZZZZ
   
    opDo bxtStartIimBash.sh -v -n showRun -i iimGrouped /libre/var/bisos/iimGroupedPanels/${G_myName} ${G_myName}

    ANT_cooked "KKKK"
    #fi
    echo LLL
    
    inBaseDirDo /libre/var/bisos/iimGroupedPanels/${G_myName} vis_iimsInParamsUpdate

    echo JJJ
    
    inBaseDirDo /libre/var/bisos/iimGroupedPanels/${G_myName} vis_iimsInControlsUpdate


    inBaseDirDo /libre/var/bisos/iimGroupedPanels/${G_myName} vis_iimsLineModeUpdate
    

    #inBaseDirDo /libre/var/bisos/iimGroupedPanels/${G_myName} bx-dblock -i dblockUpdateFiles ./Panel.org

    echo MMMM

    lpReturn
}	

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_groupedPanel    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_groupedPanel {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Subject it to forcemode
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]
    #ANT_cooked "KKKK"
    if [ ! -d /libre/var/bisos/iimGroupedPanels/${G_myName} ] ; then
	#ANT_cooked "KKKK"
	opDo vis_groupedPanelPreps
	#ANT_cooked "KKKK"
    fi

    #ANT_cooked "KKKK"
    emlVisit -v -n showRun -i gotoPanel "/libre/var/bisos/iimGroupedPanels/${G_myName}/Panel.org"

    lpReturn
}	


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Player Interface*
_CommentEnd_




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgedPanel    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgedPanel {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Subject it to forcemode
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]

    typeset iimBaseDir="./var/${G_myName}"
    
    if [ ! -d "${iimBaseDir}" ] ; then
	opDo mkdir -p "${iimBaseDir}"
    fi
    
    if [ ! -d "${iimBaseDir}"/iimsIn/commonControlFp ] ; then
	opDo vis_bxtPanelPreps
    fi

    #emlVisit -v -n showRun -i gotoPanel "./Panel.org"

    lpReturn
}	

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimsPkgPreps    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimsPkgPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Steps:
*** Usually Invoked through iimProc.sh
***  Consider . as iimBaseDir
***  In that BaseDir, create a grouped IIM panel
***  In BaseDir, create ./iimsIn/params and ./iimsIn/commonControl
***  Go to BaseDir/panel.org
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]

    typeset iimScriptPrefix=$( FN_prefix ${G_myName} )
    typeset panelFileName="${iimScriptPrefix}-Panel.org"
    
    if [ "${iimScriptPrefix}" == "iimsProc" ] ; then
	panelFileName="Panel.org"
    fi

    typeset iimBaseDir="./var/iimsPkg"
    
    if [ ! -d "${iimBaseDir}" ] ; then
	opDo mkdir -p "${iimBaseDir}"
    fi
	
    inBaseDirDo "${iimBaseDir}" vis_iimsPkgUpdate

    FN_fileSafeKeep  ${panelFileName}

    opDo eval cat /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/common/beginPanel.org \| sed -e "s:@iimName@:${G_myName}:g" \> ${panelFileName}

    opDo  bx-dblock -i dblockUpdateFiles ${panelFileName}

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgedPanelPreps    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgedPanelPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Steps:
***  Consider . as iimBaseDir
***  In that BaseDir, create a grouped IIM panel
***  In BaseDir, create ./iimsIn/params and ./iimsIn/commonControl
***  Go to BaseDir/panel.org
_EOF_
    }
    
    EH_assert [[ $# -eq 0 ]]

    typeset iimScriptPrefix=$( FN_prefix ${G_myName} )
    typeset panelFileName="${iimScriptPrefix}-Panel.org"

    typeset iimBaseDir="./var/${G_myName}"
    
    if [ ! -d "${iimBaseDir}" ] ; then
	opDo mkdir -p "${iimBaseDir}"
    fi
	
    inBaseDirDo  "${iimBaseDir}" vis_iimsInParamsUpdate

    inBaseDirDo  "${iimBaseDir}" vis_iimsInControlsUpdate

    inBaseDirDo  "${iimBaseDir}" vis_iimsLineModeUpdate

    FN_fileSafeKeep  ${panelFileName}

    opDo eval cat /libre/ByStar/InitialTemplates/begin/templates/purposed/iims/bash/common/beginPanel.org \| sed -e "s:@iimName@:${G_myName}:g" \> ${panelFileName}

    opDo  bx-dblock -i dblockUpdateFiles ${panelFileName}
    #opDo bx-dblock -i dblockUpdateFiles ./Panel.org

    lpReturn
}	

typeset -A IimGroupingType=(  # One Of Choice
    [pkged]=pkged          # eg basicPkg, toiimPkg, empnaPkg
    [grouped]=grouped      # eg BISOS
    [scattered]=scattered  # eg MailingProc
    [unitary]=unitary      # A Single IIM
    [unitary]=standalone      # Libs included, any linux runable, used for bootstrapping
    [other]=other
    [none]=unset
)

typeset -A IimCmndParts=(
    [common]=common
    [param]=param 
    [target]=target
    [bxo]=bxo
    [bxsrf]=bxsrf
    [none]=unset
)


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *IICM Player Info*
_CommentEnd_


#
# DEFAULTS
#

# set-u fix
G_myPanel=$(FN_prefix ${G_myName})-Panel.org

G_iimGroupingType=${IimGroupingType[grouped]}

G_iimCmndParts="
${IimCmndParts[common]}
"

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimGroupingType    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimGroupingType {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    #EH_assert [[ $# -eq 0 ]]

    echo ${G_iimGroupingType}

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_iimCmndPartList [[elisp:(org-cycle)][| ]]
####+BEGIN: bx:dblock:global:run-result :command "dsnGet.sh -i iimCmndPartList"
/bin/bash: dsnGet.sh: command not found

####+END:
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimCmndPartList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimCmndPartList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    #EH_assert [[ $# -eq 0 ]]

    echo ${G_iimCmndParts}

    lpReturn
}	

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF-X     ::  vis_iimCmndPartIncludes    [[elisp:(org-cycle)][| ]]
####+BEGIN: bx:dblock:global:run-result :command "iimName.sh  -i iif"
/bin/bash: iimName.sh: command not found

####+END:
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_iimCmndPartIncludes    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_iimCmndPartIncludes {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset thisPart=""
    typeset retVal=1

    for thisPart in "$@" ; do
	#echo "${thisPart}"
	
	if IS_inList "${thisPart}" "${G_iimCmndParts}" ; then
	    lpReturn 0
	else
	    continue
	fi
    done
    lpReturn ${retVal}
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
