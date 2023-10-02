<#
.SYNOPSIS
Implement the circular buffer data structure.

.DESCRIPTION
A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end.
Please implement the circular buffer class with these methods:
- Write     : write new value into the buffer, raise error if the buffer is full.
- Overwrite : overwrite the oldest element in the buffer if the buffer is full, otherwise behave like write.
- Clear     : clear all elements in the buffer, it is now empty.
- Read      : read the oldest element in the buffer, and return its value.

.EXAMPLE
$buffer = [CircularBuffer]::new(2)

$buffer.Write(1)
$buffer.Read()
Return: 1

$buffer.Write(2)
$buffer.Write(3)
$buffer.Overwrite(5)
$buffer.Read()
Return: 5

$buffer.Clear()
$buffer.Read()
Throw "BufferError: Circular buffer is empty"
#>

Class CircularBuffer {
    $buffer
    $readHeader
    $writeHeader

    CircularBuffer([int]$capacity) {
        $this.buffer = @($null) * $capacity
        $this.readHeader = $null
        $this.writeHeader = 0
    }

    Write($value) {
        if ($this.writeHeader -eq $this.readHeader) {
            Throw "BufferError: Circular buffer is full"
        }
        $this.Overwrite($value)
    }

    Overwrite($value) {
        $this.buffer[$this.writeHeader] = $value

        $new_write = ($this.writeHeader + 1) % $this.buffer.count
        if ($this.readHeader -eq $null) {
            $this.readHeader = $this.writeHeader
        } elseif ($this.readHeader -eq $this.writeHeader) {
            # Buffer is full; advance read head after overwriting the oldest element
            $this.readHeader = $new_write
        }
        $this.writeHeader = $new_write
    }

    Clear() {
        $this.readHeader = $null
    }

    [object] Read() {
        if ($this.readHeader -eq $null) {
            Throw "BufferError: Circular buffer is empty"
        }        
        $value = $this.buffer[$this.readHeader]
        $this.buffer[$this.readHeader] = $null
        
        $this.readHeader = ($this.readHeader + 1) % $this.buffer.count
        if ($this.readHeader -eq $this.writeHeader) {
            $this.readHeader = $null
        }
        return $value
    }
}
