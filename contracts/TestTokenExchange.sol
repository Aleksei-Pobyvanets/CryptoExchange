// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

import "Lock.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract Vendor is Ownable {
  TestToken TestTokenExchange;
  uint256 public tokensPerMatic = 100;
  event BuyTokens(address buyer, uint256 amountOfMATIC, uint256 amountOfTokens);
  constructor(address tokenAddress) {
    TestTokenExchange = TestToken(tokenAddress);
  }

  function buyTokens() public payable returns (uint256 tokenAmount) {
    require(msg.value > 0, "You need to send some MATIC to proceed");
    uint256 amountToBuy = msg.value * tokensPerMatic;

    uint256 vendorBalance = yourToken.balanceOf(address(this));
    require(vendorBalance >= amountToBuy, "Vendor has insufficient tokens");

    (bool sent) = yourToken.transfer(msg.sender, amountToBuy);
    require(sent, "Failed to transfer token to user");

    emit BuyTokens(msg.sender, msg.value, amountToBuy);
    return amountToBuy;
  }
