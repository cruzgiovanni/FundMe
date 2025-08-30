# 🏦 FundMe & 📈 PriceConverter Solidity Suite

## Overview

This repository contains a modular suite for Ethereum-based crowdfunding and real-time price conversion, featuring:

- **FundMe Smart Contract** — A secure, owner-controlled crowdfunding contract that enforces a minimum USD contribution, tracks funders, and allows owner withdrawals.
- **PriceConverter Library** — A reusable Solidity library for converting ETH to USD in smart contracts, using Chainlink decentralized price feeds.

These components are designed to work together or independently, providing a solid foundation for DeFi, fundraising platforms, or any dApp requiring fiat-denominated logic and reliable price data.

---

## Contents

- [`FundMe.sol`](contracts/FundMe.sol) — Crowdfunding contract leveraging Chainlink and `PriceConverter`.
- [`PriceConverter.sol`](contracts/PriceConverter.sol) — ETH/USD conversion library for Solidity contracts.

---

## FundMe Contract

### Features

- **Minimum USD Enforcement:** Only accepts funding above a configurable minimum (default: $50), calculated in real time using Chainlink price feeds.
- **Funder Tracking:** Logs and tracks each funder and their contributed amount.
- **Owner-Only Withdrawal:** Only the contract owner can withdraw funds.
- **Fallback & Receive:** All ETH sent to the contract is routed to `fund()`, ensuring no lost funds.
- **Chainlink Integration:** Uses decentralized price feeds for robust conversion.

### Usage

1. **Deploy**: Owner is set to the deployer.
2. **Fund**: Call `fund()` or send ETH directly; must meet the USD minimum.
3. **Withdraw**: Only owner can withdraw all funds.
4. **Versioning**: Use `getVersion()` to check the Chainlink price feed version.

### Technical Notes

- Utilizes the `PriceConverter` library for conversion.
- Tracks funders in an array and maps contribution amounts.
- Implements custom error handling and gas optimizations.

---

## PriceConverter Library

### Features

- **Fetch ETH/USD Price:** Uses Chainlink AggregatorV3Interface.
- **Convert ETH to USD:** Provides utility functions for conversion with 18 decimal precision.
- **No Deployment Needed:** Functions are internal, attachable to `uint256` types in any contract.

### Usage

```solidity
import "./PriceConverter.sol";

contract Example {
    using PriceConverter for uint256;

    function getUsdValue(uint256 ethAmount) public view returns (uint256) {
        return ethAmount.getConversionRate();
    }
}
```

### Chainlink Configuration

- **Network:** Sepolia Testnet
- **ETH/USD Feed:** `0x694AA1769357215DE4FAC081bf1f309aDC325306`

---

## Security & Best Practices

- Always use up-to-date Chainlink feed addresses for your network.
- Handle decimals carefully for financial logic.
- The `FundMe` contract restricts withdrawals to the owner and resets funder balances on withdrawal.
- Consider adding events, enums, and fallback logic for more robustness.

---

## License

MIT

---

## References

- [Solidity Documentation](https://docs.soliditylang.org/)
- [Chainlink Price Feeds](https://docs.chain.link/data-feeds/price-feeds)
- [FundMe FCC Example](https://github.com/PatrickAlphaC/fund-me-fcc)

---

*Questions or suggestions? Open an issue or submit a pull request!*