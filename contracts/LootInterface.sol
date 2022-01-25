pragma solidity ^0.8.0;

interface LootInterface {
    function ownerOf(uint256 tokenId) external view returns (address owner);
}