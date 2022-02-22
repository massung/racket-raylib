#lang racket

#|

Raylib 4.0 wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------

(define _ConfigFlags
  (_enum '(FLAG_VSYNC_HINT         = #x00000040
           FLAG_FULLSCREEN_MODE    = #x00000002
           FLAG_WINDOW_RESIZABLE   = #x00000004
           FLAG_WINDOW_UNDECORATED = #x00000008
           FLAG_WINDOW_HIDDEN      = #x00000080
           FLAG_WINDOW_MINIMIZED   = #x00000200
           FLAG_WINDOW_MAXIMIZED   = #x00000400
           FLAG_WINDOW_UNFOCUSED   = #x00000800
           FLAG_WINDOW_TOPMOST     = #x00001000
           FLAG_WINDOW_ALWAYS_RUN  = #x00000100
           FLAG_WINDOW_TRANSPARENT = #x00000010
           FLAG_WINDOW_HIGHDPI     = #x00002000
           FLAG_MSAA_4X_HINT       = #x00000020
           FLAG_INTERLACED_HINT    = #x00010000)))

;; ----------------------------------------------------

(define _TraceLogLevel
  (_enum '(LOG_ALL
           LOG_TRACE
           LOG_DEBUG
           LOG_INFO
           LOG_WARNING
           LOG_ERROR
           LOG_FATAL
           LOG_NONE)))

;; ----------------------------------------------------

(define _KeyboardKey
  (_enum '(KEY_NULL            = 0

           ;; alphanumeric keys
           KEY_APOSTROPHE      = 39
           KEY_COMMA           = 44
           KEY_MINUS           = 45
           KEY_PERIOD          = 46
           KEY_SLASH           = 47
           KEY_ZERO            = 48
           KEY_ONE             = 49
           KEY_TWO             = 50
           KEY_THREE           = 51
           KEY_FOUR            = 52
           KEY_FIVE            = 53
           KEY_SIX             = 54
           KEY_SEVEN           = 55
           KEY_EIGHT           = 56
           KEY_NINE            = 57
           KEY_SEMICOLON       = 59
           KEY_EQUAL           = 61
           KEY_A               = 65
           KEY_B               = 66
           KEY_C               = 67
           KEY_D               = 68
           KEY_E               = 69
           KEY_F               = 70
           KEY_G               = 71
           KEY_H               = 72
           KEY_I               = 73
           KEY_J               = 74
           KEY_K               = 75
           KEY_L               = 76
           KEY_M               = 77
           KEY_N               = 78
           KEY_O               = 79
           KEY_P               = 80
           KEY_Q               = 81
           KEY_R               = 82
           KEY_S               = 83
           KEY_T               = 84
           KEY_U               = 85
           KEY_V               = 86
           KEY_W               = 87
           KEY_X               = 88
           KEY_Y               = 89
           KEY_Z               = 90
           KEY_LEFT_BRACKET    = 91
           KEY_BACKSLASH       = 92
           KEY_RIGHT_BRACKET   = 93
           KEY_GRAVE           = 96

           ;; function keys
           KEY_SPACE           = 32
           KEY_ESCAPE          = 256
           KEY_ENTER           = 257
           KEY_TAB             = 258
           KEY_BACKSPACE       = 259
           KEY_INSERT          = 260
           KEY_DELETE          = 261
           KEY_RIGHT           = 262
           KEY_LEFT            = 263
           KEY_DOWN            = 264
           KEY_UP              = 265
           KEY_PAGE_UP         = 266
           KEY_PAGE_DOWN       = 267
           KEY_HOME            = 268
           KEY_END             = 269
           KEY_CAPS_LOCK       = 280
           KEY_SCROLL_LOCK     = 281
           KEY_NUM_LOCK        = 282
           KEY_PRINT_SCREEN    = 283
           KEY_PAUSE           = 284
           KEY_F1              = 290
           KEY_F2              = 291
           KEY_F3              = 292
           KEY_F4              = 293
           KEY_F5              = 294
           KEY_F6              = 295
           KEY_F7              = 296
           KEY_F8              = 297
           KEY_F9              = 298
           KEY_F10             = 299
           KEY_F11             = 300
           KEY_F12             = 301
           KEY_LEFT_SHIFT      = 340
           KEY_LEFT_CONTROL    = 341
           KEY_LEFT_ALT        = 342
           KEY_LEFT_SUPER      = 343
           KEY_RIGHT_SHIFT     = 344
           KEY_RIGHT_CONTROL   = 345
           KEY_RIGHT_ALT       = 346
           KEY_RIGHT_SUPER     = 347
           KEY_KB_MENU         = 348

           ;; keypad keys
           KEY_KP_0            = 320
           KEY_KP_1            = 321
           KEY_KP_2            = 322
           KEY_KP_3            = 323
           KEY_KP_4            = 324
           KEY_KP_5            = 325
           KEY_KP_6            = 326
           KEY_KP_7            = 327
           KEY_KP_8            = 328
           KEY_KP_9            = 329
           KEY_KP_DECIMAL      = 330
           KEY_KP_DIVIDE       = 331
           KEY_KP_MULTIPLY     = 332
           KEY_KP_SUBTRACT     = 333
           KEY_KP_ADD          = 334
           KEY_KP_ENTER        = 335
           KEY_KP_EQUAL        = 336

           ;; android key buttons
           KEY_BACK            = 4
           KEY_MENU            = 82
           KEY_VOLUME_UP       = 24
           KEY_VOLUME_DOWN     = 25)))

