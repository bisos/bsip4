#!/bin/bash

#
# RCS Revision: $Id: ocp-general.sh,v 1.7 2019-08-08 21:46:01 lsipusr Exp $
#

#
# Description:
#

dateTag=`date +%y%m%d%H%M%S`

if [[ "${BASH_VERSION}X" != "X" ]] ; then
  shopt -s expand_aliases
  shopt -s extglob
  #shopt

  alias integer='typeset -i'
fi

if [[ "${BASH_VERSION}X" != "X" ]] ; then
    #echo BASH -- ${BASH_VERSION}
  alias OrderedArray='typeset -a'
  alias Array='typeset -a'
  alias ListFuncs='typeset -F | sed -e s/"declare -f "//' 
  alias TagVar='typeset -t'
  alias TagVarList='typeset -t | sed -e s/"declare -t "// | cut -d= -f1'
  alias IimParam='declare -t -g -A'
  
  #alias beIdempotent="eval \"if [[ -z \$${thisFuncName}_hasRun ]] ; then ${thisFuncName}_hasRun=true;  else  print -u2 ${thisFuncName}HasRun; return; fi;\""

  alias beIdempotent='eval "if [[ -z \$${thisFuncName}_hasRun ]] ; then ${thisFuncName}_hasRun=true;  else  print -u2 ${thisFuncName}HasRun_ReRunAvoided; return; fi;"'
  
elif [[ "${KSH_VERSION}X" != "X" ]] ; then
    # For mksh
  alias OrderedArray='typeset'
  alias Array='set -A'
  alias ListFuncs='typeset +f'
  alias TagVar='typeset -t'
  alias TagVarList='typeset +t'

elif [[ "${.sh.version}X" != "X" ]] ; then
  # for ksh93
  alias OrderedArray='typeset'
  alias Array='typeset -A'
  alias ListFuncs='typeset +f'
  alias TagVar='typeset -t'
  alias TagVarList='typeset +t'
 
  alias beIdempotent='eval "if [[ -z \$${thisFuncName}_hasRun ]] ; then ${thisFuncName}_hasRun=true;  else  print -u2 ${thisFuncName}_HasRun_ReRunAvoided; return; fi;"'

else
    echo "UnknownShell"
fi


alias _CommentBegin_=": <<'_CommentEnd_'" # '_CommentEnd_' is important -- it prevents evaluations of ${var} and $(cmnd)


# Alias did not work write in Bash
#alias setThisFuncName='$( thisFuncNameBashOrKsh "$0" "$FUNCNAME" )'

function thisFuncNameBashOrKsh {
    if [[ "${BASH_VERSION}X" != "X" ]] ; then
        # for BASH -- ${BASH_VERSION}
        echo ${2}
    elif [[ "${KSH_VERSION}X" != "X" ]] ; then
        # For mksh
        echo ${1}
    elif [[ "${.sh.version}X" != "X" ]] ; then
        # for ksh93
        echo "${1}"
    else
        echo "UnknownShell"
    fi
}

#
# NOTYET, There should be no HOME in here as it could be used from
# scripts in systemd, etc.
#
# NOTYET, dela with :${HOME:-/}/.poetry/bin
# 
function opBasePathSet {

    function addEffectiveSitePerhaps {
        # ~/bpos/sites/selected
        # local effSiteBinBase="$HOME/bpos/sites/selected/sys/bin"
        local effSiteBinBase="/bisos/var/sites/selected/sys/bin"
        if [ -d "${effSiteBinBase}" ] ; then
            export PATH="${PATH}:${effSiteBinBase}"
        fi
    }
    
    export PATH="."

    addEffectiveSitePerhaps
  
  #export PATH="${PATH}:${HOME}/.local/bin"
  export PATH="${PATH}:/bisos/pipx/bin"
  export PATH="${PATH}:${HOME:-/}/.poetry/bin"
  export PATH="${PATH}:/bisos/venv/py3/devbin"
  export PATH="${PATH}:/bisos/venv/py3/dev-bisos3/bin"
  export PATH="${PATH}:/bisos/venv/py3/bisos3/bin"
  export PATH="${PATH}:/bisos/venv/py3/adopted/bin"
  export PATH="${PATH}:${opBase}/bin:${opBase}/lib:${opBase}/usrEnv"
  export PATH="${PATH}:/bisos/core/dev/bin"
  export PATH="${PATH}:/bisos/asc/bin"
  export PATH="${PATH}:/bisos/asc/dns/bin"
  export PATH="${PATH}:/bisos/asc/bedrock/bin"  
  export PATH="${PATH}:/bisos/asc/plone3/bin"
  export PATH="${PATH}:/bisos/asc/mail/bin"
  export PATH="${PATH}:/bisos/core/bsip/bin"
  export PATH="${PATH}:/bisos/core/bpip/bin"
  export PATH="${PATH}:/bisos/core/lcnt/bin"
  export PATH="${PATH}:/bisos/core/mail/bin"
  export PATH="${PATH}:/bisos/pals/bin"
  export PATH="${PATH}:/usr/local/bin:/usr/local/sbin"
  export PATH="${PATH}:/var/qmail/bin"
  export PATH="${PATH}:/usr/5bin:/usr/ccs/bin:/usr/sbin:/bin:/sbin:/usr/bin"
}


