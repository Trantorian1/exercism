const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var flags: u32 = 0;
    for (str) |c| {
        if (c == '-' or c == ' ') continue;

        const mask = @as(u32, 1) << @truncate((std.ascii.toLower(c) - 'a'));
        if (flags & mask > 0) return false;

        flags |= mask;
    }
    return true;
}

