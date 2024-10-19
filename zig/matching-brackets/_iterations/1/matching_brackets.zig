const std = @import("std");
const mem = std.mem;

fn toClosing(c: u8) u8 {
    return switch (c) {
        '(' => ')',
        '[' => ']',
        '{' => '}',
        else => 0,
    };
}

/// Returns whether the characters `(`, `[`, and `{` are matched and correctly nested in `s`.
/// Caller guarantees that the nesting depth of those characters in `s` is at most 100.
// The tests use `try`, so this function returns `!bool` even though it cannot return an error.
pub fn isBalanced(_: mem.Allocator, s: []const u8) !bool {
    var stack: [100]u8 = undefined;
    var stack_size: usize = 0;

    for (s) |c| {
        switch (c) {
            '(', '[', '{' => {
                if (stack_size >= stack.len) {
                    return false; // Should not happen due to caller guarantee.
                }
                const closing = toClosing(c);
                if (closing == 0) {
                    return false; // Should not happen due to caller guarantee.
                }
                stack[stack_size] = closing;
                stack_size += 1;
            },
            ')', ']', '}' => {
                if (stack_size == 0 or stack[stack_size - 1] != c) {
                    return false;
                }
                stack_size -= 1;
            },
            else => continue,
        }
    }

    return stack_size == 0;
}
