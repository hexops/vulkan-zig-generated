#!/usr/bin/env bash
set -euo pipefail

rm -rf vulkan-zig/

# `git clone --depth 1` but at a specific revision
mkdir vulkan-zig/
pushd vulkan-zig
git init
git remote add origin https://github.com/Snektron/vulkan-zig
git fetch --depth 1 origin ac4103a733c479b599aae8d42c08cabd7d5cf48a
git checkout FETCH_HEAD
popd

# Generate vulkan bindings
zig run vulkan-zig/generator/main.zig -- vk.xml vk.zig

echo "
// -------------------------------------------

pub const ANativeWindow = opaque{};
pub const CAMetalLayer = opaque{};
pub const AHardwareBuffer = opaque{};
" >> vk.zig

zig fmt vk.zig
