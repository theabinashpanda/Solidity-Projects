// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract StartStopUpdateExample{
    receive() external payable {}
    function destroy() public{
        selfdestruct(payable(msg.sender));
    }
}