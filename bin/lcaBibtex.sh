#!/bin/bash

if [[ "${opRunDistGeneration}_" == "1004_"  	]] ; then
    /usr/bin/bibtex.original  $@
else
    /usr/bin/bibtex  $@
fi

