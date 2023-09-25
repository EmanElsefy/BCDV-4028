// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeCheck {
    // Function to check if a contract has code
    function hasCode(address target) external view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(target)
        }
        return size > 0;
    }

    function codeSize(address target) external view returns (uint) {
        uint size;
        assembly {
            size := extcodesize(target)
        }
        return size;
    }
}
