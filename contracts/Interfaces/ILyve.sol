// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ILyve is IERC20 {
    error NotMinter();
    error NotOwner();
    
    function mint(address, uint256) external returns (bool);

    function minter() external returns (address);

    function burn(address _account, uint256 _amount) external;
}
