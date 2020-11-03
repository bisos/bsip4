#!/bin/bash

#
# RCS Revision: $Id: ocp-lib.sh,v 1.5 2020-01-21 21:33:43 lsipusr Exp $
#

# NOTE WELL:  Order of files is important

# Entering here, opConfig.sh has been sourced, but nothing else

. ${opBase}/bin/opBases.sh

# Now opBases variables are also available,

. ${opLibBase}/opOutput.sh
. ${opLibBase}/ocp-lineNu.sh

#. ${opLibBase}/ocp-tests.sh

. ${opLibBase}/printBash.sh 

. ${opLibBase}/ocp-general.sh

# ./opRunEnvLib.sh 
. ${opLibBase}/opRunEnvLib.sh

opRunEnvGet
opRunUserGet

. ${opBinBase}/opBasesSite.sh

# ./autoItemsSelect.sh
# ./itemsLib.sh 
. ${opLibBase}/itemsLib.sh

# ./opWrappersLib.sh 
. ${opLibBase}/opWrappersLib.sh

# NOTYET, this should go into seedAction.sh
# ./visLib.sh
. ${opLibBase}/doLib.sh

. ${opLibBase}/opDoLib.sh

. ${opLibBase}/ocp-sup.sh

. ${opBinBase}/fileParam_lib.sh

. ${opLibBase}/visLib.sh

. ${opBinBase}/bleeLib.sh

# if [ -z ${G_emacsServerPid} ] ; then
#     export G_emacsServerPid=$(vis_emacsServerPidFromIcmLib)
# fi

