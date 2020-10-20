#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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

* This is a starting point for Merging opMachines.sh and bystarBoxAdmin.sh -- IMPORTANT --
** Use site/assign/BOX/box0059/cpf_box0059.sh
** Get rid of items file -- Get rid of subjectAction
** Scope of this is Physiacl Machines -- Not Virtual Machines -- unique id comes from dmidecode -s system-uuid and being physical
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh


. ${opBinBase}/bxo_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/bisosCurrents_lib.sh


setBasicItemsFiles opMachineItems

typeset -t opSiteName="nedaPlus"


# PRE parameters
typeset -t siteName="MANDATORY"


function G_postParamHook {
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    lpCurrentsGet
}


function G_postParamHook {
     return 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"
    #typeset oneId=`ifconfig eth0 | grep HWaddr | cut -c 39-55`
    local oneId=$( sudo dmidecode -s system-uuid )

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "ITEM / MODEL CREATION" )
${G_myName} ${extraInfo} -s all -a summaryID | grep -i box0
${G_myName} ${extraInfo} -i itemBoxGen 0001
${G_myName} ${extraInfo} -i itemBoxGen 0001 >> /opt/public/osmt/siteControl/nedaPlus/opMachineItems.site
${G_myName} ${extraInfo} -i getNextBoxNu 
${G_myName} ${extraInfo} -i thisBoxStdout
${G_myName} ${extraInfo} -i thisBoxAdd
$( examplesSeperatorChapter "INFORMATION" )
${G_myName} ${extraInfo} -i myUniqueId
${G_myName} ${extraInfo} -i myBoxName
${G_myName} ${extraInfo} -i givenIdFindBoxName ${oneId}
${G_myName} ${extraInfo} -s all -a summaryID
${G_myName} ${extraInfo} -p opSiteName=nedaPlus -s all -a summaryBoxName
${G_myName} ${extraInfo} -p opSiteName=nedaPlus -s all -a summaryBoxName | a2ps -s 1 -r --font-size=12
$( examplesSeperatorChapter "Misc" )
${G_myName} ${extraInfo} -i arpScanReport
 arp-scan eth0 192.168.0.1/24 2> /dev/null | cut -f 2 | grep '^..:..:' | xargs ${G_myName} ${extraInfo} -i givenIdFindBoxName
sudo dmidecode -s system-uuid
$( examplesSeperatorChapter "From bystarBoxAdmin.sh -- To be merged with opMachines.sh" )
$( examplesSeperatorSection "BOX -- Locate/Create" )
opMachines.sh -h -v -n showRun -i myBoxName
opMachines.sh -i thisBoxAdd
${G_myName} ${extraInfo} -p siteName=${opRunSiteName} -p hostType=bacs -i boxInfoBaseLocate
$( examplesSeperatorSection "InfoBase UPDATE (create Next Entry For This Box" )
${G_myName} ${extraInfo} -p type=netbook -p make=ASUS -p model=eeepc -i thisBoxInfoBaseUpdate 
${G_myName} ${extraInfo} -i thisBoxParamsShow
_EOF_
}


noArgsHook() {
  vis_examples
}

