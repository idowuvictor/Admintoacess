// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdminOnly {
    address public admin;
    uint256 public data;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Access restricted to the admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Example of a function restricted to the admin
    function adminFunction(uint256 newData) public onlyAdmin {
        data = newData;
    }

    // Function to change the admin, only callable by the current admin
    function changeAdmin(address newAdmin) public onlyAdmin {
        require(newAdmin != address(0), "New admin address cannot be zero address");
        admin = newAdmin;
    }

    // Function to demonstrate public access (not restricted)
    function publicFunction() public view returns (uint256) {
        return data;
    }
}
