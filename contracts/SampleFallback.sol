// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    function setMyUint(uint _myNewUint) public{
        myUint = _myNewUint;
    }
    
    //0xe492fd840000000000000000000000000000000000000000000000000000000000000001
    // 0x :Hex val
    //e492fd84: func signature

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
     }
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
     }  
}