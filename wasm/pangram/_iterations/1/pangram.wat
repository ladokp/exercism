(module
  (memory (export "mem") 1)

  ;; return 1 if pangram, 0 otherwise
  (func (export "isPangram") (param $offset i32) (param $length i32) (result i32)
    (local $i i32) (local $flags i32) (local $c i32)
    (block
      (loop
        (br_if 1 (i32.eq (local.get $i) (local.get $length)))
        (local.set $c (i32.load8_u (i32.add (local.get $i) (local.get $offset))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (if (i32.or
              (i32.and
                (i32.ge_u (local.get $c) (i32.const 65))
                (i32.lt_u (local.get $c) (i32.const 91)))
              (i32.and
                (i32.ge_u (local.get $c) (i32.const 97))
                (i32.lt_u (local.get $c) (i32.const 123))))
          (then
            (local.set $flags
              (i32.or
                (local.get $flags)
                (i32.shl (i32.const 1) (i32.and (local.get $c) (i32.const 31)))))
          )
        )
        (br 0)
      )
    )
    (return (i32.eq (local.get $flags) (i32.const 0x7fffffe)))
  )
)