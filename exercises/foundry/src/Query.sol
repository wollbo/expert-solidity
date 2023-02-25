pragma solidity ^0.8.4;

contract Query {

    function query(bytes memory data, function(uint) external test) public pure {
        // this function should revert if test is a ERC-20 transfer function
        // casting to bytes4 returns 4 first bytes of keccak hash
        if (bytes4(keccak256(bytes("transfer(address,uint256)"))) == test.selector) {
            revert("selector is not transfer");
        }
    }

    event TransferOccured(address,uint256);

    function checkCall(bytes calldata data) external {
        // the function should revert if the function is not an ERC20 transfer function.
        // otherwise extract the address and amount from the data variable and emit an event
        // with those details 
        bytes4 selector = bytes4(data);
        if (bytes4(keccak256(bytes("transfer(address,uint256)"))) != selector) {
            revert("selector is not transfer");
        }
        (address target, uint256 amount) = abi.decode(data[4:], (address, uint256));
        emit TransferOccured(target, amount);
    }

}