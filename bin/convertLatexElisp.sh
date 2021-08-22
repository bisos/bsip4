#!/bin/osmtKsh
#!/bin/osmtKsh

typeset RcsId="$Id: convertLatexElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
    seedSubjectAction.sh -l $0 "$@"
    exit $?
fi

#

typeset -t el=""
typeset -t exec=""

typeset -t inFile="MANDATORY"
typeset -t outFile="MANDATORY"
typeset -t outputDir=""

function vis_examples {
  typeset extraInfo="-v -n showRun"
  #typeset extraInfo=""

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- outPng ---
${G_myName} ${extraInfo} -p outputDir="/tmp" -p outFile=result -i outPng "Text To Convert"
--- Emacs Based Batch Script ---
${G_myName} ${extraInfo} -i elFrame > frame.el
${G_myName} ${extraInfo} -i elBody > body.el
cat frame.el body.el > work.el
${G_myName} ${extraInfo} -p el="./work.el" -p exec=main -p inFile=iIi -p outFile=oOo -i xemacs arg1 arg2
${G_myName} ${extraInfo} -p el="./work.el" -p exec=main -i xemacs arg1 arg2
${G_myName} ${extraInfo} -p el="./work.el" -p exec=main -i emacs arg1 arg2
--- Eliminate input commands  ---
${G_myName} ${extraInfo} -p inFile=ii -p outFile=main-full.tex -i inputElim
${G_myName} ${extraInfo} -p inFile=ii -p outFile=main-full.tex -i citeConvert
${G_myName} ${extraInfo} -p inFile=ii -i citeConvertOverwrite
--- Book and Article ---
${G_myName} ${extraInfo} -i bookToArticle doc1.ttytex 
_EOF_
}

function noArgsHook {
  vis_examples
}

function vis_arabTexExamples {
 cat  << _EOF_
ArabTex and color/colour examples.

cd /usr/curenv/start/farsiTex
_EOF_
}


function vis_outPng {
 cat  > ${outFile}.tex << _EOF_ 
\documentclass{minimal}
\begin{document}
$1
\end{document}
_EOF_

  opDoComplain latex ${outFile}.tex 
  opDoComplain dvipng -x 3000 -o ${outFile}.png ${outFile}.dvi

  opDoComplain ls -l ${outFile}.tex ${outFile}.png
  print ${outputDir}
  if [[ "${outputDir}_" != "_" ]] ; then
    opDo FN_dirCreatePathIfNotThere ${outputDir}
    opDo cp ${outFile}.png ${outputDir}
  fi

}

