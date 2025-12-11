const std = @import("std");

pub fn sum(_: anytype, factors: []const u32, limit: u32) !u64 {
    var s: u64 = 0;

    for (factors, 0..) |f, i| {
        var m = if (f != 0) f else continue;

        multiples: while (m < limit) : (m += f) {
            for (factors[0..i]) |f_prev| {
                if (m % f_prev == 0) continue :multiples;
            }

            s += m;
        }
    }

    return s;
}

