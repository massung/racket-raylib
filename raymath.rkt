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
(require "types.rkt")

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------
;; Float Ops
;; ----------------------------------------------------

(define-raylib Clamp
  (_fun _float _float _float -> _float))

(define-raylib Lerp
  (_fun _float _float _float -> _float))

(define-raylib Normalize
  (_fun _float _float _float -> _float))

(define-raylib Remap
  (_fun _float _float _float _float _float -> _float))

;; ----------------------------------------------------
;; Vector2 Ops
;; ----------------------------------------------------

(define-raylib Vector2Zero
  (_fun -> _Vector2))

(define-raylib Vector2One
  (_fun -> _Vector2))

(define-raylib Vector2Add
  (_fun _Vector2 _Vector2 -> _Vector2))

(define-raylib Vector2AddValue
  (_fun _Vector2 _float -> _Vector2))

(define-raylib Vector2Subtract
  (_fun _Vector2 _Vector2 -> _Vector2))

(define-raylib Vector2SubtractValue
  (_fun _Vector2 _float -> _Vector2))

(define-raylib Vector2Length
  (_fun _Vector2 -> _float))

(define-raylib Vector2LengthSqr
  (_fun _Vector2 -> _float))

(define-raylib Vector2DotProduct
  (_fun _Vector2 _Vector2 -> _float))

(define-raylib Vector2Distance
  (_fun _Vector2 _Vector2 -> _float))

(define-raylib Vector2Angle
  (_fun _Vector2 _Vector2 -> _float))

(define-raylib Vector2Scale
  (_fun _Vector2 _float -> _Vector2))

(define-raylib Vector2Multiply
  (_fun _Vector2 _Vector2 -> _Vector2))

(define-raylib Vector2Negate
  (_fun _Vector2 -> _Vector2))

(define-raylib Vector2Divide
  (_fun _Vector2 _Vector2 -> _Vector2))

(define-raylib Vector2Normalize
  (_fun _Vector2 -> _Vector2))

#;(define-raylib Vector2Transform
  (_fun _Vector2 _Matrix -> _Vector2))

(define-raylib Vector2Lerp
  (_fun _Vector2 _Vector2 _float -> _Vector2))

(define-raylib Vector2Reflect
  (_fun _Vector2 _Vector2 -> _Vector2))

(define-raylib Vector2Rotate
  (_fun _Vector2 _float -> _Vector2))

(define-raylib Vector2MoveTowards
  (_fun _Vector2 _Vector2 _float -> _Vector2))

;; ----------------------------------------------------
;; Vector3 Ops
;; ----------------------------------------------------

(define-raylib Vector3Zero
  (_fun -> _Vector3))

(define-raylib Vector3One
  (_fun -> _Vector3))

(define-raylib Vector3Add
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3AddValue
  (_fun _Vector3 _float -> _Vector3))

(define-raylib Vector3Subtract
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3SubtractValue
  (_fun _Vector3 _float -> _Vector3))

(define-raylib Vector3CrossProduct
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Perpendicular
  (_fun _Vector3 -> _Vector3))

(define-raylib Vector3Length
  (_fun _Vector3 -> _float))

(define-raylib Vector3LengthSqr
  (_fun _Vector3 -> _float))

(define-raylib Vector3DotProduct
  (_fun _Vector3 _Vector3 -> _float))

(define-raylib Vector3Distance
  (_fun _Vector3 _Vector3 -> _float))

(define-raylib Vector3Angle
  (_fun _Vector3 _Vector3 -> _float))

(define-raylib Vector3Scale
  (_fun _Vector3 _float -> _Vector3))

(define-raylib Vector3Multiply
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Negate
  (_fun _Vector3 -> _Vector3))

(define-raylib Vector3Divide
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Normalize
  (_fun _Vector3 -> _Vector3))

(define-raylib Vector3OrthoNormalize
  (_fun _Vector3-pointer _Vector3-pointer -> _void))

(define-raylib Vector3Transform
  (_fun _Vector3 _Matrix -> _Vector3))

(define-raylib Vector3RotateByQuaternion
  (_fun _Vector3 _Quaternion -> _Vector3))

(define-raylib Vector3Lerp
  (_fun _Vector3 _Vector3 _float -> _Vector3))

