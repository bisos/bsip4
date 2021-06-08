#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${box_lib:-}" ] ; then
    box_lib="LOADED" ; TM_trace 7 "box_lib :: Loading Library -- /bisos/bsip/bin/box_lib.sh"
else
    TM_trace 7 "box_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/box_lib.sh" ; return
fi
####+END:


function vis_runningInAndroidContainer {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]

   lpDo vis_userAcctExists android-root
   local retVal=$?
   
   if [ "${G_verbose}" == "verbose" ] ; then
       if [ ${retVal} == 0 ] ; then
	   ANT_raw "Running In An Android Container"
       else
	   ANT_raw "Not Running In An Android Container"
       fi
   fi
   
   lpReturn ${retVal}
}



function vis_thisBoxUUID {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		      }

   EH_assert [[ $# -eq 0 ]]
    
   # if not physical, exit

   if vis_runningInAndroidContainer ; then
       l3Admin.sh -i givenInterfaceGetMacAddr eth0
   else
       sudo dmidecode -s system-uuid
   fi
   lpReturn
}