function vis_bookToArticle {
  EH_assert [[ $# -gt 0 ]]

  typeset thisOne
  for thisOne in "$@" ; do
    #set -x
    typeset checkThis checkThis2
    integer x y
    checkThis=`grep "{book}" ${thisOne}` ; x=$?
    checkThis2=`grep "chapter" ${thisOne}` ; y=$?
    
#     if [ $x -ne 0 -a $y -ne 0 ] ; then
#       print "${thisOne}: Is already in article format"
#       continue
#     fi

    FN_fileSafeCopy ${thisOne} ${thisOne}.${dateTag}.book
    #/bin/mv ${thisOne} ${thisOne}.book

    cat ${thisOne}.${dateTag}.book | sed -e "s@{book}@{article}@g" | sed  -e "s@\\\\subsubsection{@\\\\subsubsubsection{@g"  | sed -e "s@\\\\subsection{@\\\\subsubsection{@g" | sed -e "s@\\\\section{@\\\\subsection{@g" | sed -e "s@\\\\chapter{@\\\\section{@g" > ${thisOne}
      

  done
}



#
# Now that we have all the parameters, get the job done.
#
EMACS=emacs
lispArgsFile="/tmp/$$.elispArgs"
lispFrameFile="/tmp/$$.elispFrame"
lispBodyFile="/tmp/$$.elispBody"


lispEntryFunc=${action}

function vis_xemacs {
  EMACS=emacs
  vis_run $*
}

function vis_emacs {
  EMACS=emacs
  vis_run $*
}

function shellToElispVars {

# all shell typset -t variables should be passed to elisp

cat > ${lispArgsFile} << _EOF_ 

(setq inFile "${inFile}")
(setq outFile "${outFile}")
(setq G_argv "${G_argv}")

_EOF_
}

function vis_run {

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

opDo ${EMACS} -q -l ${lispArgsFile} -l ${elFile} -f ${lispEntryFunc}

#/bin/rm ${lispArgsFile}

}


function vis_inputElim {

FN_fileDefunctMake ${outFile} ${outFile}.${dateTag}

shellToElispVars

vis_elFrameInputElim > ${lispFrameFile}

vis_elBodyInputElim > ${lispBodyFile}

opDo ${EMACS} -q -l ${lispArgsFile} -l ${lispFrameFile} -l ${lispBodyFile} -f main

}

function vis_elFrameInputElim {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: convertLatexElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
 (ioSetup)
 ;;(bufferWork)
 (latex-input-elim)
 (save-buffer)
 (save-buffers-kill-emacs)
)

(defun ioSetup ()
""
 (interactive)
 (let (start end)

   (find-file outFile)
   (insert-file inFile)
   )
 )

_EOF_
}

function vis_elBodyInputElim {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS: %W% %G%
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Module Description:
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;

;;; Lifted from Latexinfo mode utilities to convert LaTeX files to latexinfo.

(defun latex-input-elim ()
  (interactive)
  (if (save-excursion (re-search-forward "^\\\\\\\\input" nil t))
      (while (re-search-forward "^\\\\\\\\input" nil t)
        (save-excursion
          (skip-chars-forward "         {")
          (let ((file-name
                 (buffer-substring 
                  (point)
                  (progn
                    (skip-chars-forward "^      \n}")
                    (point)))))
            (setq file-name
                  (expand-file-name
                   (if (file-readable-p (expand-file-name file-name))
                       file-name
                     (concat file-name ".tex"))))
            (beginning-of-line 1)
            (if (file-readable-p file-name)
                (progn
                  (delete-region (point) (progn (forward-line 1) (point)))
                  (message "Inserting file %s..." file-name) ;;(sit-for 1)
                  (insert-file file-name)
                  (message "Inserting file %s...done" file-name))
              (error "I can't find the file %s" file-name))
            )))))

_EOF_
}

function vis_citeConvert {

FN_fileDefunctMake ${outFile} ${outFile}.${dateTag}

shellToElispVars

vis_elFrame > ${lispFrameFile}

vis_elBody > ${lispBodyFile}

opDo ${EMACS} -q -l ${lispArgsFile} -l ${lispFrameFile} -l ${lispBodyFile} -f main

}

function vis_citeConvertOverwrite {

FN_fileSafeCopy ${inFile} ${inFile}.${dateTag}

shellToElispVars

vis_elFrameOverwrite > ${lispFrameFile}

vis_elBody > ${lispBodyFile}

opDo ${EMACS} -q -l ${lispArgsFile} -l ${lispFrameFile} -l ${lispBodyFile} -f main

}


function vis_elFrameOverwrite {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: convertLatexElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
 (ioSetup)
 (latex-cite-convert)
 (save-buffer)
 (save-buffers-kill-emacs)
)

(defun ioSetup ()
""
 (interactive)
 (let (start end)

   (find-file inFile)
   )
 )

_EOF_
}

function vis_elFrame {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: $Id: convertLatexElisp.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
 (ioSetup)
 (latex-cite-convert)
 (save-buffer)
 (save-buffers-kill-emacs)
)

(defun ioSetup ()
""
 (interactive)
 (let (start end)

   (find-file outFile)
   (insert-file inFile)
   )
 )

_EOF_
}

function vis_elBody {
cat << _EOF_ 
;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS: %W% %G%
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Module Description:
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;

;;; Lifted from Latexinfo mode utilities to convert LaTeX files to latexinfo.

(defun latex-cite-convert ()
  (interactive)
  (while (re-search-forward "\cite\\\\[.*\\\\]" nil t)
    (replace-match "\cite" nil nil))
 )
_EOF_
}

