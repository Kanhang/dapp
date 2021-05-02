var DappToken = artifacts.require("./Dapptoken.sol");

module.exports = function(deployer){
  deployer.deploy(DappToken);
};
