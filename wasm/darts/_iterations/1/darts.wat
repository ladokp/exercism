(module
  (func (export "score") (param $xDistance f32) (param $yDistance f32) (result i32) (local $distance f32)
    (f32.mul (local.get $xDistance) (local.get $xDistance))
    (f32.mul (local.get $yDistance) (local.get $yDistance))
    f32.add
    local.set $distance
    (if (f32.le (local.get $distance) (f32.const 1)) (then (return (i32.const 10))))
    (if (f32.le (local.get $distance) (f32.const 25)) (then (return (i32.const 5))))
    (if (f32.le (local.get $distance) (f32.const 100)) (then (return (i32.const 1))))
    (return (i32.const 0))
  )
)
