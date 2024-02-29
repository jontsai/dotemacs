(require 'package)

(add-to-list 'package-archives (cons "melpa-stable" "https://stable.melpa.org/packages/") t)

(package-list-packages)
(package-refresh-contents)

;; Install Dependencies

(package-install 'company)
(package-install 'compat)
(package-install 'dash)
(package-install 'flycheck)
(package-install 'helm)
(package-install 'keycast)
(package-install 'which-key)

;; Optional Modules for Productivity
;; (package-install 'org)
;; (package-install 'org-trello)

;; Deprecated
;; (package-install 'lsp-mode)
;; (package-install 'helm-lsp)
