(require 'package)

;; Add MELPA Stable and GNU ELPA to package archives
(add-to-list 'package-archives (cons "melpa-stable" "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives (cons "gnu" "https://elpa.gnu.org/packages/") t)

(message "Running package-initialize...")
(package-initialize)
(message "Running package-refresh-contents...")
(package-refresh-contents)

;; Upgrade all packages
(let ((package-menu-async nil))  ; Ensure synchronous operations
    (package-list-packages)      ; Fetch list of packages
    (package-menu-mark-upgrades) ; Mark available upgrades
    (package-menu-execute t))    ; Execute upgrades


;; Install Dependencies
;; List of packages to install
(setq package-list
    '(
         company ; https://melpa.org/#/company
         compat ; https://elpa.gnu.org/packages/compat.html
         dash ; https://melpa.org/#/dash
         direnv ; https://melpa.org/#/direnv
         f ; https://melpa.org/#/f
         flycheck ; https://melpa.org/#/flycheck
         helm ; https://melpa.org/#/helm
         jsonrpc ; https://elpa.gnu.org/packages/jsonrpc.html
         keycast ; https://melpa.org/#/keycast
         s ; https://melpa.org/#/s
         which-key ; https://melpa.org/#/which-key

         ;; Optional Modules for Productivity
         ; org
         ; org-trello
         ; Deprecated
         ; lsp-mode
         ; helm-lsp
         ))

;; Loop through each package and install if not already installed
(dolist (pkg package-list)
    (if (package-installed-p pkg)
        (message "Skipping %s (already installed)" (symbol-name pkg))
        (progn
            (message "Installing %s" (symbol-name pkg))
            (package-install pkg))))
