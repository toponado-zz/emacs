;;===========================================================
;;键绑定
;;===========================================================

;;============================================================
;;必备扩展
;;============================================================
;;-----------------redo
(require 'redo)
(global-set-key ( kbd "C-.") 'redo)
(global-set-key ( kbd "C-o") 'forward-word)
(global-set-key ( kbd "C-i") 'backward-word)
(load-library "smart-compile.el")
(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;f3为查找字符串,alt+f3关闭当前缓冲区
(global-set-key [C-f3] 'grep-find)
(global-set-key [f3] 'kill-this-buffer)

;;.emacs中设一个speedbar的快捷键
(global-set-key [(f4)] 'speedbar-get-focus)
;;ctrl-f4,激活,ecb
(global-set-key [C-f4] 'ecb-activate)

;;F6显示/隐藏工具栏 方便调试
(global-set-key [f6] 'tool-bar-mode)
;;ctrl-F6显示/隐藏菜单栏 ;; M-x menu-bar-open
(global-set-key [C-f6] 'menu-bar-mode)

(global-set-key [f5] 'gdb)

;;  C-f7, 设置编译命令; f7, 保存所有文件然后编译当前窗口文件
(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  
(setq-default compile-command "make")    
(global-set-key [C-f7] 'compile)
;; (global-set-key [f7] 'du-onekey-compile)
(global-set-key [f7] 'smart-compile)
(global-set-key [C-f5] 'smart-run)

;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell,shift+f8清空eshell
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

;;设置[C-f9]为调用dired命令
(global-set-key [C-f9] 'dired)
(global-set-key [f9] 'other-window);f9在其他窗口之间旋转

;;设置F10为撤销
(global-set-key [C-f10] 'undo)

;;设置F11快捷键指定Emacs 的日历系统
(global-set-key [C-f11] 'calendar) 

;;设置C-F12 快速察看日程安排
;;F12调到函数定义
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [C-f12] 'list-bookmarks)
;;shift-f12跳回去
(global-set-key [S-f12]
	(lambda ()
	(interactive)
	(if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
	(error "Semantic Bookmark ring is currently empty"))
	(let* ((ring (oref semantic-mru-bookmark-ring ring))
	(alist (semantic-mrub-ring-to-assoc-list ring))
	(first (cdr (car alist))))
	(if (semantic-equivalent-tag-p (oref first tag)
	(semantic-current-tag))
	(setq frist (cdr (car (cdr alist)))))
	(semantic-mrub-switch-tags first))))

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;;==================ecb的配置=================================
;;为了ecb窗口的切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;;隐藏和显示ecb窗口
(global-set-key [f11] 'ecb-hide-ecb-windows)
(global-set-key [S-f11] 'ecb-show-ecb-windows)



;;设置M-g为goto-line
(global-set-key (kbd "M-g") 'goto-line)

;;取消control+space键设为mark
(global-set-key (kbd "C-SPC") 'nil)

;;这样 我就不用按 C-@ 来 setmark 了, C-@ 很不好按。
(global-set-key (kbd "M-<SPC>") 'set-mark-command)


;;设置home键指向buffer开头，end键指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-,") 'scroll-left)
;; "C-."设为屏幕右移命令
(global-set-key (kbd "C-.") 'scroll-right)


;;C-z 设置标记
(global-set-key (kbd "C-z") 'set-mark-command)
;;关闭当前窗口,alt+4
(global-set-key (kbd "M-4") 'delete-window)
;;(global-set-key (kbd "M-4") 'kill-this-buffer)
;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)
;;切换到其他窗口，alt+0
(global-set-key (kbd "M-0") 'other-window)
;;显示缓冲区完整名称
(global-set-key (kbd "M-5") 'display-buffer-name)

(defun kill-buffer-when-exit ()
"Close assotiated buffer when a process exited"
(let ((current-process (ignore-errors (get-buffer-process (current-buffer)))))
(when current-process
(set-process-sentinel current-process
(lambda (watch-process change-state)
(when (string-match "\\(finished\\|exited\\)" change-state)
(kill-buffer (process-buffer watch-process))))))))
(add-hook 'gdb-mode-hook 'kill-buffer-when-exit)
(add-hook 'term-mode-hook 'kill-buffer-when-exit)


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

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(defun move-to-window-line-middle ()
  (interactive)
  (let* ((wb-height (window-buffer-height (get-buffer-window)))
        (actual-height (if (> wb-height (window-height))
                           (window-height)
                         wb-height)))
    (move-to-window-line (/ actual-height 2))))

(defun move_or_scroll_half()
  "when cursor locate in top half window, this function will move cursor to middle of window,if cursor is in bottom half window, this function will scroll forward half of window"
  (interactive)
  (setq n (line-number-at-pos))
  (setq halflen (/ (count-lines (window-start) (window-end) ) 2))
  (setq top_window_line (count-lines (window-start) (point-min) ))
  (setq middleline (+ top_window_line halflen))
  ;(message "n: %d halflen: %d middleline: %d" n halflen middleline)
  (if (< n middleline)
		(move-to-window-line-middle)
	  (scroll-up-half)))
  
(global-set-key (kbd "C-u") 'sfp-page-up)
(global-set-key (kbd "C-j") 'move_or_scroll_half)

;;================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;自动插入括号;;;;;;;;;;;;;;
;;(show-paren-mode t)
;;(setq skeleton-pair t)
;;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd  "{") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "<" ) 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "“" ) 'skeleton-pair-insert-maybe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





