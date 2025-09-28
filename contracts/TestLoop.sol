// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
contract Loop{
   uint256[] public numbers;
    function pushNumbers() public{
        delete numbers;
        for(uint256 i = 1; i <= 10; i++){
            numbers.push(i);
        }
    }
}