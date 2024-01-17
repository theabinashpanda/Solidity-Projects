// SPDX-License-Identifier: MIT
// The MIT License is a permissive open source license.
// SPDX identifier is used for license specification.

pragma solidity 0.8.15;

contract ExampleMappingWithdrawals {
    
    // Mapping to store the balance of each address.
    mapping(address => uint) public balance;

    // Function to allow users to send Ether to the contract and update their balance.
    function sendMoney() public payable {
        // Increment the sender's balance by the amount sent.
        balance[msg.sender] += msg.value;
    }

    // Function to retrieve the total balance of the smart contract.
    function getBalance() public view returns(uint) {
        // Return the balance of the smart contract.
        return address(this).balance;
    }

    // Function to withdraw all Ether from the sender's balance to a specified address.
    function withdrawAllMoney(address payable _to) public {
        // Get the balance to send from the sender's balance mapping.
        uint balanceToSend = balance[msg.sender];
        // Set the sender's balance to zero.
        balance[msg.sender] = 0;
        // Transfer the balance to the specified address.
        _to.transfer(balanceToSend);
    }
}
