// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/* 
  interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
  }
*/

contract Level_2_Solution {
   
    function solution(uint256[10] memory unsortedArray) pure public returns (uint256[10] memory){
        for (uint256 i=0; i<10; i++) {
            uint minIdx = i;
            for (uint256 j=i+1; j<10; j++) {
                if (unsortedArray[j] < unsortedArray[minIdx]) {
                    minIdx = j;
                }
            }
            uint tmp = unsortedArray[i];
            unsortedArray[i] = unsortedArray[minIdx];
            unsortedArray[minIdx] = tmp;
        }
        return unsortedArray;
    }
}