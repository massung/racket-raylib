#lang racket

#|

Raylib 4.0 wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/alloc)

;; ----------------------------------------------------

(require "lib.rkt")
(require "enums.rkt")
(require "types.rkt")

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------
;; Window
;; ----------------------------------------------------

(define-raylib InitWindow
  (_fun _int _int _string -> _void))

(define-raylib WindowShouldClose
  (_fun -> _bool))

(define-raylib CloseWindow
  (_fun -> _void))

(define-raylib IsWindowReady
  (_fun -> _bool))

(define-raylib IsWindowFullscreen
  (_fun -> _bool))

(define-raylib IsWindowHidden
  (_fun -> _bool))

(define-raylib IsWindowMinimized
  (_fun -> _bool))

(define-raylib IsWindowMaximized
  (_fun -> _bool))

(define-raylib IsWindowFocused
  (_fun -> _bool))

(define-raylib IsWindowResized
  (_fun -> _bool))

(define-raylib IsWindowState
  (_fun _ConfigFlags -> _bool))

(define-raylib SetWindowState
  (_fun _ConfigFlags -> _void))

(define-raylib ClearWindowState
  (_fun _ConfigFlags -> _void))

(define-raylib ToggleFullscreen
  (_fun -> _void))

(define-raylib MaximizeWindow
  (_fun -> _void))

(define-raylib MinimizeWindow
  (_fun -> _void))

(define-raylib RestoreWindow
  (_fun -> _void))

(define-raylib SetWindowIcon
  (_fun _Image -> _void))

(define-raylib SetWindowTitle
  (_fun _string -> _void))

(define-raylib SetWindowPosition
  (_fun _int _int -> _void))

(define-raylib SetWindowMonitor
  (_fun _int -> _void))

(define-raylib SetWindowMinSize
  (_fun _int _int -> _void))

(define-raylib SetWindowSize
  (_fun _int _int -> _void))

#;(define-raylib SetWindowOpacity
  (_fun _float -> _void))

(define-raylib GetWindowHandle
  (_fun -> _pointer))

(define-raylib GetScreenWidth
  (_fun -> _int))

(define-raylib GetScreenHeight
  (_fun -> _int))

(define-raylib GetRenderWidth
  (_fun -> _int))

(define-raylib GetRenderHeight
  (_fun -> _int))

(define-raylib GetMonitorCount
  (_fun -> _int))

(define-raylib GetCurrentMonitor
  (_fun -> _int))

(define-raylib GetMonitorPosition
  (_fun _int -> _Vector2))

(define-raylib GetMonitorWidth
  (_fun _int -> _int))

(define-raylib GetMonitorHeight
  (_fun _int -> _int))

(define-raylib GetMonitorPhysicalWidth
  (_fun _int -> _int))

(define-raylib GetMonitorPhysicalHeight
  (_fun _int -> _int))

(define-raylib GetMonitorRefreshRate
  (_fun _int -> _int))

(define-raylib GetWindowPosition
  (_fun -> _Vector2))

(define-raylib GetWindowScaleDPI
  (_fun -> _Vector2))

(define-raylib GetMonitorName
  (_fun _int -> _string))

(define-raylib SetClipboardText
  (_fun _string -> _void))

(define-raylib GetClipboardText
  (_fun -> _string))

;; ----------------------------------------------------
;; Frame
;; ----------------------------------------------------

(define-raylib SwapScreenBuffer
  (_fun -> _void))

(define-raylib PollInputEvents
  (_fun -> _void))

(define-raylib WaitTime
  (_fun _float -> _void))

;; ----------------------------------------------------
;; Cursor
;; ----------------------------------------------------

(define-raylib ShowCursor
  (_fun -> _void))

(define-raylib HideCursor
  (_fun -> _void))

(define-raylib IsCursorHidden
  (_fun -> _bool))

(define-raylib EnableCursor
  (_fun -> _void))

(define-raylib DisableCursor
  (_fun -> _void))

(define-raylib IsCursorOnScreen
  (_fun -> _bool))

;; ----------------------------------------------------
;; Drawing
;; ----------------------------------------------------

(define-raylib ClearBackground
  (_fun _Color -> _void))

(define-raylib BeginDrawing
  (_fun -> _void))

(define-raylib EndDrawing
  (_fun -> _void))

(define-raylib BeginMode2D
  (_fun _Camera2D -> _void))

(define-raylib EndMode2D
  (_fun -> _void))

(define-raylib BeginMode3D
  (_fun _Camera3D -> _void))

(define-raylib EndMode3D
  (_fun -> _void))

(define-raylib BeginTextureMode
  (_fun _RenderTexture2D -> _void))

(define-raylib EndTextureMode
  (_fun -> _void))

(define-raylib BeginShaderMode
  (_fun _Shader -> _void))

(define-raylib EndShaderMode
  (_fun -> _void))

(define-raylib BeginBlendMode
  (_fun _BlendMode -> _void))

(define-raylib EndBlendMode
  (_fun -> _void))

(define-raylib BeginScissorMode
  (_fun _int _int _int _int -> _void))

(define-raylib EndScissorMode
  (_fun -> _void))

(define-raylib BeginVrStereoMode
  (_fun _VrStereoConfig -> _void))

(define-raylib EndVrStereoMode
  (_fun -> _void))

;; ----------------------------------------------------
;; VR
;; ----------------------------------------------------

(define-raylib LoadVrStereoConfig
  (_fun _VrDeviceInfo -> _VrStereoConfig))

