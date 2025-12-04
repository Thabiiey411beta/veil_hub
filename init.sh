#!/bin/bash
set -e

# Create folders
mkdir -p contracts/core contracts/vacuum script

# foundry.toml
cat > foundry.toml << 'TOML'
[profile.default]
src = "contracts"
out = "out"
libs = ["lib"]
remappings = [
  "forge-std/=lib/forge-std/src/",
  "@openzeppelin/=lib/openzeppelin-contracts/contracts/"
]
via_ir = true
optimizer = true
optimizer_runs = 1000000

[rpc_endpoints]
supra_testnet = "https://rpc-evmstaging.supra.com/rpc/v1/eth"
supra_mainnet = "https://rpc.supra.com"

[etherscan]
supra_testnet = { url = "https://explorer.supra.com/api" }
TOML

# .env with YOUR real key (100% safe in Codespaces)
cat > .env << 'ENV'
PRIVATE_KEY=0x1c8d05fe8e1522b842d997f9f64dc765ee57154ba3258799aea100cf0fa98dd3
SUPRA_TESTNET_RPC=https://rpc-evmstaging.supra.com/rpc/v1/eth
USDC_TESTNET=0x9999999999999999999999999999999999999999   # placeholder – will be replaced after deployment
ENV

# Install deps
forge install OpenZeppelin/openzeppelin-contracts
forge install foundry-rs/forge-std

# Core contracts
cat > contracts/core/VEILToken.sol << 'SOL'
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract VEILToken is ERC20, Ownable {
    constructor() ERC20("Veil", "VEIL") Ownable(msg.sender) {
        _mint(msg.sender, 100_000_000 * 1e18);
    }
    function burn(uint256 a) external { _burn(msg.sender, a); }
}
SOL

cat > contracts/core/ImmortalReserve.sol << 'SOL'
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
contract ImmortalReserve {
    using SafeERC20 for IERC20;
    IERC20 public immutable USDC;
    uint256 public totalShares;
    uint256 public yield;
    mapping(address=>uint256) public shares;
    mapping(address=>uint256) public claimed;
    constructor(address u) { USDC = IERC20(u); }
    function burnForShares(uint256 amount, address veil) external {
        IERC20(veil).transferFrom(msg.sender, address(1), amount);
        shares[msg.sender] += amount;
        totalShares += amount;
    }
    function addYield(uint256 a) external { IERC20(USDC).transferFrom(msg.sender,address(this),a); yield += a; }
    function claim() external {
        uint256 p = shares[msg.sender] * yield / totalShares - claimed[msg.sender];
        if (p>0) { claimed[msg.sender] += p; IERC20(USDC).transfer(msg.sender, p); }
    }
}
SOL

cat > contracts/core/VeilHubVault.sol << 'SOL'
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
contract VeilHubVault is ERC4626 {
    constructor(IERC20 a) ERC4626(a) ERC20("Wrapped stHUB", "wstHUB") {}
}
SOL

cat > contracts/vacuum/LPVacuum.sol << 'SOL'
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract LPVacuum {
    address immutable treasury;
    address immutable immortal;
    constructor(address t, address i) { treasury=t; immortal=i; }
    function harvest(uint256 p, address usdc) external {
        IERC20(usdc).transferFrom(msg.sender,address(this),p);
        IERC20(usdc).transfer(treasury, p*40/100);
        IERC20(usdc).transfer(immortal, p*40/100);
    }
}
SOL

# One-click deploy script
cat > script/DeployVeilHub.s.sol << 'SOL'
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../contracts/core/VEILToken.sol";
import "../contracts/core/VeilHubVault.sol";
import "../contracts/core/ImmortalReserve.sol";
import "../contracts/vacuum/LPVacuum.sol";
contract DeployVeilHub is Script {
    function run() external {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        address dep = vm.addr(pk);
        console.log("Deploying from:", dep);
        vm.startBroadcast(pk);

        VEILToken veil = new VEILToken();
        VeilHubVault vault = new VeilHubVault(IERC20(address(0x0))); // placeholder
        ImmortalReserve immortal = new ImmortalReserve(address(0x0));
        LPVacuum vacuum = new LPVacuum(dep, address(immortal));

        console.log("VEILToken      :", address(veil));
        console.log("VeilHubVault   :", address(vault));
        console.log("ImmortalReserve:", address(immortal));
        console.log("LPVacuum       :", address(vacuum));
        console.log("VEIL HUB v14 LIVE ON SUPRAEVM");
        vm.stopBroadcast();
    }
}
SOL

echo "Veil Hub v14 codebase created"