function hookRunObsoleted {
  typeset hookFuncName=""

  #EH_assert [[ $# -eq 1 ]]

  hookFuncName=`ListFuncs | egrep "^$1$"`
    shift 

  if [ "${hookFuncName}X" != "X" ] ;   then
    ${hookFuncName} $*
  fi
}

function  RAND_4 {
    typeset result
    result=$( od -An -N4 --format=u /dev/random )
    echo ${result}
}


function DATE_epoch2local {
    #EH_assert [[ $# -eq 1 ]]
    date -u -d '1970-01-01 '$1' seconds'
}


function DATE_local2epoch {
    #EH_assert [[ $# -gt 0 ]]
    date +%s -d"$*"
}


function  DATE_getTag {
  date +%y%m%d%H%M%S
}

function varIsSetPredicate {
    typeset varName="$1"
    eval validVar=\${$varName+"x"} 
    if [ -z ${validVar} ] ; then
        return 1
    else
        return 0
    fi
}


# Mail Address Parsing

function MA_domainPart {
  print ${1##*@}
}

function MA_localPart {
 print ${1%%@*}
}

# AttrType=AttrValue Parsing  "leftSide=rightSide"

ATTR_leftSide() {
    # Escapes all non alphanumeric characters.
    typeset key=`echo "$1" | perl -p -e 'if (/([^=]+)=(.+)*/) { my $a=$1; $a =~ s/([^A-Za-z0-9])/\\\\$1/g; $_=$a; } else { die "Cannot find key"; }'` || exit
    #print ${1%%=*}
    print $key
}

ATTR_rightSide() {
    #print ${1#*=}
    # Escapes all non alphanumeric characters.
    typeset value=`echo "$1" | perl -p -e 'if (/([^=]+)=(.+)/) { my $a=$2; $a =~ s/([^A-Za-z0-9])/\\\\$1/g; $_=$a; } else { $_=""; }'` || exit
    print $value
}

function Equal_leftSide {
 echo ${1%%=*}
}

function Equal_rightSide {
  echo ${1##*=}
}


function Column_leftSide {
 echo ${1%%:*}
}

function Column_rightSide {
  echo ${1##*:}
}

function Plus_leftSide {
 echo ${1%%+*}
}

function Plus_rightSide {
  echo ${1#*+}
}


function varNameValueStdout {
  #EH_assert [[ $# -gt 0 ]]

  argv="$@"

  typeset thisOne=""
  for thisOne in ${argv} ; do
 
      varName="${thisOne}"

      # Indirection, dereferencing
      eval varValue=\$${varName}

      echo "${varName}=${varValue}"
  done
 }



#
# File Name Manipulation (FN_)
#
# /dirsPart/nonDirsPart
# /dirsPart/prefix.extension
#
function FN_prefix {
    local thisFile=${1-missing}
  baseFileName=`basename ${thisFile}`
  #print ${baseFileName%%\.*}  # 
  print ${baseFileName%\.*}  
}

FN_extension() {
  typeset baseFileName=`basename "$1"`
  typeset extension=${baseFileName##*\.}
  if [[ ${baseFileName} == ${extension} ]] ; then
      print ""
  else
      print "${extension}"
  fi
}

FN_extensionOld() {
  baseFileName=`basename $1`
  print ${baseFileName##*\.}
}

FN_dirsPart() {
    print `dirname "$1"`
}

FN_nonDirsPart() {
    print `basename "$1"`
}


function FN_typeIs  {
    if [ "${1}_" == "image_" ] ; then
        file $2 | grep 'image data,' 1> /dev/null 2> /dev/null
        retVal=$?
        #echo ${retVal}
        return ${retVal}
    else
        return 101
    fi
}


function FN_fileDefunctMake {
  # $1 is the file that we no longer want active in the system
  # $2 is the name under which we want to keep it as

  if test -f $1 -o -L $1
  then
    if test -f $2
    then
        # The target should not have existed before
        print "$2 exists: skiping defuncting of $1"
    else
        mv $1 $2
        if [ ! -L $2 ] ; then
          # Only if not a symbolic link
          chmod 0000 $2
        fi
        ls -l $2 1>&2
    fi
  else
    print "No $1: skiping defuncting of $1"
  fi

}

function FN_dirDefunctMake {
  # $1 is the directory that we no longer want active in the system
  # $2 is the name under which we want to keep it as

  if test -d $1 ; then
    if test -d $2 ; then
      # The target should not have existed before
      print "$2 exists: skiping defuncting of $1"
    else
      mv $1 $2
      if [ ! -L $2 ] ; then
        # Only if not a symbolic link
        chmod 0000 $2
      fi
      ls -ld $2 1>&2
    fi
  else
    print "No $1: skiping defuncting of $1"
  fi

}

FN_FileCreateIfNotThere() {
    # $1 is the file that will be created, if not there

  if  test  $# -ne 1 ; then
    EH_problem "$0 requires one arg: Args=$*"
    return 1
  fi

    if [ !  -f "${1}" ] ;  then
        touch ${1}
    fi
}

FN_dirIsThereVerify() {
    # $1 is the directory that will be Verified

    if test -d "${1}"
    then
        #ls -ld ${1}
        #print "${1} exists"
        return 0
    else
        print "Problem: FN_dirIsThereVerify: Missing Directory  ${1}"
        return 101
    fi
}


FN_dirCreateIfNotThere() {
    # $1 is the directory that will be created, if not there

    if test -d "${1}"
    then
        #ls -ld ${1}
        #print "${1} exists"
        return 0
    else
        mkdir "${1}"
        #print "${1} created"
        #ls -ld ${1}
        return $?
    fi
}

function FN_dirCreatePathIfNotThere {
  # $1 is the directory that will be created, if not there
  # $1 is the source name

  #EH_assert [[ $# -eq 1 ]]

  if test -d $1 ;   then
     if [[ "${G_verbose}_" == "verbose_" ]] ; then
        printf 1>&2 "Directory $1 exists -- ${BASH_SOURCE[0]} $FUNCNAME skipped\n"
     fi
  else
     mkdir -p $1
  fi
}


FN_fileSymlinkSafeMake() {
  # $1 is the source/origin  name (should exist)
  # $2 is the target name (gets created)

  if  test $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi

  if test -a $1 ;  then
    if test -a $2 ;  then
        # The target should not have existed before
        print "$2 exists: skiping $0 of $1"
        ls -l $2 1>&2
    else
        ln -s $1 $2
        ls -l $2 1>&2
    fi
  else
    print "No $1: skiping $0 of $1"
  fi

}

FN_fileSymlinkUpdateKeep() {
  # $1 is the (endPoint) source/origin  name (should exist)
  # $2 is the (origPoint) target name (gets created)

  if  test $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi


  if test -a $1 ;   then  # Src file exists
    if test  -h $2 ;     then
      print "$2 already a symlink, moving it to $2.${dateTag}"
      ls -l $2 1>&2
      mv $2 $2.${dateTag}
      printf 1>&2 "running: ln -s $1 $2\n"
      ln -s $1 $2
    elif test -a $2 ; then
      # The target should not have existed before
      printf 1>&2  "$2 exists: skiping $0 of $1\n"
      ls -l $2 1>&2
    else
      ln -s $1 $2
      ls -l $2 1>&2
    fi
  else
    print "No $1: skiping $0 of $1"
  fi
}



FN_fileSymlinkUpdate() {
  # $1 is the source/origin  name (should exist)
  # $2 is the target name (gets created)

  if  test $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi


  if test -a $1 ;   then  # Src file exists
    if test  -h $2 ;     then
      print "$2 already a symlink, removing it"
      ls -l $2 1>&2
      /bin/rm $2
      printf 1>&2 "running: ln -s $1 $2\n"
      ln -s $1 $2
    elif test -a $2 ; then
      # The target should not have existed before
      printf 1>&2 "$2 exists: skiping symlinking of $1\n"
      ls -ld $2 1>&2
    else
      ln -s $1 $2
      ls -l $2 1>&2
    fi
  else
    print "No $1: skiping $0 of $1"
  fi
}


FN_fileSymlinkRemove() {

  if  test $# -eq 0 ; then
    EH_problem "$0 requires more than zero arg"
    return 1
  fi

  for thisFile in "$@" ; do
      if test  -h "${thisFile}" ;     then
          print "running: rm ${thisFile}" 
          /bin/rm "${thisFile}"
      elif test -a "${thisFile}" ; then
          # The target should not have existed before
          print "${thisFile} exists: skiping"
          ls -l "${thisFile}" 1>&2
      else
          print "Missing ${thisFile}: skiping"
      fi
  done
}

FN_fileSymlinkRemoveIfThere() {

  if  test $# -eq 0 ; then
    EH_problem "$0 requires more than zero arg"
    return 1
  fi

  for thisFile in "$@" ; do
      if test  -h "${thisFile}" ;     then
          print "running: rm ${thisFile}" 
          /bin/rm "${thisFile}"
      elif test -a "${thisFile}" ; then
          # The target should not have existed before
          print "${thisFile} exists: skiping"
          ls -l "${thisFile}" 1>&2
      fi
  done
}


function FN_pathAbsoluteNameGet {
  # $1 is the absolute path dir

  if [[ -a $1 ]] ; then
    typeset dirsPart=`FN_dirsPart $1`
    print ${dirsPart}
    return 0
  else
    EH_problem "$1 does not exist"
    return 1
  fi
}

function FN_fileSymlinkEndGet {

  # $1 is origin file name

  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi

  if [[ -L $1 ]] ; then
    typeset linksEnd=`ls -l ${1} | cut -d '>' -f2 | cut -d' ' -f2`
    integer x=`expr ${linksEnd} : "/*"`
    if [[ $x -eq 0 ]] ; then
      linksEnd=`FN_pathAbsoluteNameGet $1`/${linksEnd}
    fi
    if [[ -L ${linksEnd} ]] ; then
      FN_fileSymlinkEndGet ${linksEnd}
      return 0
    else
      print "${linksEnd}"
      return 0
    fi
  elif [[ -f $1 ]] ; then
    print $1
    return 1    
  else
    EH_problem "Not a symlink and does not exist"
    return 1
  fi
}

function FN_multiArchSymLinks {

  if  test $# -ne 3 ; then
    EH_problem "$0 requires three args: Args=$@"
    return 1
  fi

  typeset originPoint=${1}
  typeset intermediatePoint=${2} 
  typeset endPoint=${3}

  if  [[ ! -a ${endPoint} ]] ; then
    EH_problem "${endPoint} Does Not Exist"
    return 1
  fi

  mkdir -p `FN_dirsPart ${intermediatePoint}`
  FN_fileSymlinkUpdate  ${endPoint}  ${intermediatePoint}

  if test -L ${originPoint} ; then
    linksEnd=`ls -l ${originPoint} | cut -d '>' -f2 | cut -d' ' -f2`
      
    TM_trace 7 "link dest= ${linksEnd}  expected= ${intermediatePoint}"

    if [[ "${linksEnd}" != "${intermediatePoint}" ]] ; then
      EH_problem "Updating Symlink: ${originPoint} ${intermediatePoint}"
      FN_fileSymlinkUpdate  ${intermediatePoint} ${originPoint} 
    fi
  elif  test -a ${originPoint} ; then
      # A file exists -- We cant make a link

    print "PROBLEM: `ls -ld ${originPoint}` \n EXISTS, WATCHOUT!"
    return 1
  else
    FN_fileSymlinkSafeMake ${intermediatePoint} ${originPoint} 
  fi
}


function FN_fileSafeCopyOver {
  # $1 is the source name
  # $2 is the target name

    FN_fileSafeKeep "$2"
    FN_fileSafeCopy "$1" "$2"
}


function FN_fileSafeCopy {
  # $1 is the source name
  # $2 is the target name

  if  test  $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi

  if test -f $1 ;  then
    if test -f $2 ; then
        # The target should not have existed before
        print "$2 exists: Skiping $0 of $1 $2"
    else
        cp -p $1 $2
        #ls -l $2 1>&2
    fi
  else
    print "No $1: Skipping $0 of $1 $2"
  fi
}

function FN_fileSafeMove {
  # $1 is the source name
  # $2 is the target name

  if  test  $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi

  if test -f $1 ;  then
    if test -f $2 ; then
        # The target should not have existed before
        print "$2 exists: mv $2 $2.$$; mv $1 $2"
        mv $2 $2.$$
        mv $1 $2
    else
        mv $1 $2
    fi
  else
    print "No $1: Skipping $0 of $1 $2"
  fi
}


function FN_fileSize { 
    if test $# -ne 1 ; then
        EH_problem "$0 requires one arg: Args=$*"
        return 1
    fi
    FILESIZE=$(stat -c%s "$1")
    echo "$FILESIZE"
}



opVerbose() {
  return 0
}

FN_fileCopy() {
  # $1 is the source name
  # $2 is the target name

  if test $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi

  if test -f $1 ;  then
    if test -f $2 ; then
        TM_trace 7 "$2 exists: overwriting it"
    fi

    cp -p $1 $2
    if opVerbose ; then
      ls -l $2 1>&2
    fi
  else
    print "No $1: Skipping $0 of $1 $2"
  fi

}

function FN_fileSafeKeep {
  # $* is list of the source name
  typeset thisOne=""
  for thisOne in $* ;  do
    if test -f ${thisOne} -o -L ${thisOne} ;   then
      if [ "${dateTag}X" == "X" ] ; then 
        #TM_trace 7 "not found"
        local dateTag=`date +%y%m%d%H%M%S`
      fi
      if [[ "${G_verbose}_" == "verbose_" ]] ; then
        print "$0: ${thisOne}.${dateTag}" 1>&2
      fi
      mv ${thisOne} ${thisOne}.${dateTag}
    fi
  done
}


function FN_fileSafeKeepCp {
  # $* is list of the source name
  typeset thisOne=""
  for thisOne in $* ;  do
    if test -f ${thisOne} -o -L ${thisOne} ;   then
      if [ "${dateTag}X" == "X" ] ; then 
        #TM_trace 7 "not found"
        local dateTag=`date +%y%m%d%H%M%S`
      fi
      if [[ "${G_verbose}_" == "verbose_" ]] ; then
        print "$0: ${thisOne}.${dateTag}" 1>&2
      fi
      cp -p  ${thisOne} ${thisOne}.${dateTag}
    fi
  done
}


function FN_dirSafeKeep {
  # $1 is the source name

  #EH_assert [[ $# -eq 1 ]]

  if test -d $1 ;   then
    if [ "${dateTag}X" == "X" ] ; then 
      #TM_trace 7 "not found"
      local dateTag=`date +%y%m%d%H%M%S`
    fi
    if [[ "${G_verbose}_" == "verbose_" ]] ; then
        print -u2 "Running: mv $1 $1.${dateTag}"
    fi
    mv "$1" "$1.${dateTag}"
  else
     if [[ "${G_verbose}_" == "verbose_" ]] ; then
        print -u2 "$1: not a directory, $0 skipped"
     fi
  fi
}


function FN_safeKeepsClean {
    # $1 is the source name

    # EH_assert [[ $# -eq 1 ]]

    # notyet, should support more then one arg and 
    # clean should perhaps move to wastebasket instead or rm

    typeset filesListVar=$( ls -d $1.[0-9]* 2> /dev/null )

    for thisFile in ${filesListVar} ; do
        if test  -d "${thisFile}" ;     then
              print "running: rm -r ${thisFile}" 
              /bin/rm -r "${thisFile}"
        elif test -f "${thisFile}" ; then
              print "running: rm  ${thisFile}" 
              /bin/rm "${thisFile}"
        else
            if [[ "${G_verbose}_" == "verbose_" ]] ; then
                print -u2 "$1: not a directory or file, $FUNCNAME skipped"
            fi
        fi
    done
}


function FN_dirDeleteIfThere {

  if  test $# -eq 0 ; then
    EH_problem "$0 requires more than zero arg"
    return 1
  fi

  for thisDir in "$@" ; do
      if test -d ${thisDir} ;   then
          /bin/rm -r -f ${thisDir}
      else
          if [[ "${G_verbose}_" == "verbose_" ]] ; then
              print -u2 "${thisDir}: not a directory, $0 skipped"
          fi
      fi
  done
}

FN_lineIsInFile() {
    # $1 is string to check for
    # $2 is the file
    #
  # returns 0 if line Is In File 
  # returns 1 if line In NOT in file.

  #print  "$1"
  #print  "$2"

    #NOTYET, Verify number of args. Should be three

    FN_egrep "$1" "$2" > /tmp/$$id

    if [ -s /tmp/$$id ]
    then
        #print "String $1 already in $2"
        return 0
    else
        return 1
    fi
    /bin/rm /tmp/$$id
}

FN_lineRemoveFromFile() {
    # $1 is string to check for
    # $2 is the file
    #
  # returns 0 if line Is In File 
  # returns 1 if line In NOT in file.

  #print  "$1"
  #print  "$2"

  #NOTYET, Verify number of args. Should be three
  
  dateTag=`date +%y%m%d%H%M%S`
  cp ${2} ${2}.$dateTag
  FN_egrep -v "$1" "$2" > /tmp/$$id
  /bin/cp /tmp/$$id $2
  /bin/rm /tmp/$$id
  return 0
}

FN_blockRemoveFromLine() {

  # This function will remove message block
  # from a file
  # NOTYET TESTING.  MAYBE NOT WORKING

  # cat $3 | sed '/$1/,/$2/d' > /tmp/${3}.$$

  # $1 = start of the string (regex mode)
  # $2 = end of string
  # $3 = file name

  typeset tmpFile="/tmp/blockRm.$$"
  cat $3 | sed /$1/,/$2/d > ${tmpFile}
  mv ${tmpFile} $3

}

FN_lineAddToFile() {
    # $1 is string to check for
    # $2 is the string to add at the end of the fie
    # $3 is the file
    #

  #print  "$1"
  #print  "$2"
  #print  "$3"
    
    #NOTYET, Verify number of args. Should be three

    FN_egrep "$1" "$3" > /tmp/$$id

    if [ -s /tmp/$$id ]
    then
        #print "String $1 already in $3"
        #cat /tmp/$$id
        #print "$0: skiping it"
        return 1
    else
        #print "Adding $2 to $3"
        #print $2 >> $3
        print $2 >> $3
        return 0
    fi
    /bin/rm /tmp/$$id
}

function FN_textReplace {
#
# $1 -- regexp of text to replace.
# $2 -- replacement text
# $3 is the file
# To replace a line, make sure $1 is of this format: ^text.*$
# 
  print  "$1"
  print  "$2"
  print  "$3"
    
    #NOTYET, Verify number of args. Should be three
    typeset replacee=`echo "$2"|perl -p -e 's/\//\\\\\\//g' ` #escape the '/'
    perl -pi -e "s/$1/$replacee/" "$3" 2> /dev/null
    perl -p -e "/$replacee/ and die \"123FOUND321\"" "$3" 2>&1 | 
    grep "123FOUND321" > /dev/null
}


function FN_textReplaceOrAdd {
#
# $1 -- regexp of text to replace.
# $2 -- replacement text
# $3 is the file
# To replace a line, make sure $1 is of this format: ^text.*$
# 

    if [[ $# -ne 3 ]] ; then
        EH_problem "Bad usage: $# expected 3"
        return 1
    fi
    FN_lineIsInFile "$1" "$3"
    if [[ $? == 0 ]] ; then
        FN_textReplace "$1" "$2" "$3" || return $?
    else
        ( print "$2" >> "$3" ) || return $?
    fi
}

function FN_fileInstall {
#
# Ensure that we use FSF's install command
# Options are passed straight to install
# Tips: common options: -m mode -u user -g group frompath topath
#

    typeset cmdPath=""
    if [[ "X${opRunOsType}" == "XSunOS" ]] ; then
        cmdPath="/opt/sfw/bin/install"
    elif [[ "X${opRunOsType}" == "XLinux" ]] ; then
        cmdPath="install"
    fi
    ${cmdPath} "$@"
}    

function FN_grep {
  #
  # Ensure that we use grep command that supports 
  # "-F", "-v", and "-q"
  #

  typeset cmdPath=""
  if [[ "X${opRunOsType}" == "XSunOS" ]] ; then
    cmdPath="/usr/xpg4/bin/grep"
  elif [[ "X${opRunOsType}" == "XLinux" ]] ; then
    cmdPath="grep"
  fi
  ${cmdPath} "$@"
}    

function FN_egrep {
  #
  # Ensure that we use egrep command that supports 
  # "-v", "-q"
  #

  typeset cmdPath=""
  if [[ "X${opRunOsType}" == "XSunOS" ]] ; then
    cmdPath="/usr/xpg4/bin/grep"
  elif [[ "X${opRunOsType}" == "XLinux" ]] ; then
    cmdPath="grep"
  fi
  ${cmdPath} "-E" "$@"
}


function FN_tempFile {
    typeset tmp="/tmp/${G_myName}.$$.$RANDOM"
    #while [[ -e "$tmp" ]] ; do
    while test -e "$tmp"  ; do
        tmp="/tmp/${G_myName}.$$.$RANDOM"
    done
    print -- "$tmp"
}
    
function FN_fileIsAbsolutePath {

  # $1 = given file

  typeset givenFile=$1

  typeset after=${givenFile#/}

  if [[ "${givenFile}" != "${after}" ]] ; then
    TM_trace 7 "${givenFile} is an absolute path"
    return 0
  else
    return 1
  fi
}


function FN_absolutePathGet {
  # $1 = given file

  if  test  $# -ne 1 ; then
    return 1
  fi

  typeset givenFile=$1
  local processedGivenFile=""

  if [ "${givenFile}" == "" ] ; then
      return 1
  fi

  # Similar to expand-file-name in elisp
  # Convert filename NAME to absolute, and canonicalize it.
  #
  
  case "${givenFile}" in
      ~*)
          processedGivenFile=$(eval /bin/echo "${givenFile}")
          if [ "${processedGivenFile}" == "${givenFile}" ] ; then
              printf "FN_absolutePathGet: Missing ${givenFile}\n" 1>&2
              echo ""
              return
          else
              givenFile="${processedGivenFile}"
          fi
          ;;
      *)
          givenFile=$(eval /bin/echo "${givenFile}")
          ;;
  esac

  local absPath=""

  if [ -d "${givenFile}" ] ; then
      (cd ${givenFile}; pwd -P)
  else
      absPath=$(
  case $givenFile in
    */*) cd ${givenFile%/*} ;;
  esac
  pwd -P
)/${givenFile##*/}
  fi

  echo -n ${absPath}
}



FN_fileCmpAndDiff () {
    #EH_assert [[ $# -eq 2 ]]
    typeset retVal=0

    if (cmp ${1} ${2}  1> /dev/null 2>&1) ; then
        ANT_raw "VERIFIED: ${1} and ${2} Are identical"
        retVal=0
    else
        ANT_raw "Inconsistent -- ${1} ${2} : Are Different"
        #opDo diff ${1} ${2}
        diff ${1} ${2}
        retVal=100
    fi
    return ${retVal}
}

USER_isInPasswdFile() {
    # $1 is string to check for
    # $2 is the string to add at the end of the fie
    # $3 is the file
    #

    #NOTYET, Verify number of args. Should be three

    FN_egrep "^$1:" /etc/passwd > /tmp/$$id

    if [ -s /tmp/$$id ]
    then
        print "User -- $1 -- Is In /etc/passwd file"
       /bin/rm /tmp/$$id
        return 0
    else
        print "User -- $1 -- Is NOT In /etc/passwd file"
        /bin/rm /tmp/$$id
        return 11
    fi

}

USER_loginGivenHomeDir() {
    # $1 is Home Dir
    # outputs loginName and returns 0 if found
    # returns 1 if not found

    #NOTYET, Verify number of args. Should be three

  #TM_trace 7 "$*"

     loginName=`cat /etc/passwd | FN_egrep ":$1:" | cut -d':' -f 1` 

       if [ "${loginName}X" == "X" ] ; then 
         #TM_trace 7 "not found"
         return 1
       else
         print ${loginName}
         return 0
         fi

}


USER_nextLoginNameGet() {
  # $1 category sa-, qvd-

  # nextLoginNumber

  return 11
}


PN_fileVerify () {
  ls -l $1 1>&2
}

function FN_fileRmIfThere {
        #print $*
        #typeset -ft PN_rmIfThere
        PN_rmIfThere $*
}

PN_rmIfThere()
{
        rmIfThereVerbose=FALSE

  while getopts v c
  do
    case $c in
      'v')
        rmIfThereVerbose=TRUE
        ;;
      *)
        EH_problem "rmIfThere: BAD OPTION"
        exit
        ;;
    esac
  done

  if [[ "${BASH_VERSION}X" == "X" ]] ; then
      shift $( expr $OPTIND - 1 )
  fi

  for f in $* 
  do
      if [ -f ${f} ] ;  then
        if [ ${rmIfThereVerbose} == TRUE ] ; then 
          print Removing $f
        fi
        /bin/rm $f
      else
        #TM_trace 9 -- Skipping $f
        # NOTYET, TM_trace is not working ...
        rmIfThereVerbose=${rmIfThereVerbose}
        #print ""
      fi
  done

}


function IS_inList {
  # $1=target --  $2=validList

    if [[ "$1_" == "_" ]] ; then
        return 1
    fi

    if [[ "$2_" == "_" ]] ; then
        return 1
    fi


  typeset retVal=1
  typeset i=""
  typeset allInput="$@"
  typeset validList=`echo ${allInput} | cut -d ' ' -f2-${#allInput}`
  #print $validList
  for i in $validList ;  do
    if [[ "${i}_" == "$1_" ]] ; then
      #print "_${i}_" "_$1_"
      retVal=0
      break
    fi
  done

  
  return ${retVal}
}

function LIST_isIn {
  # $1=target --  $2=validList
  if [[ $# -ne 2 ]] ; then
    print -u2 "$0: expected 2 args, got $#"
    return 1
  fi

  typeset retVal=1
  typeset i=""

  #print $2
  for i in $2 ;  do
    if [[ "${i}_" == "$1_" ]] ; then
      #print "_${i}_" "_$1_"
      retVal=0
      break
    fi
  done
  
  return ${retVal}
}

STR_toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]" 
} 


STR_toUpper() {
  echo $1 | tr "[:lower:]" "[:upper:]" 
} 


function STR_toTitleCaseWords {
    #EH_assert [[ $# -gt 0 ]]
    argv=$@

    typeset thisOne=""
    for thisOne in ${argv} ; do
        echo ${thisOne} | awk 'BEGIN{OFS=FS=""}{$1=toupper($1);print}'
    done
}


function LIST_getLast {
  #set -x
  if test $# -ge 1 ; then
    shiftValue=`expr $#  - 1`
    #print ${shiftValue} $* >> /tmp/ZZ
    shift ${shiftValue} 
    #print ${shiftValue} $* >> /tmp/ZZ
  fi
  print $*
}

function LIST_getFirst {
  print $1
  return 
}

function LIST_set {
  activeList=$*
  #print ${activeList}
}

function LIST_minus {
  newList=""
  for subjectInList in ${activeList} ; do
    if [ "${1}X" != "${subjectInList}X" ] ; then
      newList="${newList} ${subjectInList}"
    fi
  done
  activeList=${newList}
  #print ${activeList}
}

function LIST_setMinusResult {
  print ${activeList}
}

# ksh syntax sometimes demands something
# so, we provide doNothing
doNothing() {
  typeset x=""
}

# doStderrToStdout can be used as a one-liner to ignore stdout and 
# replace stderr with stdout. No tmp files.

# set -x
# if [[ "${BASH_VERSION}X" == "X" ]] ; then
# function doStderrToStdout {
#   integer retVal=0

#   if [[ $# -lt 1 ]] ; then
#     EH_problem "$0 requires at least one arg: Args=$*"
#     return 1
#   fi

#                        # Commented for pedagogical purposes

#   cat |&               # co-process, to take in stderr  
#   exec 2>&p            # our stderr is now co-process's input 
#   $* 1>/dev/null       # run the command, ignore stdout, stderr goes to co-process
#   retVal=$?            # keep exit code of the command
#   exec 2>&-            # close our stderr stream
#   exec 0<&p            # co-process's stdout becomes our stdin
#   cat                  # we put our stdin to our stdout
#   return ${retVal}     # we return the exit code of the command as exit code
# }
# fi




G_validateOption()
{
  # $1=target
  # $2=validList

  targetIsValid="FALSE"

  for i in $2
  do
    #TM_trace 9 $i
    if [ "${i}" = "$1" ] ; then
      #TM_trace 9 "target=$1"
      targetIsValid="TRUE"
      break
    fi
  done

  if [ "${targetIsValid}" = "FALSE" ] ; then
    #EH_problem "XXX - Unknown archType: ${archType}"
    print "Unknown option: ${1}"
    usage
    exit 1
  fi
}

# Verify We are running Solaris or Linux
G_abortIfNotSupportedOs() {
  osType=`uname -s`
  case ${osType} in
    'SunOS')
      #TM_trace 7 "$0 running on ${osType} ...."
      ;;
    'Linux')
      #TM_trace 7 "$0 running on ${osType} ...."
      ;;
    CYGWIN_NT-*)
      #TM_trace 7 "$0 running on ${osType} ...."
      ;;

    # NOTYET, Linux to be added
    *)
      uname
        print "$0 not Suported on ${osType}"
        exit
  esac

}

G_abortIfNotRunningAsRoot() {
  # Verify Being Run As Root

  id | grep root > /tmp/$$id

  if [ ! -s /tmp/$$id ]
  then
    id
    print "$0 should be run as root"
    exit 1
  fi
  /bin/rm /tmp/$$id
}

G_returnIfNotRunningAsRoot() {
  # Verify Being Run As Root

  id | grep root > /tmp/$$id

  if [ ! -s /tmp/$$id ]
  then
    print "$0 should be run as root"
    id
    return 1
  fi
  /bin/rm /tmp/$$id
}


G_validateRunOS()  
{
  # $1=validList

  runOsType=`uname -s`

  isValid="FALSE"

  for i in $1
  do
    #TM_trace 9 $i
    if [ "${i}" = "${runOsType}" ] ; then
      isValid="TRUE"
      break
    fi
  done

  if [ "${isValid}" = "FALSE" ] ; then
    print "Can't RUN this script on ${runOsType}"
    exit 1
  fi
}


# Usage: opDoRet opLinuxOnly || return $?

function opLinuxOnly {
  case ${opRunOsType} in
  "Linux")
     return 0
     ;;
  *)
     EH_problem "Unsupported OS: ${opRunOsType}"
     return 1
     ;;
  esac
}

