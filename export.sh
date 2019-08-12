#!/bin/sh

# Create ABI file
solc --abi contracts/Ethash.sol --overwrite -o ./abi
solc --bin contracts/Ethash.sol --overwrite -o ./bin

# Generate Go file and export to go-testimonium project
abigen --bin=bin/Ethash.bin --abi=abi/Ethash.abi --pkg=ethash --out=${GOPATH}/src/github.com/pf92/go-testimonium/ethereum/ethash/EthashContract.go
