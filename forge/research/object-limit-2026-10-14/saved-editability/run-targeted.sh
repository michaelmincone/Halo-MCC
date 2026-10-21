#!/bin/bash
set -euo pipefail

task_root="$(cd "$(dirname "$0")/../../../.." && pwd)"
evidence_root="$task_root/forge/research/object-limit-2026-10-14/saved-editability"
target_binary='/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/haloreach.dll'
tool_root="$task_root/publisher/investigation"
script_source="$tool_root/scripts/ghidra/DecompileSelected.java"
export JAVA_HOME='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'
export GHIDRA_HEADLESS_MAXMEM=1G
export GHIDRA_HEADLESS_JAVA_OPTIONS='-XX:ActiveProcessorCount=2'

mkdir -p "$evidence_root/ghidra"
if [[ -e "$evidence_root/ReachSavedEdits.gpr" ]]; then
  operation=(-process haloreach.dll)
else
  operation=(-import "$target_binary")
fi

# Only read/disassemble the declared exception-table function extents. This
# does not run target code, patch the binary, or perform whole-program analysis.
exec "$tool_root/.tools/ghidra/ghidra_12.1.4_PUBLIC/support/analyzeHeadless" \
  "$evidence_root" ReachSavedEdits "${operation[@]}" -noanalysis -max-cpu 2 \
  -scriptPath "$tool_root/scripts/ghidra" \
  -postScript DecompileSelected.java "$evidence_root/ghidra" "$target_binary" "$script_source" \
  0x180076834 0x180076984 0x18006e550 0x18006e638 0x18006c290 \
  0x1800692cc 0x18006e0c8 0x18006e7bc 0x180076608 \
  -log "$evidence_root/headless.log" -scriptlog "$evidence_root/script.log"
