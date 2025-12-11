const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var n = num;
    var sum: u128 = 0;
    const log: u128 = if (num > 0) std.math.log10_int(num) + 1 else 0;

    while (n > 0) : (n /= 10) {
        sum += std.math.pow(u128, n % 10, log);
    }

    return sum == num;
}

