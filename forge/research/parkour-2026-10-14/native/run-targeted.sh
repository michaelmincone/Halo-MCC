#!/bin/bash
set -euo pipefail
task_root="$(cd "$(dirname "$0")/../../../.." && pwd)"
evidence_root="$task_root/forge/research/parkour-2026-10-14/native"
project_root="$task_root/forge/research/object-limit-2026-10-14/saved-editability"
target_binary='/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection/haloreach/haloreach.dll'
tool_root="$task_root/publisher/investigation"
script_source="$tool_root/scripts/ghidra/DecompileSelected.java"
pass_name="${1:?Supply a new evidence pass name}"
shift
case "$pass_name" in *[!a-zA-Z0-9_-]*|'') exit 2;; esac
output="$evidence_root/$pass_name"
if [[ -e "$output" ]]; then echo "Evidence destination already exists" >&2; exit 2; fi
mkdir -p "$output"
export JAVA_HOME='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'
export GHIDRA_HEADLESS_MAXMEM=1G
export GHIDRA_HEADLESS_JAVA_OPTIONS='-XX:ActiveProcessorCount=2'
# Reuse the existing imported image, with temporary analysis changes discarded.
# No target execution, binary patching, or whole-program autoanalysis.
exec "$tool_root/.tools/ghidra/ghidra_12.1.4_PUBLIC/support/analyzeHeadless" \
  "$project_root" ReachSavedEdits -process haloreach.dll -readOnly -noanalysis -max-cpu 2 \
  -scriptPath "$tool_root/scripts/ghidra" \
  -postScript DecompileSelected.java "$output" "$target_binary" "$script_source" "$@" \
  -log "$output/headless.log" -scriptlog "$output/script.log"
