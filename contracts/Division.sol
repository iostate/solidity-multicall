// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Division {
    uint256 numerator;
    uint256 denominator;
    uint256 result;

    function divide(uint256 num, uint256 denom)
        public
        pure
        returns (
            uint256 quotient,
            uint256 remainder,
            uint256 decimals
        )
    {
        quotient = num / denom;
        remainder = num - denom * quotient;
        decimals = remainder**2;

        return (quotient, remainder, decimals);
    }

    function setNumerator(uint256 input) public {
        numerator = input;
    }

    function setDenominator(uint256 input2) public {
        denominator = input2;
    }
}

