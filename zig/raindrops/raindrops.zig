const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var i: usize = 0;
    if (n % 3 == 0) {
        @memmove(buffer[0..5], "Pling");
        i += 5;
    }

    if (n % 5 == 0) {
        @memmove(buffer[i .. i + 5], "Plang");
        i += 5;
    }
    if (n % 7 == 0) {
        // std.mem.copyForwards(u8, buffer[buffer.len..], "Plong");
    }
    if (n % 3 != 0 and n % 5 != 0 and n % 7 != 0) {
        // cursor = std.fmt.bufPrint(cursor[cursor.len..], "{d}", .{n}) catch cursor;
    }

    std.debug.print("i: {d}\n", .{i});
    @memset(buffer[i..], 0);

    return buffer;
}

