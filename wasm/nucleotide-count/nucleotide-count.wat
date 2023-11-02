(module
  (memory (export "mem") 1)

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $a i32) (local $c i32) (local $g i32) (local $t i32) (local $i i32) (local $nucleotide i32)

    (if (i32.eqz (local.get $length)) (return (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 0)))

    (local.set $a (i32.const 0)) (local.set $i (i32.const 0)) (local.set $g (i32.const 0)) (local.set $c (i32.const 0)) (local.set $t (i32.const 0))
    (loop
      (local.set $nucleotide (i32.load8_u (i32.add (local.get $offset) (local.get $i))))
      (if
        (i32.eq (local.get $nucleotide) (i32.const 65)) ;; A
        (then (local.set $a (i32.add (local.get $a) (i32.const 1))))
        (else (if
          (i32.eq (local.get $nucleotide) (i32.const 67)) ;; C
          (then (local.set $c (i32.add (local.get $c) (i32.const 1)))) 
          (else (if
            (i32.eq (local.get $nucleotide) (i32.const 71)) ;; G
            (then (local.set $g (i32.add (local.get $g) (i32.const 1)))) 
            (else (if
              (i32.eq (local.get $nucleotide) (i32.const 84)) ;; T
              (then (local.set $t (i32.add (local.get $t) (i32.const 1)))) 
              (else (return (i32.const -1) (i32.const -1) (i32.const -1) (i32.const -1))
            )))
          ))
        ))
      )
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if 0 (i32.lt_u (local.get $i) (local.get $length)))
    )

    (return (local.get $a) (local.get $c) (local.get $g) (local.get $t))
  )
)