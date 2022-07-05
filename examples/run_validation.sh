#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

#ASTRASIM="/home/dkadiyala3/Desktop/astra-sim-roofline"
#ASTRASIM="/nethome/dkadiyala3/astra-sim-roofline"

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/validate.json
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/validate.txt
WORKLOAD="${SCRIPT_DIR:?}"/../inputs/workload/validation-microbenchmark.txt
STATS="${SCRIPT_DIR:?}"/validation_astra_allreduce_analytical

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD}" \
--path="${STATS}/" \
--run-name="Transformer_HybridParallel" \
--num-passes=1 \
--total-stat-rows=1 \
--stat-row=0
