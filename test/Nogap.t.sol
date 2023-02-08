// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Nogap.sol";

contract NogapTest is Test {
    Nogap public nogap;

    function setUp() public {
        nogap = new Nogap();
    }

    function testGetAtIndex() public {
        uint two = nogap.getAtIndex(2);
        assertEq(two, 2);
    }

    function testDeleteAtIndex() public {
        nogap.deleteAtIndex(2);
        assertEq(nogap.getAtIndex(2), 0);
    }

    function testDeleteAndJoin() public {
        nogap.deleteAndJoin(2);
        assertEq(nogap.getAtIndex(2), 3);
        assertEq(nogap.getAtIndex(1), 1);
        nogap.deleteAndJoin(5);
        assertEq(nogap.getAtIndex(5), 7);
        assertEq(nogap.getAtIndex(4), 5);
    }
}
