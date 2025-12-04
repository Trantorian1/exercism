const std = @import("std");

pub fn sum(allocator: std.mem.Allocator, factors: []const u32, limit: u32) !u64 {
    switch (factors.len) {
        0 => {
            return 0;
        },
        1 => {
            // We can avoid allocating if there is a single multiple to consider
            const f = factors[0];
            if (f == 0) {
                return 0;
            }

            var score: u64 = 0;
            var m = f;
            while (m < limit) : (m += f) {
                score += m;
            }

            return score;
        },
        else => {
            // We try to allocate only once, so we first determine the total
            // number of all multiples under the limit to allocate an array
            // large enough to hold them all without having to resize.
            var size: usize = 0;
            for (factors) |f| if (f != 0) {
                size += (limit -| 1) / f;
            };

            const multiples = try allocator.alloc(u64, size);
            defer allocator.free(multiples);

            var i: usize = 0;
            for (factors) |f| if (f != 0) {
                var m = f;
                while (m < limit) : ({
                    i += 1;
                    m += f;
                }) {
                    multiples[i] = m;
                }
            };

            switch (multiples.len) {
                0 => return 0,
                1 => return multiples[0],
                else => {
                    // Using pdq sort for its in-place sorting with no extra
                    // allocation. We don't care about the sort being stable
                    // either, so pdq is ok. Based off the performance metrics
                    // in Zort.
                    //
                    //          https://github.com/alichraghi/zort
                    //
                    std.sort.pdq(u64, multiples, {}, std.sort.asc(u64));
                    var score = multiples[0];
                    for (multiples[1..], multiples[0 .. multiples.len - 1]) |m, m_prev| {
                        if (m != m_prev) {
                            score += m;
                        }
                    }

                    return score;
                },
            }
        },
    }
}

