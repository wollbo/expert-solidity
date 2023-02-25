// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Passed {
    function passed() public payable returns(uint) {
        assembly {
            let v := callvalue()
            mstore(0, v)
            return(0, 0x20)
        }
    }
}