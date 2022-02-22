#lang racket

(require (prefix-in rl: "../main.rkt"))

(module+ main
  (rl:InitWindow 800 450 "raylib [core] example - basic window")
  (rl:SetTargetFPS 60)

  ;; main game loop
  (let loop ()
    (rl:BeginDrawing)
    (rl:ClearBackground rl:RAYWHITE)
    (rl:DrawText "Congrats! You created your first window!" 190 200 20 rl:LIGHTGRAY)
    (rl:EndDrawing)

    ;; stop when the window is closing
    (unless (rl:WindowShouldClose)
      (loop)))

  ;; clean up
  (rl:CloseWindow))
