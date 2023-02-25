// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Nogap {
    uint[] s_dynamic;

    constructor () {
        s_dynamic = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    }
    function getAtIndex(uint _index) public view returns (uint) {
        return s_dynamic[_index];
    }

    function getArrayLength() public view returns (uint) {
        return s_dynamic.length;
    }

    function deleteAtIndex(uint _index) public {
        delete s_dynamic[_index];
    }
    function deleteAndJoin(uint _index) public {
        uint[] memory dynamic = s_dynamic;
        uint[] memory result = new uint[](dynamic.length-1);

        for(uint i=0;i<_index;i++){
            result[i] = dynamic[i];
        }
        for(uint i=_index+1;i<dynamic.length;i++){
            result[i-1] = dynamic[i];
        }
        s_dynamic = result;
    }

    function getNumbers() external view returns(uint256[] memory) {
        return s_dynamic;
    }
}
