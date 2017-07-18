var BasicMathLib = artifacts.require("./BasicMathLib.sol");
var ERC20Lib = artifacts.require("./ERC20Lib.sol");
var ETHCONEarlyBirdToken = artifacts.require("./ETHCONEarlyBirdToken.sol");
var ETHCONEarlyBirdDonation = artifacts.require("./ETHCONEarlyBirdDonation.sol");

module.exports = function(deployer, network) {
  deployer.deploy(BasicMathLib,{overwrite: false});
  deployer.link(BasicMathLib, ERC20Lib);
  deployer.deploy(ERC20Lib,{overwrite: false});
  deployer.link(BasicMathLib, ETHCONEarlyBirdToken);
  deployer.link(ERC20Lib, ETHCONEarlyBirdToken);
  deployer.link(BasicMathLib, ETHCONEarlyBirdDonation);
  deployer.link(ERC20Lib, ETHCONEarlyBirdDonation);
  if(network !== 'live'){
    deployer.deploy(ETHCONEarlyBirdToken).then(function() {
      var addr = ETHCONEarlyBirdToken.address
      addr = addr.toString('hex');
      return deployer.deploy(ETHCONEarlyBirdDonation, addr);
    });
  } else {
    deployer.deploy(ETHCONEarlyBirdToken).then(function() {
      var addr = ETHCONEarlyBirdToken.address
      addr = addr.toString('hex');
      return deployer.deploy(ETHCONEarlyBirdDonation, addr);
    });
  }
};
