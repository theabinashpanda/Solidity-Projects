// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract {
    string public ourStr = "Abinash Panda";

    function updateOurStr(string memory _updateString) public {
        ourStr = _updateString;
    }
}