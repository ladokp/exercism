(module
  (memory (export "mem") 1)

  (func (export "compute") 
    (param $firstOffset i32) (param $firstLength i32) (param $secondOffset i32) (param $secondLength i32)
    (result i32) (local $difference i32) (local $index i32)
    (if (i32.ne (local.get $firstLength) (local.get $secondLength)) (return (i32.const -1)))
    (loop $nucleotide
          (i32.load8_u (i32.add (local.get $index) (local.get $firstOffset)))
          (i32.load8_u (i32.add (local.get $index) (local.get $secondOffset)))
          (local.set $difference (i32.add (local.get $difference (i32.ne))))
          (local.tee $index (i32.add (i32.const 1) (local.get $index)))
          (br_if $nucleotide (i32.lt_u (local.get $firstLength))))
    (local.get $difference)))