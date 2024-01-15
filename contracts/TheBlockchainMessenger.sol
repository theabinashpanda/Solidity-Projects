// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract TheBlockchainMessenger{

    uint public Count;
    address public owner;
    address public sender;
    address public receiver;
    string public Message;

    constructor(){
        owner= msg.sender;
    }

    function updateTheMessage(string memory _newMsg) public {
        if(msg.sender == owner){
            Message = _newMsg;
            Count++;
            sender = msg.sender;
            receiver = sender;
        }
        else{
            receiver = sender;
            sender = msg.sender;
            Message = _newMsg;
            Count++;
        }
    }
}