;; ----------------------------------------------------

(define _MouseButton
  (_enum '(MOUSE_BUTTON_LEFT
           MOUSE_BUTTON_RIGHT
           MOUSE_BUTTON_MIDDLE
           MOUSE_BUTTON_SIDE
           MOUSE_BUTTON_EXTRA
           MOUSE_BUTTON_FORWARD
           MOUSE_BUTTON_BACK)))

;; ----------------------------------------------------

(define _MouseCursor
  (_enum '(MOUSE_CURSOR_DEFAULT
           MOUSE_CURSOR_ARROW
           MOUSE_CURSOR_IBEAM
           MOUSE_CURSOR_CROSSHAIR
           MOUSE_CURSOR_POINTING_HAND
           MOUSE_CURSOR_RESIZE_EW
           MOUSE_CURSOR_RESIZE_NS
           MOUSE_CURSOR_RESIZE_NWSE
           MOUSE_CURSOR_RESIZE_NESW
           MOUSE_CURSOR_RESIZE_ALL
           MOUSE_CURSOR_NOT_ALLOWED)))

;; ----------------------------------------------------

(define _GamepadButton
  (_enum '(GAMEPAD_BUTTON_UNKNOWN
           GAMEPAD_BUTTON_LEFT_FACE_UP
           GAMEPAD_BUTTON_LEFT_FACE_RIGHT
           GAMEPAD_BUTTON_LEFT_FACE_DOWN
           GAMEPAD_BUTTON_LEFT_FACE_LEFT
           GAMEPAD_BUTTON_RIGHT_FACE_UP
           GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
           GAMEPAD_BUTTON_RIGHT_FACE_DOWN
           GAMEPAD_BUTTON_RIGHT_FACE_LEFT
           GAMEPAD_BUTTON_LEFT_TRIGGER_1
           GAMEPAD_BUTTON_LEFT_TRIGGER_2
           GAMEPAD_BUTTON_RIGHT_TRIGGER_1
           GAMEPAD_BUTTON_RIGHT_TRIGGER_2
           GAMEPAD_BUTTON_MIDDLE_LEFT
           GAMEPAD_BUTTON_MIDDLE
           GAMEPAD_BUTTON_MIDDLE_RIGHT
           GAMEPAD_BUTTON_LEFT_THUMB
           GAMEPAD_BUTTON_RIGHT_THUMB)))

;; ----------------------------------------------------

