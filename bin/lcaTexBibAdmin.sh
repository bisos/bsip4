#!/bin/osmtKsh
#!/bin/osmtKsh

typeset RcsId="$Id: lcaTexBibAdmin.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
  seedActions.sh -l $0 "$@"
  exit $?
fi


function vis_examples {
    #oneInBibFile="/usr/local/lib/bib/networking.bib"
    oneInBibFile="/lcnt/outputs/all/plpc.bib"
    oneOutBibFile="/tmp/lcaOut1.bib"
    oneOutHtmlFile="/z1/tmp/lcaOut1"
${visLibExamples}
 cat  << _EOF_
EXAMPLES:
--- Package Components  ---
${G_myName} -i bibtexBinsPrepFix
apt-cache search bibtex
apt-get install bibtool
dpkg -L bibtool
#apt-get install bibtool-dev
apt-get install bibclean
apt-get install bibtex2html
./bib2html.sh  # Shell Script found on the net
--- VERIFY / SORT  ---
bibtool -s -i ${oneInBibFile} -o ${oneOutBibFile}
bibtool -# -i ${oneInBibFile}
bibtool -@ -i ${oneInBibFile} -o ${oneOutBibFile}
bibclean ${oneInBibFile}
bibtex2html -o ${oneOutHtmlFile} ${oneInBibFile}; echo file://${oneOutHtmlFile}.html
bib2bib
--- Help and Documentation ---
${G_myName} -i help
---
_EOF_
}

noArgsHook() {
  vis_examples
}



function vis_bibtexBinsPrepFix {
  EH_assert [[ $# -eq 0 ]]

  if [[ "${opRunDistGeneration}_" == "1004_" || \
      "${opRunDistGeneration}_" == "1010_" || \
      "${opRunDistGeneration}_" == "1104_" || \
      "${opRunDistGeneration}_" == "1110_" || \
      "${opRunDistGeneration}_" == "1204_" || \
      "${opRunDistGeneration}_" == "1210_" || \
      "${opRunDistGeneration}_" == "7_" || \
      "${opRunDistGeneration}_" == "SQUEEZE_" ]] ; then
      if [[ -h /usr/bin/bibtex ]] ; then
          opDo FN_fileSafeKeep /usr/bin/bibtex
          opDo eval "bibtexBinsPrepFixStdout > /usr/bin/bibtex"
          opDo chmod ugo+x /usr/bin/bibtex
      else
          ANT_raw "/usr/bin/bibtex not a symlink -- must have been fixed already -- do verify"
      fi
      opDo ls -l /usr/bin/bibtex
  else
      doNothing
  fi
}

function bibtexBinsPrepFixStdout {
    cat  << _EOF_
#!/bin/bash

/usr/bin/bibtex.original  \$@
_EOF_
}

