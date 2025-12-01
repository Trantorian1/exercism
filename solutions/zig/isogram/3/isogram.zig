const std = @import("std");

pub fn isIsogram(str: [*:0]const u8) bool {
    var flags: u32 = 0;
    var i: usize = 0;

    while (str[i] != 0) : (i += 1) {
        const lower = str[i] | 0x20;
        const index = lower -% 'a';
        if (index >= 26) continue;

        const mask = @as(u32, 1) << @truncate(index);
        if (flags & mask > 0) return false;

        flags |= mask;
    }
    return true;
}

