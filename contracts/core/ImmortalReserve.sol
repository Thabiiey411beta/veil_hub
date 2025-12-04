// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ImmortalReserve is ReentrancyGuard {
    using SafeERC20 for IERC20;

    IERC20 public usdc;
    IERC20 public veilToken;
    uint256 public totalShares;
    uint256 public accumulatedYield;
    mapping(address => uint256) public userShares;
    mapping(address => uint256) public claimed;

    event Dividend(uint256 amount);
    event Claim(address indexed user, uint256 amount);

    constructor(address _usdc, address _veilToken) {
        usdc = IERC20(_usdc);
        veilToken = IERC20(_veilToken);
    }

    function addYield(uint256 amount) external {
        usdc.safeTransferFrom(msg.sender, address(this), amount);
        accumulatedYield += amount;
        emit Dividend(amount);
    }

    function burnToBecomeImmortal(uint256 veilAmount) external nonReentrant {
        veilToken.safeTransferFrom(msg.sender, address(1), veilAmount); // BURN
        uint256 shares = veilAmount; // 1:1
        userShares[msg.sender] += shares;
        totalShares += shares;
    }

    function claim() external nonReentrant {
        uint256 pending = (userShares[msg.sender] * accumulatedYield) / totalShares - claimed[msg.sender];
        if (pending > 0) {
            claimed[msg.sender] += pending;
            usdc.safeTransfer(msg.sender, pending);
            emit Claim(msg.sender, pending);
        }
    }
}
