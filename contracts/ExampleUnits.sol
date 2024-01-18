// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleUnits{
    modifier betweenOneAndTwo(){
        require(msg.value >= 1 ether && msg.value <= 2 ether);
        _;
    }

    uint runUtilTimestamp;
    uint startTimestamp;

    constructor(uint startInDays){
        startTimestamp = block.timestamp + (startInDays * 24 * 60 * 60);
        runUtilTimestamp = startTimestamp + (7 days);
    }
}