function opSolarisOnly {
  case ${opRunOsType} in
  "SunOS")
     return 0
     ;;
  *)
     EH_problem "Unsupported OS: ${opRunOsType}"
     return 1
     ;;
  esac
}

DOS_toFrontSlash() {
  print -r -- $1 | sed -e "s@\\\\@/@g"
}

DOS_toBackSlash() {
  print NOTYET
}

RELID_extractInfo () {
  # $1 is RELID_RELINFO_FILE

  RELID_PROD_NAME=`grep RELID-INFO-Product-Name $1 | cut -d: -f2`
  RELID_REVNUM=`grep RELID-INFO-Rev-Number $1 | cut -d$ -f2 | cut -d' ' -f 2`
  #RELID_REVNUM="0.${RELID_REVNUM}"
  RELID_REL_DATE=`grep RELID-INFO-Rel-Date $1 | cut -d$ -f2 | cut -d' ' -f 2,3`
  RELID_CVS_TAG=`grep RELID-INFO-CVS-Tag $1 | cut -d$ -f2 | tr -s ' ' | cut -d' ' -f 2`
  RELID_BUILD_USER=${USER}
  RELID_BUILD_HOST="`uname -n` `uname -svrm`"
  RELID_BUILD_DATE=`date | tr -s ' '`

  if [ "${RELID_PROD_NAME}" = "" ]
  then
    RELID_PROD_NAME="product unspecified"
  fi

  if [ "${RELID_REVNUM}" = "" ]
  then
    RELID_REVNUM="revision unspecified"
  fi

  if [ "${RELID_REL_DATE}" = "" ]
  then
    RELID_REL_DATE="release date unspecified"
  fi

  if [ "${RELID_CVS_TAG}" = "" ]
  then
    RELID_CVS_TAG="CVS tag unspecified"
  fi
}


