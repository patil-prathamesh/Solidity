// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Arrays {
    uint[] public nums;
    string[] public names;
    // length,push(),pop()
    // dynamic array - uint[] public nums;
    // fixed size array - uint[5] public nums;
    
    function addValue(uint value) public returns (uint256) {
        nums.push(value);
        return nums.length;
    }
}