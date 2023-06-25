# vulkan-zig-generated

[Snektron/vulkan-zig](https://github.com/Snektron/vulkan-zig), generated for you, so that you can depend on it via the Zig package manager.

## Experimental

This is an _experimental_ Mach library, according to our [stability guarantees](https://machengine.org/next/docs/libs/):

> Experimental libraries may have their APIs change without much notice, and you may have to look at recent changes in order to update your code.

[Why this library is not declared stable yet](https://machengine.org/next/docs/libs/experimental/#earcut)

## Getting started

### Adding dependency

Create a `build.zig.zon` file in your project (replace `$LATEST_COMMIT` with the latest commit hash):

```
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .vulkan_zig_generated = .{
            .url = "https://github.com/hexops/vulkan-zig-generated/archive/$LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler instruct you to add a `.hash = "..."` field next to `.url`.

Then use the dependency in your `build.zig`:

```zig
...
pub fn build(b: *Build) void {
    ...
    exe.addModule("vulkan-zig-generated", b.dependency("vulkan_zig_generated", .{
        .target = target,
        .optimize = optimize,
    }).module("vulkan_zig_generated"));
}
```

You may then `const vk = @import("vulkan-zig-generated");` and use it.

### Usage

For usage, see [Snektron/vulkan-zig](https://github.com/Snektron/vulkan-zig).

## Issues

Issues are tracked in the [main Mach repository](https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Avulkan-zig-generated).
