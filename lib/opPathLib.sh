

function opPathIsIn {
  EH_assert [[ $# -eq 2 ]]
  typeset pathVal
  eval pathVal='$'{$1}

  if [[ "${pathVal}_" == "_" ]] ; then
    return 1
  else
    if env | FN_grep $1 | FN_egrep "=$2\$" > /dev/null ; then
      ANV_raw "$0: $2 Already In $1 -- (=) skipped"
      return 0
    elif env | FN_grep $1 | FN_egrep "=$2:" > /dev/null  ; then
      ANV_raw "$0: $2 Already In $1 -- (=:) skipped"
      return 0
    elif env | FN_grep $1 | FN_egrep ":$2:" > /dev/null ; then
      ANV_raw "$0: $2 Already In $1 -- (::) skipped"
      return 0
    elif env | FN_grep $1 | FN_egrep ":$2\$" > /dev/null ; then
      ANV_raw "$0: $2 Already In $1 -- (:) skipped"
      return 0
    else
      return 1
    fi
  fi
  # NOT REACHED
}

function opPathSet {
  EH_assert [[ $# -eq 2 ]]
  typeset pathVal
  eval pathVal='$'{$1}

  if [[ "${pathVal}_" == "_" ]] ; then
    export $1=$2
  else 
    ANT_raw "$0: previously set $1=${pathVal} -- set to $2"
    export $1=$2
  fi
  #env | grep $1=
}

function opPathSetList {
    #set -x
  EH_assert [[ $# -eq 2 ]]

  typeset thisOne=""
  for thisOne in $2 ;  do
    opPathAppend $1 "${thisOne}"
  done
}


function opPathAppend {
  EH_assert [[ $# -eq 2 ]]
  typeset pathVal
  eval pathVal='$'{$1}

  if [[ "${pathVal}_" == "_" ]] ; then
    export $1=$2
  else 
    if opPathIsIn "$1" "$2"  ; then 
      doNothing
    else
      export $1="${pathVal}:$2"
    fi
  fi
  #env | grep $1=
}


function opPathPrepend {
  EH_assert [[ $# -eq 2 ]]
  typeset pathVal
  eval pathVal='$'{$1}

  if [[ "${pathVal}_" == "_" ]] ; then
    export $1=$2
  else 
    if opPathIsIn "$1" "$2"  ; then 
      doNothing
    else
      export $1="$2:${pathVal}"
    fi
  fi
  #env | grep $1=
}

###
### To be Absorbed
###

#
pathedit()
{
    [[ -z $2 ]] && return 2
    PATH=:$PATH: PATH=${PATH//:$2:/:}
    case $1 in
    -p ) PATH=$2$PATH ;;
    -a ) PATH=$PATH$2 ;;
    -r ) ;;
    * ) return 2 ;;
    esac
    while [[ $PATH == *::* ]] ; do
        PATH=${PATH//::/:}
    done
    PATH=${PATH#:} PATH=${PATH%:}
}

pathadd() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
        fi
    fi
}

pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}
