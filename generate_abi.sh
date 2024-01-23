#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: generate_abi.sh [abi|bin]"
    exit 1
fi

echo "generate $1 ..."
solc forge-std/=forge-std/src/ --base-path ./contracts/ --include-path ./lib --optimize --$1 ./contracts/AutomataDcapV3Attestation.sol --pretty-json -o AutomataDcapV3Attestation.$1
echo "done"