logActivitySeparator()
{
  print -r -- ""
  print -r -- "-------------------------------------------------------"
}



buildAndRecord() {
  # $1 = buildDir
  # $2 = buildCmd
  cd $1
  print -r "++++++++++ Started In `pwd` at `date`  Running: $2"
  #print "++++++++++ Started In `pwd` at `date`  Running: $2"

  $2

  if [ ${status} ] ; then
    print "XXXXXXXX build failed in `pwd` with status=${status}"
    exit 1
  fi
  print -r -- "--------- Completed In `pwd` at `date`  Running: $2"
  print ""
}

function pathToArray {
  #set -x

  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi

  typeset pathToParse=$1

  pathArray=( `(echo ${pathToParse} |  sed -e "s:/: :g" )` )
}

function fqdnToArray {
  #set -x

  if  test $# -ne 1 ; then
    EH_problem "$0 requires one args: Args=$*"
    return 1
  fi

  typeset fqdnToParse=$1

  fqdnArray=( `(echo ${fqdnToParse} |  sed -e 's:\.: :g' )` )

 set ${fqdnArray[@]}

 reversedWords=""

 for thisElem in ${fqdnArray[@]} ; do
   #echo ${thisElem}
   reversedWords="${thisElem} ${reversedWords}"
   shift
 done

 fqdnArrayReverse=( ${reversedWords} )

}

