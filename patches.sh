#!/usr/bin/env bash
#
# patches:
#   patch/ramulator2_pim.patch           (patch for LLMSimulator)
#   patch/ssd_offloading.patch           (patch for SSD-offloading)

set -euo pipefail

ROOT_DIR=$(dirname "$(realpath "$0")")
SIM_DIR="$ROOT_DIR/LLMSimulator"
RAMULATOR_DIR="$SIM_DIR/src/dram/ramulator2"

# even if we don't use ramulator in this repo, this is intended to facilitate portability from LLMSimulator.
echo "▶︎  Applying patch for LLMSimulator..."
pushd "$RAMULATOR_DIR" >/dev/null
git apply --whitespace=nowarn "$SIM_DIR/patch/ramulator2_pim.patch"
popd >/dev/null

echo "▶︎  Applying patch for SSD_offloading..."
pushd "$SIM_DIR" >/dev/null
git apply -p0 --whitespace=nowarn "$ROOT_DIR/patch/ssd_offloading.patch"
popd >/dev/null

echo "All patches applied"

