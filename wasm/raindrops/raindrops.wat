(module
  (memory (export "mem") 1)

  (func $toString (param $n i32) (param $ptr i32) (result i32)
    (if (result i32) (i32.eqz (local.get $n))
      (then (local.get $ptr))
      (else (i32.store8
          (local.tee $ptr
            (call $toString (i32.div_u (local.get $n) (i32.const 10)) (local.get $ptr)))
          (i32.add (i32.const 48) (i32.rem_u (local.get $n) (i32.const 10))))
        (i32.add (local.get $ptr) (i32.const 1)))))

  (func (export "convert") (param $input i32) (result i32 i32)
    (local $p i32)
    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 3)))
      (then
        (i64.store (local.get $p) (i64.const 0x676E696C50)) ;; Pling
        (local.set $p (i32.add (local.get $p) (i32.const 5)))))
    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 5)))
      (then
        (i64.store (local.get $p) (i64.const 0x676E616C50)) ;; Plang
        (local.set $p (i32.add (local.get $p) (i32.const 5)))))
    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 7)))
      (then
        (i64.store (local.get $p) (i64.const 0x676E6F6C50)) ;; Plong
        (local.set $p (i32.add (local.get $p) (i32.const 5)))))
    (if (i32.eqz (local.get $p)) (local.set $p (call $toString (local.get $input) (local.get $p))))
    (return (i32.const 0) (local.get $p))))