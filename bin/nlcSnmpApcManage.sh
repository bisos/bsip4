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


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectAction.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectAction.sh]] |
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/nlcSnmpApcManage.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectAction.sh -l $0 "$@"
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


vis_help () {
  cat  << _EOF_


This is nlcSnmpApcManage.sh 
the middle layer of a 3 layers models.

It uses lcaSnmpManage.sh and 
is used by siteApcManage.sh (eg /private/site/bin/nedaApcManage.sh)
                    
For outdoor lights, sunset and sunrise are calculated with "at" repeatedly.

The following are abstracted in this module.

  - The APC Object Identifiers
  - The Device as an item -s xxx
  - Collection of Devices as an itemFile -- -p itemFile=yyy

_EOF_
}


. ${opBinBase}/opAcctLib.sh

typeset -t itemFile=""

#setBasicItemsFiles lcaPloneDomainItems


#--------------------------------------------------------------------------
# These following OID values were obtained by:
#
# 1) installing the snmp/powernet.mib (from CD) in the
#    /usr/local/share/snmp/mibs directory
#
# 2) snmpwalk -v1 -cpublic <switchaddr> . > apc.walk
#
# 3) looking thru apc.walk to find what I was looking for
#
# 4) snmpwalk -v1 -cpublic -mall <switchaddr> <oid>
#
# 5) snmpwalk -v1 -cpublic -On <switchaddr> <oid>
#    to see the output in numberic OID form
#
# The reason they are here is to prevent having to have them installed.
#--------------------------------------------------------------------------

# this is: PowerNet-MIB::sPDUMasterState.0
snmpOid_MasterState=".1.3.6.1.4.1.318.1.1.4.2.2.0"

# this is: PowerNet-MIB::sPDUOutletCtlName
snmpOid_OutletNames=".1.3.6.1.4.1.318.1.1.4.4.2.1.4"

# this is: PowerNet-MIB::sPDUOutletCtl
snmpOid_OutletCtl=".1.3.6.1.4.1.318.1.1.4.4.2.1.3"

# these values are for On Off and Reboot
snmpAction_outletOn=1
snmpAction_outletOff=2
snmpAction_outletReboot=3         

function G_postParamHook {

  if [  "${itemFile}_" != "_" ] ; then
    ItemsFiles=${itemFile}
  fi

}

function vis_examples {
  typeset options="-h -v -n showRun"
  typeset oneItemFile="/dev/null"

  #${doLibExamples}
  cat  << _EOF_
EXAMPLES:
--- INFORMATION ---
${G_myName} -i attributions
${G_myName} -s all -a summary
--- Using BAP ---
${G_myName} ${options} -p itemFile=${oneItemFile} -s apcDevice_exampleDevice  -a probe
${G_myName} ${options} -s apcDevice_exampleDevice  -a probe
${G_myName} ${options} -p itemFile=${oneItemFile} -s apcDevice_exampleDevice  -a list
${G_myName} ${options} -s apcDevice_exampleDevice  -a list
${G_myName} ${options} -p itemFile=${oneItemFile} -s apcDevice_exampleDevice  -a on exampleOutlet
${G_myName} ${options} -p itemFile=${oneItemFile} -s exampleDevice  -a onNu 7
${G_myName} ${options} -s apcDevice_exampleDevice  -a onNu 7
${G_myName} ${options} -p itemFile=${oneItemFile} -s apcDevice_exampleDevice  -a off exampleOutlet
${G_myName} ${options} -s apcDevice_exampleDevice  -a offNu 7
${G_myName} ${options} -p itemFile=${oneItemFile} -s apcDevice_exampleDevice  -a reboot exampleOutlet
_EOF_
}


item_apcDevice_exampleDevice() {

    iv_apcDevice_name="grage"
    iv_apcDevice_ipAddr="192.168.0.61"

}



noSubjectHook() {
  return 0
}
 
noArgsHook() {
  vis_examples
}

function vis_info {
 cat  << _EOF_
Proprietary Component Adopted

American Power Components

Password Recovery
=====================================

- Use a Null Modem
- Setup that port as 2400 baud 8bit NP 
- Hit Enter a few times till you see user:
- Push the reset bitton
- After the green light (eth) comes back on 
- Enter User Name: apc  
- Enter passwd: apc

=======================================
SNMP Management:
community public read
community private write  
NOTYET: Tryout address 0.0.0.0

_EOF_
}


function do_summary {
  subjectValidatePrepare

  typeset -L15 v1=${iv_apcDevice_name}
  typeset -L30  v2=${iv_apcDevice_ipAddr}

  print "${v1}${v2}"
}


function do_probe {

    if [[ ! -z ${itemFile} ]] ; then . ${itemFile};  fi;

   subjectValidatePrepare

   opDo /usr/bin/snmpwalk -cpublic -v1 -Onq ${iv_apcDevice_ipAddr} ${snmpOid_OutletNames}
}

function do_list {

    subjectValidatePrepare

    opDo /usr/bin/snmpget -cpublic -v1 -Oqv ${iv_apcDevice_ipAddr} ${snmpOid_MasterState}
   
  }

function do_on {

  subjectValidatePrepare
}

function do_onNu {
   EH_assert [[ $# -eq 1 ]]

   outletNu=$1 

   subjectValidatePrepare

   opDo /usr/bin/snmpset -cprivate -v1 -Oqv ${iv_apcDevice_ipAddr} ${snmpOid_OutletCtl}.${outletNu} i ${snmpAction_outletOn}
}

function do_off {

  subjectValidatePrepare
}

function do_offNu {
   EH_assert [[ $# -eq 1 ]]

   outletNu=$1 

   subjectValidatePrepare

   opDo /usr/bin/snmpset -cprivate -v1 -Oqv ${iv_apcDevice_ipAddr} ${snmpOid_OutletCtl}.${outletNu} i ${snmpAction_outletOff}
}

function do_reboot {

  subjectValidatePrepare
}


function vis_attributions {
 cat  << _EOF_
#!/usr/bin/perl
#
# $Id: nlcPduApcSnmpManage.sh,v 1.1.1.1 2016-06-08 23:49:52 lsipusr Exp $

#*
#* Copyright 2003 John De Boskey <jwd(@)FreeBSD.org>
#*                David Quattlebaum <drq(@)rtp.FreeBSD.org>
#* All Rights Reserved.
#*
#* Redistribution and use in source and binary forms, with or without
#* modification, are permitted provided that the following conditions
#* are met:
#*
#* 1. Redistributions of source code must retain the above copyright
#*    notice, this list of conditions and the following disclaimer.
#* 2. Redistributions in binary form must reproduce the above copyright
#*    notice, this list of conditions and the following disclaimer in the
#*    documentation and/or other materials provided with the distribution.
#*
#* THIS SOFTWARE IS PROVIDED BY JOHN DE BOSKEY & DAVID QUATTLEBAUM 
#* ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
#* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
#* A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL JOHN DE BOSKEY
#* OR DAVID QUATTLEBAUM BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
#* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
#* TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
#* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
#* USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
#* DAMAGE.
#*
#
# control of APC MasterSwitch power outlet contollers
#
# Syntax: apcpwr list
#         apcpwr probe
#         apcpwr <node> (off|on|reboot)

_EOF_
}

