// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Intro.sol";
import "../src/Add.sol";
import "../src/Sub.sol";
import "../src/Scope.sol";



contract AssemblyTest is Test {
    Intro public intro;
    Add public add;
    SubOverflow public sub;
    Scope public scope;

    function setUp() public {
        intro = new Intro();
        add = new Add();
        sub = new SubOverflow();
    }
    
    function testReturnMol() public {
        uint mol = intro.intro();
        assertEq(mol, 420);
    }

    function testReturnAdd() public {
        uint res = add.addAssembly(123, 456);
        assertEq(res, 579);
    }

    function testSubOverflow() public {
        uint res = sub.subtract(123, 456);
        assertEq(res, 0);
        res = sub.subtract(123, 11);
        assertEq(res, 112);
    }

    function testIncrement() public { // for some reason gives errors here, but works in remix
        scope.increment(2);
        console.logUint(scope.count());
        assertEq(scope.count(), 12);
    }
}