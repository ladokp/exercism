;; based on algorithm at
;; https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

(module
  (memory (export "mem") 1)

  (global $i32Size i32 (i32.const 4))

  (func $location (param i32) (result i32)
    (i32.mul (local.get 0) (global.get $i32Size)))

  (func $initialize-work-array (param $limit i32)
    (local $i i32)
    (local.set $i (i32.const 2))
    (loop $A (if (i32.le_u (local.get $i) (local.get $limit))
        (then
          (i32.store (call $location (local.get $i)) (local.get $i))
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br $A)))))

  (func $mark-multiples (param $limit i32)
    (local $i i32) (local $j i32) (local $p i32) (local $sqrt i32)
    (local.set $sqrt (i32.trunc_f32_u (f32.sqrt (f32.convert_i32_u (local.get $limit)))))
    (local.set $i (i32.const 2))
    (loop $B
      (if (i32.le_u (local.get $i) (local.get $sqrt))
        (then
          (if (i32.load (call $location (local.get $i)))
            (then (local.set $j (i32.mul (local.get $i) (local.get $i)))
              (loop $C
                (if (i32.le_u (local.get $j) (local.get $limit))
                  (then
                    (i32.store (call $location (local.get $j)) (i32.const 0))
                    (local.set $j (i32.add (local.get $j) (local.get $i)))
                    (br $C))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $B)))))

  (func $collect-primes (param $limit i32) (result i32)
    (local $len i32) (local $i i32) (local $n i32)
    (local.set $i (i32.const 2))
    (loop $D
      (if (i32.le_u (local.get $i) (local.get $limit))
        (then
          (if (local.tee $n (i32.load (call $location (local.get $i))))
            (then
              (i32.store (call $location (local.get $len)) (local.get $n))
              (local.set $len (i32.add (local.get $len) (i32.const 1)))))
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br $D))))
    (return (local.get $len)))


  (func (export "primes") (param $limit i32) (result i32 i32)
    (local $length i32)
    (if (i32.lt_s (local.get $limit) (i32.const 2)) (then (return (i32.const 0) (i32.const 0))))
    (call $initialize-work-array (local.get $limit))
    (call $mark-multiples (local.get $limit))
    (return (i32.const 0) (call $collect-primes (local.get $limit)))))