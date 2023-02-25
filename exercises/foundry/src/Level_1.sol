// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
  interface Isolution1 {
    function solution(uint256[2] calldata firstArray, uint256[2] calldata secondArray) external pure returns (uint256[2] calldata finalArray);
  }
*/

contract Level_1_Solution {

    function solution(uint256[2] calldata firstArray, uint256[2] calldata secondArray) external pure returns (uint256[2] memory finalArray) {
        uint256[2] memory arr;
    
        // Implement your solution here. 
        arr[0] = firstArray[0] + secondArray[0];
        arr[1] = firstArray[1] + secondArray[1];

        return arr;
    }
}
