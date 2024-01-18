// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Owner{
    address owner;
    constructor (){
         owner = msg.sender;
    }
    modifier ownerOnly() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    function transferOwnership(address newOwner) public ownerOnly{
        owner = newOwner;
    }
}