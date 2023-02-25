// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point
            let s_mol := mol
            mstore(0, s_mol)
            return(0, 0x20) // return first 32 bytes of memory
        }
    }
}