// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./PriceConverter.sol";

contract FundMe {
  using PriceConverter for uint256;

  uint256 public minimunUsd = 50 * 1e18;

  address[] public funders;
  mapping(address => uint256) public addressToAmountFunded;

  function fund() public payable {
    require(msg.value.getConversionRate() >= minimunUsd, "Didn't send enough!");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
  }

  // function withdraw() public {}
}
