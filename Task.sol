// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Task1 {
    uint256 public taskNum1;

    function storeTask1(uint256 _taskNum1) public{
        taskNum1 = _taskNum1;
    } 

    function getTask1() internal view returns (uint256){
        return taskNum1;
    }
}

contract Task2 is Task1 {
    uint256 public taskNum2;

    function storeTask2(uint256 _taskNum2) public{
        taskNum2 = _taskNum2;
    } 

    function getTask2() external view returns (uint256){
        return taskNum2;
    }

    function getFromParent() public view returns (uint256){
        return  getTask1();
    }

    function retrive2() public pure returns(uint256){
        return 10;
    } 
}
