#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${box_lib:-}" ] ; then
    box_lib="LOADED" ; TM_trace 7 "box_lib :: Loading Library -- /bisos/bsip/bin/box_lib.sh"
else
    TM_trace 7 "box_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/box_lib.sh" ; return
fi
####+END:


function vis_kvmRequirementsP {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
                      }
   EH_assert [[ $# -eq 0 ]]

   local result
   local curUser=$( id -un)

   function missingGroupP {
       local subjectGroup="$1"
       local retVal
       if id -nG "${curUser}" | grep -qw "${subjectGroup}"; then
           result=0
           retVal=1
       else
           EH_problem "${curUser} does not belong to ${subjectGroup}"
           result=1
           retVal=0
       fi
       lpReturn ${retVal}
   }
   
   if missingGroupP "kvm"  ; then
       return ${result}
   fi

   if missingGroupP "libvirt"  ; then
       return ${result}
   fi

   local nuOfVirtCpus=$(lpDo echo $( lpDo vis_nuOfVirtCpus ))
   
   if [ "${nuOfVirtCpus}" == "0" ] ; then
      EH_problem "BIOS does not Support Virtualization"
      result=2
   fi 

   if [ "${result}" == "0" ] ; then
       ANT_raw "KVM Pre-Requisits Are In Place"
   else
       EH_Oops ""
   fi
   
   lpReturn ${result}
}

function vis_nuOfVirtCpus {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    lpDo eval "egrep -c '(vmx|svm)' /proc/cpuinfo"
}
