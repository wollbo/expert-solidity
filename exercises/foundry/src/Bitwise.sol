// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// watch out for underflow and overflow

contract Bitwise {

    uint256 beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190; 
    uint256 deValue = 100651486825157721501865874785935801379319359184012953785965706769510029551182;

    uint256 x = deValue;
    // 2**8 = 16**2
    // two hex slots equals eight bits
    function solidityShift () external {
        bytes32 x_ = bytes32(x) >> 248; // shift right so we get the first byte 
        if (uint(x_) == 0xde) {
            x = x * 4; // overflow 
        }
        if (uint(x_) == 0xbe) {
            x = x / 4;
        } 
    }

    function yulShift () external { // multiplication/division is performed in place
        assembly {
            switch shr(248, sload(x.slot)) // extract the first byte
            case 0xde {
                sstore(x.slot, mul(sload(x.slot), 4)) 
            }
            case 0xbe {
                sstore(x.slot, div(sload(x.slot), 4))
            }            
        }
    }

    function get_x() public view returns (uint256) {
        return x;
    }

    function set_x(uint256 _x) public {
        x = _x;
    }

}