pragma solidity ^0.4.24;

import "./../eip721/EIP721.sol";


contract Artifaqt is EIP721 {
    address public owner;

    bytes32[] private sins;

    // Mapping from token ID to token type
    mapping(uint256 => uint256) internal typeOfToken;

    constructor() public {
        // Limbo
        sins.push(keccak256("Those who were never baptised.")); 
        // Lust
        sins.push(keccak256("Those who gave into pleasure.")); 
        // Gluttony
        sins.push(keccak256("Those who indulged in excess.")); 
        // Avarice
        sins.push(keccak256("Those who hoard and spend wastefully.")); 
        // Wrath
        sins.push(keccak256("Those consumed by anger and hatred.")); 
        // Heresy
        sins.push(keccak256("Those who worshipped false idols.")); 
        // Violence
        sins.push(keccak256("Those violent against others, one’s self, and God.")); 
        // Fraud
        sins.push(keccak256("Those who used lies and deception for personal gain.")); 
        // Treachery
        sins.push(keccak256("Those who have betrayed their loved ones.")); 

        // Set owner
        owner = msg.sender;

        // Default name and symbol
        name = "Artifaqt";
        symbol = "ATQ";
    }

    function claimToken(
        bytes32 _sin,
        uint256 _sinIndex) public
    {
        bytes32 sinHash = sins[_sinIndex];

        // Make sure it's the correct sin
        require(_sin == keccak256(abi.encodePacked(sinHash, msg.sender)));

        uint256 tokenId = totalSupply();
        addToken(msg.sender, tokenId);

        // Save token type
        typeOfToken[tokenId] = _sinIndex;

        emit TokenClaimed(tokenId, _sinIndex, msg.sender);
    }

    function getToken(
        uint256 _tokenId
    ) public view returns (uint256, address, uint256) {
        return (
            allTokensIndex[_tokenId],
            ownerOfToken[_tokenId],
            typeOfToken[_tokenId]
        );
    }

    event TokenClaimed(uint256 tokenId, uint256 sinType, address player);
}