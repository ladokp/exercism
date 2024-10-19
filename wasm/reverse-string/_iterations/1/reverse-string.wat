(module
  (memory (export "mem") 1)
 
  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (call $reverse (local.get $offset)(local.get $offset)(local.get $length))
    (return (local.get $offset) (local.get $length))
  )

  (func $reverse (param $offset i32)(param $pointer i32) (param $remaining i32)
    (local $byte i32) (local.set $byte (i32.load8_s(local.get $pointer)))
    (if (i32.le_u(local.get $remaining)(i32.const 1))
      (then (i32.store8(local.get $offset)(local.get $byte)))
      (else 
        (call $reverse 
          (local.get $offset)
          (i32.add(local.get $pointer)(i32.const 1))
          (i32.sub(local.get $remaining)(i32.const 1)))
        (i32.store8(i32.add(local.get $offset)(i32.sub(local.get $remaining)(i32.const 1)))(local.get $byte))
      )
    )
  )
)