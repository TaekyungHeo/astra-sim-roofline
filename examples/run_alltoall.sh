#! /bin/bash

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY=""
NETWORK=""
CONFIG=""
SYNTHETIC=""
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/sample_torus_sys.txt
WORKLOAD="${SCRIPT_DIR:?}"/../inputs/workload/microAllToAll.txt
STATS="${SCRIPT_DIR:?}"/results/run_alltoall

while getopts n: flag
do
    case "${flag}" in
        n) network=${OPTARG};;
    esac
done

echo "network: $network";

BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/sample_Torus3D.json

rm -rf "${STATS}"
mkdir "${STATS}"

$BINARY ${CONFIG} $SYNTHETIC --network-configuration=${NETWORK} --system-configuration=${SYSTEM} --workload-configuration=${WORKLOAD} --path=${STATS}/ --run-name=sample_all_to_all --num-passes=2 --total-stat-rows=1 --stat-row=0
