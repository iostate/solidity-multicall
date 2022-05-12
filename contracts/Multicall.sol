// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract TestMultiCall {
    function first() external view returns (uint256, uint256) {
        return (1, block.timestamp);
    }

    function second() external view returns (uint256, uint256) {
        return (2, block.timestamp);
    }

    function getFirst() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.first.selector);
    }

    function getSecond() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.second.selector);
    }
}

contract MultiCall {
    function multicall(address[] calldata targets, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length != data length");
        bytes[] memory results = new bytes[](data.length);

        for (uint256 i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            );
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }
}
