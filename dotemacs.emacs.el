;============================================================================
; dotemacs.emacs.el (fka: jontsai.emacs.el, JTemacs.el)
; By: Jonathan Tsai
; https://github.com/jontsai/dotemacs
;
; Revision History
; ----------------
; 2022.09.04 Re-sets name macro keybinding, load user customizations
; 2022.08.24 Always include MELPA and ELPA
; 2022.08.14 Provide (C-c l) as an alternate to (C-SPC) for set-mark-command
; 2022.03.29 Provide (C-c m) as an alternate to (C-SPC) for set-mark-command
; 2020.12.27 Adds prettier-js
; 2020.04.30 Load user-specific dotemacs
; 2020.01.17 Automatically run isort on Python files
; 2019.05.09 Overwrite some default Helm key mappings for tab completion
; 2019.05.09 Lots of yummy shortcut keys
; 2019.05.09 Disable menu-bar-mode
; 2019.05.08 Add diary-face and holiday-face hack
; 2019.05.08 Add MELPA (Milkypostman's Emacs Lisp Package Archive)
; 2019.05.08 Add Helm keybindings
; 2019.05.07 Put Autosave and Backups directory inside of user-emacs-directory
; 2018.06.10 Commented some stuff out for Emacs 26 compatibility
; 2009.04.24 Added autosave and backup back in after a huge crash :(
; 2005.04.23 included PHP, Verilog, Visual, VB modes
; 2004.09.12 emacs-lisp file can be byte compiled for faster load
; 2001.01.20 Modified Documentation for www.geocities.com/IntroToEECS/
; 2000.06.01 Original RSemacs.emacs by Richard Shiao
; 1998.xx.xx local modifications merged with cs61a class master emacs startup file
;
; Authors:
; ???? - 1998: Unknown - Copyright (C) 1998 Regents of California
; 1998 - 2001: Richard Shiao
; 2004 - present: Jonathan Tsai
;
; Documentation
;
;============================================================================
; Purpose:  This .emacs file was created from examining many examples.
;           It is mainly for personal use but includes features that I
;           think are useful to other people as well.  People new to .emacs
;           files may find this file a useful example.
;           Some features included are personalizing color settings,
;           a delete key that deletes forward, indenting regions with
;           control-c-i, useful function keys, switching between buffers
;           with control-tab, and PC-styled keybindings and selction for text
;           selection, cutting, copying, and pasting.
;
; Extra:    I have chosen colors that fit with the Cal spirit.
;
;
; Features: I.   Starting Emacs
;                - Enable Debugging on error (currently commented out)
;                - Version check (currently supports Xemacs 20.4 on Linux)
;                - Welcome message
;                - Setting home directory
;                - Silent the bell (currently commented out)
;                - Exiting Emacs requires confirmation
;           II.  Display and Colors
;                - Enable Font Lock Mode
;                - Show matching parentheses on cursor-over too
;                - Window size, location, title, modeline
;                - Clock (currently commented out)
;                - Colors for specific faces
;           III. Program Behavior
;                - Text mode
;                - Set kill ring
;                - Set auto save character interval
;                - Transient-Mark mode
;                - Auto-Fill mode
;                - Set word wrapping width
;                - Toggle Horizontal scroll bars (currently commented out)
;                - Scroll down 1 line at a time rather than a huge section
;                - Don't add more lines when scrolling past end of buffer
;                - Resize mini-buffer automatically
;                - Substitute yes/no responses to y/n
;                - Specify tab width
;                - Substitute tabs with spaces
;                - Search is not case-sensitive
;                - End files with a newline character
;           IV.  Key Bindings
;                - Use PC-style key bindings and selection... YES!!!
;                - Shift-Tab completes abbreviated words
;                - Delete key deletes forward
;                - C-Backspace deletes word
;                - C-PageUp/PageDown scrolls other buffer
;                - PageUp/PageDown remembers cursor position
;                - Cut with C-c x or C-c C-x
;                - Copy with C-c c or C-c C-c
;                - Paste with C-c v or C-c C-v
;                - Select all with C-c a or C-c C-a
;                - Compare Windows with C-c w
;                - GoTo line with C-c g
;                - Indent regions with C-c i
;                - Center line with C-c C-e
;                - Comment out region with C-c o
;                - Function keys
;                           f1  - Help
;                     Shift f1  - Man
;                           f2  - Save Buffer
;                *    Shift f2  - Save All Buffers
;                           f3  - Open
;                     Shift f3  - Open .emacs
;                           f4  - Close Buffer
;                *    Shift f4  - Save All and Quit
;                           f5  - Compile
;                           f6  - Next Error
;                     Shift f6  - First Error
;                     Ctrl  f6  - Previous Error
;                           f7  - GoTo Line
;                           f8  - Comment Region
;                     Shift f8  - Uncomment Region
;                           f9  - Indent Region
;                           f10 - One Window
;                     Shift f10 - Two Windows (Top and Bottom)
;                     Ctrl  f10 - Two Windows (Left and Right)
;                           f11 - Switch Window
;                *          f12 - Start/End Keyboard Macro
;                     Shift f12 - Name Last Keyboard Macro
;                     Ctrl  f12 - Call Last Keyboard Macro
;                - Buffer opens in same window
;                - Disable C-x f since C-x C-f is find file
;                - Disable C-x C-k since C-x k is kill
;                - Disable C-t since it's close to y
;                - Disable C-a since I think Select All
;                - Disable C-q since I think Quit
;                * Disable S-backspace
;                - Load Buffer Menu in same window with C-x C-b
;                - Undo with C-z
;                - Save with C-s
;           V.   Mouse Bindings
;                - Scroll with Mouse-1
;                - Select from completion list with Mouse-1
;                - Select from Buffer Menu with Mouse-1
;                - Show Context-Sensitive Menu with Mouse-2
;           VI.  Mail
;                - Enable alias
;           VII. Additional Functions
;                - Open .emacs with Shift-f3, by Richard Shiao
;                - Toggle keyboard macro recording with f12
;                - Save all with Shift-f2
;                - Save all and Quit with Shift-f4
;                - Buffer Switching, by Young-il Choo
;                  Use C-tab to switch buffer.
;                - Saving the Emacs Desktop, by Richard Shiao
;                  Opens files from last session upon starting.
;           Look for successful loading confirmation in Messages buffer.
;
; * denotes a feature that is not yet implemented or buggy.
;
; Version History:
;      Created:  Richard Shiao
;                IntroToEECS@yahoo.com
;                2000/06/01
;      Modified:
;
; If you are accessing this file indirectly, there is a good chance that it
; has been modified.  To see the original file, official releases, and
; the most recent version, go to:
; www.geocities.com/IntroToEECS
;============================================================================


;--- Copyright and Legal Information ----------------------------------------
; (c)Copyright 2000 by Richard Shiao.
; You may share, use, and modify it freely, provided you include the
; following text next to borrowed code:
;
;    Original File: Richard E. Shiao 2000/06/03
;    For the most recent version of original file,
;    go to  www.geocities.com/IntroToEECS
;---------------------------------------------------------------------------

;--- Credits ----------------------------------------------------------------
; Here is a basic list of where some of my ideas came from:
;
; Steve Ackermann <sackermann@itree.com.au> -
; PC-style selection and bindings.  Simple two-liner setting, but it
; made a huge difference, and was one of the main goals of my writing
; my own .emacs file.
;
; Young-il Choo <choo@cs.yale.edu> -
; Control-Tab between buffers.  Convenient.  I also see it all over the
; place in many different people's files.  Some people tried to steal credit
; for themselves, even with the function named "yic-next-buffer"!
;
; Steve Dodd <sdodd@undergrad.math.uwaterloo.ca> -
; Mouse and keyboard bingdings.  Many useful features.  Another file liked
; by many people.
;
; Dave Gallucci <David.Gallucci@nasd.com> -
; Set a backups directory.  It's good to centralize those backup~ files.
; Too bad I don't have the "backup" package to actually use it yet.
;
; Ingo Koch <koch@dotemacs.de> -
; Confirmation message at the end.
; (This person maintains a whole website devoted to .emacs files.
; It's current and useful.  Check it out at: www.dotemacs.de)
;
; Jayakrishnan Nair <jayakrishnan@netscape.net> -
; Debug-on-error and writing progress messages to the Message buffer.
; I don't use it, but it's nice to know it's there if I ever want to.
;
; Jason Rumney <jasonr@altavista.net> -
; Mouse-2 menu.  Cool... who pastes with the mouse-2 button anyway?
;---------------------------------------------------------------------------

;--- Notes and Reminders ---------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
;
; Customizing: Use Help/Customize menu to change settings-
;              User personal information and colors
;
; Help:        Type: C-h or F1
;              Mode Help: C-h m
;              Look under the Help/Manuals menu for detailed information.
;              The FAQ file is a useful place to start.
;
; Mail:        Enter mail mode, type `C-x m'
;              Enter RMAIL (for reading mail), type `M-x rmail'
;
; Scheme:      Type: M-x run-scheme, but it doesn't work on my system right
;              now for some reason.
;
; Language:    Stephen Tse's file has Chinese capabilities.  Available
;              at www.dotemacs.de.  Also see www.dict.org
;
; Macros:      Start with C-x ( or F12.
;              Type macro.
;              Finish with C-x ) or F12.
;              M-x name-last-kbd-macro to name macro.
;              M-x call-last-kbd-macro to execute.
;              M-x insert-kbd-macro followed by the name
;                 to insert the key sequence equivalent into your code
;                 for your .emacs file.  (This is very useful if you are
;                 unfamiliar with the key binding syntax).
;
; Compiling:   Byte compile this file to make emacs load faster.
;              Select "Byte Compile This File" under the Emacs-Lisp menu.
;              Compile it as .NameOfFile.elc and then put
;                 (load-file "~/.NameOfFile.elc")
;              in your normal .emacs file (where NameOfFile is any name
;              you choose).
;---------------------------------------------------------------------------


;--- MELPA and Packages------------------------------------------------------
; By:     jontsai
; Date:   2019.05.08
; Source: https://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/"))))

; Org mode
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;---------------------------------------------------------------------------


;--- Org mode ------------------------------------------------------
; By:     jontsai
; Date:   2019.05.08
; Source: http://org-trello.github.io/usage.html#automatic-org-trello-files-in-emacs

(add-hook 'org-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name (current-buffer))))
              (when (and filename (string= "trello" (file-name-extension filename)))
              (org-trello-mode)))))

;---------------------------------------------------------------------------


;--- Starting Emacs --------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

;(setq debug-on-error t) ;; Currently turned off
(message "Now loading jontsai's .emacs file...")
(message "Scroll down the message buffer to see if loading successful...")

(defun running-at-least (major minor)
  (or (> emacs-major-version major)
	(and (= emacs-major-version major)
	     (>= emacs-minor-version minor))))

(if (running-at-least 24 0)
    (message "Running at least Emacs 24.0 ... Welcome to Emacs!")
    (message "WARNING: Whoa, you should upgrade Emacs to at least 24.0!"))

; Setting home directory
; If I ever use emacs on a pc,
; (setenv "HOME" "c:/emacs")

;; http://www.dotemacs.de/dotfiles/JanBorsodi/JanBorsodi.emacs.html
;; Add .site-lisp and site-lisp in home directory to load path
;; allows people to add emacs files if access to the global site-lisp is not possible
(setq load-path (nconc (list (concat (getenv "HOME") "/.site-lisp") ) load-path ))
(setq load-path (nconc (list (concat (getenv "HOME") "/site-lisp") ) load-path ))

; If I ever want to turn off the beep...
; (set-message-beep 'silent)

; Confirm Emacs exit
; Disabled 2003.05.16 by Jonathan Tsai
; uncomment to enable confirmation
;(setq kill-emacs-query-functions
;      (cons (lambda () (y-or-n-p "Quit Emacs?"))
;	    kill-emacs-query-functions))
;---------------------------------------------------------------------------


;--- Display and Colors ----------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
;
; Default color, location, size, and title options for all frames
; Note: Go to Edit/Text Properties/Display Faces to see a list of available
;       faces and their current color settings.
;       Go to Edit/Text Properties/Display Colors to see a list of available
;       colors
; Note: Some settings like font-lock-mode and show-paren-mode in particular
;       need to come before the color assignments to the faces.
;       Make sure you preserve this order.

; Use color coding for syntax during programming.
; Important line!
(global-font-lock-mode t)

; Show matching parentheses upon cursor-over
(show-paren-mode 1)

; Turn on line numbers globally
(global-linum-mode 1)

(if (member window-system '(x w32))
    (let ((setting 'laptop))
      (cond ((eq setting 'laptop)
             (progn
               (set-face-font `default "-adobe-courier-bold-r-*-*-20-*-*-*-*-*-*")
               (set-frame-height (selected-frame) 36)
               (set-frame-width (selected-frame) 80)))
            ((eq setting 'desktop)
             (progn
               (set-face-font `default "-adobe-courier-bold-r-*-*-*-140-120-120-*-*-*-*")
               (set-frame-height (selected-frame) 50)
               (set-frame-width (selected-frame) 100)))
            ((eq setting 'unix)
             (set-face-font `default "-adobe-courier-bold-r-*-*-*-120-90-90-*-*-*-*")))))

;--- BEGIN COLORING ---
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
; Colors and font updated by Jonathan Tsai 2003/05/16


(set-background-color "Black")
(set-foreground-color "Green")

;; (add-to-list 'default-frame-alist
;;     '(background-color . "Black")
;;     '(foreground-color . "Green"))

(set-cursor-color "CornflowerBlue")
(set-face-foreground 'font-lock-builtin-face       "MediumBlue") ;MediumBlue
(set-face-foreground 'font-lock-comment-face       "Orange") ;DarkGreen
(set-face-foreground 'font-lock-constant-face      "Pink") ;Maroon
(set-face-foreground 'font-lock-function-name-face "Green") ;Black
(make-face-bold      'font-lock-function-name-face)
(set-face-foreground 'font-lock-keyword-face       "LightGreen") ;Blue
(set-face-foreground 'font-lock-string-face        "White") ;Firebrick
(set-face-foreground 'font-lock-type-face          "Coral") ;Coral
(set-face-foreground 'font-lock-variable-name-face "LightGray") ;DarkSlateGray
(set-face-foreground 'font-lock-warning-face       "Pink") ;Red
(make-face-bold      'font-lock-warning-face)

(set-face-foreground 'bold                         "Gold")
(set-face-background 'bold                         "Navy")
(set-face-foreground 'bold-italic                  "Navy")
(set-face-background 'bold-italic                  "Gold")
(set-face-foreground 'highlight                    "Navy")
(set-face-background 'highlight                    "Gold")
(set-face-foreground 'italic                       "Blue")
;(set-face-foreground 'mode-line                     "Gold")
;(set-face-background 'mode-line                     "Navy")
;(make-face-bold      'mode-line)
(set-face-foreground 'region                       "Blue") ;White
(set-face-background 'region                       "Yellow") ;Navy
(set-face-background 'secondary-selection          "LightBlue")
; TODO: invalid in Emacs 26
;(set-face-foreground 'show-paren-match-face        "Gold")
;(set-face-background 'show-paren-match-face        "Navy")

; "... Down with the Red and White!
;  California's out for a victory..."
;  From: The "Stanfurd Jonah" Fight Song
;        Ted Haley, Class of 1915
; Following settings signal a parentheses error.
;; TODO: invalid in Emacs 26
;; (set-face-background 'show-paren-mismatch-face     "Red") ;Red
;; (set-face-foreground 'show-paren-mismatch-face     "White") ;White
;; (make-face-bold      'show-paren-mismatch-face)

; Calendar highlighting colors
(defvar calendar-load-hook nil)
(setq calendar-load-hook
      '(lambda ()
         (set-face-foreground 'diary-face          "MediumBlue") ;MediumBlue
         (set-face-background 'holiday-face        "SlateBlue") ;SlateBlue
         (set-face-foreground 'holiday-face        "White"))) ;White

; quick hack to define diary-face, holiday-face
(copy-face 'bold 'diary-face)
(copy-face 'bold 'holiday-face)

;--- END COLORING ---

; Title Bar (%f is file name, %b is buffer name)
; Original title follows, but is too long, so I'm using the alternate below.
;(setq-default frame-title-format
;              (list "Richard's Emacs" emacs-version "("
;                    invocation-directory invocation-name "@" system-name
;                    ")- %f"))
(setq-default frame-title-format "Emacs - %b")


; Icon Bar
(setq-default icon-title-format "Emacs - %b")

; Show name of current function in modeline
(which-function-mode t)

; Show column number in modeline
(setq column-number-mode t)

; Show clock in mode line in AM/PM mode
(defvar display-time-24hr-format nil)
(setq display-time-24hr-format nil)
(setq display-time-day-and-date t)
(display-time)
;---------------------------------------------------------------------------


;--- Program Behavior  -----------------------------------------------------
; By:     Jonathan Tsai (2004.09.16)
;         Richard Shiao (2004.06.01)
; Date:   2000/06/01
; Source: www.ocf.berkeley.edu/~jontsai/dotemacs
;         www.geocities.com/IntroToEECS

; Use text mode as default
(setq major-mode 'text-mode)

; Number of kills to keep in memory
(setq kill-ring-max 50)

; disable menu-bar-mode for extra screen real estate
; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

;;**********************************
;; Begin Autosave/Backup section
;; Controlling backup files:
;;
;; Set the following variable to `nil' to disable the making of backup
;; files.

;;(setq make-backup-files nil)

;; The following variables control how backup files are made, and are
;; only used if `make-backup-files' is non-nil.
;;
;; Backup files are created when a file is saved for the first time (and
;; the file already exists on disk).  Backup files can be created by
;; renaming the original file or by copying.
;;
;; Renaming means that Emacs renames the existing file so that it is a
;; backup file, then writes the buffer into a new file.  Any other names
;; that the old file had will now refer to the backup file.  The new
;; file is owned by you and its group is defaulted.  Note that this
;; method CAN CHANGE the ownerships of a file.  The variables
;; `backup-by-copying-when-linked' and `backup-by-copying-when-mismatch'
;; control whether or not the ownerships can change.
;;
;; Copying means that Emacs copies the existing file into the backup
;; file, then writes the buffer on top of the existing file.  Any other
;; names that the old file had will now refer to the new (edited) file.
;; The file's owner and group are unchanged.  However, if you edit very
;; large file, backing up by copying can take a long time.
;;
;; The choice of renaming or copying is controlled by the variables
;; backup-by-copying, backup-by-copying-when-linked and
;; backup-by-copying-when-mismatch.  For most people, these variables
;; should have the following values:
;;
;;	backup-by-copying			nil
;;	backup-by-copying-when-linked		t
;;	backup-by-copying-when-mismatch		t
;;
;; If you want to backup by renaming, set the variable
;; `backup-by-copying' to nil; if you want to backup by copying, set the
;; variable `backup-by-copying' to non-nil.

(setq backup-by-copying nil)

;; If you want to use copying to create backups for files with multiple
;; names, set `backup-by-copying-when-linked' to non-nil.  This causes
;; the alternate names to refer to the latest version as edited.  This
;; variable is relevant only if backup-by-copying is nil.

(setq backup-by-copying-when-linked t)

;; If you want to create backups by copying if this preserves owner or
;; group, set `backup-by-copying-when-mismatch' to non-nil.  Renaming
;; may still be used (subject to control of other variables) when it
;; would not result in changing the owner or group of the file; that is,
;; for files which are owned by you and whose group matches the default
;; for a new file created there by you.  This variable is relevant only
;; if backup-by-copying is nil.

(setq backup-by-copying-when-mismatch t)

;; Numbered backup files
;; enabled: `t'
;; make numbered backup files only for those files that already have
;; them: `nil'
;; disabled: `never'
;; (i.e., use "(setq version-control 'never)").

(setq version-control t)

;; Autosave
;; enable auto-save : `t'
;; disable auto-save: `nil'

(setq auto-save-default t)

;; Autosave every n characters typed
;; Default : 300
;; Disabled: 0

(setq auto-save-interval 500)

;; https://www.emacswiki.org/emacs/AutoSave
;;
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
;;(defvar autosave-dir (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
;;(defvar autosave-dir (concat (getenv "HOME") "/.emacs.d/autosaves/"))
(defvar autosave-dir (concat user-emacs-directory "autosaves"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; https://www.emacswiki.org/emacs/BackupDirectory
;;
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
;;(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
;; $HOME = (getenv "HOME") ;; e.g. /home/jontsai
;;(defvar backup-dir (concat (getenv "HOME") "/.emacs.d/backups"))
(defvar backup-dir (concat user-emacs-directory "backups"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; End Autosave/Backup section
;;**********************************

;;**********************************
;; Begin appearances

;; default-truncate-lines
;; non-nil: continuation lines are not displayed
;;          each line of text is given one and only one screen line.
;;          In this case, lines longer than the screen/window width have to be
;;          viewed using the scroll-left and scroll-right functions.
;; recommended setting: `nil'

(setq truncate-lines nil)
(setq truncate-partial-width-windows truncate-lines)

;; Marking regions

;; Use Transient mark mode
;; (setq transient-mark-mode t)
(setq transient-mark-mode '1)

;; Line numbers
(line-number-mode 1)

; Column beyond which to do word wrap
(setq fill-column 80)

; If I decide I actually don't want word wrapping...
; turned off by Jonathan Tsai
;(hscroll-global-mode t)

;; scroll-step
;; number of lines to try scrolling a window when
;; point tries to move outside of a window.  If that fails to bring the
;; point back onto the screen the point is centered in the window
;; instead.
;; 0: the point is always centered after
;;    it moves outside of a window.
;; 1: Scroll down 1 line at a time rather than a huge section
(setq scroll-step 1)

;; next-screen-context-lines
;; the number of lines of continuity when scrolling a window.
(setq next-screen-context-lines 1)

; Don't add more lines when scrolling past end of buffer
(setq next-line-add-newlines nil)

; Resize mini-buffer automatically
;(resize-minibuffer-mode)
;(setq resize-minibuffer-window-exactly nil)

; Substitute yes/no responses to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight-current-line.el/elc must be installed
(require 'highlight-current-line)

;; prettier - https://github.com/prettier/prettier-emacs
(require 'prettier-js)

(add-hook 'js-jsx-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; End appearances
;;**********************************

; Use Auto Fill word wrapping
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;*****************************
;; Additional Programming modes
;;*****************************
;; Custom modes - put in .../emacs/list/progmodes
;; php-mode.el
;; verilog-mode.el
;; visual-basic-mode.el

(setq auto-mode-alist
  (append

   '(;; Make .h and .H files default to C++ mode rather than C mode.
     ("\\.H$" . c++-mode)
     ("\\.h$" . c++-mode)
     ;; SFDC Apex mode
     ("\\.cls$" . apex-mode) ; Apex class
     ("\\.trg$" . apex-mode) ; Apex trigger
     ("\\.page$" . apex-mode) ; Visualforce page
     ;; C# mode
     ("\\.cs$" . csharp-mode)
     ;; Coffee mode
     ("\\.coffee$" . coffee-mode)
     ;; JavaScript mode
     ;;("\\.js$" . javascript-mode)  ;; replaced by js-jsx-mode
     ("\\.js$" . js-jsx-mode)
     ("\\.jsx$" . js-jsx-mode)
     ;; LESS to use CSS mode
     ("\\.less$" . css-mode)
     ;; Lua mode
     ("\\.lua$" . lua-mode)
     ;; PHP mode
     ("\\.php$" . php-mode)
     ("\\.gne$" . php-mode) ; Flickr "Game Never Ending"
     ;; Puppet mode
     ("\\.pp$" . puppet-mode)
     ;; Python mode
     ("\\.py$" . python-mode)
     ;; Scala mode
     ("\\.sbt$" . scala-mode)
     ("\\.scala$" . scala-mode)
     ;; org-trello major mode for all .trello files
     ("\\.trello$" . org-mode)
     ;; Visual Basic mode
     ("\\.vbs$" . visual-basic-mode)
     ("\\.vb$" . visual-basic-mode)
     ("\\.basic$" . visual-basic-mode)
     ;; Verilog
     ("\\.v\\'" . verilog-mode)
     ;; YAML
     ("\\.yml$" . yaml-mode)
     )
   auto-mode-alist))

;; Load programming modes only when needed
(autoload 'apex-mode "apex-mode" "Major mode for editing SFDC Apex code." t)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(autoload 'coffee-mode "coffee-mode" "CoffeeScript mode" t)
(autoload 'javascript-mode "javascript-mode" "JavaScript mode" t)
;(autoload 'js-jsx-mode "js-jsx-mode" "Javascript + JSX mode" t)  ;; built-in to Emacs
(autoload 'lua-mode "lua-mode" "Lua mode" t)
(autoload 'php-mode "php-mode" "PHP mode" t)
;(autoload 'python-mode "python-mode" "Python mode" t)  ;; built-in to Emacs
(autoload 'puppet-mode "puppet-mode" "Puppet mode" t)
(autoload 'scala-mode "scala-mode2" "Scala mode" t)
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(autoload 'visual-basic-mode "visual-basic-mode" "Visual" t)
(autoload 'yaml-mode "yaml-mode" "YAML" t)

;; Autoload Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; Colorize keywords for additional programming modes
(defvar enable-font-lock-mode nil)
(setq enable-font-lock-mode '(lambda () (font-lock-mode 1)))

(mapc (lambda (progmode) (add-hook progmode enable-font-lock-mode))
      '(javascript-mode-hook
    ;jsx-mode-hook
	php-mode-hook
	python-mode-hook
	verilog-mode-hook
	visual-basic-mode-hook
	yaml-mode-hook
	))

;; Set tab-width
(setq tab-width 2)

;; Set up C/C++ indentation
(defvar c-basic-offset)
(setq c-basic-offset 2)
(defvar c-tab-always-indent nil)
(setq c-tab-always-indent nil)
(defvar c-indent-level)
(setq c-indent-level 2)
;(define-key c-mode-map "\r" 'newline-and-indent)
(defvar c-continued-statement-offset)
(setq c-continued-statement-offset 2)
(defvar c-argdecl-indent)
(setq c-argdecl-indent 0)


;; Indent Tabs Mode
;; By default, Emacs inserts tabs in place of multiple spaces when it formats a
;; region. (For example, you might indent many lines of text all at once with
;; the indent-region command.) Tabs look fine on a terminal or with ordinary
;; printing, but they produce badly indented output when you use TeX or Texinfo
;; since TeX ignores tabs.
;; The following turns off Indent Tabs mode:
;; Prevent Extraneous Tabs - nil
;; use tabs: t
(setq-default indent-tabs-mode nil)
;; setq-default instead of setq
;; sets values only in buffers that do not have their own local values for the variable.

; Make searches non-case-sensitive
(set-default 'case-fold-search t)

;; You can set `require-final-newline' to one of the following to
;; control newlines at the end of a file when the file is saved:
;;
;;	t		Silently place a newline at the end of the file
;;			when the file is saved.  This is done only if
;;			the file does not already end with a newline.
;;	nil		Don't add newlines.
;;	(anything else) Ask the user what to do.

(setq require-final-newline nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;---------------------------------------------------------------------------


;--- Key Bindings ----------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

;-- Setting:

;; ****Begin UC key bindings
(global-set-key "\eg" 'goto-line)
(global-set-key "\eW" 'copy-region-as-kill)
;; (global-set-key "\^w" 'backward-kill-word)
;; (global-set-key "\eq" 'query-replace)
;; (global-set-key "\eQ" 'query-replace-regexp)
;; (global-set-key "\^x\^e" 'compile)
;; (global-set-key [S-return] 'newline-and-indent)

;; Disable C-x n n, ^z, C-x C-l, C-x C-u
;; ****End UC key bindings

;;(global-unset-key "\^z") don't need to disable suspend
(global-unset-key "\^xnn")
;; (global-unset-key "\^x\^l")
;; (global-unset-key "\^x\^u")

; Use PC-style key bindings and selection
;(pc-bindings-mode)
;(pc-selection-mode)

; Shift-Tab completes words
(global-set-key [S-iso-lefttab] 'dabbrev-completion)

; Delete key deletes forward
(defvar delete-key-deletes-forward)
(setq delete-key-deletes-forward t)

; C-Backspace deletes word
(global-set-key [\C-backspace] 'backward-kill-word)

; C-PageUp/PageDown scrolls the other buffer
(global-set-key [C-next] 'scroll-other-window)
(global-set-key [C-prior] 'scroll-other-window-down)

; Page Up and Down remembers cursor position
(setq scroll-preserve-screen-position t)

(global-set-key "\C-o" "\ev")                       ; scroll up


; C-c * shortcuts for common operations
(global-set-key "\C-ci"    'indent-region)
(global-set-key "\C-cm"    'set-mark-command)        ; for when the OS overrides ^-SPC
(global-set-key "\C-cl"    'set-mark-command)        ; for when the OS overrides ^-SPC + another Emacs program overrides 'C-c m'
(global-set-key "\C-co"    'comment-region)
(global-set-key "\C-cu"    'uncomment-region)
(global-set-key "\C-cs"    'sort-lines)
(global-set-key "\C-cq"    'query-replace)
; disabled by Jonathan Tsai 2003/05/16
;(global-set-key "\C-cx"    "\C-w")                  ; cut
;(global-set-key "\C-c\C-x" "\C-w")                  ; cut
;(global-set-key "\C-cc"    "\C-w\C-y")              ; copy
;(global-set-key "\C-c\C-c" "\C-w\C-y")              ; copy
;(global-set-key "\C-cv"    "\C-y")                  ; paste
;(global-set-key "\C-c\C-v" "\C-y")                  ; paste
;(global-set-key "\C-ca"    [C-home C-S-end])        ; select all
;(global-set-key "\C-c\C-a" [C-home C-S-end])        ; select all
;(global-set-key "\C-cw"    'compare-windows)        ;
;(global-set-key "\C-cg"    'goto-line)              ;
;(global-set-key "\C-c\C-e" 'center-line)            ;
;(global-set-key "\C-cb"    'universal-argument)     ; I use this for S-f8 below

; Function Keys
;;(global-set-key [f1]    'help)                      ;
;;(global-set-key [S-f1]  'man)                       ;

;;(global-set-key [f2]    'save-buffer)               ;
; Shift f2              'see function below         ; saves all buffers
;;(global-set-key [f3]    'find-file)                 ; open new or existing file
; Shift f3              'see function below         ; opens .emacs file
;;(global-set-key [f4]    'kill-buffer)               ; close current file
;;(global-set-key [S-f4]  [?\S-f2 ?\M-f4])            ; save-all and quit ********************

;;(global-set-key [f5]    'compile)                   ;
;;(global-set-key [S-f6]  'first-error)               ;
;;(global-set-key [C-f6]  'previous-error)            ;
;;(global-set-key [f6]    'next-error)                ;
;;(global-set-key [f7]    'goto-line)                 ;
;;(global-set-key [f8]    'comment-region)            ;
;;(global-set-key [S-f8]  'uncomment-region)          ;
;;(fset 'uncomment-region
;;   [?\C-c ?b f8]) ; dependent on C-c b defintion for universal-argument
;;                  ; (see C-c definitions above)


;;(global-set-key [f9]    'indent-region)             ;

;;(global-set-key [f10]   'delete-other-windows)      ;
;;(global-set-key [S-f10] 'split-window-vertically)   ;
;;(global-set-key [C-f10] 'split-window-horizontally) ;

;;(global-set-key [f11]   'other-window)

; F12                   'see function below         ; toggles kbd macro recording
;;(global-set-key [S-f12] 'name-last-kbd-macro)       ;
;;(global-set-key [C-f12] 'call-last-kbd-macro)       ;


; I don't need these...
;(global-set-key [f9]    'new-frame)
;(global-set-key [S-f9]  'delete-frame)
;(global-set-key [C-f9]  'delete-window)


;-- Unsetting: (Things I don't use, but may press by mistake)
(global-unset-key "\C-xf") ; set fill column to
;(global-unset-key "\C-x\C-k") ; name macro \C-x\C-kn
;(global-unset-key "\C-t") ; transpose characters
;(global-unset-key "\C-a") ; move to beginning of line
(global-unset-key [S-backspace]) ;;;;;;;;;;;;;;;;;;;; doesn't work yet

;-- Resetting:
(global-set-key "\C-x\C-b" 'buffer-menu)            ; opens in same window

;; C-q for quote

;(if (eq window-system 'w32)
;    (global-set-key "\C-z" 'undo)                   ; use pc binding
;  (global-set-key "\C-q" 'undo))                    ; C-z is reserved for suspend on Unix
;(global-set-key "\C-s" 'save-buffer)                ; convenient
;(global-set-key "\C-xs" 'save-buffer)               ; convenient
;---------------------------------------------------------------------------


;--- Mouse -----------------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
; Mouse-1 takes over Mouse-2:

; Drag scroll bar with Mouse-1
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)

; Select from the completion list with Mouse-1
(add-hook 'completion-list-mode-hook
  '(lambda() (define-key completion-list-mode-map [down-mouse-1]
               'mouse-choose-completion)))

; Select from the Buffer Menu with Mouse-1
(add-hook 'buffer-menu-mode-hook
  '(lambda() (define-key Buffer-menu-mode-map [down-mouse-1]
               'Buffer-menu-mouse-select)))

; Mouse-2 shows context sensitive menu
(define-key global-map [mouse-2] 'mouse-major-mode-menu)
;---------------------------------------------------------------------------


;--- Mail ------------------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

; Aliases are stored in `~/.mailrc' in this format:
;    alias me IntroToEECS@yahoo.com
; Turn on aliases
; (setq mail-aliases t)
;---------------------------------------------------------------------------


;--- Snippet Functions follow: ---------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

; You can copy and paste them to your .emacs file.
; Just make sure there are no key-binding conflicts with
; other parts of your file.  It's a good idea to keep these
; snippets intact.


;--- "Buffer Switching" ----------------------------------------------------
;     By:       Young-il Choo
;     Original: yic-buffer.el
;     From:     choo@cs.yale.edu (young-il choo)
;     Date:     1990/08/07
;     (Modified)
;---------------------------------------------------------------------------
(global-set-key [\C-tab] 'yic-next-buffer)
(global-set-key [\C-\S-tab] 'yic-prev-buffer)
; The above line doesn't seem to apply anymore... Richard Shiao 2000/06/02
; Emacs just beeps.

(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause
   ;;a duplicate top-level buffer inside two frames.
   (memq str
         (mapcar
          (lambda (x)
            (buffer-name
             (window-buffer
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
         bf bn go
         )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))        ;skip over
   (setq go bf)
        (setq ptr (cdr ptr))
        )
      )
    (if go
        (switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))
;---------------------------------------------------------------------------


;--- "Open .emacs with Shift-f3" -------------------------------------------
;     By: Richard Shiao
;     Description: Opens the init file .emacs with S-f3
;     History:
;     - Updated path by jontsai 2022.09.04
;     - Modified by Richard Shiao 2000.06.03
;---------------------------------------------------------------------------
(defun open-dot-emacs ()
    "Opening .emacs"
    (interactive) ;this makes the function a command too
    ;(find-file "~/RSemacs.emacs")
    (find-file "~/code/dotemacs/dotemacs.emacs.el")
    )

(global-set-key [S-f3]  'open-dot-emacs)

;******************************************************************************************
;--- "Toggle Keyboard Macro Recording with f12" ----------------------------
;     By: Richard Shiao
;     Description: Starts and ends keyboard macro recording
;     Modified: Richard Shiao 2000/06/05
;---------------------------------------------------------------------------
; (fset 'start [?\C-x ?\(])
; (fset 'end   [?\C-x ?\)])

; (defvar recording-kbd-macro nil) ; Initially recording is not on.
; (defun toggle-kbd-macro-recording ()
;   "Toggle keyboard macro recording."
;   (interactive) ; Makes the function a command too
;   (if recording-kbd-macro
;       (end-kbd-macro)
;       (start-kbd-macro))
;   (setq recording-kbd-macro (not recording-kbd-macro)))

; (global-set-key [f12]  'toggle-kbd-macro-recording)


;--- "Saving the Emacs Desktop" --------------------------------------------
;     By:         Richard Shiao
;     Purpose:    Open files from last session upon starting.
;     Note:       Keep this function at the bottom to avoid any
;                 potential improper overwriting.
;     Note:       First time saving desktop, you'll need to use
;                 M-x desktop-save
;---------------------------------------------------------------------------
;(load "desktop")
;(desktop-load-default)
;(desktop-read)
;---------------------------------------------------------------------------


;--- Editorconfig -----------------------------------------------------------------
; By:     jontsai
; Date:   2016/07/06
; Source: https://github.com/editorconfig/editorconfig-emacs
(require 'editorconfig)
(editorconfig-mode 1)

;---------------------------------------------------------------------------


;--- Helm -----------------------------------------------------------------
; By:     jontsai
; Date:   2019.05.09
; Source: https://github.com/emacs-helm/helm/wiki

(with-eval-after-load "helm"
  ; keybindings to make Helm awesome
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  ; keybindings to override default Helm behavior and restore customary "tab completion"
  ; https://emacs.stackexchange.com/a/38235/16731
  ;(bind-key "M-Y" #'helm-end-of-buffer helm-map)
  (define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") #'helm-select-action))

; enable Helm to to trigger custom keybindings, then immediately disable
(helm-mode 1)
(helm-mode 0)

;---------------------------------------------------------------------------


;--- isort -----------------------------------------------------------------
; By:     jontsai
; Date:   2020.01.17
; Source: https://github.com/paetzke/py-isort.el

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)


;--- user-specific emacs -----------------------------------------------------------------
; By:     jontsai
; Date:   2020.04.30
; Attemps to load `USER.el[c]`


(condition-case nil
    (load (getenv "USER"))
    (error nil))


;--- load custom directory with saved macros -----------------------------------------------------------------
; By:     jontsai
; Date:   2022.09.04
; Load custom dotemacs directory along with saved macros
;
; See: https://www.thegeekstuff.com/2010/07/emacs-macro-tutorial-how-to-record-and-play/
; 1. Record macro
; 2. Name macro (C-x C-k n)
; 3. Open macros.el
; 4. Store macro: M-x insert-kbd-macro

(require 'load-directory)
(load-directory "~/.emacs.d/custom")

;---------------------------------------------------------------------------


; If execution reaches the end, then success!
(message "                                                    ")
(message "    <----<---<--<-<<  YES!!! >>->-->--->---->       ")
(message "..... The file .emacs has loaded successfully! .....")
(message "                                                    ")
;=== end of file ===========================================================
