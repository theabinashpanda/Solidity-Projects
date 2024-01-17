// SPDX-License-Identifier: MIT

// The MIT License is a permissive open source license.
// SPDX identifier is used for license specification.

// Use Solidity version 0.8.15, ensuring compatibility with the specified compiler version.
pragma solidity 0.8.15; 

contract SmartWallet {

    // Current balance of the smart wallet
    uint public balance;

    // Function to deposit Ether into the smart wallet (Smart Contract)
    function deposit() public payable {

        // Increase the balance by the amount sent
        balance += msg.value;

    }

    // Function to get the current balance of the smart wallet (Smart Contract)
    function getBalance() public view returns(uint) {

        // Return the balance of the smart wallet
        return address(this).balance;

    }

    // Function to withdraw the entire balance to the owner
    function withdrawAll() public {

        // Convert the owner's address to a payable address
        address payable to = payable(msg.sender);

        // Get the current balance
        uint amount = getBalance();
        // Transfer the entire balance to the owner
        to.transfer(amount);

        // Update the balance variable by subtracting the withdrawn amount
        balance -= amount;

    }

    // Function to withdraw the entire balance to a specified address
    function withdrawToAddress(address payable to) public {

        // Get the current balance
        uint amount = getBalance();

        // Transfer the entire balance to the specified address
        to.transfer(amount);

        // Update the balance variable by subtracting the withdrawn amount
        balance -= amount;

    }

}