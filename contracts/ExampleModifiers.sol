//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

import "contracts/Owner.sol";

contract InheritanceModifierExample is Owner {

    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public ownerOnly{
        
        tokenBalance[owner]++;
    }

    function burnToken() public ownerOnly{
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}