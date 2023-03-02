// SPDX-License-Identifier: MIT

// Get funds from users
// Withdraw funs
// Set a minium funding value in USD

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public  minimumUsd = 50 * 1e18; 

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

   
    function fund() public payable {
        // Want to be able to set a minimum fund amount
        // 1. How do we send ETH to this contract.
 
        require(msg.value.getConversionRate() > minimumUsd,"Didn't send enough!"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        // msg.sender is a address wallert stand for this contract
        // a ton of computation here
        // What is reverting ?
        // undo any action before , and send remaining gas back

    }

    function withdraw() public onlyOwner {
        // for loop
        // [1,2,3,4]
       
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);
        // actually withdraw the funds

        // //transfer
        // payable(msg.sender).transfer(address(this).balance);
        // //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess,"Send failed");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed");
        // msg.sender = address

    }
    // modifier will go first.

    modifier onlyOwner {
         require(msg.sender == owner, "Sender is not owner");
         _;
    }

}