// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract veVEIL is ERC721, ReentrancyGuard {
    IERC20 public veilToken;
    uint256 public totalLocked;
    uint256 public nextId = 1;

    struct Lock {
        uint128 amount;
        uint64 end;
        bool isPermanent;
    }

    mapping(uint256 => Lock) public locks;
    mapping(address => uint256) public userBalance;

    constructor(address _veilToken) ERC721("Vote-Escrowed VEIL", "veVEIL") {
        veilToken = IERC20(_veilToken);
    }

    function createLock(uint128 amount, uint64 end, bool permanent) external nonReentrant returns (uint256 tokenId) {
        require(amount > 0, "zero amount");
        tokenId = nextId++;
        locks[tokenId] = Lock(amount, end, permanent);
        userBalance[msg.sender]++;
        totalLocked += amount;
        _safeMint(msg.sender, tokenId);
        veilToken.transferFrom(msg.sender, address(this), amount);
    }

    function votingPower(uint256 tokenId) external view returns (uint256) {
        Lock memory l = locks[tokenId];
        if (block.timestamp >= l.end && !l.isPermanent) return 0;
        return l.isPermanent ? uint256(l.amount) * 10 : uint256(l.amount) * 5;
    }
}
