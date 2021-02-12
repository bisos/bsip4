#!/bin/bash

IcmBriefDescription="
* NOTYET: Short Description Of This Interactive Command Module"

####+BEGIN: bx:bash:origin-statement :control "release"
ORIGIN="
* Part Of ByStar -- Best Used With Emacs, Blee and COMEEGA."
####+END:

####+BEGIN: bx:bash:top-of-file :control "release"
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bash:author :control "release" :author "mohsenBanan"
__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact"
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedElisp.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedElisp.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/elispFilterHtml.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedElisp.sh -l $0 "$@" 
    exit $?
fi
####+END:

elispScriptFile="${opBinBase}/elispFilterHtml.el"

#
# See Help in seedElisp.sh 
#

function examplesHookPost {
  #docName="ExecSummary"
    docName="BusPlan"
  cat  << _EOF_
----- POST HOOK EXAMPLES -----
#/bin/rm ./index.html
${G_myFullName} ${extraInfo} -p el="${elispScriptFile}" -p exec=main -p inFile="./${docName}.html" -p outFile="./index.html" -i emacs ${docName}
--- As invoked by opTexNedaBuild.sh ---
${G_myFullName} ${extraInfo}  -i inLineCss art_overviewOperationalLS
${G_myFullName} ${extraInfo}  -i heveaPlone3Fixups articleEnFa
${G_myFullName} ${extraInfo}  -i deTitle /content/generated/doc.free/bystar/PLPC/180036/current/emailContentEnFa/index.html
--- One Time Preparations ---
${G_myFullName} ${extraInfo} -i outputScript
_EOF_
}


function vis_outputScript {
  cat  << _EOF_
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : elispRun.sh,v 1.2 2006/06/29 12:24:07 mohsen Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
 ;;(ioOverwriteSetup)
 (ioFilterSetup)
 (bufferWork)
 (save-buffer)
 (save-buffers-kill-emacs)
)

;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : elispRun.sh,v 1.2 2006/06/29 12:24:07 mohsen Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun ioFilterSetup ()
""
 (interactive)
 (let (start end)

   (find-file outFile)
   (insert-file-contents inFile)
   )
 )

(defun ioOverwriteSetup ()
""
 (interactive)
 (let (start end)

   (find-file inFile)
   )
 )


;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : elispRun.sh,v 1.2 2006/06/29 12:24:07 mohsen Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(defun bufferWork ()
""
 (interactive)
 ;;(helloWorldWork)
 (html-inLineCss)
 )

(defun html-inLineCss ()
  (interactive)
  (goto-char (point-min))
  (setq cssFileName (format "%s.css" G_argv))

 (re-search-forward cssFileName nil t)
   (beginning-of-line)
   (kill-line)

  (insert "
<style type=\"text/css\">
<!--")

  (insert-file-contents cssFileName)

  (re-search-forward "end css.sty" nil t)
  (forward-line)

  (insert "-->
</style>")
  (insert "\n")
       )


;;;
;;; Begin Junk Yard
;;;

(defun helloWorldWork ()
""
 (interactive)
 (let (start end)

   (insert " Some Func ZZZ\n")

   (insert (format "%s %s %s\n" inFile outFile G_argv))
   )

    ;;;(message "Hello World")
 )
_EOF_

}

function vis_inLineCss {
  EH_assert [[ $# -eq 1 ]]
  fileBaseName=$1

  elispScriptFile="${opBinBase}/elispFilterHtml.el"

  #if [[ ! -f ${elispScriptFile} ]] ; then 
    #vis_outputScript > ${elispScriptFile}
  #fi

  inFileName="./tex4ht-${fileBaseName}/${fileBaseName}.html"
  outFileName="./tex4ht-${fileBaseName}/index.html"

  FN_fileRmIfThere ${outFileName}

  opDo ${G_myFullName} -v -n showRun  ${extraInfo} -p el="${elispScriptFile}" -p exec=main -p inFile="${inFileName}" -p outFile="${outFileName}" -i emacs ${fileBaseName}
}

function vis_heveaPlone3Fixups {
  EH_assert [[ $# -eq 1 ]]
  fileBaseName=$1

  elispScriptFile="${opBinBase}/elispFilterHtml.el"

  #if [[ ! -f ${elispScriptFile} ]] ; then 
    #vis_outputScript > ${elispScriptFile}
  #fi

  inFileName="./heveaHtml-${fileBaseName}/${fileBaseName}.html"
  outFileName="./heveaHtml-${fileBaseName}/index.html"

  FN_fileRmIfThere ${outFileName}

  opDo ${G_myFullName} -v -n showRun  -p el="${elispScriptFile}" -p exec=mainHevea -p inFile="${inFileName}" -p outFile="${outFileName}" -i emacs ${fileBaseName}
}

function vis_deTitle {
  EH_assert [[ $# -eq 1 ]]
  inFileName=$1

  elispScriptFile="${opBinBase}/elispFilterHtml.el"

  opDo ${G_myFullName} -v -n showRun  -p el="${elispScriptFile}" -p exec=mainDeTitle -p inFile="${inFileName}" -p outFile="/dev/null" -i emacs
}

function vis_deTitleCompletely {
  EH_assert [[ $# -eq 1 ]]
  inFileName=$1

  elispScriptFile="${opBinBase}/elispFilterHtml.el"

  opDo ${G_myFullName} -v -n showRun -p el="${elispScriptFile}" -p exec=mainDeTitleCompletely -p inFile="${inFileName}" -p outFile="/dev/null" -i emacs
}



