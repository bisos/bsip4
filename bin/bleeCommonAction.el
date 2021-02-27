(defun latexNewlineFixFile (<fileName)
  "General panel cleanup in current buffer."
  (interactive "fName Of File: ")
  (let (
	($curBuf (current-buffer))
	)
    (save-excursion 
      (find-file <fileName)
      (latexNewlineFix)
      (save-buffer)
      (kill-buffer)
      (set-buffer $curBuf)
      )
    )
  )



(defun latexNewlineFix ()
  "General panel cleanup in current buffer."
  (interactive)
  (goto-char (point-min))
  (show-all)
  (replace-string "\\\\" "\\newline" nil nil nil nil nil)
  )



(defun filterBufferPanelCleanups ()
  "General panel cleanup in current buffer."
  (interactive)
  (goto-char (point-min))
  (show-all)
  (bgx:org-dblock:named/eliminateForward "bxPanel:common/title-plus")
  (bgx:org-dblock:named/eliminateForward "blee:bxPanel:foldingSection :outLevel 1 :sep t :title \"Panel Tree Navigation\" :anchor \"panelTreeNav\" :extraInfo \"\"")
  (bgx:org-dblock:named/eliminateForward "blee:bxPanel:linedTreeNavigator")
  )

(defun filterBufferAddRoamTitle ()
  "General panel cleanup in current buffer."
  (interactive)
  (goto-char (point-min))
  (show-all)
  (org-end-of-line)
  (insert (format "\n####+BEGIN: bxPanel:common/title-plus\n####+END"))
  (org-dblock-update)
  )



(defun filterFilePanelCleanups (<fileName)
  "General panel cleanup in current buffer."
  (interactive "fName Of File: ")
  (let (
	($curBuf (current-buffer))
	)
    (find-file <fileName)
    (filterBufferPanelCleanups)
    (filterBufferAddRoamTitle)
    (save-buffer)
    (kill-buffer)
    (set-buffer $curBuf)
    )
  )

