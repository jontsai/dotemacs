# Opinionated collection of the best dotemacs (*.el) files

## Prerequisites

An Emacs Lisp Package Archive such as [MELPA (Milkypostman's Emacs Lisp Archive)](https://melpa.org) is required.

## Installation

1. `git clone https://github.com/jontsai/dotemacs` OR `git clone git@github.com:jontsai/dotemacs.git`
1. `make` (See [Makefile](Makefile))
1. Profit

## Utilities

- [EditorConfig](https://editorconfig.org/)
- [Highlight Current Line](http://www.emacswiki.org/emacs/HighlightCurrentLine)
  - Using the tried and true: [`highlight-current-line.el`](http://www.emacswiki.org/emacs/highlight-current-line.el)

## Dependency Emacs Packages

This Emacs configuration uses the following Emacs packages:

- [Company](https://company-mode.github.io/) (`company`)
- [Dash](https://github.com/magnars/dash.el) (`dash`)
- [Flycheck](https://github.com/jontsai/emacs-flycheck) (`flycheck`)
- [Helm](https://github.com/emacs-helm/helm) (`helm`)
- [Keycast](https://github.com/jontsai/emacs-keycast) (`keycast`)
- [Org mode](https://orgmode.org/) (`org`)
  - [org-trello](http://org-trello.github.io/) (`org-trello`)
- [which-key](https://github.com/justbur/emacs-which-key) (`which-key`)

### Installation

Installation of these dependencies happens automatically with `make`.

Previously, the steps were:

1. Fetch the latest MELPA package list:  
   `M-x package-refresh-contents`
1. For each of these, run:  
   `M-x package-install <package-name>`

### Deprecated Dependencies

These packages were previously used by this Emacs configuration, but
no longer.

- [Helm LSP](https://github.com/jontsai/emacs-helm-lsp) (`helm-lsp`)
- [LSP Mode](https://github.com/emacs-lsp/lsp-mode) (`lsp-mode`)

## Languages

- [Python](https://www.python.org/)
- [Ruby](https://www.ruby-lang.org/)
- `javascript-mode` is now `js-mode` and included in Emacs versions >= 23.2
  - [JavaScript](https://en.wikipedia.org/wiki/JavaScript) - http://www.emacswiki.org/emacs/JavaScriptMode
- Others in [Git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules):
  - [Apex](https://en.wikipedia.org/wiki/Salesforce.com#Apex) - `apex-mode`
  - [C#](https://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29) - `csharp-mode`
  - [CoffeeScript](https://coffeescript.org/) - `coffee-mode`
  - [PHP](https://www.php.net/) - `php-mode`
  - [Scala](https://scala-lang.org/) - `scala-mode2`
  - [YAML](https://yaml.org/) - `yaml-mode`

## Contributing

Pull requests are welcome!

## Guides to Learning Emacs

- Check out the wiki section: https://github.com/jontsai/dotemacs/wiki/Emacs-Tips

## License

See `LICENSE.md`
