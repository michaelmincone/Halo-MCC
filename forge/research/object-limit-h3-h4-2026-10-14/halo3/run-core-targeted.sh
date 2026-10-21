#!/bin/bash
set -euo pipefail

task_root="$(cd "$(dirname "$0")/../../../.." && pwd)"
evidence_root="$task_root/forge/research/object-limit-h3-h4-2026-10-14/halo3"
target_binary='/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/MCC/Binaries/Win64/MCC-Win64-Shipping.exe'
tool_root="$task_root/publisher/investigation"
script_source="$tool_root/scripts/ghidra/DecompileSelected.java"
export JAVA_HOME='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'
export GHIDRA_HEADLESS_MAXMEM=1G
export GHIDRA_HEADLESS_JAVA_OPTIONS='-XX:ActiveProcessorCount=2'

mkdir -p "$evidence_root/ghidra-core"
if [[ -e "$evidence_root/Halo3CoreDispatch.gpr" ]]; then
  operation=(-process MCC-Win64-Shipping.exe)
else
  operation=(-import "$target_binary")
fi

# Reads only two declared PE exception-table ranges. No autoanalysis, executable
# launch, binary patches, or whole-engine inference from shared routing code.
exec "$tool_root/.tools/ghidra/ghidra_12.1.4_PUBLIC/support/analyzeHeadless" \
  "$evidence_root" Halo3CoreDispatch "${operation[@]}" -noanalysis -max-cpu 2 \
  -scriptPath "$tool_root/scripts/ghidra" \
  -postScript DecompileSelected.java "$evidence_root/ghidra-core" "$target_binary" "$script_source" \
  0x14043ce28 0x14043eaac \
  -log "$evidence_root/headless.log" -scriptlog "$evidence_root/script.log"
