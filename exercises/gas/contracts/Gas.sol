// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract GasContract {
    uint256 public constant totalSupply = 10000;

    uint256 internal paymentCounter;
    mapping(address => uint256) public balances;
    address internal contractOwner;
    mapping(address => Payment[]) internal payments;
    mapping(address => uint256) public whitelist;
    address[5] public administrators;

    struct Payment {
        uint256 paymentType;
        uint256 paymentID;
        uint256 amount;
    }

    event Transfer(address recipient, uint256 amount);

    constructor(address[5] memory _admins, uint256 _totalSupply) {
        contractOwner = msg.sender;
        administrators = _admins;
        balances[contractOwner] = _totalSupply;
    }

    function balanceOf(address _user) external view returns (uint256 balance_) {
        return balances[_user];
    }

    function getTradingMode() external pure returns (bool mode_) {
        return true;
    }

    function getPayments(address _user)
        external
        view
        returns (Payment[] memory payments_)
    {
        return payments[_user];
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata _name
    ) external returns (bool status_) {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_recipient, _amount);
        Payment memory payment;
        payment.paymentType = 3;
        payment.amount = _amount;
        payment.paymentID = ++paymentCounter;
        payments[msg.sender].push(payment);
        return true;
    }

    function updatePayment(
        address _user,
        uint256 _ID,
        uint256 _amount,
        uint256 _type
    ) external {
        require(msg.sender == contractOwner);
        for (uint256 ii = 0; ii < payments[_user].length; ii++) {
            if (payments[_user][ii].paymentID == _ID) {
                payments[_user][ii].paymentType = _type;
                payments[_user][ii].amount = _amount;
                break;
            }
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        external
    {
        whitelist[_userAddrs] = _tier;
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount,
        uint256[3] calldata _struct
    ) external {
        balances[msg.sender] -= (_amount-whitelist[msg.sender]);
        balances[_recipient] += (_amount-whitelist[msg.sender]);
    }
}
