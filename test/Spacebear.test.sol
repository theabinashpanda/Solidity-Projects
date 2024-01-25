// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Spacebear.sol";

contract SpacebearTest is Test {
    Spacebear spacebear;
    function setUp() public{
        spacebear = new Spacebear();
    }
    function testNameIsSpacebear() public {
        assertEq(spacebear.name(),"Spacebears");   
    }
    function testMintingNTFs() public{
        spacebear.safeMint(msg.sender);
        assertEq(spacebear.ownerOf(0),msg.sender);
        assertEq(spacebear.tokenURI(0),"https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/spacebear_1.json");
    }
}