#!/bin/osmtKsh

#
# RCS Revision: $Id: opOutput.sh,v 1.3 2017-02-09 23:51:32 lsipusr Exp $
#

#
# Author: Mohsen Banan.
# 
#

#
# ANT_   Announce/Note Terse
# ANV_   Announce/Note Verbose
# 
# stdOutput  echo/print to stdout
#

if [[ "${BASH_VERSION}X" != "X" ]] ; then
    alias ANT_cooked='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; ant_cooked'
    alias ANV_cooked='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; anv_cooked'
else
    alias ANT_cooked='tm_fileName=$0; tm_lineNo=$LINENO; ant_cooked'
    alias ANV_cooked='tm_fileName=$0; tm_lineNo=$LINENO; anv_cooked'
fi


alias stdOutput='print -r --'

function ANT_raw {
    #print -u2 -r -- "$*"
    printf --  1>&2  "$*\n"         
    #( printf  "$*\n" ) > /dev/stdout
}

function ANV_raw {
  if [[ "${G_verbose}_" == "verbose_" ]] ; then
      #print -u2 -r -- "$*"
      printf  1>&2  "$*\n"     
  fi
}

function ant_cooked {
    #print -u2 -r -- "NOTE,${G_myName},${tm_fileName},${tm_lineNo}: $*"
    if [ -z "${G_recordMode}" ] ; then
        printf  1>&2 "NOTE,${G_myName},${tm_fileName},${tm_lineNo}: $*\n"  
    else
        printf  1>&2 "** NOTE,${G_myName},${tm_fileName},${tm_lineNo}: $*\n"  
    fi
}

function anv_cooked {
  if [[ "${G_verbose}_" == "verbose_" ]] ; then
      #print -u2 -r -- "NOTE,${G_myName},${tm_fileName},${tm_lineNo}: $*"
    if [ -z "${G_recordMode}" ] ; then
        printf  1>&2 "NOTE,${G_myName},${tm_fileName},${tm_lineNo}: $*\n"  
    else
        printf  1>&2 "** [[file:${G_myFullName}::${tm_lineNo}][inBaseDirDo]] $*\n"  
    fi
  fi
}




