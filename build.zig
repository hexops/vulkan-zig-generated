const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("vulkan-zig-generated", .{ .source_file = .{ .path = "vk.zig" } });
}
