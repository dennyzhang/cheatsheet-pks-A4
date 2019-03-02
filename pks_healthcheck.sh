#!/usr/bin/env bash

# TODO improve the logic
source /home/kubo/gw_scripts/bosh_env.sh
echo "bosh vms"
bosh vms

echo "pks clusters"
pks clusters
