#lang racket
;; /*******************************************************************************************
;; *
;; *   raylib [audio] example - Multichannel sound playing
;; *
;; *   This example has been created using raylib 2.6 (www.raylib.com)
;; *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
;; *
;; *   Example contributed by Chris Camacho (@chriscamacho) and reviewed by Ramon Santamaria (@raysan5)
;; *
;; *   Copyright (c) 2019 Chris Camacho (@chriscamacho) and Ramon Santamaria (@raysan5)
;; *
;; ********************************************************************************************/

;; Racket port of the original C example - Jens Axel Søgaard (@soegaard)


(require "../../main.rkt")  ; Todo: Use (require racket-raylib) instead.


;;;
;;; Initialization
;;;


(define screen-width 800)
(define screen-height 450)

(InitWindow screen-width screen-height  "raylib [audio] example - multichannel sound playing")

(InitAudioDevice)   ; Initialize audio device

(define fxWav (LoadSound "resources/sound.wav"))      ; Load WAV audio file
(define fxOgg (LoadSound "resources/target.ogg"))     ; Load OGG audio file
(SetSoundVolume fxWav 0.2)

(SetTargetFPS 60) ; Set 60 frames-per-second as target


;;;
;;; Main Loop
;;;

(let loop ()
  (unless (WindowShouldClose) ; Detect window close button or ESC key

    ;; Update
    (when (IsKeyPressed 'KEY_SPACE) (PlaySoundMulti fxWav))      ; Play WAV sound
    (when (IsKeyPressed 'KEY_ENTER) (PlaySoundMulti fxOgg))      ; Play OGG sound

    ;; Draw
    (BeginDrawing)

    (ClearBackground RAYWHITE)

    (DrawText "MULTICHANNEL SOUND PLAYING"          20  20 20 GRAY)
    (DrawText "Press SPACE to PLAY the WAV sound!" 200 180 20 LIGHTGRAY)
    (DrawText "Press ENTER to PLAY the OGG sound!" 200 220 20 LIGHTGRAY)

    (EndDrawing)
    (loop)))

;;;
;;; Clean up
;;;

(StopSoundMulti)       ; We must stop the buffer pool before unloading


(UnloadSound fxWav)    ; Unload sound data
(UnloadSound fxOgg)    ; Unload sound data

(CloseAudioDevice)     ;  Close audio device

(CloseWindow)          ;Close window and OpenGL context
