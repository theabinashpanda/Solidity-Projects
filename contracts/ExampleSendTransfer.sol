// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Sender {
    receive() external payable { }
    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
 
    }
    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);
        require(isSent,"Sending the funds was unsuccessful");
    }
}

contract ReceiverNoAction{
    
    function balance() public view returns (uint){
        return  address(this).balance;
    }
    receive() external payable { }
}

// Transfer didn't work for this because when we called the receiver in action, it tried to write to the storage variable and it ran out of gas and then it got failed.
// The calling contract saw that the call failed it for an error and the transaction was rolled back

contract ReceiverAction{
    uint public balanceReceived;
    receive() external payable {
        balanceReceived += msg.value;       
    }
    function balance() public view returns (uint){
        return  address(this).balance;
    }
}