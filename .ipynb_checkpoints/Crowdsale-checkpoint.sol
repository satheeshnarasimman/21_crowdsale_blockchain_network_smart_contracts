pragma solidity ^0.5.17;

import "./puppercoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale{

    constructor(
        // Fill in the constructor parameters!
        uint rate,
        address payable wallet,
        PupperCoin token,
        uint goal,
        uint open,
        uint close
    )
        // Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(goal)
        TimedCrowdsale(open, close)
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public pupper_sale_address;
    address public token_address;

    constructor(
        // Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet,
        uint goal
    )
        public
    {
        // create the PupperCoin and keep its address handy
        PupperCoin token= new PupperCoin(name, symbol, 0);
        token_address= address(token);

        // create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        uint open = now;
        uint close = now + 24 weeks;
        
        PupperCoinSale pupper_sale = new PupperCoinSale(1, wallet, token, goal, open, close);
        pupper_sale_address= address(pupper_sale);

        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(pupper_sale_address);
        token.renounceMinter();
    }
}