const std = @import("std");

// PARAMS
const DEBUG = false;
const ALLOW_UNSAFE = true;

// OBJECT
const Tag = enum {
    nil,
    atom,
    number,
    pair,
    clos,
    prim,
};
const Object = struct {
    tag: Tag,
    value: union {
        atom: []u8,
        number: i64,
        pair: struct {
            car: *Object,
            cdr: *Object,
        },
        clos: struct {
            body: *Object,
            env: *Object,
        },
        prim: struct {
            func: fn (env: **Object) void,
        },
    },
};

pub fn main() !void {
    std.debug.print("Hello, World!\n", .{});
}