(define-raylib UnloadVrStereoConfig
  (_fun _VrStereoConfig -> _void) #:wrap (deallocator))

;; ----------------------------------------------------
;; Shaders
;; ----------------------------------------------------

(define-raylib LoadShader
  (_fun _path _path -> _Shader))

(define-raylib LoadShaderFromMemory
  (_fun _string _string -> _Shader))

(define-raylib GetShaderLocation
  (_fun _Shader _string -> _int))

(define-raylib GetShaderLocationAttrib
  (_fun _Shader _string -> _int))

(define-raylib SetShaderValue
  (_fun _Shader _int _pointer _ShaderUniformDataType -> _void))

(define-raylib SetShaderValueV
  (_fun _Shader _int _pointer _ShaderUniformDataType -> _void))

(define-raylib SetShaderValueMatrix
  (_fun _Shader _int _Matrix -> _void))

(define-raylib SetShaderValueTexture
  (_fun _Shader _int _Texture2D -> _void))

(define-raylib UnloadShader
  (_fun _Shader -> _void) #:wrap (deallocator))

;; ----------------------------------------------------
;; Screen-space
;; ----------------------------------------------------

(define-raylib GetMouseRay
  (_fun _Vector2 _Camera3D -> _Ray))

(define-raylib GetCameraMatrix
  (_fun _Camera3D -> _Matrix))

(define-raylib GetCameraMatrix2D
  (_fun _Camera2D -> _Matrix))

(define-raylib GetWorldToScreen
  (_fun _Vector3 _Camera3D -> _Vector2))

(define-raylib GetWorldToScreenEx
  (_fun _Vector3 _Camera3D _int _int -> _Vector2))

(define-raylib GetWorldToScreen2D
  (_fun _Vector2 _Camera2D -> _Vector2))

(define-raylib GetScreenToWorld2D
  (_fun _Vector2 _Camera2D -> _Vector2))

;; ----------------------------------------------------
;; Timing
;; ----------------------------------------------------

(define-raylib SetTargetFPS
  (_fun _int -> _void))

(define-raylib GetFPS
  (_fun -> _int))

(define-raylib GetFrameTime
  (_fun -> _float))

(define-raylib GetTime
  (_fun -> _double))

;; ----------------------------------------------------
;; Misc
;; ----------------------------------------------------

(define-raylib GetRandomValue
  (_fun _int _int -> _int))

(define-raylib SetRandomSeed
  (_fun _uint -> _void))

(define-raylib TakeScreenshot
  (_fun _path -> _void))

(define-raylib SetConfigFlags
  (_fun _ConfigFlags -> _void))

;; ----------------------------------------------------
;; Logging
;; ----------------------------------------------------

(define-raylib TraceLog
  (_fun _TraceLogLevel _string -> _void))

(define-raylib SetTraceLogLevel
  (_fun _TraceLogLevel -> _void))

;; ----------------------------------------------------
;; Files
;; ----------------------------------------------------

;; TODO:

;; ----------------------------------------------------
;; Compression/Encoding
;; ----------------------------------------------------

(define-raylib CompressData
  (_fun _pointer _int (n : (_ptr o _int)) -> (data : _pointer) -> (values data n)))

(define-raylib DecompressData
  (_fun _pointer _int (n : (_ptr o _int)) -> (data : _pointer) -> (values data n)))

(define-raylib EncodeDataBase64
  (_fun _pointer _int (n : (_ptr o _int)) -> (data : _pointer) -> (values data n)))

(define-raylib DecodeDataBase64
  (_fun _string _int (n : (_ptr o _int)) -> (data : _pointer) -> (values data n)))

;; ----------------------------------------------------
;; Storage
;; ----------------------------------------------------

(define-raylib SaveStorageValue
  (_fun _uint _int -> _bool))

(define-raylib LoadStorageValue
  (_fun _uint -> _int))

;; ----------------------------------------------------
;; Internet
;; ----------------------------------------------------

(define-raylib OpenURL
  (_fun _string -> _void))

;; ----------------------------------------------------
;; Keyboard Input
;; ----------------------------------------------------

(define-raylib IsKeyPressed
  (_fun _KeyboardKey -> _bool))

(define-raylib IsKeyDown
  (_fun _KeyboardKey -> _bool))

(define-raylib IsKeyReleased
  (_fun _KeyboardKey -> _bool))

(define-raylib IsKeyUp
  (_fun _KeyboardKey -> _bool))

(define-raylib SetExitKey
  (_fun _KeyboardKey -> _void))

(define-raylib GetKeyPressed
  (_fun -> _KeyboardKey))

(define-raylib GetCharPressed
  (_fun -> (c : _int) -> (integer->char c)))

;; ----------------------------------------------------
;; Gamepad Input
;; ----------------------------------------------------

(define-raylib IsGamepadAvailable
  (_fun _int -> _bool))

(define-raylib GetGamepadName
  (_fun _int -> _string))

(define-raylib IsGamepadButtonPressed
  (_fun _int _GamepadButton -> _bool))

(define-raylib IsGamepadButtonDown
  (_fun _int _GamepadButton -> _bool))

(define-raylib IsGamepadButtonReleased
  (_fun _int _GamepadButton -> _bool))

(define-raylib IsGamepadButtonUp
  (_fun _int _GamepadButton -> _bool))

(define-raylib GetGamepadButtonPressed
  (_fun -> _GamepadButton))

(define-raylib GetGamepadAxisCount
  (_fun _int -> _int))

(define-raylib GetGamepadAxisMovement
  (_fun _int _GamepadAxis -> _float))

(define-raylib SetGamepadMappings
  (_fun _string -> _int))

;; ----------------------------------------------------
;; Mouse Input
;; ----------------------------------------------------

(define-raylib IsMouseButtonPressed
  (_fun _MouseButton -> _bool))

(define-raylib IsMouseButtonDown
  (_fun _MouseButton -> _bool))

(define-raylib IsMouseButtonReleased
  (_fun _MouseButton -> _bool))

(define-raylib IsMouseButtonUp
  (_fun _MouseButton -> _bool))

(define-raylib GetMouseX
  (_fun -> _int))

(define-raylib GetMouseY
  (_fun -> _int))

(define-raylib GetMousePosition
  (_fun -> _Vector2))

(define-raylib GetMouseDelta
  (_fun -> _Vector2))

(define-raylib SetMousePosition
  (_fun _int _int -> _void))

(define-raylib SetMouseOffset
  (_fun _int _int -> _void))

(define-raylib SetMouseScale
  (_fun _float _float -> _void))

(define-raylib GetMouseWheelMove
  (_fun -> _float))

(define-raylib SetMouseCursor
  (_fun _MouseCursor -> _void))

;; ----------------------------------------------------
;; Touch Input
;; ----------------------------------------------------

(define-raylib SetGesturesEnabled
  (_fun _Gesture -> _void))

(define-raylib IsGestureDetected
  (_fun _Gesture -> _bool))

(define-raylib GetGestureDetected
  (_fun -> _Gesture))

(define-raylib GetGestureHoldDuration
  (_fun -> _float))

(define-raylib GetGestureDragVector
  (_fun -> _Vector2))

(define-raylib GetGestureDragAngle
  (_fun -> _float))

(define-raylib GetGesturePinchVector
  (_fun -> _Vector2))

(define-raylib GetGesturePinchAngle
  (_fun -> _float))

;; ----------------------------------------------------
;; Camera
;; ----------------------------------------------------

(define-raylib SetCameraMode
  (_fun _Camera3D _CameraMode -> _void))

(define-raylib UpdateCamera
  (_fun _Camera3D-pointer -> _void))

(define-raylib SetCameraPanControl
  (_fun _KeyboardKey -> _void))

(define-raylib SetCameraAltControl
  (_fun _KeyboardKey -> _void))

(define-raylib SetCameraSmoothZoomControl
  (_fun _KeyboardKey -> _void))

(define-raylib SetCameraMoveControls
  (_fun _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey _KeyboardKey -> _void))

;; ----------------------------------------------------
;; Shapes
;; ----------------------------------------------------

(define-raylib SetShapesTexture
  (_fun _Texture2D _Rectangle -> _void))

(define-raylib DrawPixel
  (_fun _int _int _Color -> _void))

(define-raylib DrawPixelV
  (_fun _Vector2 _Color -> _void))

(define-raylib DrawLine
  (_fun _int _int _int _int _Color -> _void))

(define-raylib DrawLineV
  (_fun _Vector2 _Vector2 _Color -> _void))

(define-raylib DrawLineEx
  (_fun _Vector2 _Vector2 _float _Color -> _void))

(define-raylib DrawLineBezier
  (_fun _Vector2 _Vector2 _float _Color -> _void))

(define-raylib DrawLineBezierQuad
  (_fun _Vector2 _Vector2 _Vector2 _float _Color -> _void))

(define-raylib DrawLineBezierCubic
  (_fun _Vector2 _Vector2 _Vector2 _float _Color -> _void))

(define-raylib DrawLineStrip
  (_fun _Vector2-pointer _int _Color -> _void))

(define-raylib DrawCircle
  (_fun _int _int _float _Color -> _void))

(define-raylib DrawCircleSector
  (_fun _Vector2 _float _float _float _int _Color -> _void))

(define-raylib DrawCircleSectorLines
  (_fun _Vector2 _float _float _float _int _Color -> _void))

(define-raylib DrawCircleGradient
  (_fun _int _int _float _Color _Color -> _void))

(define-raylib DrawCircleV
  (_fun _Vector2 _float _Color -> _void))

(define-raylib DrawCircleLines
  (_fun _int _int _float _Color -> _void))

(define-raylib DrawEllipse
  (_fun _int _int _float _float _Color -> _void))

(define-raylib DrawEllipseLines
  (_fun _int _int _float _float _Color -> _void))

(define-raylib DrawRing
  (_fun _Vector2 _float _float _float _float _int _Color -> _void))

(define-raylib DrawRingLines
  (_fun _Vector2 _float _float _float _float _int _Color -> _void))

(define-raylib DrawRectangle
  (_fun _int _int _int _int _Color -> _void))

(define-raylib DrawRectangleV
  (_fun _Vector2 _Vector2 _Color -> _void))

(define-raylib DrawRectangleRec
  (_fun _Rectangle _Color -> _void))

(define-raylib DrawRectanglePro
  (_fun _Rectangle _Vector2 _float _Color -> _void))

(define-raylib DrawRectangleGradientV
  (_fun _int _int _int _int _Color _Color -> _void))

(define-raylib DrawRectangleGradientH
  (_fun _int _int _int _int _Color _Color -> _void))

(define-raylib DrawRectangleGradientEx
  (_fun _Rectangle _Color _Color _Color _Color -> _void))

(define-raylib DrawRectangleLines
  (_fun _int _int _int _int _Color -> _void))

(define-raylib DrawRectangleLinesEx
  (_fun _Rectangle _float _Color -> _void))

(define-raylib DrawRectangleRounded
  (_fun _Rectangle _float _int _Color -> _void))

(define-raylib DrawRectangleRoundedLines
  (_fun _Rectangle _float _int _float _Color -> _void))

(define-raylib DrawTriangle
  (_fun _Vector2 _Vector2 _Vector2 _Color -> _void))

(define-raylib DrawTriangleLines
  (_fun _Vector2 _Vector2 _Vector2 _Color -> _void))

(define-raylib DrawTriangleFan
  (_fun _Vector2-pointer _int _Color -> _void))

(define-raylib DrawTriangleStrip
  (_fun _Vector2-pointer _int _Color -> _void))

(define-raylib DrawPoly
  (_fun _Vector2 _int _float _float _Color -> _void))

(define-raylib DrawPolyLines
  (_fun _Vector2 _int _float _float _Color -> _void))

(define-raylib DrawPolyLinesEx
  (_fun _Vector2 _int _float _float _float _Color -> _void))

;; ----------------------------------------------------
;; 2D Shape Collisions
;; ----------------------------------------------------

(define-raylib CheckCollisionRecs
  (_fun _Rectangle _Rectangle -> _bool))

(define-raylib CheckCollisionCircles
  (_fun _Vector2 _float _Vector2 _float -> _bool))

(define-raylib CheckCollisionCircleRec
  (_fun _Vector2 _float _Rectangle -> _bool))

(define-raylib CheckCollisionPointRec
  (_fun _Vector2 _Rectangle -> _bool))

(define-raylib CheckCollisionPointCircle
  (_fun _Vector2 _Vector2 _float -> _bool))

(define-raylib CheckCollisionPointTriangle
  (_fun _Vector2 _Vector2 _Vector2 _Vector2 -> _bool))

(define-raylib CheckCollisionLines
  (_fun _Vector2 _Vector2 _Vector2 _Vector2 -> _bool))

(define-raylib CheckCollisionPointLine
  (_fun _Vector2 _Vector2 _Vector2 _int -> _bool))

(define-raylib GetCollisionRec
  (_fun _Rectangle _Rectangle -> _bool))

;; ----------------------------------------------------
;; Image Loading
;; ----------------------------------------------------

(define-raylib LoadImage
  (_fun _path -> _Image))

(define-raylib LoadImageRaw
  (_fun _path _int _int _PixelFormat _int -> _Image))

(define-raylib LoadImageAnim
  (_fun _path _pointer -> _Image))

(define-raylib LoadImageFromMemory
  (_fun _string _pointer _int -> _Image))

(define-raylib LoadImageFromTexture
  (_fun _Texture2D -> _Image))

(define-raylib LoadImageFromScreen
  (_fun -> _Image))

(define-raylib UnloadImage
  (_fun _Image -> _void) #:wrap (deallocator))

(define-raylib ExportImage
  (_fun _Image _path -> _bool))

(define-raylib ExportImageAsCode
  (_fun _Image _path -> _bool))

;; ----------------------------------------------------
;; Image Generation
;; ----------------------------------------------------

(define-raylib GenImageColor
  (_fun _int _int _Color -> _Image))

(define-raylib GenImageGradientV
  (_fun _int _int _Color _Color -> _Image))

(define-raylib GenImageGradientH
  (_fun _int _int _Color _Color -> _Image))

(define-raylib GenImageGradientRadial
  (_fun _int _int _float _Color _Color -> _Image))

(define-raylib GenImageChecked
  (_fun _int _int _int _int _Color _Color -> _Image))

(define-raylib GenImageWhiteNoise
  (_fun _int _int _float -> _Image))

(define-raylib GenImageCellular
  (_fun _int _int _int -> _Image))

;; ----------------------------------------------------
;; Image Manipulation
;; ----------------------------------------------------

(define-raylib ImageCopy
  (_fun _Image -> _Image))

(define-raylib ImageFromImage
  (_fun _Image _Rectangle -> _Image))

(define-raylib ImageText
  (_fun _string _int _Color -> _Image))

(define-raylib ImageTextEx
  (_fun _Font _string _float _float _Color -> _Image))

(define-raylib ImageFormat
  (_fun _Image-pointer _PixelFormat -> _void))

(define-raylib ImageToPOT
  (_fun _Image-pointer _Color -> _void))

(define-raylib ImageCrop
  (_fun _Image-pointer _Rectangle -> _void))

(define-raylib ImageAlphaCrop
  (_fun _Image-pointer _float -> _void))

(define-raylib ImageAlphaClear
  (_fun _Image-pointer _Color _float -> _void))

(define-raylib ImageAlphaMask
  (_fun _Image-pointer _Image -> _void))

(define-raylib ImageAlphaPremultiply
  (_fun _Image-pointer -> _void))

(define-raylib ImageResize
  (_fun _Image-pointer _int _int -> _void))

(define-raylib ImageResizeNN
  (_fun _Image-pointer _int _int -> _void))

(define-raylib ImageResizeCanvas
  (_fun _Image-pointer _int _int _int _int _Color -> _void))

(define-raylib ImageMipmaps
  (_fun _Image-pointer -> _void))

(define-raylib ImageDither
  (_fun _Image-pointer _int _int _int _int -> _void))

(define-raylib ImageFlipVertical
  (_fun _Image-pointer -> _void))

(define-raylib ImageFlipHorizontal
  (_fun _Image-pointer -> _void))

(define-raylib ImageRotateCW
  (_fun _Image-pointer -> _void))

(define-raylib ImageRotateCCW
  (_fun _Image-pointer -> _void))

(define-raylib ImageColorTint
  (_fun _Image-pointer _Color -> _void))

(define-raylib ImageColorInvert
  (_fun _Image-pointer -> _void))

(define-raylib ImageColorGrayscale
  (_fun _Image-pointer -> _void))

(define-raylib ImageColorContrast
  (_fun _Image-pointer _float -> _void))

(define-raylib ImageColorBrightness
  (_fun _Image-pointer _float -> _void))

(define-raylib ImageColorReplace
  (_fun _Image-pointer _Color _Color -> _void))

(define-raylib LoadImageColors
  (_fun _Image -> _Color-pointer))

(define-raylib LoadImagePalette
  (_fun _Image _int (n : (_ptr o _int)) -> (colors : _Color-pointer) -> (values colors n)))

(define-raylib UnloadImageColors
  (_fun _Color-pointer -> _void) #:wrap (deallocator))

(define-raylib UnloadImagePalette
  (_fun _Color-pointer -> _void) #:wrap (deallocator))

(define-raylib GetImageAlphaBorder
  (_fun _Image _float -> _Rectangle))

(define-raylib GetImageColor
  (_fun _Image _int _int -> _Color))

;; ----------------------------------------------------
;; Image Drawing
;; ----------------------------------------------------

(define-raylib ImageClearBackground
  (_fun _Image-pointer _Color -> _void))

(define-raylib ImageDrawPixel
  (_fun _Image-pointer _int _int _Color -> _void))

(define-raylib ImageDrawPixelV
  (_fun _Image-pointer _Vector2 _Color -> _void))

(define-raylib ImageDrawLine
  (_fun _Image-pointer _int _int _int _int _Color -> _void))

(define-raylib ImageDrawLineV
  (_fun _Image-pointer _Vector2 _Vector2 _Color -> _void))

(define-raylib ImageDrawCircle
  (_fun _Image-pointer _int _int _int _Color -> _void))

(define-raylib ImageDrawCircleV
  (_fun _Image-pointer _Vector2 _int _Color -> _void))

(define-raylib ImageDrawRectangle
  (_fun _Image-pointer _int _int _int _int _Color -> _void))

(define-raylib ImageDrawRectangleV
  (_fun _Image-pointer _Vector2 _Vector2 _Color -> _void))

(define-raylib ImageDrawRectangleRec
  (_fun _Image-pointer _Rectangle _Color -> _void))

(define-raylib ImageDrawRectangleLines
  (_fun _Image-pointer _Rectangle _int _Color -> _void))

(define-raylib ImageDraw
  (_fun _Image-pointer _Image _Rectangle _Rectangle _Color -> _void))

(define-raylib ImageDrawText
  (_fun _Image-pointer _string _int _int _int _Color -> _void))

(define-raylib ImageDrawTextEx
  (_fun _Image-pointer _Font _string _Vector2 _float _float _Color -> _void))

;; ----------------------------------------------------
;; Texture Loading
;; ----------------------------------------------------

(define-raylib LoadTexture
  (_fun _path -> _Texture2D))

(define-raylib LoadTextureFromImage
  (_fun _Image -> _Texture2D))

(define-raylib LoadTextureCubemap
  (_fun _Image _CubemapLayout -> _TextureCubemap))

(define-raylib LoadRenderTexture
  (_fun _int _int -> _RenderTexture2D))

(define-raylib UnloadTexture
  (_fun _Texture2D -> _void) #:wrap (deallocator))

(define-raylib UnloadRenderTexture
  (_fun _RenderTexture2D -> _void) #:wrap (deallocator))

(define-raylib UpdateTexture
  (_fun _Texture2D _pointer -> _void))

(define-raylib UpdateTextureRec
  (_fun _Texture2D _Rectangle _pointer -> _void))

;; ----------------------------------------------------
;; Texture Configuration
;; ----------------------------------------------------

(define-raylib GenTextureMipmaps
  (_fun _Texture2D-pointer -> _void))

(define-raylib SetTextureFilter
  (_fun _Texture2D _TextureFilter -> _void))

;; ----------------------------------------------------
;; Texture Drawing
;; ----------------------------------------------------

(define-raylib DrawTexture
  (_fun _Texture2D _int _int _Color -> _void))

(define-raylib DrawTextureV
  (_fun _Texture2D _Vector2 _Color -> _void))

(define-raylib DrawTextureEx
  (_fun _Texture2D _Vector2 _float _float _Color -> _void))

(define-raylib DrawTextureRec
  (_fun _Texture2D _Rectangle _Vector2 _Color -> _void))

(define-raylib DrawTextureQuad
  (_fun _Texture2D _Vector2 _Vector2 _Rectangle _Color -> _void))

(define-raylib DrawTextureTiled
  (_fun _Texture2D _Rectangle _Rectangle _Vector2 _float _float _Color -> _void))

(define-raylib DrawTexturePro
  (_fun _Texture2D _Rectangle _Rectangle _Vector2 _float _Color -> _void))

(define-raylib DrawTextureNPatch
  (_fun _Texture2D _NPatchInfo _Rectangle _Vector2 _float _Color -> _void))

(define-raylib DrawTexturePoly
  (_fun _Texture2D _Vector2 _Vector2-pointer _Vector2-pointer _int _Color -> _void))

;; ----------------------------------------------------
;; Color
;; ----------------------------------------------------

(define-raylib Fade
  (_fun _Color _float -> _Color))

(define-raylib ColorToInt
  (_fun _Color -> _int))

(define-raylib ColorNormalize
  (_fun _Color -> _Vector4))

(define-raylib ColorFromNormalized
  (_fun _Vector4 -> _Color))

(define-raylib ColorToHSV
  (_fun _Color -> _Vector3))

(define-raylib ColorFromHSV
  (_fun _Vector3 -> _Color))

(define-raylib ColorAlpha
  (_fun _Color _float -> _Color))

(define-raylib ColorAlphaBlend
  (_fun _Color _Color _Color -> _Color))

(define-raylib GetColor
  (_fun _uint -> _Color))

(define-raylib GetPixelColor
  (_fun _pointer _PixelFormat -> _Color))

(define-raylib SetPixelColor
  (_fun _pointer _Color _PixelFormat -> _void))

(define-raylib GetPixelDataSize
  (_fun _int _int _PixelFormat -> _int))

;; ----------------------------------------------------
;; Fonts
;; ----------------------------------------------------

(define-raylib GetFontDefault
  (_fun -> _Font))

(define-raylib LoadFont
  (_fun _path -> _Font))

(define-raylib LoadFontEx
  (_fun _path _int _pointer _int -> _Font))

(define-raylib LoadFontFromImage
  (_fun _Image _Color _int -> _Font))

(define-raylib LoadFontFromMemory
  (_fun _string _pointer _int _int _pointer _int -> _Font))

(define-raylib LoadFontData
  (_fun _pointer _int _int _pointer _int _FontType -> _Font))

#;(define-raylib GenImageFontAtlas
  (_fun _GlyphInfo-pointer _Rectangle-pointer _int _int _int _int -> _Font))

#;(define-raylib UnloadFontData
  (_fun _GlyphInfo-pointer _int -> _void))

(define-raylib UnloadFont
  (_fun _Font -> _void) #:wrap (deallocator))

#;(define-raylib ExportFontAsCode
  (_fun _Font _path -> _bool))

;; ----------------------------------------------------
;; Text Drawing
;; ----------------------------------------------------

(define-raylib DrawFPS
  (_fun _int _int -> _void))

(define-raylib DrawText
  (_fun _string _int _int _int _Color -> _void))

(define-raylib DrawTextEx
  (_fun _Font _string _Vector2 _float _float _Color -> _void))

(define-raylib DrawTextPro
  (_fun _Font _string _Vector2 _Vector2 _float _float _float _Color -> _void))

(define-raylib DrawTextCodepoint
  (_fun _Font _int _Vector2 _float _Color -> _void))

#;(define-raylib DrawTextCodepoints
  (_fun _Font _pointer _int _Vector2 _float _float _Color -> _void))

;; ----------------------------------------------------
;; Text Info
;; ----------------------------------------------------

(define-raylib MeasureText
  (_fun _string _int -> _int))

(define-raylib MeasureTextEx
  (_fun _Font _string _float _float -> _Vector2))

(define-raylib GetGlyphIndex
  (_fun _Font _int -> _int))

(define-raylib GetGlyphInfo
  (_fun _Font _int -> _GlyphInfo))

(define-raylib GetGlyphAtlasRec
  (_fun _Font _int -> _Rectangle))

;; ----------------------------------------------------
;; Text Codepoints
;; ----------------------------------------------------

(define-raylib LoadCodepoints
  (_fun _string (n : (_ptr o _int)) -> (data : _Codepoint-pointer) -> (values data n)))

(define-raylib UnloadCodepoints
  (_fun _Codepoint-pointer -> _void) #:wrap (deallocator))

(define-raylib GetCodepointCount
  (_fun _string -> _int))

(define-raylib GetCodepoint
  (_fun _string (n : (_ptr o _int)) -> (cp : _int) -> (values cp n)))

(define-raylib CodepointToUTF8
  (_fun _int (n : (_ptr o _int)) -> (s : _string) -> (values s n)))

(define-raylib TextCodepointsToUTF8
  (_fun _Codepoint-pointer _int -> _string))

;; ----------------------------------------------------
;; Text Strings
;; ----------------------------------------------------

;; TODO:

;; ----------------------------------------------------
;; 3D Shapes
;; ----------------------------------------------------

(define-raylib DrawLine3D
  (_fun _Vector3 _Vector3 _Color -> _void))

(define-raylib DrawPoint3D
  (_fun _Vector3 _Color -> _void))

(define-raylib DrawCircle3D
  (_fun _Vector3 _float _Vector3 _float _Color -> _void))

(define-raylib DrawTriangle3D
  (_fun _Vector3 _Vector3 _Vector3 _Color -> _void))

(define-raylib DrawTriangleStrip3D
  (_fun _Vector3-pointer _int _Color -> _void))

(define-raylib DrawCube
  (_fun _Vector3 _float _float _float _Color -> _void))

(define-raylib DrawCubeV
  (_fun _Vector3 _Vector3 _Color -> _void))

(define-raylib DrawCubeWires
  (_fun _Vector3 _float _float _float _Color -> _void))

(define-raylib DrawCubeWiresV
  (_fun _Vector3 _float _float _float _Color -> _void))

(define-raylib DrawCubeTexture
  (_fun _Texture2D _Vector3 _float _float _float _Color -> _void))

(define-raylib DrawSphere
  (_fun _Vector3 _float _Color -> _void))

(define-raylib DrawSphereEx
  (_fun _Vector3 _float _int _int _Color -> _void))

(define-raylib DrawSphereWires
  (_fun _Vector3 _float _int _int _Color -> _void))

(define-raylib DrawCylinder
  (_fun _Vector3 _float _float _float _int _Color -> _void))

(define-raylib DrawCylinderEx
  (_fun _Vector3 _Vector3 _float _float _int _Color -> _void))

(define-raylib DrawCylinderWires
  (_fun _Vector3 _float _float _float _int _Color -> _void))

(define-raylib DrawCylinderWiresEx
  (_fun _Vector3 _Vector3 _float _float _int _Color -> _void))

(define-raylib DrawPlane
  (_fun _Vector3 _Vector2 _Color -> _void))

(define-raylib DrawRay
  (_fun _Ray _Color -> _void))

(define-raylib DrawGrid
  (_fun _int _float -> _void))

;; ----------------------------------------------------
;; Model Loading
;; ----------------------------------------------------

(define-raylib LoadModel
  (_fun _path -> _Model))

(define-raylib LoadModelFromMesh
  (_fun _Mesh -> _Model))

(define-raylib UnloadModel
  (_fun _Model -> _void) #:wrap (deallocator))

(define-raylib UnloadModelKeepMeshes
  (_fun _Model -> _void))

(define-raylib GetModelBoundingBox
  (_fun _Model -> _BoundingBox))

;; ----------------------------------------------------
;; Model Drawing
;; ----------------------------------------------------

(define-raylib DrawModel
  (_fun _Model _Vector3 _float _Color -> _void))

(define-raylib DrawModelEx
  (_fun _Model _Vector3 _Vector3 _float _Vector3 _Color -> _void))

(define-raylib DrawModelWires
  (_fun _Model _Vector3 _float _Color -> _void))

(define-raylib DrawModelWiresEx
  (_fun _Model _Vector3 _Vector3 _float _Vector3 _Color -> _void))

(define-raylib DrawBoundingBox
  (_fun _BoundingBox _Color -> _void))

(define-raylib DrawBillboard
  (_fun _Camera3D _Texture2D _Vector3 _float _Color -> _void))

(define-raylib DrawBillboardRec
  (_fun _Camera3D _Texture2D _Rectangle _Vector3 _Vector2 _float _Color -> _void))

(define-raylib DrawBillboardPro
  (_fun _Camera3D _Texture2D _Rectangle _Vector3 _Vector3 _Vector2 _Vector2 _Color -> _void))

;; ----------------------------------------------------
;; Mesh Management
;; ----------------------------------------------------

(define-raylib UploadMesh
  (_fun _Mesh-pointer _bool -> _void))

(define-raylib UpdateMeshBuffer
  (_fun _Mesh _int _pointer _int _int -> _void))

(define-raylib UnloadMesh
  (_fun _Mesh -> _void) #:wrap (deallocator))

(define-raylib DrawMesh
  (_fun _Mesh _Material _Matrix -> _void))

(define-raylib DrawMeshInstanced
  (_fun _Mesh _Material _Matrix-pointer _int -> _void))

(define-raylib ExportMesh
  (_fun _Mesh _path -> _bool))

(define-raylib GetMeshBoundingBox
  (_fun _Mesh -> _BoundingBox))

(define-raylib GenMeshTangents
  (_fun _Mesh-pointer -> _void))

(define-raylib GenMeshBinormals
  (_fun _Mesh-pointer -> _void))

;; ----------------------------------------------------
;; Mesh Generation
;; ----------------------------------------------------

(define-raylib GenMeshPoly
  (_fun _int _float -> _Mesh))

(define-raylib GenMeshPlane
  (_fun _float _float _int _int -> _Mesh))

(define-raylib GenMeshCube
  (_fun _float _float _float -> _Mesh))

(define-raylib GenMeshSphere
  (_fun _float _int _int -> _Mesh))

(define-raylib GenMeshHemiSphere
  (_fun _float _int _int -> _Mesh))

(define-raylib GenMeshCylinder
  (_fun _float _float _int -> _Mesh))

(define-raylib GenMeshCone
  (_fun _float _float _int -> _Mesh))

(define-raylib GenMeshTorus
  (_fun _float _float _int _int -> _Mesh))

(define-raylib GenMeshKnot
  (_fun _float _float _int _int -> _Mesh))

(define-raylib GenMeshHeightmap
  (_fun _Image _Vector3 -> _Mesh))

(define-raylib GenMeshCubicmap
  (_fun _Image _Vector3 -> _Mesh))

;; ----------------------------------------------------
;; Material Loading
;; ----------------------------------------------------

(define-raylib LoadMaterials
  (_fun _path (n : (_ptr o _int)) -> (mat : _Material) -> (values mat n)))

(define-raylib LoadMaterialDefault
  (_fun -> _Material))

(define-raylib UnloadMaterial
  (_fun _Material -> _void) #:wrap (deallocator))

(define-raylib SetMaterialTexture
  (_fun _Material-pointer _MaterialMapIndex _Texture2D -> _void))

(define-raylib SetModelMeshMaterial
  (_fun _Model-pointer _int _int -> _void))

;; ----------------------------------------------------
;; Model Animation Loading
;; ----------------------------------------------------

(define-raylib LoadModelAnimations
  (_fun _path (n : (_ptr o _int)) -> (anim : _ModelAnimation) -> (values anim n)))

(define-raylib UpdateModelAnimation
  (_fun _Model _ModelAnimation _int -> _void))

(define-raylib UnloadModelAnimation
  (_fun _ModelAnimation -> _void) #:wrap (deallocator))

(define-raylib UnloadModelAnimations
  (_fun _ModelAnimation-pointer _int -> _void))

(define-raylib IsModelAnimationValid
  (_fun _Model _ModelAnimation -> _bool))

;; ----------------------------------------------------
;; 3D Shape Collisions
;; ----------------------------------------------------

(define-raylib CheckCollisionSpheres
  (_fun _Vector3 _float _Vector3 _float -> _bool))

(define-raylib CheckCollisionBoxes
  (_fun _BoundingBox _BoundingBox -> _bool))

(define-raylib CheckCollisionBoxSphere
  (_fun _BoundingBox _Vector3 _float -> _bool))

(define-raylib GetRayCollisionSphere
  (_fun _Ray _Vector3 _float -> _RayCollision))

(define-raylib GetRayCollisionBox
  (_fun _Ray _BoundingBox -> _RayCollision))

(define-raylib GetRayCollisionModel
  (_fun _Ray _Model -> _RayCollision))

(define-raylib GetRayCollisionMesh
  (_fun _Ray _Mesh _Matrix -> _RayCollision))

(define-raylib GetRayCollisionTriangle
  (_fun _Ray _Vector3 _Vector3 _Vector3 -> _RayCollision))

(define-raylib GetRayCollisionQuad
  (_fun _Ray _Vector3 _Vector3 _Vector3 _Vector3 -> _RayCollision))

;; ----------------------------------------------------
;; Audio
;; ----------------------------------------------------

(define-raylib InitAudioDevice
  (_fun -> _void))

(define-raylib CloseAudioDevice
  (_fun -> _void))

(define-raylib IsAudioDeviceReady
  (_fun -> _bool))

(define-raylib SetMasterVolume
  (_fun _float -> _void))

;; ----------------------------------------------------
;; Sound Loading
;; ----------------------------------------------------

(define-raylib LoadWave
  (_fun _path -> _Wave))

(define-raylib LoadWaveFromMemory
  (_fun _string _pointer _int -> _Wave))

(define-raylib LoadSound
  (_fun _path -> _Sound))

(define-raylib LoadSoundFromWave
  (_fun _Wave -> _Sound))

(define-raylib UpdateSound
  (_fun _Sound _pointer _int -> _void))

(define-raylib UnloadWave
  (_fun _Wave -> _void) #:wrap (deallocator))

(define-raylib UnloadSound
  (_fun _Sound -> _void) #:wrap (deallocator))

(define-raylib ExportWave
  (_fun _Wave _path -> _bool))

(define-raylib ExportWaveAsCode
  (_fun _Wave _path -> _bool))

;; ----------------------------------------------------
;; Sound Playing
;; ----------------------------------------------------

(define-raylib PlaySound
  (_fun _Sound -> _void))

(define-raylib StopSound
  (_fun _Sound -> _void))

(define-raylib PauseSound
  (_fun _Sound -> _void))

(define-raylib ResumeSound
  (_fun _Sound -> _void))

(define-raylib PlaySoundMulti
  (_fun _Sound -> _void))

(define-raylib StopSoundMulti
  (_fun _Sound -> _void))

(define-raylib GetSoundsPlaying
  (_fun -> _int))

(define-raylib IsSoundPlaying
  (_fun _Sound -> _bool))

(define-raylib SetSoundVolume
  (_fun _Sound _float -> _void))

(define-raylib SetSoundPitch
  (_fun _Sound _float -> _void))

#;(define-raylib SetSoundPan
  (_fun _Sound _float -> _void))

(define-raylib WaveCopy
  (_fun _Wave -> _Wave))

(define-raylib WaveCrop
  (_fun _Wave-pointer _int _int -> _void))

(define-raylib WaveFormat
  (_fun _Wave-pointer _int _int _int -> _void))

(define-raylib LoadWaveSamples
  (_fun _Wave -> _pointer))

(define-raylib UnloadWaveSamples
  (_fun _pointer -> _void))

;; ----------------------------------------------------
;; Music Loading
;; ----------------------------------------------------

(define-raylib LoadMusicStream
  (_fun _path -> _Music))

(define-raylib LoadMusicStreamFromMemory
  (_fun _string _pointer _int -> _Music))

(define-raylib UnloadMusicStream
  (_fun _Music -> _void) #:wrap (deallocator))

(define-raylib PlayMusicStream
  (_fun _Music -> _void))

(define-raylib IsMusicStreamPlaying
  (_fun _Music -> _bool))

(define-raylib UpdateMusicStream
  (_fun _Music -> _void))

(define-raylib StopMusicStream
  (_fun _Music -> _void))

(define-raylib PauseMusicStream
  (_fun _Music -> _void))

(define-raylib ResumeMusicStream
  (_fun _Music -> _void))

(define-raylib SeekMusicStream
  (_fun _Music _float -> _void))

(define-raylib SetMusicVolume
  (_fun _Music _float -> _void))

(define-raylib SetMusicPitch
  (_fun _Music _float -> _void))

#;(define-raylib SetMusicPan
  (_fun _Music _float -> _void))

(define-raylib GetMusicTimeLength
  (_fun _Music -> _float))

(define-raylib GetMusicTimePlayed
  (_fun _Music -> _float))

;; ----------------------------------------------------
;; AudioStreams
;; ----------------------------------------------------

(define-raylib LoadAudioStream
  (_fun _uint _uint _uint -> _AudioStream))

(define-raylib UnloadAudioStream
  (_fun _AudioStream -> _void) #:wrap (deallocator))

(define-raylib UpdateAudioStream
  (_fun _AudioStream _pointer _int -> _void))

(define-raylib IsAudioStreamProcessed
  (_fun _AudioStream -> _bool))

(define-raylib PlayAudioStream
  (_fun _AudioStream -> _void))

(define-raylib PauseAudioStream
  (_fun _AudioStream -> _void))

(define-raylib ResumeAudioStream
  (_fun _AudioStream -> _void))

(define-raylib IsAudioStreamPlaying
  (_fun _AudioStream -> _bool))

(define-raylib StopAudioStream
  (_fun _AudioStream -> _void))

(define-raylib SetAudioStreamVolume
  (_fun _AudioStream _float -> _void))

(define-raylib SetAudioStreamPitch
  (_fun _AudioStream _float -> _void))

#;(define-raylib SetAudioStreamPan
  (_fun _AudioStream _float -> _void))

(define-raylib SetAudioStreamBufferSizeDefault
  (_fun _AudioStream _int -> _void))
