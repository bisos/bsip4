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
 (html-shortTitle)
 (html-shortTitleCaps)
 (html-shortTitleNoNewLine)  ;; MB-Feb11,2018 Had to do this for resumes
 )

(defun bx:fix:toHrefConvert ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point this-url this-anchor-text)
    (while (re-search-forward "\\htmladdnormallink{" nil t)
      (progn
	(setq start-point (point))
	(re-search-forward "}{" nil t)
	(setq end-point (point))
	(kill-region start-point end-point)
	(re-search-forward "}" nil t)
	(insert "{")
	(yank)
	(delete-char -1)
	)
      )
    )
  (goto-char (point-min))
  (replace-string  "\htmladdnormallink" "\href")
  )

(defun html-shortTitleNoNewLine ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<title>" nil t)
    (setq start-point (point))
    (if 
	(re-search-forward "</title>" nil t)
	(progn
	  (setq end-point (match-beginning 0))
	  (delete-region start-point end-point)
	  ))
    )
  )


(defun html-shortTitle ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<title>" nil t)
    (end-of-line)
    (setq start-point (point))
    (if 
	(re-search-forward "</title>" nil t)
	(progn
	  (setq end-point (match-beginning 0))
	  (delete-region start-point end-point)
	  ))
    )
  )

(defun html-shortTitleCaps ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<TITLE>" nil t)
    (end-of-line)
    (setq start-point (point))
    (if 
	(re-search-forward "</TITLE>" nil t)
	(progn
	  (setq end-point (match-beginning 0))
	  (delete-region start-point end-point)
	  ))
    )
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

  (goto-char (point-min))
  ;;;(while (re-search-forward "x.png. alt=.*width=" nil t)
  (while 
      (re-search-forward "x.png. alt=.*width=" nil t)
    (backward-word 1)
    (kill-word 6)
    (delete-char 1)
    )
  )


;;;
;;; Hevea Html
;;;

(defun mainHevea ()
""
 ;;(ioOverwriteSetup)
 (ioFilterSetup)
 (heveaHtmlProc)
 (save-buffer)
 (save-buffers-kill-emacs)
)


(defun heveaHtmlProc ()
  (interactive)
  (goto-char (point-min))
  (heveaHtmlStyleStrip)
  (heveaHtmlHeadSectionInsert)
  (heveaHtmlTocReplace)
  ;;;(heveaHtmlEndReplace)
  ;;;(heveaHtmlDeTitle)
  (heveaHtmlDeFooter)
  )

(defun mainDeTitle ()
 (ioOverwriteSetup)
 ;;(ioFilterSetup)
 (heveaHtmlDeTitle)
 (save-buffer)
 (save-buffers-kill-emacs)
 )


(defun mainDeTitleCompletely ()
 (ioOverwriteSetup)
 ;;(ioFilterSetup)
 (heveaHtmlDeTitleCompletely)
 (save-buffer)
 (save-buffers-kill-emacs)
 )


(defun heveaHtmlStyleStrip ()
  (interactive)
  (goto-char (point-min))

  (let (start-point)
    (re-search-forward "^<STYLE type=\"text/css\">" nil t)
    (beginning-of-line)
    (setq start-point (point))
    (re-search-forward "^</STYLE>$" nil t)
    (delete-region start-point (point))
    )
  )


(defun heveaHtmlHeadSectionInsert ()
  (interactive)
  (goto-char (point-min))

  (let (start-point)
    (re-search-forward "^<META name=\"GENERATOR\"" nil t)
    (beginning-of-line)
    (forward-line)
    (if (file-readable-p "../headSectionInsert.html")
	(progn
	  (insert-file-contents "../headSectionInsert.html")
	  (message "Inserted ../headSectionInsert.html")
	  )
      (message "Missing ../headSectionInsert.html -- Skipped")
      )
    )
  )

(defun heveaHtmlEndReplace ()
  (interactive)
  (goto-char (point-min))

  (re-search-forward "^<HR SIZE=2><BLOCKQUOTE CLASS=\"quote\"><EM>This document" nil t)
  (beginning-of-line)
  (kill-line 2)

  (heveaHtmlInsertEndText)
  )

(defun heveaHtmlInsertEndText ()
  (interactive)
  (insert "<HR SIZE=2><BLOCKQUOTE CLASS=\"quote\">
<EM>This document was produced by </EM><A HREF=\"http://www.by-star.net\"><EM>ByStar Document Processing Toolset</EM></A><EM> which includes: XeLaTeX, XePersian, HaVeA and Plone3. </EM>
</BLOCKQUOTE>
</BODY>
")
  )



(defun heveaHtmlTocReplace ()
""
 (interactive)

 (goto-char (point-min))

 (replace-string 
  "CLASS=\"toc\"" 
  "CLASS=\"TofC\"" 
  nil 
  (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)))

 (goto-char (point-min))

 (replace-string 
  "class=\"toc\"" 
  "class=\"TofC\"" 
  nil 
  (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)))

 (goto-char (point-min))

 (replace-string 
  " CLASS=\"li-toc\"" 
  "" 
  nil 
  (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)))

 (goto-char (point-min))

 (replace-string 
  " class=\"li-toc\"" 
  "" 
  nil 
  (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)))
 
 )

(defun heveaHtmlDeTitle ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<TITLE>" nil t)
    (setq start-point (point))
    (re-search-forward "</TITLE>" nil t)
    (setq end-point (match-beginning 0))
    (delete-region start-point end-point)
    )
  )


(defun heveaHtmlDeTitleCompletely ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<TITLE>" nil t)
    (setq start-point (match-beginning 0))
    (re-search-forward "</TITLE>" nil t)
    (setq end-point (point))
    (delete-region start-point end-point)
    )
  )


(defun heveaHtmlDeFooter ()
  (interactive)
  (goto-char (point-min))

  (let (start-point end-point)
    (re-search-forward "<!--FOOTER-->" nil t)
    (setq start-point (point))
    (re-search-forward "</BODY>" nil t)
    (setq end-point (match-beginning 0))
    (delete-region start-point end-point)
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (mainRevealHevea) [[elisp:(org-cycle)][| ]]
")

(defun mainRevealHevea ()
""
 ;;(ioOverwriteSetup)
 (ioFilterSetup)
 (revealHeveaHtmlProc)
 (save-buffer)
 (save-buffers-kill-emacs)
)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (heveaHtmlProc) [[elisp:(org-cycle)][| ]]
")

(defun revealHeveaHtmlProc ()
  (interactive)
  (pointMinToFirstSectionStrip)
  (pointMaxToLastSectionStrip)
  )


(defun pointMinToFirstSectionStrip ()
  (interactive)
  (goto-char (point-min))

  (let
      ((start-point))
    ;;(re-search-forward "<section>" nil t)
    (re-search-forward "<section" nil t)    
    (setq start-point (match-beginning 0))
    (delete-region (point-min) start-point)
    )
  )


(defun pointMaxToLastSectionStrip ()
  (interactive)
  (goto-char (point-max))

  (let
      ((end-point))
    (re-search-backward "</section>" nil t)
    (setq end-point (match-end 0))    
    (delete-region end-point (point-max))
    )
  )
