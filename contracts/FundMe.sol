// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FundMe {
    uint256 public minimunUsd = 50;

    function fund() public payable {
        require(msg.value >= minimunUsd, "Didn't send enough!");
    }

    // function withdraw() public {}
}
