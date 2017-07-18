pragma solidity ^0.4.11;


import './ETHCONEarlyBirdToken.sol';

/**
 * @title ETHCON Early Bird Donation Contract
 * @author majoolr.io
 *
 * Accepts donations and issues ETHCON token if at or above 3.9604 ETH.
 * See ETHCON.org for further information.
 * ETHCONEarlyBirdToken contract at 0x55b948be16f1eba9802c6dd83f04c501be00394f
 */

contract ETHCONEarlyBirdDonation {
  address majoolr;
  ETHCONEarlyBirdToken token;

  uint256 public donations;
  mapping (address => uint256) public donationMap;
  mapping (address => uint256) public failedDonations;
  uint256 public minimum = 3960400000000000000;

  event ErrMsg(address indexed _from, string _msg);
  event ThxMsg(address indexed _from, string _msg);

  modifier andIsMajoolr {
    require(msg.sender == majoolr);
    _;
  }

  function(){ ErrMsg(msg.sender, 'No function called'); }

  function ETHCONEarlyBirdDonation(address _token){
    token = ETHCONEarlyBirdToken(_token);
    majoolr = msg.sender;
  }

  function donate() payable returns (bool){
    uint256 totalDonation = donationMap[msg.sender] + msg.value;
    if(totalDonation < minimum){
      failedDonations[msg.sender] += msg.value;
      ErrMsg(msg.sender, "Donation too low, call withdrawDonation()");
      return false;
    }

    bool success = token.transferFrom(majoolr,msg.sender,1);
    if(!success){
      failedDonations[msg.sender] += msg.value;
      ErrMsg(msg.sender, "Transer failed, call withdrawDonation()");
      return false;
    }

    donationMap[msg.sender] += msg.value;
    donations += msg.value;
    ThxMsg(msg.sender, "Thank you for your donation!");
    return true;
  }

  function generousDonation() payable returns (bool){
    uint256 tokensLeft = token.allowance(majoolr, this);
    if(tokensLeft == 0){
      failedDonations[msg.sender] += msg.value;
      ErrMsg(msg.sender, "No more donations here check Majoolr.io, call withdrawDonation()");
      return false;
    }

    donationMap[msg.sender] += msg.value;
    donations += msg.value;
    ThxMsg(msg.sender, "Thank you for your donation!");
    return true;
  }

  function withdraw() andIsMajoolr {
    uint256 amount = donations;
    donations = 0;
    msg.sender.transfer(amount);
  }

  function withdrawDonation(){
    uint256 amount = failedDonations[msg.sender];
    failedDonations[msg.sender] = 0;
    msg.sender.transfer(amount);
  }
}
