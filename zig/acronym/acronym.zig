const std = @import("std");

pub fn abbreviate(allocator: std.mem.Allocator, words: []const u8) std.mem.Allocator.Error![]u8 {
    var iter = std.mem.tokenizeAny(u8, words, "-_ ");

    // We iterate once over the initial words to determine the size of the
    // buffer to allocate.
    var size: usize = 0;
    while (iter.next()) |_| : (size += 1) {}

    iter.reset();
    const acronym = try allocator.alloc(u8, size);

    var i: usize = 0;
    while (iter.next()) |sequence| : (i += 1) {
        switch (sequence[0]) {
            'a'...'z', 'A'...'Z' => |c| acronym[i] = c & 0xDF,
            // We consider a sequence which doesn't start with a letter to
            // be undefined behavior.
            else => unreachable,
        }
    }

    return acronym;
}

