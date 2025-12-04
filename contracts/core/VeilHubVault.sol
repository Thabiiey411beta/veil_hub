// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VeilHubVault is ERC4626, Ownable {
    uint256 public constant PERFORMANCE_FEE = 1000; // 10%
    uint256 public constant WHALE_THRESHOLD = 5_000_000 * 10**6; // $5M USDC

    event Harvest(uint256 yield);
    event WhaleMode(address indexed user);

    constructor(IERC20 asset_, address initialOwner) ERC4626(asset_) ERC20("wstHUB", "wstHUB") Ownable(initialOwner) {}

    function deposit(uint256 assets, address receiver) public override returns (uint256 shares) {
        shares = super.deposit(assets, receiver);
        if (balanceOf(receiver) >= WHALE_THRESHOLD) emit WhaleMode(receiver);
        return shares;
    }

    function harvest(uint256 yield) external onlyOwner {
        uint256 fee = (yield * PERFORMANCE_FEE) / 10000;
        uint256 net = yield - fee;
        _mint(address(this), net); // compound
        emit Harvest(yield);
    }
}
