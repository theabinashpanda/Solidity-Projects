// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleWrapAround {
    uint256 public myUint;
    uint8 public myUint8=2**4;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    function decrementUint() public {
        unchecked{
            myUint --;
        }
    }
    function incrementUint8() public {
        myUint8++;
    }

}