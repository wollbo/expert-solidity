// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            if gt(x, y) {
                let r := sub(x, y)
                mstore(0, r)
                return(0, 0x20)
            }
            return(0, 0x20)
        }
    }
}