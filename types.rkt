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
;; Opaque pointers
;; ----------------------------------------------------

(define-cpointer-type _rAudioBuffer-pointer)
(define-cpointer-type _Codepoint-pointer)

;; ----------------------------------------------------
;; Callbacks
;; ----------------------------------------------------

;; TODO:

;; ----------------------------------------------------
;; Structures
;; ----------------------------------------------------

(define-cstruct _Vector2
  ([x _float]
   [y _float]))

;; ----------------------------------------------------

(define-cstruct _Vector3
  ([x _float]
   [y _float]
   [z _float]))

;; ----------------------------------------------------

(define-cstruct _Vector4
  ([x _float]
   [y _float]
   [z _float]
   [w _float]))

;; ----------------------------------------------------

(define-cstruct _Quaternion
  ([x _float]
   [y _float]
   [z _float]
   [w _float]))

;; ----------------------------------------------------

(define-cstruct _Matrix
  ([m0  _float]
   [m4  _float]
   [m8  _float]
   [m12 _float]
   [m1  _float]
   [m5  _float]
   [m9  _float]
   [m13 _float]
   [m2  _float]
   [m6  _float]
   [m10 _float]
   [m14 _float]
   [m3  _float]
   [m7  _float]
   [m11 _float]
   [m15 _float]))

;; ----------------------------------------------------

(define-cstruct _Color
  ([r _ubyte]
   [g _ubyte]
   [b _ubyte]
   [a _ubyte]))

;; ----------------------------------------------------

(define-cstruct _Rectangle
  ([x _float]
   [y _float]
   [width _float]
   [height _float]))

;; ----------------------------------------------------

(define-cstruct _Image
  ([data _pointer]
   [width _int]
   [height _int]
   [mipmaps _int]
   [format _int]))

;; ----------------------------------------------------

(define-cstruct _Texture2D
  ([id _uint]
   [width _int]
   [height _int]
   [mipmaps _int]
   [format _int]))

;; ----------------------------------------------------

(define _Texture _Texture2D)
(define _TextureCubemap _Texture2D)

;; ----------------------------------------------------

(define-cstruct _RenderTexture2D
  ([id _uint]
   [texture _Texture2D]
   [depth _Texture]))

;; ----------------------------------------------------

(define _RenderTexture _RenderTexture2D)

;; ----------------------------------------------------

(define-cstruct _NPatchInfo
  ([source _Rectangle]
   [left _int]
   [top _int]
   [right _int]
   [bottom _int]
   [layout _int]))

;; ----------------------------------------------------

(define-cstruct _GlyphInfo
  ([value _int]
   [offsetX _int]
   [offsetY _int]
   [advanceX _int]
   [image _Image]))

;; ----------------------------------------------------

(define-cstruct _Font
  ([baseSize _int]
   [glyphCount _int]
   [glyphPadding _int]
   [texture _Texture2D]
   [recs _Rectangle-pointer]
   [glyphs _GlyphInfo-pointer]))

;; ----------------------------------------------------

(define-cstruct _Camera3D
  ([position _Vector3]
   [target _Vector3]
   [up _Vector3]
   [fovy _float]
   [projection _int]))

;; ----------------------------------------------------

(define _Camera _Camera3D)

;; ----------------------------------------------------

(define-cstruct _Camera2D
  ([offset _Vector2]
   [target _Vector2]
   [rotation _float]
   [zoom _float]))

;; ----------------------------------------------------

(define-cstruct _Mesh
  ([vertexCount _int]
   [triangleCount _int]

   ;; opaque pointer data
   [vertices _pointer]
   [texcoords _pointer]
   [texcoords2 _pointer]
   [normals _pointer]
   [tangents _pointer]
   [colors _pointer]
   [indices _pointer]
   [animVertices _pointer]
   [animNormals _pointer]
   [boneIds _pointer]
   [boneWeights _pointer]
   [vaoId _uint]
   [vboId _uint]))

;; ----------------------------------------------------

(define-cstruct _Shader
  ([id _uint]
   [locs _pointer]))

;; ----------------------------------------------------

(define-cstruct _MaterialMap
  ([texture _Texture2D]
   [color _Color]
   [value _float]))

;; ----------------------------------------------------

(define-cstruct _Material
  ([shader _Shader]
   [maps _MaterialMap-pointer]
   [params (_array _float 4)]))

;; ----------------------------------------------------

(define-cstruct _Transform
  ([translation _Vector3]
   [rotation _Quaternion]
   [scale _Vector3]))

;; ----------------------------------------------------

(define-cstruct _BoneInfo
  ([name (_array _byte 32)]
   [parent _int]))

;; ----------------------------------------------------

(define-cstruct _Model
  ([transform _Matrix]
   [meshCount _int]
   [materialCount _int]
   [meshes _Mesh-pointer]
   [materials _Material-pointer]
   [meshMaterials _pointer]
   [boneCount _int]
   [bones _BoneInfo-pointer]
   [bindPose _Transform-pointer]))

;; ----------------------------------------------------

(define-cstruct _ModelAnimation
  ([boneCount _int]
   [frameCount _int]
   [bones _BoneInfo-pointer]
   [framePoses _Transform-pointer]))

;; ----------------------------------------------------

(define-cstruct _Ray
  ([position _Vector3]
   [direction _Vector3]))

;; ----------------------------------------------------

(define-cstruct _RayCollision
  ([hit _bool]
   [distance _float]
   [point _Vector3]
   [normal _Vector3]))

;; ----------------------------------------------------

(define-cstruct _BoundingBox
  ([min _Vector3]
   [max _Vector3]))

;; ----------------------------------------------------

(define-cstruct _Wave
  ([frameCount _uint]
   [sampleRate _uint]
   [sampleSize _uint]
   [channels _uint]
   [data _pointer]))

;; ----------------------------------------------------

(define-cstruct _AudioStream
  ([buffer _rAudioBuffer-pointer]
   [sampleRate _uint]
   [sampleSize _uint]
   [channels _uint]))

;; ----------------------------------------------------

(define-cstruct _Sound
  ([stream _AudioStream]
   [frameCount _uint]))

;; ----------------------------------------------------

(define-cstruct _Music
  ([stream _AudioStream]
   [frameCount _uint]
   [looping _bool]
   [ctxType _int]
   [ctxData _pointer]))

;; ----------------------------------------------------

(define-cstruct _VrDeviceInfo
  ([hResolution _int]
   [vResolution _int]
   [hScreenSize _float]
   [vScreenSize _float]
   [vScreenCenter _float]
   [eyeToScreenDistance _float]
   [lensSeparationDistance _float]
   [interpupillaryDistance _float]
   [lensDistortionValues (_array _float 4)]
   [chromaAbCorrection (_array _float 4)]))

;; ----------------------------------------------------

(define-cstruct _VrStereoConfig
  ([projection (_array _Matrix 2)]
   [viewOffset (_array _Matrix 2)]
   [leftLensCenter (_array _float 2)]
   [rightLensCenter (_array _float 2)]
   [leftScreenCenter (_array _float 2)]
   [rightScreenCenter (_array _float 2)]
   [scale (_array _float 2)]
   [scaleIn (_array _float 2)]))
