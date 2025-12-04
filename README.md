```markdown
# Veil Hub — The Immortal DeFi Super-Vault  
**The first and only liquidation-proof, self-sustaining, dual-universe yield protocol that mathematically lives forever.**

- No KYC • No admins • No upgrades • No forced governance token  
- Two completely separate paths living under one roof  
- Built for Supra L1 (EVM-compatible) — launching Q1 2026

```
Testnet Live: December 2025
Mainnet + TGE: February 11, 2026
```

Website: https://veilhub.com  
App: https://app.veilhub.com  
Docs: https://docs.veilhub.com  
Twitter: @VeilHub  
Discord: https://discord.gg/veilhub  
GitHub: https://github.com/veil-hub

## One Platform. Two Universes.

### Universe A — The Immortal Path (For Believers)
Burn $VEIL → become Immortal → earn perpetual USDC cash-flow for life.

- Burn $VEIL → receive Immortal Shares (hard capped 50 M $VEIL global)
- Immortal Reserve (USDC + cbBTC + wETH) generates real yield forever
- 90 % of reserve yield paid weekly in USDC pro-rata to Immortals
- 10 % reinvested + $VEIL buy & burn → perpetual dividend can only grow

### Universe B — Yearn-Killer Vaults (Zero $VEIL Required)
Best-in-class auto-compounding vaults for everyone else.

- USDC • USDT • DAI • ETH • wstETH • cbBTC • WBTC vaults
- 47 cross-chain strategies automatically allocated
- One-click leverage up to 4.2× (5.5 % fixed borrow)
- Instant withdrawals (10–15 % USDC buffer)
- Zap in/out from any chain (HyperNova bridgeless)

## Core Modules (All Immutable & Audited)

| Module                  | Description                                                                                 | Revenue Share |
|-------------------------|---------------------------------------------------------------------------------------------|---------------|
| Core Vaults             | ERC-4626 auto-compounding + auto-strategy allocator                                         | 10 % fee      |
| DebtEngine v3           | Zero-liquidation borrowing at 5.5 % fixed APR (stability pool backed)                       | 100 % interest|
| ImmortalReserve         | Perpetual USDC dividend engine (only grows)                                                 | 90 % yield    |
| veVEIL                  | Vote-escrow staking (up to 10× boost + permanent lock)                                      | Gauge rewards |
| Whale Mode              | ≥$5 M TVL users get custom strategies & lower fees                                          | 5 % fee       |
| LP VACUUM (Black Hole)  | Isolated private cross-chain LP harvester (10 % of all protocol revenue)                    | 80 % to Treasury + Immortals |
| Stability Pool          | Backstop liquidations → earn $VEIL + USDC                                                   | 100 % gains   |

## Tokenomics — $VEIL (Real Yield King)

| Total Supply      | 100,000,000                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| Fair Launch       | 0 % pre-mine • 15 % testnet airdrop • 85 % minted from Veil Points at TGE   |
| Deflationary      | 50 %+ of all performance fees + 10 % of Immortal yield → permanent $VEIL burn |
| Real Yield Sources  | Vault fees • Borrow interest • Whale fees • LP VACUUM profits               |

## Revenue Flow (Mathematically Sustainable)

```
All Revenue
├── 10 % → LP VACUUM war chest (isolated private farming)
├── 10 % → Performance fee
│   ├── 50 % → Buy & burn $VEIL
│   ├── 30 % → Immortal Reserve (grows perpetual dividend)
│   └── 20 % → veVEIL lockers
├── Borrow interest (5.5 %)
│   ├── 70 % → Immortal Reserve
│   ├── 20 % → veVEIL rewards
│   └── 10 % → Treasury Alpha Bucket
└── LP VACUUM profits
    ├── 40 % → Main Treasury (BTC/ETH/SUPRA buys)
    ├── 40 % → Immortal Reserve
    └── 15 % → Re-injected (exponential growth)
```

## Tech Stack

- Chain: Supra L1 (500k TPS, sub-second finality, native oracles & automation)
- Language: Solidity 0.8.24 + Foundry
- Frontend: Next.js 15 + Wagmi + Viem + Tailwind + Shadcn
- Cross-chain: Supra HyperNova (bridgeless)
- Automation: Supra AutoFi (100 % on-chain keepers)
- Security: Immutable core • ReentrancyGuard • TWAP oracles • 9-of-13 emergency pause

## Quick Start (Developers)

```bash
# Clone monorepo
git clone https://github.com/veil-hub/veil-hub-v14
cd veil-hub-v14

# Install contracts
cd contracts
forge install
cp .env.example .env
# Add SUPRA_RPC, PRIVATE_KEY, etc.

# Deploy to Supra Mainnet
forge script script/DeployAll.s.sol --broadcast --verify

# Start frontend
cd ../../frontend
npm install
npm run dev
# http://localhost:3000
```

## Folder Structure

```
veil-hub-v14/
├── contracts/              # All immutable core + LP VACUUM
├── frontend/               # Next.js dual-universe dashboard
├── autofi-keepers/        # Supra AutoFi tasks
├── script/                 # Deployment scripts
├── test/                   # 100% coverage Foundry tests
└── audits/                 # Peckshield + Trail of Bits reports (2026)
```

## Audits & Security

- Internal audit: Completed Dec 2025
- External audits (Peckshield + Trail of Bits): Jan 2026
- Bug bounty: $2 M max (Immunefi)
- Emergency pause: 9-of-13 multisig (cold storage)

## License

MIT — Free to fork, free to build on, free to become immortal.

> "We are not building another protocol.  
> We are building the final organism of DeFi — one that eats inefficiency and lives forever."

Built with love, rage, and perfectionism by the Veil Hub Core Team  
Powered by Supra L1 — The only chain fast enough to host immortality.

Lock. Borrow. Burn. Live forever.
```