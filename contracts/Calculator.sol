// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

// 1️⃣ Make a contract called Calculator
// 2️⃣ Create Result variable to store result
// 3️⃣ Create functions to add, subtract, and multiply to result
// 4️⃣ Create a function to get result

contract Calculator {
    uint256 result;
    function add(uint256 a, uint256 b) public {
        result = a+b;
    }
    function substract(uint256 a, uint256 b) public {
        result = a-b;
    }
    function multiply(uint256 a, uint256 b) public {
        result = a*b;
    }
    function divide(uint256 a, uint256 b) public {
        require(b != 0); 
        result = a / b;
    }
    function getResult() public view returns (uint256){
        return result;
    }

}
