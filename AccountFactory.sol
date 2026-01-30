// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SimpleAccount.sol";
import "@openzeppelin/contracts/utils/Create2.sol";

contract AccountFactory {
    IEntryPoint public immutable entryPoint;

    constructor(IEntryPoint _entryPoint) {
        entryPoint = _entryPoint;
    }

    function createAccount(address owner, uint256 salt) external returns (SimpleAccount) {
        address addr = Create2.computeAddress(
            bytes32(salt),
            keccak256(abi.encodePacked(type(SimpleAccount).creationCode, abi.encode(entryPoint, owner)))
        );

        if (addr.code.length > 0) return SimpleAccount(payable(addr));

        return new SimpleAccount{salt: bytes32(salt)}(entryPoint, owner);
    }
}
