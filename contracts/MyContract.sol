pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./LootInterface.sol";

contract MyCollectible is ERC721, Ownable {
    constructor() ERC721("MyCollectible", "MCO") {}

    bool public saleIsActive = true;

    //Loot Contract
    address public lootAddress = 0xFF9C1b15B16263C61d017ee9F65C50e4AE0113D7;
    LootInterface lootContract = LootInterface(lootAddress);

    function flipSaleState() public onlyOwner {
        saleIsActive = !saleIsActive;
    }

    //Private sale minting (reserved for Loot owners)
    function mintWithLoot(uint256 lootId) public payable {
        require(saleIsActive, "Sale must be active to mint");
        require(
            lootContract.ownerOf(lootId) == msg.sender,
            "Not the owner of this loot"
        );
        require(!_exists(lootId), "This token has already been minted");
        string memory Weapon = lootContract.getWeapon(lootId);
        string memory Chest = lootContract.getChest(lootId);
        string memory Head = lootContract.getHead(lootId);
        string memory Waist = lootContract.getWaist(lootId);
        string memory Foot = lootContract.getFoot(lootId);
        string memory Hand = lootContract.getHand(lootId);
        string memory Neck = lootContract.getNeck(lootId);
        string memory Ring = lootContract.getRing(lootId);

        _safeMint(msg.sender, lootId);
    }
}
