const Contract = artifacts.require("SHA3_512");

module.exports = function(deployer) {
  deployer.deploy(Contract);
};
