;;emacs参数
;; -nw 不使用图形界面 -no-window
;; -q  不加载配置文件
;; --debug-init

;;;; 添加Emacs搜索路径
(add-to-list 'load-path "~/_emacs")
(add-to-list 'load-path "~/install/ecb-2.40")
(add-to-list 'load-path "~/_emacs/codepilot")
(add-to-list 'load-path "~/_emacs/emacs-eclim")
(add-to-list 'load-path "~/_emacs/icicles")
(add-to-list 'load-path "~/_emacs/gnuserv")

;;模板功能
(add-to-list 'load-path "~/install/yasnippet-0.6.1c")
;;自动补全
(add-to-list 'load-path "~/install/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/install/auto-complete-1.3.1/dict")
(ac-config-default)

;;;;读取脚本
(load "base.el")
(load "cykbd.el")
;;(load "addon.el")

;;为了编程的配置
(load "cycode.el")

;;ecb自动添加===============================================================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-empty-lines t)
 '(mouse-1-click-in-non-selected-windows t)
 '(mouse-drag-copy-region t)
 '(mouse-yank-at-point t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 
;;ecb自动添加结束============================================================
