pub fn isIsogram(str: []const u8) bool {
    var flags: u32 = 0;

    for (str) |c| {
        // ASCII bit trick!
        //
        // Lowercase and uppercase ascii letters only differ by their 5th bit,
        // so we can convert to lower with simple bitwise operations. This will
        // mangle non-alphabetic characters but we don't care since we don't
        // count them in the isogram anyway.
        const lower = c | 0x20;
        const index = lower -% 'a';
        if (index >= 26) continue;

        const mask = @as(u32, 1) << @truncate(index);
        if (flags & mask > 0) return false;

        flags |= mask;
    }

    return true;
}

