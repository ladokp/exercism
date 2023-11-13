(module
    (import "console" "log_i32_s" (func $log_i32_s (param i32)))
  (memory (export "mem") 1)
  (func (export "find") (param $base i32) (param $numberOfElements i32) (param $needle i32) (result i32)
    (local $left i32)(local $middle i32)(local $right i32)
    (local.set $right (i32.sub(local.get $numberOfElements)(i32.const 1)))
    (if (i32.ge_s(local.get $numberOfElements)(i32.const 1))
      (then (loop $loop
          (i32.le_s(local.get $left)(local.get $right))
          (local.set $middle (i32.div_s(i32.add(local.get $left)(local.get $right))(i32.const 2)))
          (call $log_i32_s (local.get $middle))
          (if (i32.eq(i32.load(i32.add(local.get $base)(i32.mul(local.get $middle)(i32.const 4))))(local.get $needle))
            (then (return (local.get $middle))))
          (if (i32.lt_s(i32.load(i32.add(local.get $base)(i32.mul(local.get $middle)(i32.const 4))))(local.get $needle))
            (then (local.set $left (i32.add(local.get $middle)(i32.const 1))))
            (else (local.set $right (i32.sub(local.get $middle)(i32.const 1)))))
          (br_if $loop)
        )
      )
    ) (i32.const -1)
  )
)