function vis_getNextBoxNu {
  EH_assert [[ $# -eq 0 ]]

  lastBoxLine=$( ${G_myName} -s all -a summaryID 2> /dev/null | grep -i box0 | sort | tail -1 | cut -d ' ' -f 1 )
  #echo "lastBoxLine=${lastBoxLine}" 

  if [ "${lastBoxLine}_" == "_" ] ; then
      EH_problem "Missing lastBoxLine"
      return 101
  fi

  lastNuStr=${lastBoxLine##box}

  nextNu=$( expr $lastNuStr +  1 )

  #echo $nextNu

  nextNuStr=$( printf "%04d" $nextNu )

  echo ${nextNuStr}
} 


function vis_itemBoxGen {
   EH_assert [[ $# -eq 1 ]]
   boxSeqNu=$1

   typeset thisId=$( vis_myUniqueId )

  dateTag=`date +%y%m%d%H%M%S`

  cat  << _EOF_

item_mach_box${boxSeqNu}() {
  # Machine Generated on ${dateTag}
  machItemPre

  iv_machineName="box${boxSeqNu}"
  iv_machineType=""
  iv_machineInfoAssetLocation=""
  iv_machineUniqId="${thisId}" 
  iv_machineInternalDisk=""
  iv_machineCpu="" # from boot time or use dmesg
  iv_machinePhysicalMemory=""
 
  machItemPost
}

_EOF_
}


function vis_thisBoxStdout {
  EH_assert [[ $# -eq 0 ]]

  boxNameEqLine=$( opMachines.sh -i myBoxName 2> /dev/null | grep UnAssigned ) 

  if [ "${boxNameEqLine}_" == "_" ] ; then
      EH_problem "Machine Already Assigned"
      opDo opMachines.sh -i myBoxName 1>&2
      return 101
  fi

  if  ! nextBoxNu=$( vis_getNextBoxNu ) ; then 
      EH_problem "vis_getNextBoxNu failed"
      return 101
  fi
  
  vis_itemBoxGen  ${nextBoxNu}
 } 




function vis_thisBoxAdd {
  EH_assert [[ $# -eq 0 ]]

  opMachinesItemFile="/opt/public/osmt/siteControl/nedaPlus/opMachineItems.site"

  dateTag=`date +%y%m%d%H%M%S`
  FN_fileSafeCopy ${opMachinesItemFile} ${opMachinesItemFile}.${dateTag}

  vis_thisBoxStdout  >> ${opMachinesItemFile} 

  opDo ls -l ${opMachinesItemFile}

} 


function vis_arpScanReport {
  EH_assert [[ $# -eq 0 ]]
  tmpFileNameFull=/tmp/$$.arpScanReportFull

  arp-scan  --localnet 2> /dev/null | grep '..:..:..:..:..:..' > ${tmpFileNameFull} 

  macAddrList=$(  cut -f 2  ${tmpFileNameFull} )


  for thisId in ${macAddrList} ; do
      boxName=$( vis_givenIdFindBoxName ${thisId} )
      scanInfo=$( grep ${thisId} ${tmpFileNameFull} )

      echo ${scanInfo} -- BoxName=${boxName} 
  done
  /bin/rm ${tmpFileNameFull}
} 


function vis_givenIdFindBoxName {
#set -x
  EH_assert [[ $# -gt 0 ]]

  typeset thisId
  for thisId in ${*} ; do
  typeset machList=`${G_myName} -i ls`

  retVal=1
  typeset oneMach
  for oneMach in ${machList} ; do
    subject="${oneMach}"
    #ANT_raw "subject=${subject}"
    #subjectValidatePrepare 
    subjectValidatePrepare 2> /dev/null
    cononThisId=$( STR_toLower ${thisId} )
    cononMachineUniqId=$( STR_toLower ${iv_machineUniqId} )
    if [[ "${cononThisId}_" == "${cononMachineUniqId}_" ]] ; then
      #print "BoxName=${oneMach#mach_}"
      print "${oneMach#mach_}"
      return 0
    fi
  done
  if [ ${retVal} != 0 ] ; then
      #print "BoxName=UnAssigned"
      print "UnAssigned"
      retVal=1
  fi
  done
  return ${retVal}

}


function vis_myUniqueId {

    # if not physical, exit
    
    sudo dmidecode -s system-uuid

    lpReturn

    typeset firstNetIfDev=$( ls /sys/class/net/ | grep -v lo | head -1 )

    if [ -z ${firstNetIfDev} ] ; then
	EH_problem "Missing interface in /sys/class/net/"
	lpReturn 1
    fi

    cat /sys/class/net/${firstNetIfDev}/address
    lpReturn
}



function vis_myUniqueIdOld {

 case ${opRunOsType} in
    "Linux")
       eth0Results=$( ifconfig eth0 | grep HWaddr | cut -c 39-55 )
       if [ "${eth0Results}" != "" ] ; then
	   echo ${eth0Results} 
	   lpReturn
       fi
       eth1Results=$( ifconfig eth1 | grep HWaddr | cut -c 39-55 )
       if [ "${eth1Results}" != "" ] ; then
	   echo ${eth1Results}
	   lpReturn
       fi
       wlan0Results=$( ifconfig wlan0 | grep HWaddr | cut -c 39-55 )
       if [ "${wlan0Results}" != "" ] ; then
	   echo ${wlan0Results}
	   lpReturn
       fi
       EH_problem "Missing eth0 or eth1 or wlan0"
       lpReturn 1
       
       ;;
    "SunOS")
       hostid
       ;;
    *)
       print "Unverifiable, unknown OS type."
       ;;
  esac

}

function vis_myBoxName {

  thisId=$( vis_myUniqueId )
  boxName=$( vis_givenIdFindBoxName ${thisId} ) 
   
  echo "BoxName=${boxName}"
}

firstSubjectHook() {
  case ${action} in
    "summaryID")
      f2="Box Name"
      f3="Unique ID"
      print "$f2 $f3"
      echo "----------------------------------------------------------------"
      ;;
    "summaryBoxName")
      f2="Box Name"
      f3="OSMT ID"
      f4="Unique ID"
      f5="Location"
      typeset f6="Machine Type"
      
      timeStamp=`date`
      print "opMachines.sh summaryBoxName opSiteName=${opSiteName} ${timeStamp}"
      echo "================================================================================="
      print "$f2 $f3 $f4 $f5 $f6"
      echo "---------------------------------------------------------------------------------"
      ;;
    *)
       return
       ;;
  esac
}

lastSubjectHook() {
  case ${action} in
    "summaryID"|"summaryBoxName")
       echo "------------ End Summary ----------------------------"
       ;;
    *)
       return
       ;;
  esac


}


function do_summaryID {

   subjectValidatePrepare
   #typeset -L25 box_name=${subject#mach_}
   #typeset -L20 machineUniqId=${iv_machineUniqId}
   box_name=${subject#mach_}
   machineUniqId=${iv_machineUniqId}

  print "${box_name} ${machineUniqId}"

}

function do_summaryBoxName {

   subjectValidatePrepare
   box_name=${subject#mach_}
   osmtId=`opHosts.sh -p opSiteName=${opSiteName} -p boxName=${box_name} -i givenBoxFindOsmtId`
   machineInfoAssetLocation=${iv_machineInfoAssetLocation}
   machineUniqId=${iv_machineUniqId}
   typeset iv_machineType=${iv_machineType}

  print "${box_name} ${osmtId} ${machineUniqId} ${machineInfoAssetLocation} ${iv_machineType}"

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] Additional Info                        :: /* Stuff From bystarBoxAdmin.sh */ |
_CommentEnd_

function vis_thisBoxInfoBaseUpdate {

    EH_assert [[ $# -eq 0 ]]
    #EH_assert [[ "${siteName}_" != "MANDATORY_" ]]
    #EH_assert [[ "${hostType}_" != "MANDATORY_" ]]    # bisp, bacs

    # BoxName detection/assignment
    

  typeset baseDir="/libre/ByStar/InfoBase/BOX/${opRunSiteName}/${BoxName}"
  
  if [[ ! -d ${baseDir} ]] ; then 
      opDoExit mkdir -p ${baseDir}
  fi

  opDoExit cd ${baseDir}
  

  thisDir=${baseDir}

  echo ${boxName} > ${thisDir}/boxName:mr

  echo "${type}" > ${thisDir}/boxType:mr

  echo "${make}" > ${thisDir}/boxMake:mr

  echo "${model}" > ${thisDir}/boxModel:mr

  #echo "${emacsFont}" > ${thisDir}/emacsFont:mr


  opDo chmod -R g+w ${thisDir}
  opDo ls -l ${thisDir}
}


function vis_thisBoxParamsShow {
  typeset fileParamsBaseDir="/libre/ByStar/InfoBase/BOX/${opRunSiteName}/${BoxName}"

    opDo fileParamsCodeGenToFile  ${fileParamsBaseDir}
    opDo fileParamsLoadVarsFromBaseDir  ${fileParamsBaseDir}

    opDo fileParamsShow ${fileParamsBaseDir}
}


function vis_myHostBaseDir {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${siteName}_" != "MANDATORY_" ]]
    
    vis_boxInfoBaseLocate
}

function vis_boxInfoBaseLocate {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${siteName}_" != "MANDATORY_" ]]
    
    thisId=$( opMachines.sh -i myUniqueId )
    boxName=$( opMachines.sh -i givenIdFindBoxName ${thisId} ) 

    case ${boxName} in
	"UnAssigned")
	    EH_problem "Missing BoxName=${boxName}"
	    return 101
	    ;;
	"")
	    EH_problem ""
	    return 101
	    ;;
	*)
	    doNothing
	    ;;
    esac

    typeset baseDir="/libre/ByStar/InfoBase/HOST/${siteName}"
    EH_assert [[ -d ${baseDir} ]]

    opDoExit cd ${baseDir}

    myHostBaseDirList=""
    
    hostTypeList=$( ls | grep -v CVS | sort )
    for thisDir in ${hostTypeList} ; do
	if [ -f ${thisDir}/BoxName:mr ] ; then
	    subjectBoxName=$( cat ${thisDir}/BoxName:mr ) 
	    if [ ${subjectBoxName}_ == "${boxName}_" ] ; then
		ANT_raw "Found: BoxName=${boxName} ${baseDir}/${thisDir}"
		if [ -f ${thisDir}/HostStatus:or ] ; then
	           HostStatus=$( cat ${thisDir}/HostStatus:or ) 
	           if [ "inactive_" != "${HostStatus}_" ] ; then
 		       myHostBaseDirList="${myHostBaseDirList} ${baseDir}/${thisDir}"
  		   else
		       ANT_raw "inactive: BoxName=${boxName} ${baseDir}/${thisDir}"
  		   fi
		else
		    myHostBaseDirList="${myHostBaseDirList} ${baseDir}/${thisDir}"
	        fi
	    else
		#ANT_raw "${subjectBoxName} -- ${thisDir}/BoxName:mr -- Not Us, skipped"
		doNothing
	    fi
	else
	    EH_problem "Missing ${baseDir}/${thisDir}/BoxName:mr"
	    #return 101
	fi
    done

    if [ "${myHostBaseDirList}_" == "_" ] ; then
	ANT_raw "boxName=${boxName} not found in ${baseDir}"
	return 101
    fi

    for thisOne in ${myHostBaseDirList} ; do
	echo ${thisOne}
    done

    set ${myHostBaseDirList}

    if [ $# != 1 ] ; then 
    	ANT_raw "boxName=${boxName} found $# times:  ${myHostBaseDirList}"
	return 101
    fi

}

