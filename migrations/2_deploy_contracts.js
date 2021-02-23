// migrating the appropriate contracts
var CustodianRole = artifacts.require("./CustodianRole.sol");
var CustomerRole = artifacts.require("./CustomerRole.sol");
var LaboratoryRole = artifacts.require("./LaboratoryRole.sol");
var ManufacturerRole = artifacts.require("./ManufacturerRole.sol");
var MinerRole = artifacts.require("./MinerRole.sol");

var Emerald = artifacts.require("./Emerald.sol");
var EmeraldProperties = artifacts.require("./EmeraldProperties.sol");
var EmeraldStates = artifacts.require("./EmeraldStates.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(CustomerRole);
  deployer.deploy(CustodianRole);
  deployer.deploy(LaboratoryRole);
  deployer.deploy(ManufacturerRole);
  deployer.deploy(MinerRole);
  deployer.deploy(Emerald);
  deployer.deploy(EmeraldProperties);
  deployer.deploy(EmeraldStates);
  deployer.deploy(SupplyChain);
};
