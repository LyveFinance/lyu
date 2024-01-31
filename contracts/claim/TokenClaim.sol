// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenClaim is Ownable {
    IERC20 public token;
    mapping(address => uint256) public whitelist;

    constructor(IERC20 _token) {
        token = _token;
    }

    function setWhitelist(address[] memory accounts, uint256[] memory amounts) external onlyOwner {
        require(accounts.length == amounts.length, "Arrays must have the same length");
        for (uint256 i = 0; i < accounts.length; i++) {
            whitelist[accounts[i]] = amounts[i];
        }
    }

    function claim() external {
        uint256 amount = whitelist[msg.sender];
        require(amount > 0, "No tokens to claim");
        whitelist[msg.sender] = 0;
        require(token.transfer(msg.sender, amount), "Token transfer failed");
    }
    
    function withdrawTokens( uint256 amount) external onlyOwner {
        require(amount <= token.balanceOf(address(this)), "Insufficient balance");
        require(token.transfer(msg.sender, amount), "Token transfer failed");
    }
}
