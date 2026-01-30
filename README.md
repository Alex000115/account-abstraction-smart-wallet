# Account Abstraction Smart Wallet (ERC-4337)

This repository provides a high-performance, production-ready Smart Contract Wallet (SCW) architecture. By decoupling the signer from the account, this wallet allows for a superior user experience (UX) where users can pay gas in stablecoins or enjoy sponsored transactions.

## Features
- **ERC-4337 Compatibility**: Works seamlessly with EntryPoint contracts and Bundlers.
- **Paymaster Integration**: Logic to allow third parties to sponsor gas fees.
- **Signature Validation**: Modular validation logic (supports ECDSA, Passkeys, or Multisig).
- **Atomic Bundling**: Execute multiple calls (e.g., Approve + Swap) in a single UserOperation.

## Core Components
1. **SimpleAccount.sol**: The core wallet contract that holds assets.
2. **AccountFactory.sol**: A gas-efficient factory to deploy wallets using `CREATE2` for predictable addresses.
3. **UserOperation.js**: Utilities to craft and sign ERC-4337 operations.



## Setup
1. `npm install`
2. Update the `ENTRY_POINT` address in `SimpleAccount.sol` for your specific network.
3. Deploy the Factory to start onboarding users.
