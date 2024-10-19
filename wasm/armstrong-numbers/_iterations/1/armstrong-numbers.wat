(module
  (func $pow (param $b i32) (param $e i32) (result i32)
    (if (i32.eqz (local.get $e)) (return (i32.const 1)))
    (i32.mul (local.get $b) (call $pow (local.get $b) (i32.sub (local.get $e) (i32.const 1)))))

  (func (export "isArmstrongNumber") (param $candidate i32) (result i32)
    (local $ndigits i32) (local $i i32) (local $n i32)
    
    (local.set $i (i32.const 1)) (local.set $n (i32.const 10))
    (loop $loop
      (i32.lt_u (local.get $candidate) (local.get $n))
      (if (then (local.set $ndigits (local.get $i)))
        (else
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (local.set $n (i32.mul (local.get $n) (i32.const 10)))
          br $loop)))

    (local.set $i (local.get $candidate)) (local.set $n (i32.const 0))
    (loop
      (local.set $n 
        (i32.add (local.get $n)
          (call $pow (i32.rem_u (local.get $i) (i32.const 10))
            (local.get $ndigits))))
      (local.set $i (i32.div_u (local.get $i) (i32.const 10)))
      (i32.gt_u (local.get $i) (i32.const 0))
      br_if 0)

    (i32.eq (local.get $n) (local.get $candidate)))
)