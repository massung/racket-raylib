#lang racket

#|

Raylib 4.0 wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/define)

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------

(define-ffi-definer define-raylib
  (ffi-lib (case (system-type 'os)
             ('windows "raylib.dll")
             ('unix "libraylib.4.0.0.so")
             ('macosx "libraylib.4.0.0.dylib"))))
