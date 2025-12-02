pub fn isPangram(str: []const u8) bool {
    var flags: u32 = 0;

    for (str) |c| {
        const lower = c | 0x20;
        const index = lower -% 'a';
        if (index > 26) continue;

        flags |= @as(u32, 1) << @truncate(index);
    }

    return flags == 0x3FFFFFF;
}

