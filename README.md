ETHCON 2018
=========================

Repository for deployed ETHCON token contracts. [Please visit ETHCON.org](http://ethcon.org "ETHCON website") for further information.

## Contract Addresses

### Donation Contract

**ENS**: EarlyBird.majoolr.eth   
**Address**: 0x23F47686C26Aaf2Cc3227B1Cf7e19b6C8760eD4b   

### Token Contract

**Address**: 0x2d9498d0fd6f40760d53a847eb64eaf51c9b8e74

## How to Donate

In order to donate you will need to call either the contract's **donate()** or **generousDonation()** method when sending Ether. To recieve a token for ETHCON you will need to call **donate()** with a sending value of 3.9604 or more ether. Any call to the **donate()** function below that threshold will be rejected and any ether sent will go to a *failedDonations* pile. To retrieve your donation then simply call the contract's **withdrawDonation()** function. If you would like to send any amount of ether just because then call the **generousDonation()** function. [Click here for further information](http://ethcon.org "ETHCON website").

## About Us

Majoolr works on open source projects in the Ethereum community with the purpose of testing, documenting, and deploying reusable code onto the blockchain to improve security and usability of smart contracts. Majoolr also strives to educate non-profits, schools, and other community members about the application of blockchain technology. [For further information: majoolr.io](https://majoolr.io "Majoolr website").
