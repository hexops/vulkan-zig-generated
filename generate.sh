#!/usr/bin/env bash
set -euo pipefail

rm -rf vulkan-zig/

# `git clone --depth 1` but at a specific revision
mkdir vulkan-zig/
pushd vulkan-zig
git init
git remote add origin https://github.com/Snektron/vulkan-zig
git fetch --depth 1 origin 4f15927ba2e368b26c61c14deab9938bf5b19b8d
git checkout FETCH_HEAD
popd

# Generate vulkan bindings
zig run vulkan-zig/generator/main.zig -- vk.xml vk.zig
