const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const rna: []u8 = try allocator.alloc(u8, dna.len);

    for (dna, 0..) |strand, i| {
        switch (strand) {
            'G' => rna[i] = 'C',
            'C' => rna[i] = 'G',
            'T' => rna[i] = 'A',
            'A' => rna[i] = 'U',
            else => unreachable,
        }
    }

    return rna;
}

