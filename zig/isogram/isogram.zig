/// Determine if a word or phrase is an isogram.
///
/// An isogram (also known as a "non-pattern word") is a word or phrase without
/// a repeating letter, however spaces and hyphens are allowed to appear
/// multiple times.
///
/// Examples of isograms:
///
/// - lumberjacks
/// - background
/// - downstream
/// - six-year-old
///
/// This function panics if called on non-alphabetic input.
pub fn isIsogram(str: []const u8) bool {
    var flags: u32 = 0;

    for (str) |c| {
        switch (c) {
            'a'...'z', 'A'...'Z' => {
                // ASCII bit trick!
                //
                // Lowercase and uppercase ascii only differ by their 5th bit,
                // so we can convert to lower with simple bitwise operations.
                const lower = c | 0x20;
                const index = lower - 'a';

                const mask = @as(u32, 1) << @intCast(index);
                if (flags & mask > 0) return false;

                flags |= mask;
            },
            '-', ' ' => continue,
            else => unreachable,
        }
    }

    return true;
}

