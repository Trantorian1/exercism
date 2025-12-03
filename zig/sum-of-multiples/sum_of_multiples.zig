const std = @import("std");

pub fn sum(allocator: std.mem.Allocator, factors: []const u32, limit: u32) !u64 {
    // STEP 1] ALLOCATE
    var size: usize = 0;
    for (factors) |f| {
        if (f != 0) {
            size += (limit -| 1) / f;
        }
    }

    // std.debug.print("size: {d} limit: {d}\n", .{ size, limit });

    const multiples = try allocator.alloc(u64, size);
    defer allocator.free(multiples);

    // STEP 2] ACCUMULATE ALL FACTORS
    var i: usize = 0;
    for (factors) |f| {
        if (f == 0) {
            continue;
        }

        var j: u32 = 1;
        var m = f;
        // std.debug.print("f: {d}\n", .{f});
        while (m < limit) : ({
            i += 1;
            j += 1;
            m = f * j;
        }) {
            // std.debug.print("m: {d} j: {d}\n", .{ m, j });
            multiples[i] = m;
        }
    }

    // for (multiples) |m| {
    //     std.debug.print("multiples: {d}\n", .{m});
    // }
    // std.debug.print("\n", .{});

    // STEP 3] DEDUP
    std.sort.block(u64, multiples, {}, std.sort.asc(u64));
    switch (multiples.len) {
        0 => return 0,
        1 => return multiples[0],
        else => {
            var score = multiples[0];
            for (multiples[1..], multiples[0 .. multiples.len - 1]) |f, f_prev| {
                if (f != f_prev) {
                    score += f;
                }
            }

            return score;
        },
    }
}

