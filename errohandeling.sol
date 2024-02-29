// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {

    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    // require
    function setOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the current owner can change the owner");
        owner = _newOwner;
    }

    // revert
    error InsuffBal(uint balance, uint withdrawAmount);

    function withdraw(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsuffBal({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
    // assert
    uint256 public total;

    function addValue(uint256 _value) public {
        total += _value;
        assert(total > 0 && total <= 100);
    }
}