(define-raylib Vector3Reflect
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Min
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Max
  (_fun _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Barycenter
  (_fun _Vector3 _Vector3 _Vector3 _Vector3 -> _Vector3))

(define-raylib Vector3Unproject
  (_fun _Vector3 _Matrix _Matrix -> _Vector3))

(define-raylib Vector3ToFloatV
  (_fun _Vector3 -> _float))

;; ----------------------------------------------------
;; Matrix Ops
;; ----------------------------------------------------

(define-raylib MatrixDeterminant
  (_fun _Matrix -> _float))

(define-raylib MatrixTrace
  (_fun _Matrix -> _float))

(define-raylib MatrixTranspose
  (_fun _Matrix -> _Matrix))

(define-raylib MatrixInvert
  (_fun _Matrix -> _Matrix))

(define-raylib MatrixNormalize
  (_fun _Matrix -> _Matrix))

(define-raylib MatrixIdentity
  (_fun -> _Matrix))

(define-raylib MatrixAdd
  (_fun _Matrix _Matrix -> _Matrix))

(define-raylib MatrixSubtract
  (_fun _Matrix _Matrix -> _Matrix))

(define-raylib MatrixMultiply
  (_fun _Matrix _Matrix -> _Matrix))

(define-raylib MatrixTranslate
  (_fun _float _float _float -> _Matrix))

(define-raylib MatrixRotate
  (_fun _Vector3 _float -> _Matrix))

(define-raylib MatrixRotateX
  (_fun _float -> _Matrix))

(define-raylib MatrixRotateY
  (_fun _float -> _Matrix))

(define-raylib MatrixRotateZ
  (_fun _float -> _Matrix))

(define-raylib MatrixRotateXYZ
  (_fun _Vector3 -> _Matrix))

(define-raylib MatrixRotateZYX
  (_fun _Vector3 -> _Matrix))

(define-raylib MatrixScale
  (_fun _float _float _float -> _Matrix))

(define-raylib MatrixFrustum
  (_fun _float _float _float _float _float _float -> _Matrix))

(define-raylib MatrixPerspective
  (_fun _float _float _float _float -> _Matrix))

(define-raylib MatrixOrtho
  (_fun _float _float _float _float _float _float -> _Matrix))

(define-raylib MatrixLookAt
  (_fun _Vector3 _Vector3 _Vector3 -> _Matrix))

(define-raylib MatrixToFloatV
  (_fun _Matrix -> _float))

;; ----------------------------------------------------
;; Quaternion Ops
;; ----------------------------------------------------

(define-raylib QuaternionAdd
  (_fun _Quaternion _Quaternion -> _Quaternion))

(define-raylib QuaternionAddValue
  (_fun _Quaternion _float -> _Quaternion))

(define-raylib QuaternionSubtract
  (_fun _Quaternion _Quaternion -> _Quaternion))

(define-raylib QuaternionSubtractValue
  (_fun _Quaternion _float -> _Quaternion))

(define-raylib QuaternionIdentity
  (_fun -> _Quaternion))

(define-raylib QuaternionNormalize
  (_fun _Quaternion -> _Quaternion))

(define-raylib QuaternionInvert
  (_fun _Quaternion -> _Quaternion))

(define-raylib QuaternionMultiply
  (_fun _Quaternion _Quaternion -> _Quaternion))

(define-raylib QuaternionScale
  (_fun _Quaternion _float -> _Quaternion))

(define-raylib QuaternionDivide
  (_fun _Quaternion _Quaternion -> _Quaternion))

(define-raylib QuaternionLerp
  (_fun _Quaternion _Quaternion _float -> _Quaternion))

(define-raylib QuaternionNlerp
  (_fun _Quaternion _Quaternion _float -> _Quaternion))

(define-raylib QuaternionSlerp
  (_fun _Quaternion _Quaternion _float -> _Quaternion))

(define-raylib QuaternionFromVector3ToVector3
  (_fun _Vector3 _Vector3 -> _Quaternion))

(define-raylib QuaternionFromMatrix
  (_fun _Matrix -> _Quaternion))

(define-raylib QuaternionToMatrix
  (_fun _Quaternion -> _Matrix))

(define-raylib QuaternionFromAxisAngle
  (_fun _Vector3 _float -> _Quaternion))

(define-raylib QuaternionToAxisAngle
  (_fun _Vector3 (n : (_ptr o _float)) -> (axis : _Vector3) -> (values axis n)))

(define-raylib QuaternionFromEuler
  (_fun _float _float _float -> _Quaternion))

(define-raylib QuaternionToEuler
  (_fun _Quaternion -> _Vector3))

(define-raylib QuaternionTransform
  (_fun _Quaternion _Matrix -> _Quaternion))
