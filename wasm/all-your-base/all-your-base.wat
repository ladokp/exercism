(module
  (memory (export "mem") 1)

  (global $wrongOutputBase i32 (i32.const -3)) (global $wrongInputBase i32 (i32.const -2))
  (global $inputHasWrongFormat i32 (i32.const -1)) (global $ok i32 (i32.const 0))

  (func (export "convert") (param $p i32) (param $l i32) (param $iBase i32) (param $oBase i32) (result i32 i32 i32)
    (local $i i32) (local $n i32) (local $d i32)

    (local.get $p) (local.get $l)
    (if (param i32 i32) (result i32 i32) (i32.lt_s (local.get $iBase) (i32.const 2)) (return (global.get $wrongInputBase)))
    (if (param i32 i32) (result i32 i32) (i32.lt_s (local.get $oBase) (i32.const 2)) (return (global.get $wrongOutputBase)))
    (if (param i32 i32) (result i32 i32) (i32.lt_s (local.get $l) (i32.const 1)) (return (global.get $inputHasWrongFormat)))

    (if (param i32 i32) (i32.eq (i32.load (local.get $p)) (i32.const 0))
      (then
        (if (param i32 i32) (i32.ne (local.get $l) (i32.const 1))
          (return (global.get $inputHasWrongFormat))
          (return (global.get $ok))))
      (else drop drop))

    (local.set $n (i32.const 0))
    (local.set $i (i32.const 0))
    (loop
      (local.tee $d (i32.load (local.get $p)))
      (if (i32.ge_u (local.get $iBase)) (return (i32.const 0) (i32.const 0) (global.get $inputHasWrongFormat)))
      (local.set $n (i32.add (local.get $d) (i32.mul (local.get $iBase) (local.get $n))))
      (local.set $p (i32.add (local.get $p) (i32.const 4)))
      (local.tee $i (i32.add (local.get $i) (i32.const 1)))
      (br_if 0 (i32.lt_u (local.get $l)))
    )
    (return (call $toBase (local.get $n) (local.get $oBase)) (i32.const 0))
  )

  (func $toBase (param $n i32) (param $base i32) (result i32 i32)
    (local $p i32) (local $i i32)

    (local.set $i (i32.const 0))
    (local.set $p (i32.const 0x8000))
    (loop
      (local.tee $p (i32.sub (local.get $p) (i32.const 4)))
      (i32.store (i32.rem_u (local.get $n) (local.get $base)))
      (local.set $n (i32.div_u (local.get $n) (local.get $base)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if 0 (i32.ne (local.get $n) (i32.const 0)))
    )
    (local.get $p) (local.get $i)
  )
)