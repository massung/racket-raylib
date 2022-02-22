#lang racket

#|

Raylib 4.0 wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)

;; ----------------------------------------------------

(require "types.rkt")

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------
;; Colors
;; ----------------------------------------------------

(define LIGHTGRAY  (make-Color 200  200  200  255))
(define GRAY       (make-Color 130  130  130  255))
(define DARKGRAY   (make-Color  80   80   80  255))
(define YELLOW     (make-Color 253  249    0  255))
(define GOLD       (make-Color 255  203    0  255))
(define ORANGE     (make-Color 255  161    0  255))
(define PINK       (make-Color 255  109  194  255))
(define RED        (make-Color 230   41   55  255))
(define MAROON     (make-Color 190   33   55  255))
(define GREEN      (make-Color   0  228   48  255))
(define LIME       (make-Color   0  158   47  255))
(define DARKGREEN  (make-Color   0  117   44  255))
(define SKYBLUE    (make-Color 102  191  255  255))
(define BLUE       (make-Color   0  121  241  255))
(define DARKBLUE   (make-Color   0   82  172  255))
(define PURPLE     (make-Color 200  122  255  255))
(define VIOLET     (make-Color 135   60  190  255))
(define DARKPURPLE (make-Color 112   31  126  255))
(define BEIGE      (make-Color 211  176  131  255))
(define BROWN      (make-Color 127  106   79  255))
(define DARKBROWN  (make-Color  76   63   47  255))

(define WHITE      (make-Color 255  255  255  255))
(define BLACK      (make-Color   0    0    0  255))
(define BLANK      (make-Color   0    0    0    0))
(define MAGENTA    (make-Color 255    0  255  255))
(define RAYWHITE   (make-Color 245  245  245  255))
