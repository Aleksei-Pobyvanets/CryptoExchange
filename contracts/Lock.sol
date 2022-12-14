// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestTokenExchange is ERC20, Ownable {
    constructor() ERC20("TestTokenExchange", "TTE") {}

    function mint() public onlyOwner {
        _mint(msg.sender, 10000 * 10 ** 18);
    }

}