# Example from page 78
# isnum returns True if its argument is a valid number.
# The first pattern requires a digit before the decimal
# point, and the second after the decimal point.
#
# BASH NOTE: make sure you have executed `shopt -s extglob' before
# trying to use this function, or it will not work
#
function isnum # string
{
    case $1 in
    ?([-+])+([0-9])?(.)*([0-9])?([Ee]?([-+])+([0-9])) )
        return 0;;
    ?([-+])*([0-9])?(.)+([0-9])?([Ee]?([-+])+([0-9])) )
        return 0;;
    *) return 1;;
    esac
    # Not reached.
}


isnum2() # string
{
    case $1 in
    ?([-+])+([[:digit:]])?(.)*([[:digit:]])?([Ee]?([-+])+([[:digit:]])) )
        return 0;;
    ?([-+])*([[:digit:]])?(.)+([[:digit:]])?([Ee]?([-+])+([[:digit:]])) )
        return 0;;
    *) return 1;;
    esac
}

isint() # string
{
    case $1 in
    ?([-+])+([0-9]) )
        return 0;;
    *) return 1;;
    esac
}

isint2() # string
{
    case $1 in
    ?([-+])+([[:digit:]]) )
        return 0;;
    *) return 1;;
    esac
}



#
# TESTING
#

#print "FN_dirsPart on $0 produces: `FN_dirsPart $0`"
#print "FN_nonDirsPart on $0 produces: `FN_nonDirsPart $0`"
#print "FN_prefix on $0 produces: `FN_prefix $0`"
#print "FN_extension on $0 produces: `FN_extension $0`"


#traceLevel=9
#TM_trace 3 "hello $0-$0"

#USER_loginGivenHomeDir /acct/qmaildom/com/payk

#LOG_event "something"

#EH_problem "some prob"

#EH_fatal "die"

#print "should never see this"


#local=`MA_localPart mohsen@neda.com`
#domain=`MA_domainPart mohsen@neda.com`
#print "Local is ${local} and domain is ${domain}"


#left=`ATTR_leftSide subscribe=iran-news@lists.payk.net`
#right=`ATTR_rightSide subscribe=iran-news@lists.payk.net`
#print "Left is ${left} and Right is ${right}"

