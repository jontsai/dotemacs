# Opinionated collection of the best dotemacs (*.el) files

## Prerequisites

An Emacs Lisp Package Archive such as [MELPA (Milkypostman's Emacs Lisp Archive)](https://melpa.org) is required.

## Installation

1. `git clone https://github.com/jontsai/dotemacs` OR `git clone git@github.com:jontsai/dotemacs.git`
1. `make install`
1. Profit

## Utilities

- [EditorConfig](https://editorconfig.org/)
- [Highlight Current Line](http://www.emacswiki.org/emacs/HighlightCurrentLine)
  - Using the tried and true: [`highlight-current-line.el`](http://www.emacswiki.org/emacs/highlight-current-line.el)

## Dependency Emacs Packages

For each of these, run `M-x package-install <package-name>`

- [Emacs-Helm](https://github.com/emacs-helm/helm) (`helm`)
- [Org mode](https://orgmode.org/) (`org`)
  - [org-trello](http://org-trello.github.io/) (`org-trello`)

## Languages

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
