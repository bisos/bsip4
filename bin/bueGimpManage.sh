#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" :partof "generic" :copyleft "none"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: bueGimpManage.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
# }}} DBLOCK-top-of-file
####+END:

# {{{ Authors:
# Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
# }}} 

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/bueGimpManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ Help/Info

function vis_help {
    cat  << _EOF_
_EOF_
}

# }}}

# {{{ Prefaces

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh

# PRE parameters

function G_postParamHook {
     return 0
}

# }}}

# {{{ Examples

function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
---- BUE Initialize ----
${G_myName} ${extraInfo} -i dotGimpByStar   # Adds scheme files to .gimp
---- BASIC ----
cat ./inFilesList | ${G_myName} ${extraInfo} -i batch-scale-cadre-to 1000 750
echo test7.jpg | ${G_myName} ${extraInfo} -i batch-scale-cadre-to 1000 750 
---- BASIC Scale Width-To ----
cat ./inFilesList | ${G_myName} ${extraInfo} -i batch-scale-width-to 200
echo test7.jpg | ${G_myName} ${extraInfo} -i batch-scale-width-to 200
---- BASIC Scale Height-To ----
cat ./inFilesList | ${G_myName} ${extraInfo} -i batch-scale-height-to 200
echo test7.jpg | ${G_myName} ${extraInfo} -i batch-scale-height-to 200
---- BASIC Scale Height-To ----
cat ./inFilesList | ${G_myName} ${extraInfo} -i scaleReplaceHeightTo 200
echo test7.jpg | ${G_myName} ${extraInfo} -i scaleReplaceHeightTo 200
---- BASIC ----
cat ./inFilesList | ${G_myName} ${extraInfo} -i batch-scale-cadre-to-1000x750 
echo test7.jpg | ${G_myName} ${extraInfo} -i batch-scale-cadre-to-1000x750 
----
cat ./inFilesList | ${G_myName} ${extraInfo} -i batch-scale-cadre-to-100x75 
echo test7.jpg | ${G_myName} ${extraInfo} -i batch-scale-cadre-to-100x75
--- Rotate pnm files
mogrify -rotate 90 xx
convert -rotate 90 image-0005.pnm  image-0005-rotated.pnm
--- Reduce density -- dpi
mogrify -resize 25% t2.pnm
convert -resize 25% t1.pnm t3.pnm
convert -resample 25% t1.pnm t3.pnm
_EOF_
}


noArgsHook() {
  vis_examples
}

# }}}


function vis_dotGimpByStar {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]
    
    function myGimpBaseDir {
	# ls -d ~/.gimp-2.*
	ls -d ~/.config/GIMP/2.*
    }

    thisGimpBaseDir=$( myGimpBaseDir )

    local bisosAppsGimpBase="/bisos/apps/gimp"

    # /bisos/apps/gimp/scripts/idPhoto.scm
    opDo ln -s ${bisosAppsGimpBase}/scripts/bx-cadreImageWidthHeight.scm  "${thisGimpBaseDir}"/scripts/bx-cadreImageWidthHeight.scm
    opDo ln -s ${bisosAppsGimpBase}/scripts/bx-resizeImageToWidth.scm  "${thisGimpBaseDir}"/scripts/bx-resizeImageToWidth.scm
    opDo ln -s ${bisosAppsGimpBase}/scripts/bx-resizeImageToHeight.scm  "${thisGimpBaseDir}"/scripts/bx-resizeImageToHeight.scm
    opDo ln -s ${bisosAppsGimpBase}/scripts/idPhoto.scm  "${thisGimpBaseDir}"/scripts/idPhoto.scm

    lpReturn
}


