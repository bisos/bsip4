#!/bin/bash

# This is important to make sure string manipulation is handled
# byte-by-byte.
export LANG=C

#urlencode() {
#
# Output will only include [0-9a-zA-Z_\.\-]
#
safeString() {
#set -x
#arg="$1"
arg="$@"
i="0"
while [ "$i" -lt ${#arg} ]; do
c=${arg:$i:1}
#if echo "$c" | grep -q '[0-9a-zA-Z/:_\.\-]'; then
if echo "$c" | grep -q '[0-9a-zA-Z_\.\-]'; then
echo -n "$c"
else
echo -n "_"
printf "%X" "'$c'"
fi
i=$((i+1))
done
}


urlencode2() {
local arg
arg=”$1″
while [[ "$arg" =~ ^([0-9a-zA-Z/:_\.\-]*)([^0-9a-zA-Z/:_\.\-])(.*) ]] ; do
echo -n “${BASH_REMATCH[1]}”
printf “%%%X” “‘${BASH_REMATCH[2]}’”
arg=”${BASH_REMATCH[3]}”
done
# the remaining part
echo -n “$arg”
}


# URL encode a stream or a string   ### / wird nicht encoded!
function vis_url_encode3 {
    # usage exit for too many parameters
    [ $# -gt 1 ] && { echo >&2 "usage: url_encode [string]"; return 1; }
    
    # self call when an argument is given, else handle stdin
    #[ $# -eq 1 ] && { echo -n "$1" | vis_url_encode; return $?; }
    [ $# -eq 1 ] && { echo  "$1" | vis_url_encode; return $?; }
        
    # first create alternating lines of hex code and ascii characters
    # then remember the hex value,
    # convert spaces to +,
    # keep some selected characters unchanged
    # and use the hexvalue prefixed with a % for the rest
    ##od -t x1c -w1 -v -An |
    ##LANG=C awk '
    ##  NR % 2                  { hex=$1;               next    }
    ##  /^ *$/                  { printf("%s", "+");    next    }
    ##  /^ *[a-zA-Z0-9.*()-]$/  { printf("%s", $1);     next    }
    ##  /^ *\//                 { printf("%s", $1);     next    }
    ##                          { printf("%%%s", hex)           }
    ##'
    hexdump -v -e '1/1 "%02x\t"' -e '1/1 "%_c\n"' |
    LANG=C awk '
        $1 == "20"                      { printf("%s",      "+");   next    }
        $2 ~  /^[a-zA-Z0-9.*()\/-]$/    { printf("%s",      $2);    next    }
                                        { printf("%%%s",    $1)             }
    '
}

#urlencode "$@"
safeString "$@"

