
(require 'redo)
(global-set-key ( kbd "C-.") 'redo)
(global-set-key ( kbd "C-o") 'forward-word)
(global-set-key ( kbd "C-i") 'backward-word)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

 (defun sfp-page-down (&optional arg)
   (interactive "^P")
   (setq this-command 'next-line)
   (next-line
	(- (window-text-height)
	   next-screen-context-lines)))
(put 'sfp-page-down 'isearch-scroll t)
(put 'sfp-page-down 'CUA 'move)
    
(defun sfp-page-up (&optional arg)
  (interactive "^P")
  (setq this-command 'previous-line)
  (previous-line
   (- (window-text-height)
	  next-screen-context-lines)))
(put 'sfp-page-up 'isearch-scroll t)
(put 'sfp-page-up 'CUA 'move)
(global-set-key (kbd "C-u") 'sfp-page-up)
(global-set-key (kbd "C-j") 'sfp-page-down)

(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
	(select-window other)
    )
)

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-horizontally)
  (eshell)
  (swap-buffers-in-windows)
)

(defun my-eshell-clear-buffer ()
  "Eshell clear buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
(global-set-key [S-f8] 'my-eshell-clear-buffer)
