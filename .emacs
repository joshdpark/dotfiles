(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'ess-r-mode)
;; I generally will not use evil mode unless I have to

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a314da06fccf92da6e94b8daf863f39bdf95aad2087591cec7a7481a60dbab3d" "efef7ea25d225f2478248fad987d61ecf8827ab26c3a300ba772c546f67f1da6" default))
 '(package-selected-packages '(meow silkworm-theme company ess evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'exec-path "/opt/homebrew/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-14"))

(auto-fill-mode)

(global-set-key [f5] (quote evil-mode))
