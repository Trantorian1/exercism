const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;

    var n = num;
    var sum: u128 = 0;
    const log: u128 = std.math.log10(num) + 1;

    while (n > 0) : ({
        n /= 10;
    }) {
        sum += std.math.powi(u128, n % 10, log) catch return false;
    }

    return sum == num;
}

