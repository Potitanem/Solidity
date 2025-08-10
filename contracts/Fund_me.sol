// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{


    uint256 public minimumUsd = 5e18;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;
    mapping(address => uint256) public userCallCount;

    function fund() public payable {
        //Allow users to send $
        //Have a minimum $ sent $
        //This is how we send ETH to this conctract
        require(getConversionRate(msg.value) > minimumUsd, "Didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        contributionCount();
    }

    function contributionCount() private {
        userCallCount[msg.sender] += 1;
    }

    function getPrice() public view returns (uint256){

        // Adress ETH/USD: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = dataFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000.00000000
        return uint256(answer * 1e10);
   }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    } 

    function convertUsdToEth(uint256 usdAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        require(ethPrice > 0, "Price cannot be zero");
        uint256 usdToEth = (1e18 * usdAmount) / ethPrice;
        return usdToEth;
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}

 
 contract GetBTC{
    function getPriceBTC() public view returns (uint256){
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
         (,int256 answer,,,) = priceFeed.latestRoundData();
         return uint256(answer) / 1e10;
    }

 }