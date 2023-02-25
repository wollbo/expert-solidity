// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Passed.sol";


contract AssemblyTest is Test {
    Passed public passed;

    function setUp() public {
        passed = new Passed();
    }

    function testReturnCall() public {
        uint call_val = 10;
        uint return_val = passed.passed{value: call_val}();
        assertEq(call_val, return_val);
    }
}