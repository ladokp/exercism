(module
  (memory (export "mem") 1)

  (data (i32.const 0) "One for ") (data (i32.const 8) "you") (data (i32.const 11) ", one for me.")

  (func (export "twoFer") (param $offset i32) (param $length i32) (result i32 i32)
    (if (i32.eqz (local.get  $length)) (return (i32.const 0) (i32.const 24)))
    (memory.copy (i32.const 24) (i32.const 0) (i32.const 8))
    (memory.copy (i32.const 32) (local.get $offset) (local.get $length))
    (memory.copy (i32.add (i32.const 32) (local.get $length)) (i32.const 11) (i32.const 13))
    (return (i32.const 24) (i32.add (i32.const 21) (local.get $length)))
  )
)