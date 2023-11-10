(module
  (import "console" "log_i32_s" (func $log_i32_s (param i32)))

  (memory 1)
  (global $empty (mut i32) (i32.const 1))
  (global $capacity (mut i32) (i32.const 0))
  (global $head (mut i32) (i32.const 0))
  (global $tail (mut i32) (i32.const 0))
  (global $full (mut i32) (i32.const 0))

  (data (i32.const 100) "")

  (func (export "init") (param $newCapacity i32) (result i32)
    (global.set $capacity (i32.mul(i32.sub(local.get $newCapacity)(i32.const 1))(i32.const 4)))
    (i32.const 0)
  )

  (func $clear (export "clear")
    (if (i32.eqz(global.get $empty))(then (call $move_tail)))
  )

  (func $write (export "write") (param $elem i32) (result i32)
    (call $log_i32_s (local.get $elem))
    (if (global.get $full)(return (i32.const -1))) (i32.store(i32.add(i32.const 100)(global.get $head))(local.get $elem))
    (call $move_head)
    (i32.const 0)
  )

  (func (export "forceWrite") (param $elem i32) (result i32)
    (if (global.get $full) (then (call $clear))) (call $write (local.get $elem)) 
  )

  (func (export "read") (result i32 i32) (local $ret i32)
    (if (global.get $empty) (then (return (i32.const -1) (i32.const -1)))
    ) (i32.load (i32.add(i32.const 100)(global.get $tail)))(i32.const 0)
    (call $move_tail)  
  )

  (func $move_head
    (global.set $empty (i32.const 0))
    (if (i32.ge_u (global.get $head) (global.get $capacity))
      (then (global.set $head (i32.const 0)))
      (else (global.set $head (i32.add(global.get $head)(i32.const 4))))
    )
    (if (i32.and(i32.eqz(global.get $empty))(i32.eq(global.get $tail)(global.get $head)))
      (then (global.set $full (i32.const 1)))
    )
  )

  (func $move_tail
    (global.set $full (i32.const 0))
    (if (i32.ge_u (global.get $tail) (global.get $capacity))
      (then (global.set $tail (i32.const 0)))
      (else (global.set $tail (i32.add(global.get $tail)(i32.const 4))))
    )
    (if (i32.and(i32.eqz(global.get $full))(i32.eq(global.get $tail)(global.get $head)))
      (then (global.set $empty (i32.const 1))))
  )
)