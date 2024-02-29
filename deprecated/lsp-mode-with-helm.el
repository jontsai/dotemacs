;--- lsp-mode with helm-lsp -----------------------------------------------------------------
; By:     jontsai
; Date Added:   2024.02.28
; Deprecated:   2024.02.28
; Reason: Use eglot in favor of lsp-mode
;
; References:
; - https://github.com/jontsai/emacs-lsp-mode
; - https://github.com/jontsai/emacs-helm-lsp
; - https://emacs-lsp.github.io/lsp-mode/page/installation/#use-package

;; (defvar lsp-keymap-prefix)
;; (setq lsp-keymap-prefix "s-l")

;; (require 'lsp-mode)

;; ;; Defer LSP server startup (and DidOpen notifications) until the buffer is visible
;; ;; (add-hook 'prog-mode-hook #'lsp)
;; ;; (add-hook 'prog-mode-hook #'lsp-deferred)
;; (add-hook 'python-mode #'lsp-deferred)
;; (add-hook 'ruby-mode #'lsp-deferred))

(use-package lsp-mode
    :init
    ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
    (setq lsp-keymap-prefix "C-c k")
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
              ;; (XXX-mode . lsp)
              ;; (python-mode . lsp)
              ;; (ruby-mode . lsp)
              ;; (XXX-mode . lsp-deferred)
              (python-mode . lsp-deferred)
              (ruby-mode . lsp-deferred)
              ;; if you want which-key integration
              (lsp-mode . lsp-enable-which-key-integration))
    ;; :commands lsp
    :commands (lsp lsp-deferred)
    )

;; optional extensions to pair with LSP
(use-package helm-lsp :commands helm-lsp-workspace-symbol) ; Helm, yes, we love it!
;; (use-package lsp-ui :commands lsp-ui-mode) ; lsp-ui does not work well with emacs-nox
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol) ; Ivy
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; (use-package dap-mode) ; For debugger
;; (use-package dap-LANGUAGE) ; to load the dap adapter for your language

;---------------------------------------------------------------------------
