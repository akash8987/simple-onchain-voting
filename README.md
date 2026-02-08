# Simple On-Chain Voting

A streamlined Web3 voting system built with Solidity. This repository provides a robust foundation for decentralized governance, allowing users to create proposals and cast votes directly on the blockchain.

### Features
* **Proposal Creation:** Anyone can initialize a new proposal with a clear description.
* **One-Vote-Per-Address:** Built-in logic to prevent double-voting.
* **Real-time Results:** Transparent tracking of "Yes" and "No" counts on-chain.

### Quick Start
1. Deploy `Voting.sol` to a testnet (Goerli, Sepolia, etc.).
2. Use the `createProposal` function to start a poll.
3. Vote using the `vote` function with the proposal ID.
