(module
  (memory (export "mem") 1)

  (global $comma i32 (i32.const 44))
  (data $colors (i32.const 0) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  (func (export "colors") (result i32 i32)
    (return (i32.const 0) (i32.const 58))
  )

  (func (export "colorCode") (param $offset i32) (param $length i32) (result i32)
        (local $posInput i32) (local $end i32) (local $posColors i32) (local $colorsLetter i32)
        (local $colorNum i32)
    (local.set $posInput (local.get $offset))
    (local.set $posColors (i32.const 0))
    (local.set $colorNum (i32.const 0))
    (local.set $end (i32.add (local.get $offset) (local.get $length)))

    (loop $loop
      (local.set $colorsLetter (i32.load8_u (local.get $posColors)))
      (block $continue
        (if (i32.eq (local.get $colorsLetter) (global.get $comma))
          (then (local.set $colorNum (i32.add (local.get $colorNum) (i32.const 1)))
                (local.set $posInput (local.get $offset))))

        (if (i32.eq (local.get $colorsLetter) (i32.load8_u (local.get $posInput)))
          (local.set $posInput (i32.add (local.get $posInput) (i32.const 1)))))
      
      (local.set $posColors (i32.add (local.get $posColors) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $posInput) (local.get $end))))

    (return (local.get $colorNum))
  )
)