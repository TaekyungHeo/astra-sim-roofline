#! /bin/bash -v

# Absolue path to this script

#ASTRASIM="/home/dkadiyala3/Desktop/astra-sim-roofline"
#ASTRASIM="/nethome/dkadiyala3/astra-sim-roofline"

# Absolute paths to useful directories
BINARY="../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra"
NETWORK="../inputs/network/analytical/validate.json"
SYSTEM="../inputs/system/validate.txt"
WORKLOAD="../inputs/workload/validation-microbenchmark.txt"
STATS="./validation_astra_allreduce_analytical"

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

#--comm-scale=50 \
