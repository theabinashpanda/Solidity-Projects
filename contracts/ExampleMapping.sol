// SPDX-License-Identifier: MIT
// The MIT License is a permissive open source license.
// SPDX identifier is used for license specification.

pragma solidity 0.8.15;

contract ExampleMapping {
    
    // Mapping from uint to bool, stores whether a value is true or false.
    mapping(uint => bool) public myMapping;
    // function myMapping(uint _key) public view returns(bool){
    //     return myMapping[_key];
    // }

    // Mapping from address to bool, stores whether an address is marked as true or false.
    mapping (address => bool) public myAddressMapping;

    // Nested mapping, maps pairs of uint keys to bool values.
    mapping (uint => mapping (uint => bool)) uintUintBoolMapping;

    // Function to set a value in the myMapping mapping.
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    // Function to set the value for the caller's address in myAddressMapping.
    function setAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    // Function to set a value in the nested uintUintBoolMapping mapping.
    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }

}