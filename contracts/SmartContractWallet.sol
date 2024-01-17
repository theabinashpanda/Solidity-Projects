// Wallet has 1 Owner.
// Receive funds with fallback function.
// Spend money on EOA and Contracts.
// Give allowance to other people.
// Set a new owner with 3 out of 5 guardians.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Consumer {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    function deposit() public payable {}
}

contract SmartContractWallet {

    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowed;
    mapping (address => bool) public guardians;
    mapping (address => mapping (address => bool)) nextOwnerGuardianVotedBool;

    address payable public owner;
    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationFromGuardians = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner,"You are not the owner, Aborting...");
        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender],"You are not a guardian, Aborting...");
        require(nextOwnerGuardianVotedBool[_newOwner][msg.sender] == false,"You already voted, Aborting...");
        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }
        guardiansResetCount++;
        
        if(guardiansResetCount >= confirmationFromGuardians){
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }
    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner,"You are not the owner, Aborting...");
        allowance[_for] = _amount;
        if(_amount>0){
            isAllowed[_for] = true;
        }
        else{
            isAllowed[_for] = false;
        }
    }

    function transferFunds(address payable _to, uint _amount,bytes memory _payload) public returns (bytes memory){
        require(msg.sender == owner,"You aren't the owner of this wallet, Aborting...");
        if(msg.sender != owner){
            require(isAllowed[msg.sender], "You are not allowed to send more than allowed, Aborting");
            require(allowance[msg.sender] >= _amount,"Sending more than allowed, Aborting...");

            allowance[msg.sender] -= _amount;
        }
        (bool success,bytes memory returnData)=_to.call{value:_amount}(_payload);
        require(success,"Call Not Sucessfull! Aborting...");
        return returnData;
    }
     receive() external payable { }
}