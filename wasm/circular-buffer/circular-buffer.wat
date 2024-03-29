(module
  (memory (export "mem") 1 4)
  (global $head (mut i32) (i32.const -1))
  (global $tail (mut i32) (i32.const -1))
  (global $capacity (mut i32) (i32.const 0))
  (global $i32Size i32 (i32.const 4))

  (func (export "init") (param $newCapacity i32) (result i32)
    (if (i32.or 
      (i32.lt_s (local.get $newCapacity) (i32.const 0)) 
      (i32.gt_s (local.get $newCapacity) (i32.const 65536))) (then
        (return (i32.const -1))))

    (global.set $head (i32.const -1))
    (global.set $tail (i32.const -1))
    (global.set $capacity (local.get $newCapacity))

    (if (result i32) (i32.le_s (local.get $newCapacity) (i32.const 16384)) (then
      (i32.const 0)
    ) (else 
      (memory.grow (i32.div_s (i32.sub (local.get $newCapacity) (i32.const 1)) (i32.const 16384)))
      (if (result i32) (i32.ne (i32.const -1)) (i32.const 0) (i32.const -1))
    ))
  )

  (func (export "clear") (global.set $head (i32.const -1)) (global.set $tail (i32.const -1)))

  (func (export "write") (param $elem i32) (result i32)
    (local $temp i32)
    (if (i32.eq (global.get $capacity) (i32.const 0)) (then
      (return (i32.const -1))
    ))

    (if (i32.eq (global.get $head) (i32.const -1)) (then
      (global.set $head (i32.const 0))
      (global.set $tail (i32.const 0))
      (i32.store (i32.mul (global.get $tail) (global.get $i32Size)) (local.get $elem))
    ) (else 
      (local.set $temp (i32.rem_u (i32.add (global.get $tail) (i32.const 1)) (global.get $capacity)))
      (if (i32.eq (local.get $temp) (global.get $head)) (then
        (return (i32.const -1))
      ))

      (global.set $tail (local.get $temp))
      (i32.store (i32.mul (global.get $tail) (global.get $i32Size)) (local.get $elem))
    ))

    (i32.const 0)
  )

  (func (export "forceWrite") (param $elem i32) (result i32)
    (local $temp i32)
    (if (i32.eq (global.get $capacity) (i32.const 0)) (then
      (return (i32.const -1))
    ))

    (if (i32.eq (global.get $head) (i32.const -1)) (then
      (global.set $head (i32.const 0))
      (global.set $tail (i32.const 0))
      (i32.store (i32.mul (global.get $tail) (global.get $i32Size)) (local.get $elem))
    ) (else 
      (local.set $temp (i32.rem_u (i32.add (global.get $tail) (i32.const 1)) (global.get $capacity)))
      (if (i32.eq (local.get $temp) (global.get $head)) (then
        (global.set $head (i32.rem_u (i32.add (global.get $head) (i32.const 1)) (global.get $capacity)))
      ))

      (global.set $tail (local.get $temp))
      (i32.store (i32.mul (global.get $tail) (global.get $i32Size)) (local.get $elem))
    ))

    (i32.const 0)
  )

  (func (export "read") (result i32 i32)
    (local $result i32)

    (if (i32.eq (global.get $head) (i32.const -1)) (then
      (return (i32.const -1) (i32.const -1))
    ))

    (if (i32.eq (global.get $head) (global.get $tail)) (then
      (local.set $result (i32.load (i32.mul (global.get $head) (global.get $i32Size))))
      (global.set $head (i32.const -1))
      (global.set $tail (i32.const -1))
      (return (local.get $result) (i32.const 0) )
    ))

    (local.set $result (i32.load (i32.mul (global.get $head) (global.get $i32Size))))
    (global.set $head (i32.rem_u (i32.add (global.get $head) (i32.const 1)) (global.get $capacity)))
    (return (local.get $result) (i32.const 0))
  )
)