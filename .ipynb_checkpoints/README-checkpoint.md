# week21_advanced_solidity
In this project, a Blockchain network is created for fundraising, in order to track the genetic trail of dogs.

## Libraries/Protocols
- ERC20
- ERC20Detailed
- ERC20Mintable
- Crowdsale
- MintedCrowdsale
- CappedCrowdsale
- TimedCrowdsale
- RefundableCrowdsale

## Tools/Technologies
- Solidity v0.5.17
- Remix
- MetaMask
- GitHub
- Gitbash
- Jupyter lab
- Windows 10 64-bit

## Files created
- puppercoin.sol
- crowdsale.sol

## High level summary
- An ERC20 token is created, that consists of the name, symbol and initial supply.
- Under the contract PupperCoinSale, the rate, wallet address, PupperCoin token, open and close time are declared.
- The PupperCoin and its address are created.
- The goal, open and close time are set.
- The PupperCoinSale contract is made as a minter and then PupperCoinSaleDeployer renounces its minter role.

## Address used to send ETH
0xB44F86125615Cd27d1af4962acCa9801D6afBBf1

## Contributors
- Satheesh Narasimman

## People who helped
- Michael Tang, Bootcamp tutor

## References
- https://docs.openzeppelin.com/contracts/2.x/crowdsales