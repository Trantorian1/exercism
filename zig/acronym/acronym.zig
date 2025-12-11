const std = @import("std");

pub fn abbreviate(allocator: std.mem.Allocator, words: []const u8) std.mem.Allocator.Error![]u8 {
    var iter = std.mem.splitAny(u8, words, "-_ ");

    // We iterate once over the initial words to determine the size of the
    // buffer to allocate.
    var size: usize = 0;
    while (iter.next()) |sequence| {
        if (sequence.len > 0) {
            size += 1;
        }
    }

    iter.reset();
    const acronym = try allocator.alloc(u8, size);

    var i: usize = 0;
    while (iter.next()) |sequence| {
        if (sequence.len > 0) {
            switch (sequence[0]) {
                'a'...'z', 'A'...'Z' => |c| acronym[i] = c & 0xDF,
                // We consider a sequence which doesn't start with a letter to
                // be undefined behavior.
                else => unreachable,
            }

            i += 1;
        }
    }

    return acronym;
}

