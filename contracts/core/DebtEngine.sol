// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IVault {
    function convertToAssets(uint256 shares) external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function asset() external view returns (address);
}

contract DebtEngine is ReentrancyGuard {
    uint256 public constant APR = 550; // 5.5%
    uint256 public constant LTV = 7000; // 70%
    IVault public vault;

    mapping(address => uint256) public debt;
    uint256 public totalDebt;

    constructor(address _vault) {
        vault = IVault(_vault);
    }

    function borrow(uint256 assets) external nonReentrant {
        uint256 collateral = vault.convertToAssets(vault.balanceOf(msg.sender));
        require(collateral * LTV / 10000 >= debt[msg.sender] + assets, "Low LTV");
        debt[msg.sender] += assets;
        totalDebt += assets;
        IERC20(vault.asset()).transfer(msg.sender, assets);
    }
}
