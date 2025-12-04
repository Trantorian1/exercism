pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const greet = name orelse "you";

    const i: usize = 8;
    const j: usize = i + greet.len;
    const k: usize = j + 13;

    @memmove(buffer[0..i], "One for ");
    @memmove(buffer[i..j], greet);
    @memmove(buffer[j..k], ", one for me.");

    return buffer[0..k];
}

