const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    if (n % 105 == 0) {
        return "PlingPlangPlong";
    } else if (n % 35 == 0) {
        return "PlangPlong";
    } else if (n % 21 == 0) {
        return "PlingPlong";
    } else if (n % 15 == 0) {
        return "PlingPlang";
    } else if (n % 7 == 0) {
        return "Plong";
    } else if (n % 5 == 0) {
        return "Plang";
    } else if (n % 3 == 0) {
        return "Pling";
    } else {
        return itoa(buffer, n);
    }
}

fn itoa(buffer: []u8, n: u32) []const u8 {
    var i: usize = 0;
    var m: u32 = n;

    while (m > 0) : ({
        m /= 10;
        i += 1;
    }) {
        const c = m % 10 + '0';
        buffer[i] = @truncate(c);
    }
    std.mem.reverse(u8, buffer[0..i]);

    return buffer[0..i];
}

