(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;;'(custom-enabled-themes (quote (naquadah)))
;;'(custom-safe-themes (quote("702ed17ae44a6f3cb71ed2e5bf5edeec06a771c80eb61b265ebf8a658edd2462" default)))
'(tool-bar-mode nil))

;; Hier der Kram der nix mit Themes, fonts, etc zu tun hat.
(global-linum-mode t)
(setq make-backup-files nil)
(setq inhibit-startup-message t)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
     
;; Rinari
(add-to-list 'load-path "~/Projects/config/rinari")
(require 'rinari)
(put 'upcase-region 'disabled nil)
