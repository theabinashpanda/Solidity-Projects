// SPDX-License-Identifier: MIT
// The MIT License is a permissive open-source license.
// SPDX identifier is used for license specification.

pragma solidity 0.8.15;

contract ExampleMappingStruct {

    // Struct to represent a transaction with amount and timestamp.
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    // Struct to represent the balance of an address with deposits and withdrawals.
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }
    
    // Mapping to store the balance information for each address.
    mapping(address => Balance) public balances;

    // Function to get details of a specific deposit for a given address and deposit number.
    function getDepositNum(address _from, uint _numDeposit) public view returns(Transaction memory) {
        // Return the details of the specified deposit.
        return balances[_from].deposits[_numDeposit];
    }

    // Function to allow users to deposit Ether and update their balance.
    function depositMoney() public payable {
        // Increment the total balance of the sender by the amount sent.
        balances[msg.sender].totalBalance += msg.value;

        // Create a deposit transaction and store it in the deposits mapping.
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }

    // Function to allow users to withdraw Ether and update their balance.
    function withdrawMoney(address payable _to, uint _amount) public {
        // Decrement the total balance of the sender by the withdrawal amount.
        balances[msg.sender].totalBalance -= _amount;

        // Create a withdrawal transaction and store it in the withdrawals mapping.
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;
        balances[msg.sender].numWithdrawals++;

        // Transfer the specified amount to the specified address.
        _to.transfer(_amount);
    }

}