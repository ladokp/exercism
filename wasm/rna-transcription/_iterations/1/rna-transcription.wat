(module
  (memory (export "mem") 1)

  (func (export "toRna") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    (loop $l
      (i32.store8 (i32.add(local.get $offset)(local.get $i))
        (call $dna2rna(i32.load8_u(i32.add(local.get $offset)(local.get $i)))))
      (local.set $i (i32.add(local.get $i)(i32.const 1)))
      (br_if $l (i32.lt_u(local.get $i)(local.get $length)))
    )
    (return (local.get $offset) (local.get $length))
  )

  (func $dna2rna (param $value i32)(result i32)
    (if (i32.eq(local.get $value)(i32.const 0x54))(then (return(i32.const 0x41))))
    (if (i32.eq(local.get $value)(i32.const 0x47))(then (return(i32.const 0x43))))
    (if (i32.eq(local.get $value)(i32.const 0x43))(then (return(i32.const 0x47))))
    (if (i32.eq(local.get $value)(i32.const 0x41))(then (return(i32.const 0x55))))
    (i32.const 0)
  )
)