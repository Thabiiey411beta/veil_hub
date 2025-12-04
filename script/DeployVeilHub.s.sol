// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../contracts/core/MockUSDC.sol";
import "../contracts/core/VEILToken.sol";
import "../contracts/core/veVEIL.sol";
import "../contracts/core/ImmortalReserve.sol";
import "../contracts/core/VeilHubVault.sol";
import "../contracts/core/DebtEngine.sol";
import "../contracts/vacuum/LPVacuum.sol";

contract DeployVeilHub is Script {
    function run() external {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(pk);
        console.log("Deploying from:", deployer);

        vm.startBroadcast(pk);

        // 1. Deploy MockUSDC
        MockUSDC usdc = new MockUSDC();
        console.log("MockUSDC:", address(usdc));

        // 2. Deploy VEILToken
        VEILToken veil = new VEILToken(deployer);
        console.log("VEILToken:", address(veil));

        // 3. Deploy veVEIL
        veVEIL veVeil = new veVEIL(address(veil));
        console.log("veVEIL:", address(veVeil));

        // 4. Deploy ImmortalReserve
        ImmortalReserve immortal = new ImmortalReserve(address(usdc), address(veil));
        console.log("ImmortalReserve:", address(immortal));

        // 5. Deploy VeilHubVault
        VeilHubVault vault = new VeilHubVault(IERC20(address(usdc)), deployer);
        console.log("VeilHubVault:", address(vault));

        // 6. Deploy DebtEngine
        DebtEngine debt = new DebtEngine(address(vault));
        console.log("DebtEngine:", address(debt));

        // 7. Deploy LPVacuum
        LPVacuum vacuum = new LPVacuum(address(usdc), deployer, address(immortal));
        console.log("LPVacuum:", address(vacuum));

        console.log("VEIL HUB v14 DEPLOYED ON SUPRAEVM");
        vm.stopBroadcast();
    }
}
