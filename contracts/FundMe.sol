// SPDX-License-Identifier: MIT

// Get funds from users
// Withdraw funs
// Set a minium funding value in USD

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public  minimumUsd = 50 * 1e18; 

    function fund() public payable {
        // Want to be able to set a minimum fund amount
        // 1. How do we send ETH to this contract.

        require(getConversionRate(msg.value) > minimumUsd,"Didn't send enough!"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000

        // a ton of computation here
        // What is reverting ?
        // undo any action before , and send remaining gas back

    }

    function getPrice() public view returns(uint256) {
        // ABI
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int price, , ,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 1650.0000

        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();

        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

   // function withdraw(){}

}