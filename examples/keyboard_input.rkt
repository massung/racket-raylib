#lang racket

(require (prefix-in rl: "../main.rkt"))

(module+ main
  (rl:InitWindow 800 450 "raylib [core] example - keyboard input")
  (rl:SetTargetFPS 60)

  (define ball-x 400)
  (define ball-y 225)

  ;; main game loop
  (let loop ()
    (when (rl:IsKeyDown 'KEY_RIGHT) (set! ball-x (+ ball-x 2)))
    (when (rl:IsKeyDown 'KEY_LEFT) (set! ball-x (- ball-x 2)))
    (when (rl:IsKeyDown 'KEY_DOWN) (set! ball-y (+ ball-y 2)))
    (when (rl:IsKeyDown 'KEY_UP) (set! ball-y (- ball-y 2)))
    
    (rl:BeginDrawing)
    (rl:ClearBackground rl:RAYWHITE)
    (rl:DrawText "Move the ball with the arrow keys" 10 10 20 rl:DARKGRAY)
    (rl:DrawCircle ball-x ball-y 50.0 rl:MAROON)
    (rl:EndDrawing)

    ;; stop when the window is closing
    (unless (rl:WindowShouldClose)
      (loop)))

  ;; clean up
  (rl:CloseWindow))
