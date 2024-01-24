// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
abstract contract ERC20{
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public virtual view returns (uint8);
}
contract ExampleTokenSale{
    uint tokenPriceInWei = 1 ether;
    ERC20 public token;
    address tokenOwner;

    constructor (address _token){
        tokenOwner =msg.sender;
        token = ERC20(_token);
    }
    function purchaseCoffee () public payable {
        require(msg.value>= tokenPriceInWei,"Not Enough Money Sent!");
        uint tokensToTransfer = msg.value/tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer);
        payable(msg.sender).transfer(remainder);
    }
}