(define _GamepadAxis
  (_enum '(GAMEPAD_AXIS_LEFT_X
           GAMEPAD_AXIS_LEFT_Y
           GAMEPAD_AXIS_RIGHT_X
           GAMEPAD_AXIS_RIGHT_Y
           GAMEPAD_AXIS_LEFT_TRIGGER
           GAMEPAD_AXIS_RIGHT_TRIGGER)))

;; ----------------------------------------------------

(define _MaterialMapIndex
  (_enum '(MATERIAL_MAP_ALBEDO
           MATERIAL_MAP_METALNESS
           MATERIAL_MAP_NORMAL
           MATERIAL_MAP_ROUGHNESS
           MATERIAL_MAP_OCCLUSION
           MATERIAL_MAP_EMISSION
           MATERIAL_MAP_HEIGHT
           MATERIAL_MAP_CUBEMAP
           MATERIAL_MAP_IRRADIANCE
           MATERIAL_MAP_PREFILTER
           MATERIAL_MAP_BRDF)))

;; ----------------------------------------------------

(define MATERIAL_MAP_DIFFUSE 'MATERIAL_MAP_ALBEDO)
(define MATERIAL_MAP_SPECULAR 'MATERIAL_MAP_METALNESS)

;; ----------------------------------------------------

(define _ShaderLocationIndex
  (_enum '(SHADER_LOC_VERTEX_POSITION
           SHADER_LOC_VERTEX_TEXCOORD01
           SHADER_LOC_VERTEX_TEXCOORD02
           SHADER_LOC_VERTEX_NORMAL
           SHADER_LOC_VERTEX_TANGENT
           SHADER_LOC_VERTEX_COLOR
           SHADER_LOC_MATRIX_MVP
           SHADER_LOC_MATRIX_VIEW
           SHADER_LOC_MATRIX_PROJECTION
           SHADER_LOC_MATRIX_MODEL
           SHADER_LOC_MATRIX_NORMAL
           SHADER_LOC_VECTOR_VIEW
           SHADER_LOC_COLOR_DIFFUSE
           SHADER_LOC_COLOR_SPECULAR
           SHADER_LOC_COLOR_AMBIENT
           SHADER_LOC_MAP_ALBEDO
           SHADER_LOC_MAP_METALNESS
           SHADER_LOC_MAP_NORMAL
           SHADER_LOC_MAP_ROUGHNESS
           SHADER_LOC_MAP_OCCLUSION
           SHADER_LOC_MAP_EMISSION
           SHADER_LOC_MAP_HEIGHT
           SHADER_LOC_MAP_CUBEMAP
           SHADER_LOC_MAP_IRRADIANCE
           SHADER_LOC_MAP_PREFILTER
           SHADER_LOC_MAP_BRDF)))

;; ----------------------------------------------------

(define SHADER_LOC_MAP_DIFFUSE 'SHADER_LOC_MAP_ALBEDO)
(define SHADER_LOC_MAP_SPECULAR 'SHADER_LOC_MAP_METALNESS)

;; ----------------------------------------------------

(define _ShaderUniformDataType
  (_enum '(SHADER_UNIFORM_FLOAT
           SHADER_UNIFORM_VEC2
           SHADER_UNIFORM_VEC3
           SHADER_UNIFORM_VEC4
           SHADER_UNIFORM_INT
           SHADER_UNIFORM_IVEC2
           SHADER_UNIFORM_IVEC3
           SHADER_UNIFORM_IVEC4
           SHADER_UNIFORM_SAMPLER2D)))

;; ----------------------------------------------------

(define _ShaderAttributeDataType
  (_enum '(SHADER_ATTRIB_FLOAT
           SHADER_ATTRIB_VEC2
           SHADER_ATTRIB_VEC3
           SHADER_ATTRIB_VEC4)))

;; ----------------------------------------------------

(define _PixelFormat
  (_enum '(PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1
           PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA
           PIXELFORMAT_UNCOMPRESSED_R5G6B5
           PIXELFORMAT_UNCOMPRESSED_R8G8B8
           PIXELFORMAT_UNCOMPRESSED_R5G5B5A1
           PIXELFORMAT_UNCOMPRESSED_R4G4B4A4
           PIXELFORMAT_UNCOMPRESSED_R8G8B8A8
           PIXELFORMAT_UNCOMPRESSED_R32
           PIXELFORMAT_UNCOMPRESSED_R32G32B32
           PIXELFORMAT_UNCOMPRESSED_R32G32B32A32
           PIXELFORMAT_COMPRESSED_DXT1_RGB
           PIXELFORMAT_COMPRESSED_DXT1_RGBA
           PIXELFORMAT_COMPRESSED_DXT3_RGBA
           PIXELFORMAT_COMPRESSED_DXT5_RGBA
           PIXELFORMAT_COMPRESSED_ETC1_RGB
           PIXELFORMAT_COMPRESSED_ETC2_RGB
           PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA
           PIXELFORMAT_COMPRESSED_PVRT_RGB
           PIXELFORMAT_COMPRESSED_PVRT_RGBA
           PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA
           PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA)))

