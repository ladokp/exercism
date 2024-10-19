pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = [_]bool{true} ** (limit + 1);
    var count: u32 = 0;

    var index: u32 = 2;
    while (index <= limit) : (index += 1) {
        if (sieve[index]) {
            buffer[count] = index;
            count += 1;
            if (count == buffer.len) break;

            var index2: u32 = 2 * index;
            while (index2 <= limit) : (index2 += index) {
                sieve[index2] = false;
            }
        }
    }
    return buffer[0..count];
}