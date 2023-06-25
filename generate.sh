git clone https://github.com/Snektron/vulkan-zig --depth 1
zig run vulkan-zig/generator/main.zig -- vk.xml vk.zig

echo "
// -------------------------------------------

pub const ANativeWindow = opaque{};
pub const CAMetalLayer = opaque{};
pub const AHardwareBuffer = opaque{};
" >> vk.zig

zig fmt vk.zig
