// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VEILToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("Veil", "VEIL") Ownable(initialOwner) {
        _mint(initialOwner, 100_000_000 * 10**18);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
