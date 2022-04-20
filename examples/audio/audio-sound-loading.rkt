#lang racket
;; /*******************************************************************************************
;; *
;; *   raylib [audio] example - Sound loading and playing
;; *
;; *   This example has been created using raylib 1.0 (www.raylib.com)
;; *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
;; *
;; *   Copyright (c) 2014 Ramon Santamaria (@raysan5)
;; *
;; ********************************************************************************************/

;; Racket port of the original C example - Jens Axel Søgaard (@soegaard)

;; This example demonstrates how to play wav and ogg files.


(require "../../main.rkt")  ; Todo: Use (require racket-raylib) instead.


;;;
;;; Initialization
;;;


(define screen-width 800)
(define screen-height 450)

(InitWindow screen-width screen-height  "raylib [audio] example - sound loading and playing")

(InitAudioDevice)   ; Initialize audio device

(define fxWav (LoadSound "resources/sound.wav"))      ; Load WAV audio file
(define fxOgg (LoadSound "resources/target.ogg"))     ; Load OGG audio file

(SetTargetFPS 60) ; Set 60 frames-per-second as target


;;;
;;; Main Loop
;;;

(let loop ()
  (unless (WindowShouldClose) ; Detect window close button or ESC key

    ;; Update
    (when (IsKeyPressed 'KEY_SPACE) (PlaySound fxWav))      ; Play WAV sound
    (when (IsKeyPressed 'KEY_ENTER) (PlaySound fxOgg))      ; Play OGG sound

    ;; Draw
    (BeginDrawing)

    (ClearBackground RAYWHITE)

    (DrawText "Press SPACE to PLAY the WAV sound!" 200 180 20 LIGHTGRAY)
    (DrawText "Press ENTER to PLAY the OGG sound!" 200 220 20 LIGHTGRAY)

    (EndDrawing)
    (loop)))

;;;
;;; Clean up
;;;

(UnloadSound fxWav)    ; Unload sound data
(UnloadSound fxOgg)    ; Unload sound data

(CloseAudioDevice)     ;  Close audio device

(CloseWindow)          ;Close window and OpenGL context
