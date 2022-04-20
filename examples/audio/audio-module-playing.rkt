#lang racket
;; /*******************************************************************************************
;; *
;; *   raylib [audio] example - Module playing (streaming)
;; *
;; *   This example has been created using raylib 1.5 (www.raylib.com)
;; *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
;; *
;; *   Copyright (c) 2016 Ramon Santamaria (@raysan5)
;; *
;; ********************************************************************************************/

;; Racket port of the original C example - Jens Axel Søgaard (@soegaard)
;; Note: This is a direct port - so we also have the bug that the time played bar
;;       doesn't get reset, when the music is restarted.

;; The examples plays a continuous piece of music in terms of the music module mini1111.xm.
;; The file format xm is used by many music trackers.

;; The visualization consist of random circles. The circles appear then shrinks/fades away.


(require "../../main.rkt")  ; Todo: Use (require racket-raylib) instead.

;;;
;;; CIRCLES
;;;

(define MAX-CIRCLES 64)

(struct circle
  (position ; Vector2    
   radius   ; float
   alpha    ; float       ; transparency
   speed    ; float
   color    ; Color
   )
  #:mutable)

(define (int   x) (inexact->exact (floor x)))
(define (float x) (* 1.0 x))

(define (random-circle)
  (define alpha    0.0)
  (define radius   (float (GetRandomValue 10 40)))
  (define posx     (float (GetRandomValue (int radius) (int (- screen-width  radius)))))
  (define posy     (float (GetRandomValue (int radius) (int (- screen-height radius)))))
  (define position (make-Vector2 posx posy))
  (define speed    (/ (GetRandomValue 1 100) 2000.0))
  (define color    (vector-ref colors (GetRandomValue 0 13)))
  
  (circle position radius alpha speed color))


;;;
;;; Initialization
;;;

;; Screen
(define screen-width  800)
(define screen-height 450)

(SetConfigFlags 'FLAG_MSAA_4X_HINT) ; Enable Multi Sampling Anti Aliasing 4x (if available)
(InitWindow screen-width screen-height "raylib [audio] example - module playing (streaming)")
(SetTargetFPS 60) ; Target 60 frames-per-second

;; Audio
(InitAudioDevice) ; Initialize audio device

(define music (LoadMusicStream "resources/mini1111.xm"))
(set-Music-looping! music #f)
(PlayMusicStream music)

(define pitch       1.0)  ; controlled by arrow up and arrow down keys
(define time-played 0.0)  ; 
(define pause       #f)   ; toggled by pressing P

;; Visualization
(define colors (vector ORANGE RED GOLD LIME BLUE VIOLET BROWN LIGHTGRAY PINK
                       YELLOW GREEN SKYBLUE PURPLE BEIGE))

(define circles (for/vector ([i MAX-CIRCLES]) (random-circle)))



;;
;; Main Loop
;; 

(let loop ()
  (unless (WindowShouldClose)  ; Detect window close button or ESC key
    ;;; MUSIC

    ;; Update music buffer with new data to stream
    (UpdateMusicStream music)  

    ;; Restart music playing (stop and play)?
    (when (IsKeyPressed 'KEY_SPACE)
      (StopMusicStream music)
      (PlayMusicStream music))

    ;; Pause/Resume music playing
    (when (IsKeyPressed 'KEY_P)
      (set! pause (not pause))
      (if pause
          (PauseMusicStream music)
          (ResumeMusicStream music)))

    ;; Pitch control
    (when (IsKeyDown 'KEY_DOWN)
      (set! pitch (- pitch 0.01)))
    (when (IsKeyDown 'KEY_UP)
      (set! pitch (+ pitch 0.01)))

    (SetMusicPitch music pitch)

    ;; Time played (bar dimensions)
    (define tp (GetMusicTimePlayed music))
    (define tl (GetMusicTimeLength music))
    (define time-played (* (/ tp tl) (- screen-width 40)))


    ;;; Visualizations
    (unless pause
      (for ([i MAX-CIRCLES])
        (define c (vector-ref circles i))
        (match-define (circle position radius alpha speed color) c)
        (define alpha1 (+ alpha speed))
        (set-circle-alpha!  c alpha1)
        (set-circle-radius! c (+ radius (* speed 10.0)))
        (when (> alpha1 1.0)
          (set-circle-speed! c (* -1 speed)))
        (when (< alpha1 0.0)
          (vector-set! circles i (random-circle)))))
          
    ;;; DRAW
    
    (BeginDrawing)
    (ClearBackground RAYWHITE)
    
    (for ([c circles])
      (match-define (circle position radius alpha speed color) c)
      (DrawCircleV position radius (Fade color alpha)))

    ;; Draw time bar
    (DrawRectangle      20 (- screen-height 20 12) (- screen-width 40) 12 LIGHTGRAY)
    (DrawRectangle      20 (- screen-height 20 12) (int time-played)   12 MAROON)
    (DrawRectangleLines 20 (- screen-height 20 12) (- screen-width 40) 12 GRAY)
    
    (EndDrawing)
    
    ;; Done
    (loop)))


;; Clean up
(UnloadMusicStream music) ;     Unload music stream buffers from RAM
(CloseAudioDevice)        ;     Close audio device (music streaming is automatically stopped)
(CloseWindow)             ;     Close window and OpenGL context
