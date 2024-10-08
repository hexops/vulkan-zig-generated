#!/usr/bin/env bash
set -euo pipefail

rm -rf vulkan-zig/
rm -rf Vulkan-Docs/

# `git clone --depth 1` but at a specific revision
mkdir Vulkan-Docs/
pushd Vulkan-Docs
git init
git remote add origin https://github.com/KhronosGroup/Vulkan-Docs
git fetch --depth 1 origin ed4ba0242beb89a1795d6084709fa9e713559c94
git checkout FETCH_HEAD
popd

# Update vk.xml
mv Vulkan-Docs/xml/vk.xml .

# `git clone --depth 1` but at a specific revision
mkdir vulkan-zig/
pushd vulkan-zig
git init
git remote add origin https://github.com/Snektron/vulkan-zig
git fetch --depth 1 origin 06dae6c9201863837a92064e2e7814aa71064067
git checkout FETCH_HEAD
popd

# Generate Vulkan Zig bindings
pushd vulkan-zig/
zig build
popd

./vulkan-zig/zig-out/bin/vulkan-zig-generator vk.xml vk.zig

rm -rf vulkan-zig/
rm -rf Vulkan-Docs/
