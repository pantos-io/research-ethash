const Contract = artifacts.require("Ethash");

module.exports = function(deployer) {
  deployer.deploy(Contract);
};
