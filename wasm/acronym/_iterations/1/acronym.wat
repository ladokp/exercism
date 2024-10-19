(module
  (memory (export "mem") 1)

  (func (export "parse") (param $offset i32) (param $length i32) (result i32 i32)
    (local $end i32) (local $read i32) (local $write i32) (local $upper i32) (local $was-space i32)
    local.get $offset i32.const 1 i32.sub local.set $read
    local.get $offset local.get $length i32.add local.set $end
    i32.const 197 local.set $write
    i32.const 1 local.set $was-space
    loop $loop
      local.get $read i32.const 1 i32.add local.tee $read
      local.get $read local.get $end i32.eq if
        i32.const 197 local.get $write i32.const 197 i32.sub return
      end
      local.get $read i32.load8_u i32.const 0xdf i32.and local.set $upper
      local.get $was-space if
        local.get $upper i32.const 65 i32.sub i32.const 26 i32.lt_u if
          local.get $write local.get $upper i32.store8
          local.get $write i32.const 1 i32.add local.set $write
          i32.const 0 local.set $was-space
        end
      else
        local.get $upper i32.eqz if
          i32.const 1 local.set $was-space
        else local.get $upper i32.const 13 i32.eq if
          i32.const 1 local.set $was-space
        end end
      end
      br $loop
    end
    unreachable
  )
)