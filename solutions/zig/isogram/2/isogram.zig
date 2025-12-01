const std = @import("std");

pub fn isIsogram(str: [*:0]const u8) bool {
    var flags: u32 = 0;
    var i: usize = 0;

    while (str[i] != 0) : (i += 1) {
        const sub = @subWithOverflow(std.ascii.toLower(str[i]), 'a');
        if (sub.@"1" == 1) continue;

        const mask = @as(u32, 1) << @truncate((sub.@"0"));
        if (flags & mask > 0) return false;

        flags |= mask;
    }
    return true;
}

