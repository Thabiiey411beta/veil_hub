// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LPVacuum is ReentrancyGuard {
    IERC20 public usdc;
    address public treasury;
    address public immortalReserve;
    uint256 public warChest;

    event VacuumHarvest(uint256 profit);

    constructor(address _usdc, address _treasury, address _immortal) {
        usdc = IERC20(_usdc);
        treasury = _treasury;
        immortalReserve = _immortal;
    }

    function injectCapital(uint256 amount) external {
        usdc.transferFrom(msg.sender, address(this), amount);
        warChest += amount;
    }

    function harvest(uint256 profit) external {
        usdc.transferFrom(msg.sender, address(this), profit);
        uint256 toTreasury = (profit * 40) / 100;
        uint256 toImmortals = (profit * 40) / 100;
        uint256 compound = (profit * 15) / 100;
        usdc.transfer(treasury, toTreasury);
        usdc.transfer(immortalReserve, toImmortals);
        warChest += compound;
        emit VacuumHarvest(profit);
    }
}
