// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";
import {MathLibrary} from "./MathLibrary.sol";
contract FundMe{
    using PriceConverter for uint256;
    using MathLibrary for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    mapping(address => uint256) public userCallCount;

    function fund() public payable {
        //Allow users to send $
        //Have a minimum $ sent $
        //This is how we send ETH to this conctract
       require(msg.value.getConversionRate() > minimumUsd, "Didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        contributionCount();
    }

    function calculateSum(uint256 x, uint256 y) public pure returns (uint256) {
        return x.sum(y);
    }

    function contributionCount() private {
        userCallCount[msg.sender] += 1;
    }

 }