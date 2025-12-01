pub fn isLeapYear(year: u32) bool {
    // "A leap year check in three instructions"
    // - by Falk Hüffner
    //
    // https://hueffner.de/falk/blog/a-leap-year-check-in-three-instructions.html
    return ((year *% 1073750999) & 3221352463) <= 126976;
}

