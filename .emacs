;;; MELPA https://melpa.org/#/getting-started
;;; REACT https://gist.github.com/CodyReichert/9dbc8bd2a104780b64891d8736682cea
;;; http://web-mode.org/
;;; https://github.com/jaypei/emacs-neotree


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; react dev ;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-enable-auto-closing nil)
  (setq web-mode-enable-auto-quoting nil)
  )
(add-hook 'web-mode-hook  'web-mode-init-hook)

(require 'flycheck)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'neotree)
(setq neo-window-width 30)
(helm-mode 1)
;;; react dev ;;;


(setq create-lockfiles nil)
(add-hook 'dired-load-hook
          (lambda ()
          (require 'dired-x)))

(cua-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages '(auto-package-update helm neotree flycheck web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)

(setq-default c-basic-offset 2)

(tool-bar-mode -1)

;; pour pouvoir scroller normalement
(setq scroll-preserve-screen-position t)

;; permet d'ouvrir les gz a la volee
(auto-compression-mode t)

(setq european-calendar-style 't)
(setq calendar-week-start-day 1)
;(setq calendar-day-name-array
;["Dimanche" "Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi"])
;(setq calendar-month-name-array
;["Janvier" "Fevrier" "Mars" "Avril" "Mai" "Juin" "Juillet"
;"Aout" "Septembre" "Octobre" "Novembre" "Decembre"])

;; Show the time in the minibuffer
(display-time)

;; scroller en douceur
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; 1 line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll 1 line at a time

;; mettre en surligné la zone de selection
(transient-mark-mode t)

;; colorisation de la syntaxe
(global-font-lock-mode t)
(add-hook 'font-lock-mode-hook
	  (lambda () (setq font-lock-maximum-decoration t)))


;; plus de BIP mais clignotement des lignes superieure et inferieure
(setq visible-bell 't)


;; AUTO-REVERT
(autoload 'auto-revert-mode "autorevert" nil t)
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
(autoload 'global-auto-revert-mode "autorevert" nil t)
(global-auto-revert-mode 1)


; Colorisation syntaxique maximale dans tous les modes
; Avec emacs 21, la colorisation est disponible en mode texte. Cool !
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


; Montrer la correspondance des parenthèses
; (systématiquement et non seulement après la frappe)
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
;(setq blink-matching-paren-on-screen t) ;; le curseur va montrer le correspondant
;(setq show-paren-style 'expression) ;; l'intérieur est highlighté
(setq blink-matching-paren-dont-ignore-comments t)


; Afficher l'heure dans la barre d'état (format 24 heures)
(setq display-time-24hr-format t)
(display-time)


; Inhiber l'affichage du message d'accueil
(setq inhibit-startup-message t)


; C'est fastidieux de taper « yes » pour confirmer, raccourcissons
; cela à « y » (idem pour « no », désormais « n »).
(fset 'yes-or-no-p 'y-or-n-p)


; Supprimer les fichiers de sauvegarde en quittant.
; (vous savez, ces fameux fichiers dont le nom se termine par « ~ »)
(setq make-backup-files nil)


; Pour l'impression, du papier au format A4 est utilisé
(setq ps-paper-type 'a4)


; Si cette variable est différente de 'nil', lorsque l'on est à la fin
; d'une ligne, le déplacement vertical du curseur s'accompagne d'un
; déplacement horizontal pour atteindre la fin de la ligne courante.
; Si cette variable vaut 'nil', le déplacement est strictement vertical.
(setq track-eol nil)


; La fin d'une phrase n'est pas marquée par un point suivi de deux espaces,
; un seul suffit.
(setq sentence-end-double-space nil)


; Ne pas remplacer les espaces par des tabulations
(setq indent-tabs-mode nil)


(defun save-buffer-thai ()
  "Save and reparse page"
  (interactive)
  (save-buffer())
;  (mmm-parse-buffer)
)

; des affectations de touches
(global-set-key [f1]  'point-to-register)
(global-set-key [f2]  'jump-to-register)
(global-set-key [f3]  'query-replace)
(global-set-key [f4]  'goto-line)

(global-set-key [f5]  'save-buffer-thai)
(global-set-key [f6]  'helm-occur)
(global-set-key [f7] 'neotree-toggle)
(global-set-key [f8] 'neotree-change-root)

(global-set-key [f9]  'helm-buffers-list)
(global-set-key [f10] 'apropos)



; Activation des fonctions « upcase-region » et « downcase-region »
; Ces fonctions sont désactivées par défaut sous Emacs 21 ; pourquoi ?
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'default-frame-alist
                       '(font . "DejaVu Sans Mono-10"))
;;(load-theme 'misterioso)
(load-theme 'deeper-blue)
