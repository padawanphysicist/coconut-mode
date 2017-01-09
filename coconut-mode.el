;;; coconut-mode.el --- sample major mode for editing Coconut.

;; Copyright © 2016, by Victor Santos

;; Author: Victor Santos ( victor_santos@fisica.ufc.br )
;; Version: 2.0.13
;; Created: 02 Nov 2016
;; Keywords: languages
;; Homepage: http://gitlab.com/padawanphysicist/coconut-mode

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; Major mode for Coconut Lang

;;; Code:
(add-to-list 'auto-mode-alist '("\\.coco$" . coconut-mode))

;; Python keywords + Coconut keywords
(defvar coconut-keywords
  '("False" "None" "True" "and"
    "as" "assert" "break" "case"
    "class" "continue" "data" "def"
    "del" "elif" "else" "except"
    "finally" "for" "from" "global"
    "if" "import" "in" "is"
    "lambda" "match" "nonlocal" "not"
    "or" "pass" "raise" "return"
    "try" "while" "with" "yield"))

;; Some builtin functions
(defvar coconut-builtin-functions
  '("abs" "all" "any" "ascii"
    "bin" "bool" "bytearray" "bytes"
    "callable" "chr" "classmethod" "compile" 
    "complex" "consume" "delattr" "dict" "dir"
    "divmod" "enumerate" "eval" "exec"
    "filter" "float" "format" "frozenset"
    "getattr" "globals" "hasattr" "hash"
    "help" "hex" "id" "input"
    "int" "isinstance" "issubclass" "iter"
    "len" "list" "locals" "map"
    "max" "memoryview" "min" "next"
    "object" "oct" "open" "ord"
    "pow" "print" "property" "range"
    "reduce" "repr" "reversed" "round" "set"
    "setattr" "slice" "sorted" "staticmethod"
    "str" "sum" "super" "tuple"
    "type" "vars" "zip" "__import__"
    ))

  ;; Two small edits.
  ;; First is to put an extra set of parens () around the list
  ;; which is the format that font-lock-defaults wants
  ;; Second, you used ' (quote) at the outermost level where you wanted ` (backquote)
  ;; you were very close
  (defvar coconut-font-lock-defaults
    `((
       ;; stuff between double quotes
       ("\"\\.\\*\\?" . font-lock-string-face)
       ;; Functions
       ("\\<def[ \t]+\\([a-zA-Z]+[a-zA-Z0-9_]*\\)" 1 font-lock-function-name-face)
       ;; |> |*> <| <*| -> are treated as special 
       ("\|>\\|<\|\\|<\\*\|\\|\|\\*>\\|->\\|\\$" . font-lock-variable-name-face)
       ( ,(regexp-opt coconut-keywords 'words) . font-lock-keyword-face)
       ( ,(regexp-opt coconut-builtin-functions 'words) . font-lock-builtin-face)
       )))

  (define-derived-mode coconut-mode python-mode "Coconut script"
    "Coconut mode is a major mode for editing coconut files"

    (setq font-lock-defaults coconut-font-lock-defaults)
    ;; Note that there's no need to manually call `coconut-mode-hook'; `define-derived-mode'
    ;; will define `coconut-mode' to call it properly right before it exits
    )
  (provide 'coconut-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; coconut-mode.el ends here
