// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract MyContract {
    uint public myUint = 123;
    function setMyUint(uint _myUint) public {
        myUint =_myUint;
    }
}