;; ----------------------------------------------------

(define _TextureFilter
  (_enum '(TEXTURE_FILTER_POINT
           TEXTURE_FILTER_BILINEAR
           TEXTURE_FILTER_TRILINEAR
           TEXTURE_FILTER_ANISOTROPIC_4X
           TEXTURE_FILTER_ANISOTROPIC_8X
           TEXTURE_FILTER_ANISOTROPIC_16X)))

;; ----------------------------------------------------

(define _TextureWrap
  (_enum '(TEXTURE_WRAP_REPEAT
           TEXTURE_WRAP_CLAMP
           TEXTURE_WRAP_MIRROR_REPEAT
           TEXTURE_WRAP_MIRROR_CLAMP)))

;; ----------------------------------------------------

(define _CubemapLayout
  (_enum '(CUBEMAP_LAYOUT_AUTO_DETECT
           CUBEMAP_LAYOUT_LINE_VERTICAL
           CUBEMAP_LAYOUT_LINE_HORIZONTAL
           CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR
           CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE
           CUBEMAP_LAYOUT_PANORAMA)))

;; ----------------------------------------------------

(define _FontType
  (_enum '(FONT_DEFAULT
           FONT_BITMAP
           FONT_SDF)))

;; ----------------------------------------------------

(define _BlendMode
  (_enum '(BLEND_ALPHA
           BLEND_ADDITIVE
           BLEND_MULTIPLIED
           BLEND_ADD_COLORS
           BLEND_SUBTRACT_COLORS
           BLEND_ALPHA_PREMUL
           BLEND_CUSTOM)))

;; ----------------------------------------------------

(define _Gesture
  (_enum '(GESTURE_NONE        = 0
           GESTURE_TAP         = 1
           GESTURE_DOUBLETAP   = 2
           GESTURE_HOLD        = 4
           GESTURE_DRAG        = 8
           GESTURE_SWIPE_RIGHT = 16
           GESTURE_SWIPE_LEFT  = 32
           GESTURE_SWIPE_UP    = 64
           GESTURE_SWIPE_DOWN  = 128
           GESTURE_PINCH_IN    = 256
           GESTURE_PINCH_OUT   = 512)))

;; ----------------------------------------------------

(define _CameraMode
  (_enum '(CAMERA_CUSTOM
           CAMERA_FREE
           CAMERA_ORBITAL
           CAMERA_FIRST_PERSON
           CAMERA_THIRD_PERSON)))

;; ----------------------------------------------------

(define _CameraProjection
  (_enum '(CAMERA_PERSPECTIVE
           CAMERA_ORTHOGRAPHIC)))

;; ----------------------------------------------------

(define _NPatchLayout
  (_enum '(NPATCH_NINE_PATCH
           NPATCH_THREE_PATCH_VERTICAL
           NPATCH_THREE_PATCH_HORIZONTAL)))
