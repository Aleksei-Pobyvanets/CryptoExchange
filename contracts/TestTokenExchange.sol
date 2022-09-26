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

