// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractB {
    uint256 public value;

    function setValue(uint256 _value) external {
        value = _value;
    }
}

contract ContractA {
    address public contractBAddress;
    uint256 public valueFromContractB;

    constructor(address _contractBAddress) {
        contractBAddress = _contractBAddress;
    }

    function delegateCallToContractB(uint256 _newValue) external {
        // Perform a delegate call to ContractB's setValue function
        (bool success, ) = contractBAddress.delegatecall(
            abi.encodeWithSignature("setValue(uint256)", _newValue)
        );

        require(success, "Delegate call to ContractB failed");
    }

    function getValueFromContractB() external view returns (uint256) {
        // Read the value from ContractB
        (bool success, bytes memory result) = contractBAddress.staticcall(
            abi.encodeWithSignature("value()")
        );

        require(success, "Static call to ContractB failed");

        // Parse the result as a uint256
        return abi.decode(result, (uint256));
    }
}
