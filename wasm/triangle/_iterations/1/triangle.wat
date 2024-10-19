(module
  (func $isEquilateral (export "isEquilateral") (param f32 f32 f32) (result i32)
    (f32.eq (local.get 0) (local.get 2))
    (f32.eq (local.get 0) (local.get 1))
    (f32.gt (local.get 0) (f32.const 0))
    i32.and
    i32.and
  )

  (func $isValidTriangle (param f32 f32 f32) (result i32)
    (f32.gt (local.get 0) (f32.const 0)) 
    (f32.gt (local.get 1) (f32.const 0))
    (f32.gt (local.get 2) (f32.const 0))
    (f32.gt (f32.add (local.get 1) (local.get 2)) (local.get 0))
    (f32.gt (f32.add (local.get 2) (local.get 0)) (local.get 1))
    (f32.gt (f32.add (local.get 0) (local.get 1)) (local.get 2))
    i32.and
    i32.and
    i32.and
    i32.and
    i32.and
  )

  (func $isIsosceles (export "isIsosceles") (param f32 f32 f32) (result i32)
    (i32.and 
      (call $isValidTriangle (local.get 0) (local.get 1) (local.get 2))
      (i32.or (f32.eq (local.get 0) (local.get 1))
        (i32.or(f32.eq (local.get 0) (local.get 2))
          (f32.eq (local.get 1) (local.get 2))))))

  (func (export "isScalene") (param f32 f32 f32) (result i32)
    (i32.and (call $isValidTriangle (local.get 0) (local.get 1) (local.get 2))
      (i32.eqz (call $isIsosceles (local.get 0) (local.get 1) (local.get 2)))))
)