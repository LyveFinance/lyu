// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "../Interfaces/IPriceFeed.sol";

contract PriceFeedL2Test is IPriceFeed {
	
	mapping(address => uint256) public oracleRecords;


	function fetchPrice(address _token) external view returns (uint256){
		return oracleRecords[_token];
	}

	function setOracle(
		address _token,
		address _oracle,
		ProviderType _type,
		uint256 _timeoutSeconds,
		bool _isEthIndexed,
		bool _isFallback
	) external{

	}
	function setPrice(
		address _token,
		uint256 _price
	) external{
		oracleRecords[_token] =  _price;
	}
}