function vis_batch-scale-cadre-to {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=inWidth  $2=inHeight
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 2 ]]

    typeset inWidth="${1}"
    typeset inHeight="${2}"

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

   if [ "${inFilesList}_" == "_" ] ; then
       ANT_raw "No Pictures To Upload"
       lpReturn 101
   fi

   for thisFile in ${inFilesList}; do
       if [ ! -f "${thisFile}" ] ; then
	   EH_problem "Missing ${thisFile} -- Skipped"
	   lpReturn 101
       fi

       typeset thisPrefix=$( FN_prefix ${thisFile} )
       typeset thisExtension=$( FN_extension ${thisFile} )
       typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
       typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

       #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

       typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

       typeset thisDestFile="${thisPathPrefix}"-"${inWidth}"x"${inHeight}"."${thisExtension}"

       opDo cp -p "${thisFile}" "${thisDestFile}"
    
       opDo eval gimp -i -b  "'(bx-batch-scale-cadre-to-width-height \"${thisDestFile}\" ${inWidth} ${inHeight})'" -b  "'(gimp-quit 0)'"

       opDo echo "${thisDestFile}"
   done

   lpReturn
}


function vis_batch-scale-cadre-to-100x75 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    opDo vis_batch-scale-cadre-to 100 75

    lpReturn
}



function vis_batch-scale-cadre-to-1000x750 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    opDo vis_batch-scale-cadre-to 1000 750

    lpReturn
}


function vis_batch-scale-width-to-200 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    opDo vis_batch-scale-width-to 200

    lpReturn
}


function vis_batch-scale-width-to {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=inWidth
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 1 ]]

    typeset inWidth="${1}"

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

   if [ "${inFilesList}_" == "_" ] ; then
       ANT_raw "No Pictures To Upload"
       lpReturn 101
   fi

   for thisFile in ${inFilesList}; do
       if [ ! -f "${thisFile}" ] ; then
	   EH_problem "Missing ${thisFile} -- Skipped"
	   lpReturn 101
       fi

       typeset thisPrefix=$( FN_prefix ${thisFile} )
       typeset thisExtension=$( FN_extension ${thisFile} )
       typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
       typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

       #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

       typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

       typeset thisDestFile="${thisPathPrefix}"-"w=${inWidth}"."${thisExtension}"

       opDo cp -p "${thisFile}" "${thisDestFile}"
    
       opDo eval gimp -i -b  "'(bx-batch-scale-width-to \"${thisDestFile}\" ${inWidth})'" -b  "'(gimp-quit 0)'"

       opDo echo "${thisDestFile}"
   done

   lpReturn
}



function vis_batch-scale-height-to {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=inHeight
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 1 ]]

    typeset inHeight="${1}"

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

   if [ "${inFilesList}_" == "_" ] ; then
       ANT_raw "No Pictures To Upload"
       lpReturn 101
   fi

   for thisFile in ${inFilesList}; do
       if [ ! -f "${thisFile}" ] ; then
	   EH_problem "Missing ${thisFile} -- Skipped"
	   lpReturn 101
       fi

       typeset thisPrefix=$( FN_prefix ${thisFile} )
       typeset thisExtension=$( FN_extension ${thisFile} )
       typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
       typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

       #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

       typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

       typeset thisDestFile="${thisPathPrefix}"-h="${inHeight}"."${thisExtension}"

       opDo cp -p "${thisFile}" "${thisDestFile}"
    
       opDo eval gimp -i -b  "'(bx-batch-scale-height-to \"${thisDestFile}\" ${inHeight})'" -b  "'(gimp-quit 0)'"

       opDo echo "${thisDestFile}"
   done

   lpReturn
}



function vis_scaleReplaceHeightTo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1=inHeight
Reads from stdin
Each line of the input is expected to be the image file in full resolution.
_EOF_
    }

    EH_assert [[ $# -eq 1 ]]

    typeset inHeight="${1}"

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

   if [ "${inFilesList}_" == "_" ] ; then
       ANT_raw "No Pictures To Upload"
       lpReturn 101
   fi

   for thisFile in ${inFilesList}; do
       if [ ! -f "${thisFile}" ] ; then
	   EH_problem "Missing ${thisFile} -- Skipped"
	   lpReturn 101
       fi

       typeset thisSavedFile="${thisFile}.orig"

       if [ ! -f "${thisSavedFile}" ] ; then
	   opDo cp -p "${thisFile}" "${thisSavedFile}"
       fi

       opDo eval gimp -i -b  "'(bx-batch-scale-height-to \"${thisFile}\" ${inHeight})'" -b  "'(gimp-quit 0)'"

       opDo echo "${thisFile}"
   done

   lpReturn
}




####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:
