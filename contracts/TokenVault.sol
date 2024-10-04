// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenVault {
    address public owner;
    IERC20 public token;
    mapping(address => uint256) public balances;

    constructor(address _token) {
        owner = msg.sender;
        token = IERC20(_token);
    }

    // Deposit tokens into the vault
    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "Deposit failed");
        balances[msg.sender] += amount;
    }

    // Withdraw tokens from the vault
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Withdraw failed");
    }

    // Get the vault's balance of tokens
    function getVaultBalance() external view returns (uint256) {
        return token.balanceOf(address(this));
    }
}
