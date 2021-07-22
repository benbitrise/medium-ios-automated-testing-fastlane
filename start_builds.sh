#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

echo "Starting builds" 

workflow_names=("gen2-4_core-xcode13.0" "gen2-4_core-xcode12.5" "gen2-4_core-xcode12.4" "gen2-4_core-xcode12.3" "gen2-4_core-xcode12.2" "gen2-4_core-xcode12.1" "gen2-4_core-xcode12.0")

for i in "${workflow_names[@]}";
do
echo $i
curl https://app.bitrise.io/app/${BITRISE_APP_SLUG}/build/start.json --data "{\"hook_info\":{\"type\":\"bitrise\",\"build_trigger_token\":\"${BUILD_TRIGGER_TOKEN}\"},\"build_params\":{\"branch\":\"lower_stack_sim_app_repro\",\"workflow_id\":\"${i}\" },\"triggered_by\":\"curl\"}"
sleep 45
done
