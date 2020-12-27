#!/bin/osmtKsh
#!/bin/osmtKsh

typeset RcsId="$Id: seedElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
  seedActions.sh -l $0 "$@"
  exit $?
fi

typeset -t el=""
typeset -t exec=""

typeset -t inFile="MANDATORY"
typeset -t outFile="MANDATORY"


elStartFile=start.el
elScriptFile=script.el

function vis_examples {
  typeset extraInfo="-v -n showRun"
  #typeset extraInfo=""
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
    
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- Create a Starting Point Script File ---
${G_myName} ${extraInfo} -i elStart > ${elStartFile}
${G_myName} ${extraInfo} -e "Then edit the script file" -i runFunc cp ${elStartFile} ${elScriptFile}
--- Filter Mode Emacs Based Batch Script ---
${G_myName} ${extraInfo} -p el="${elScriptFile}" -p exec=main -p inFile=iIi -p outFile=oOo -i emacs 
${G_myName} ${extraInfo} -p el="${elScriptFile}" -p exec=main -i xemacs arg1 arg2
--- Overwrite Emacs Based Batch Script ---
${G_myName} ${extraInfo} -p el="${elScriptFile}" -p exec=main -p inFile=iIi -i emacs 
${G_myName} ${extraInfo} -p el="${elScriptFile}" -p exec=main -i xemacs arg1 arg2
--- Eliminate input commands  ---
${G_myName} ${extraInfo} -p inFile=ii -p outFile=oo -i filter filtArg1
${G_myName} ${extraInfo} -p inFile=ii  -i filter filtArg1
_EOF_

hookRun "examplesHookPost"
}


function vis_examplesOther {
    return
}

function vis_describe {
    vis_help
}


function vis_help {
  cat  << _EOF_

* 1) Copy /opt/public/osmt/bin/elispRun.sh to the directory where you are working.
    -- Say elispRun.sh

* 2) Run ${G_myName} ${extraInfo} -i elStart > ${elStartFile}

* 3) Copy ${elStartFile} to ${elScriptFile} 

* 4) Edit ${elScriptFile}

* 5) Capture your run scripts in elispRun.sh

_EOF_
}

function noArgsHook {
  vis_examples
}



#
# Now that we have all the parameters, get the job done.
#
EMACS="emacs -batch -q -no-site-file"
lispArgsFile="/tmp/$$.elispArgs"
lispFrameFile="/tmp/$$.elispFrame"
lispLibFile="/tmp/$$.elispLib"
lispBodyFile="/tmp/$$.elispBody"


lispEntryFunc=${action}

function vis_xemacs {
    # xemacs does not work when invioked from 
    # shell script -- NOTYEY
  EMACS="emacs -batch -q -no-site-file"
  vis_run $*
}

function vis_emacs {
  EMACS="emacs -batch -q -no-site-file"
  vis_run $*
}

function vis_eoe {
  EMACS="emacs -batch"
  vis_run $*
}

function shellToElispVars {

# NOTYET
# all shell typset -t variables should be passed to elisp
   
cat > ${lispArgsFile} << _EOF_ 

(setq inFile (expand-file-name "${inFile}"))
(setq outFile (expand-file-name "${outFile}"))
(setq G_argv "${G_argv}")

_EOF_
}

function vis_run {
    FN_fileRmIfThere ${outFile}

    shellToElispVars

if [[ "${el}_" != "_" ]] ; then
  elFile=${el}
fi

if [[ "${exec}_" != "_" ]] ; then
  lispEntryFunc=${exec}
fi

# echo  "${EMACS} -q -l ${lispArgsFile} -l ${elFile} -f ${lispEntryFunc}"
# echo ${G_argv}
# echo ${inFile}

opDo ${EMACS} -l ${lispArgsFile} -l ${elFile} -f ${lispEntryFunc}

#/bin/rm ${lispArgsFile}

}


function vis_filter {

shellToElispVars

vis_elFrame > ${lispFrameFile}

vis_elLib > ${lispLibFile}

vis_elBody > ${lispBodyFile}

opDo ${EMACS}  -l ${lispArgsFile} -l ${lispFrameFile} -l ${lispLibFile} -l ${lispBodyFile} -f main

}

function vis_elStart {
    vis_elFrame
    vis_elLib 
    vis_elBody
}


# function vis_elStart {
# vis_elFrame > ${elStartFile}
# vis_elLib >> ${elStartFile}
# vis_elBody >> ${elStartFile}
# opDo ls -l ${elStartFile}
# }


function vis_elFrame {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: seedElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
    ;; NOTYET, if no outFile, then ioOverwriteSetup
    ;; if outFile, then ioFilterSetup
 (ioOverwriteSetup)
 ;;(ioFilterSetup)
 (bufferWork)
 (save-buffer)
 (save-buffers-kill-emacs)
)

_EOF_
}

function vis_elLib {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: seedElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
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


_EOF_
}


function vis_elBody {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: seedElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(defun bufferWork ()
""
 (interactive)
 (helloWorldWork)
 ;;(latex-cite-convert)
 )

(defun helloWorldWork ()
""
 (interactive)
 (let (start end)

   (insert " Some Func ZZZ\n")

   (insert (format "%s %s %s\n" inFile outFile G_argv))
   )
    ;;;(message "Hello World")
 )

(defun latex-cite-convert ()
  (interactive)
  (while (re-search-forward "\cite\\\\[.*\\\\]" nil t)
    (replace-match "\cite" nil nil))
 )
_EOF_
}


