# Ethash

This project contains an Ethereum smart contract that enables the on-chain verification 
of Ethereum Proof of Work (PoW).

By providing the block number, the Keccak hash of the RLP-encoded block header without nonce and mix, the nonce, difficulty,
and some elements of the Directed Acyclic Graph (DAG) used for mining, callers are able to verify the PoW on-chain. For 
instance, the contract is used by [Testimonium](https://github.com/pantos-io/testimonium) to verify the validity of submitted
block headers. 

> _Important: Ethash is a research prototype. 
  It represents ongoing work conducted within the [TAST](https://dsg.tuwien.ac.at/projects/tast/) 
  research project. Use with care._

## Get Started
Ethash can be deployed through the CLI tool of [Testimonium](https://github.com/pantos-io/testimonium), so go check it out [here](https://github.com/pf92/go-testimonium).  
If you want to deploy the contracts manually, follow the steps below.

## Installation
The following guide will walk you through the deployment of Ethash on a local blockchain (Ganache).

### Prerequisites
You need to have the following tools installed:
* [Node](https://nodejs.org/en/) v10
* [Ganache](https://www.trufflesuite.com/ganache) v2.1.0

### Deployment
1. Clone the repository: `git clone git@github.com:pf92/ethash.git`
2. Change into the project directory: `cd ethash/`
3. Install all dependencies: `npm install`  
4. Deploy contract: `truffle migrate --reset`

## How it works
Developers can use this contract to perform an on-chain verification of Ethereum PoW by calling the
function _verifyPoW_ with the following parameters: the block number, the Keccak hash of the RLP-encoded
block header without nonce and mix, the nonce, difficulty, and some elements of the Directed Acyclic Graph (DAG) used
for mining. To check that elements come from the correct DAG (for every epoch (30,000 blocks) a new DAG is used), the contract has to be initialized
with so-called epoch data. This can be done by using the function _setEpochData_. In case the
contract is intended to be used in production, it should be initialized in advance with
an sufficient amount of epoch data (e.g., epoch data for the next 5 years). Since
the data of each epoch can be easily recomputed, everyone can verify the correctness of the data
used for the contract initialization. Thus, no trust in the party initializing the contract is needed.

The generation of epoch data and example calls of the contract's functions are shown at https://github.com/pf92/go-testimonium/blob/master/cmd/submitEpoch.go


## How to contribute
Ethash is a research prototype. We welcome anyone to contribute.
File a bug report or submit feature requests through the [issue tracker](https://github.com/pantos-io/ethash/issues). 
If you want to contribute feel free to submit a pull request.

## Acknowledgements
* The development of this prototype was funded by [Pantos](https://pantos.io/) within the [TAST](https://dsg.tuwien.ac.at/projects/tast/) research project.
* The original code for the Ethash contract comes from the [smartpool project](https://github.com/smartpool).

## Licence
This project is licensed under the [MIT License](LICENSE).
