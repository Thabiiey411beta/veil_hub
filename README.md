# 🏛️ VEIL HUB v10 — THE IMMORTAL PROTOCOL

> The first liquidation-proof, omnichain yield super-vault with burn-to-earn immortality.
> 
> **Testnet Launch:** December 15, 2025  
> **Mainnet + TGE:** February 11, 2026  
> **Chain:** Supra L1

---

## 📖 TABLE OF CONTENTS

1. [Overview](#overview)
2. [Core Features](#core-features)
3. [Tokenomics](#tokenomics)
4. [Architecture](#architecture)
5. [Smart Contracts](#smart-contracts)
6. [Deployment](#deployment)
7. [Frontend Setup](#frontend-setup)
8. [AutoFi Keepers](#autofi-keepers)
9. [Security](#security)
10. [Roadmap](#roadmap)

---

## 🌟 OVERVIEW

**Veil Hub** is the final evolution of DeFi — a self-sustaining, liquidation-proof yield vault where:

- **Users deposit USDC** → get auto-compounding wstHUB shares
- **Burn $VEIL** → become Immortal → earn 10% of treasury revenue forever (USDC)
- **Borrow against positions** at 2% fixed APR with **zero liquidation risk**
- **50% of ALL revenue** is permanently burned (deflationary)
- **Treasury auto-buys BTC/ETH/SUPRA** every week (70/20/10 split)

### The Closed Loop

```
1. You burn $VEIL
       ↓
2. 100% value → Treasury
       ↓
3. Treasury buys BTC/ETH/SUPRA
       ↓
4. Treasury grows → more revenue
       ↓
5. 10% revenue → USDC to you (forever)
       ↓
6. 50% revenue → Burn $VEIL (forever)
       ↓
7. Repeat infinitely
```

This is the first **perpetual motion DeFi machine**.

---

## 🚀 CORE FEATURES

### 1. **wstHUB (Auto-Compounding Shares)**
- ERC-4626 liquid staking token
- 40% of yield auto-compounds
- Cross-chain strategies across 5 chains (ETH, ARB, BASE, BSC, SOL)
- 47 yield strategies (Aave, Convex, GMX, Pendle, etc.)

### 2. **ImmortalVault (Burn to Earn Forever)**
- Burn $VEIL → Become Immortal
- **HARD CAPS:**
  - Global: 50M $VEIL max
  - Per wallet: 5M $VEIL max (no whale domination)
- Earn 10% of treasury revenue in USDC every week (pro-rata)
- First 500 immortals get Founding Immortal NFT

### 3. **DebtEngine (Zero Liquidation Borrowing)**
- Borrow against veVEIL/Immortal positions
- 2% fixed APR (paid in USDC)
- 70% max LTV
- 15% of weekly PNL auto-repays debt
- **Zero liquidation** (treasury-backed)

### 4. **LP Vacuum (Private Cross-Chain Farming)**
- Harvest top 100 LPs across 5 chains via HyperNova
- Private + encrypted calls (no front-running)
- Daily AutoFi harvests

### 5. **Treasury (Crypto Fed)**
- 5% of revenue → auto-buy BTC/ETH every week
- Target: Own 5-10% of $SUPRA supply + 0.5-1% of BTC
- Revenue split: 50% burn, 10% immortals, 40% compound

### 6. **Point System (Veil Points)**
- Track on-chain activity before TGE
- VP → $VEIL at launch (Feb 11, 2026)
- Multipliers for locking, immortals, referrals

### 7. **Diamond Hands Tiers**
- Monthly passive income (3-12%/month)
- Based on lock duration + immortal status

---

## 💎 TOKENOMICS

### $VEIL Token
- **Total Supply:** 100,000,000 (100M)
- **Fair Launch:** 0 pre-mine (except 15% testnet airdrop)
- **Distribution:**
  - 15M (15%): Testnet airdrop (controlled by governance)
  - 85M (85%): TGE mint from Veil Points (VP)

### Revenue Split (Immutable)
- **50%** → Burn $VEIL permanently
- **10%** → Immortal USDC distribution
- **40%** → Compound back into vault

### Burn Mechanics
- 50% of ALL revenue burned forever
- 100% of burned $VEIL value → treasury → BTC/ETH/SUPRA
- Deflationary by design (supply decreases over time)

### veVEIL (Vote-Escrowed VEIL)
- Lock $VEIL → get veVEIL (voting power + yield boost)
- **4-year lock:** 5× boost
- **Permanent lock:** 10× boost + Immortal Badge NFT

---

## 🏗️ ARCHITECTURE

```
┌─────────────────────────────────────────────────────────────┐
│                        USER LAYER                           │
│  Deposit USDC → wstHUB | Burn VEIL → Immortal | Borrow     │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                      VEIL HUB (ERC-4626)                    │
│  - Deposits/withdrawals   - Strategy management             │
│  - Emergency pause        - MEV shield                      │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                   47 YIELD STRATEGIES                       │
│  ETH: Aave, Convex, Lido, Pendle, Morpho                   │
│  ARB: GMX, Camelot, Radiant                                 │
│  BASE: Aerodrome, Morpho                                    │
│  BSC: PancakeSwap, Venus                                    │
│  SOL: Jupiter, Marinade (via HyperNova)                     │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  TREASURY (Revenue Management)              │
│  Harvest → 50% burn | 10% immortals | 40% compound         │
│  Weekly: Auto-buy BTC/ETH/SUPRA (70/20/10)                 │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    IMMORTAL VAULT                           │
│  Distribute 10% revenue to immortals (pro-rata USDC)       │
│  Claim weekly | Track burned VEIL | Issue NFTs             │
└─────────────────────────────────────────────────────────────┘
```

---

## 📜 SMART CONTRACTS

### Core Contracts

| Contract | Description | Lines | Testnet Address |
|----------|-------------|-------|-----------------|
| **VEILToken.sol** | ERC-20 governance token (100M supply) | 150 | `0x...` |
| **veVEIL.sol** | Vote-escrowed staking (4yr=5x, perm=10x) | 200 | `0x...` |
| **wstHUB.sol** | Auto-compounding ERC-4626 wrapper | 180 | `0x...` |
| **VeilHub.sol** | Main vault with strategy management | 500 | `0x...` |
| **ImmortalVault.sol** | Burn-to-earn (50M cap, 5M/wallet) | 300 | `0x...` |
| **DebtEngine.sol** | Zero-liquidation lending at 2% APR | 400 | `0x...` |
| **Treasury.sol** | Revenue management + BTC/ETH buying | 350 | `0x...` |
| **PointTracker.sol** | VP tracking for TGE | 250 | `0x...` |

### Strategy Contracts (47 total)

| Chain | Strategy | Protocol | APY Range |
|-------|----------|----------|-----------|
| ETH | AaveV3Strategy | Aave V3 USDC | 3-8% |
| ETH | ConvexStrategy | Convex crvUSD | 5-12% |
| ETH | LidoStrategy | Lido stETH | 3-5% |
| ETH | PendleStrategy | Pendle PT-eETH | 8-15% |
| ARB | GMXv2Strategy | GMX V2 GLP | 10-20% |
| ARB | CamelotStrategy | Camelot USDC/USDC.e | 6-12% |
| BASE | AerodromeStrategy | Aerodrome USDC/USDbC | 8-15% |
| BSC | PancakeStrategy | PancakeSwap USDC/BUSD | 4-10% |
| SOL | JupiterStrategy | Jupiter USDC (via HyperNova) | 5-12% |

### Governance & Security

| Contract | Purpose |
|----------|---------|
| **VeilGovernor.sol** | On-chain voting (veVEIL = voting power) |
| **Timelock.sol** | 90-day delay for critical changes |
| **EmergencyPause.sol** | 9-of-13 guardians can pause |
| **MEVShield.sol** | 2-block deposit delay to prevent sandwiches |

---

## 🚀 DEPLOYMENT

### Prerequisites

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Clone repo
git clone https://github.com/veil-hub/veil-hub-v10
cd veil-hub-v10/contracts

# Install dependencies
forge install OpenZeppelin/openzeppelin-contracts
forge install foundry-rs/forge-std

# Copy environment
cp .env.example .env
# Edit .env with your keys
```

### Environment Setup

```bash
# .env
SUPRA_TESTNET_RPC=https://rpc-testnet.supra.com
SUPRA_MAINNET_RPC=https://rpc.supra.com
DEPLOYER_PRIVATE_KEY=0x...
USDC_ADDRESS=0x... # Testnet mock or mainnet real
SUPRA_ORACLE=0x... # DORA oracle
SUPRA_AUTOFI=0x... # AutoFi registry
ETHERSCAN_API_KEY=... # For verification
```

### Deploy to Supra Testnet

```bash
# One-click deployment
forge script script/DeployAll.s.sol:DeployAll \
  --rpc-url $SUPRA_TESTNET_RPC \
  --private-key $DEPLOYER_PRIVATE_KEY \
  --broadcast \
  --verify

# Output saved to: deployment.json
```

### Deploy to Mainnet (Feb 11, 2026)

```bash
forge script script/DeployAll.s.sol:DeployAll \
  --rpc-url $SUPRA_MAINNET_RPC \
  --private-key $DEPLOYER_PRIVATE_KEY \
  --broadcast \
  --verify \
  --slow # Use slower gas for safety
```

### Add Strategies

```bash
# After deployment, add yield strategies
cast send $VEIL_HUB_ADDRESS \
  "addStrategy(address,uint256,string,uint8)" \
  $AAVE_STRATEGY 1000 "Aave USDC" 1 \
  --private-key $DEPLOYER_PRIVATE_KEY
```

---

## 🖥️ FRONTEND SETUP

### Tech Stack
- **Framework:** Next.js 15 + React 19
- **Styling:** Tailwind CSS + Shadcn UI
- **Web3:** Wagmi + Viem (Supra support)
- **Wallet:** StarKey integration
- **Charts:** Recharts + TradingView
- **Backend:** Node.js + Express + PostgreSQL

### Installation

```bash
cd frontend
npm install

# Copy env
cp .env.example .env.local
# Add contract addresses from deployment.json

# Run dev server
npm run dev
# Open http://localhost:3000
```

### Key Pages

| Route | Description |
|-------|-------------|
| `/` | Landing page + stats |
| `/dashboard` | Main dashboard (TVL, APY, portfolio) |
| `/dashboard/immortal` | Burn $VEIL to become immortal |
| `/dashboard/debt` | Borrow against positions |
| `/dashboard/points` | VP leaderboard + referrals |
| `/dashboard/treasury` | Live treasury stats (BTC/ETH holdings) |
| `/testnet` | Testnet-only features (alpha invites) |

### Environment Variables

```bash
# .env.local
NEXT_PUBLIC_VEIL_HUB_ADDRESS=0x...
NEXT_PUBLIC_IMMORTAL_VAULT_ADDRESS=0x...
NEXT_PUBLIC_DEBT_ENGINE_ADDRESS=0x...
NEXT_PUBLIC_SUPRA_RPC=https://rpc-testnet.supra.com
NEXT_PUBLIC_STARKEY_PROJECT_ID=...

# Backend
DATABASE_URL=postgresql://...
REDIS_URL=redis://...
SUPRA_API_KEY=...
```

---

## 🤖 AUTOFI KEEPERS

Veil Hub runs 100% on-chain via Supra AutoFi (no off-chain keepers).

### Keeper Scripts

| Script | Frequency | Purpose |
|--------|-----------|---------|
| **harvest-keeper.ts** | Daily 12pm UTC | Harvest yield from all strategies |
| **vacuum-keeper.ts** | Daily 6am UTC | Pull LP rewards cross-chain |
| **treasury-keeper.ts** | Weekly Mon 12am UTC | Buy BTC/ETH/SUPRA |
| **debt-repay-keeper.ts** | Weekly Fri 12am UTC | Auto-repay debts from PNL |
| **burn-keeper.ts** | Daily 12am UTC | Burn 50% of revenue |

### Register AutoFi Tasks

```bash
# After deployment
cd autofi-keepers
npm install

# Register tasks
npm run register-tasks
```

---

## 🔒 SECURITY

### Audits
- **Pre-Testnet:** Internal review (Dec 10, 2025)
- **Pre-Mainnet:** External audit by [TBD] (Jan 2026)

### Security Features
1. **ReentrancyGuard** on all state-changing functions
2. **TWAP Oracles** (5-minute manipulation resistance)
3. **MEV Shield** (2-block deposit delay)
4. **Emergency Pause** (9-of-13 guardians)
5. **Try/Catch** on all external calls
6. **Immutable Core** (no upgradeable proxies)
7. **Timelock** (90-day delay on critical changes)

### Emergency Contacts
- **Bug Bounty:** security@veilhub.com ($1M max)
- **Emergency Pause:** 9 of 13 guardians
- **Governance:** veVEIL holders (95% vote + 90-day delay)

---

## 🗓️ ROADMAP

### Phase 1: Testnet (Dec 15, 2025 - Feb 10, 2026)
- [x] Deploy all contracts to Supra Testnet
- [ ] Launch frontend dashboard
- [ ] Open 500 alpha invites
- [ ] Distribute 15M VEIL testnet airdrop
- [ ] Test all strategies + cross-chain
- [ ] Run 3 mock harvests
- [ ] Issue Founding Immortal NFTs

### Phase 2: Mainnet Launch (Feb 11, 2026)
- [ ] Deploy to Supra Mainnet
- [ ] TGE: Convert VP → $VEIL (85M supply)
- [ ] Open ImmortalVault (50M cap)
- [ ] Enable borrowing (DebtEngine)
- [ ] Start daily harvests
- [ ] First treasury BTC/ETH buy

### Phase 3: Expansion (Q1-Q2 2026)
- [ ] Add 20 more strategies
- [ ] Launch on 3 more chains (Polygon, Optimism, Avalanche)
- [ ] Integrate RWAs (Ondo, BlackRock BUIDL)
- [ ] Treasury owns 1% of BTC supply
- [ ] $1B+ TVL

### Phase 4: Post-DeFi (2026+)
- [ ] Treasury becomes crypto Fed
- [ ] $10B+ TVL
- [ ] Own 5-10% of $SUPRA supply
- [ ] First protocol to pay immortals $1M+/year
- [ ] DAO launches own L2

---

## 📞 CONTACT

- **Website:** https://veilhub.com
- **App:** https://app.veilhub.com
- **Twitter:** [@VeilHub](https://twitter.com/VeilHub)
- **Discord:** https://discord.gg/veilhub
- **Docs:** https://docs.veilhub.com
- **GitHub:** https://github.com/veil-hub

---

## 📄 LICENSE

MIT License - See [LICENSE](./LICENSE)

---

**Built by:** @Newton_crypt  
**Powered by:** Supra L1 (DORA + AutoFi + HyperNova)  
**Status:** Testnet Live — Mainnet Feb 11, 2026

> "We're not building a protocol. We're building a civilization."

---

## 🎯 QUICK START

```bash
# 1. Clone
git clone https://github.com/veil-hub/veil-hub-v10
cd veil-hub-v10

# 2. Deploy contracts
cd contracts
forge script script/DeployAll.s.sol --broadcast

# 3. Launch frontend
cd ../frontend
npm install && npm run dev

# 4. Start keepers
cd ../autofi-keepers
npm run register-tasks

# 5. Become Immortal
# Open http://localhost:3000/dashboard/immortal
# Burn $VEIL → Earn USDC forever
```

**The Black Hole is now live. Lock. Borrow. Live forever.**