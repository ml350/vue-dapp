// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// The contract inherits from the ERC721, Ownable, and ReentrancyGuard contracts from the OpenZeppelin library
contract HaHaHyenas is ERC721, Ownable, ReentrancyGuard {
    // Constants for maximum supply and maximum mint per wallet
    uint public constant MAX_SUPPLY = 5555;
    uint public constant MAX_MINT = 2;

    // Constants for each rarity tier
    uint public constant COMMON = 2495;
    uint public constant RARE = 1840;
    uint public constant EPIC = 850;
    uint public constant LEGENDARY = 350;
    uint public constant MYTHIC = 20;

    // Variables to keep track of how many NFTs have been minted for each rarity tier
    uint public commonMinted;
    uint public rareMinted;
    uint public epicMinted;
    uint public legendaryMinted;
    uint public mythicMinted;
    uint public totalMinted;

    // Mapping to keep track of how many NFTs each wallet has minted
    mapping(address => uint) public walletMintCount;

    // Mapping to store the URIs for each token
    mapping(uint => string) private _tokenURIs;

    // State variable to indicate whether the metadata is mutable
    bool public metadataIsMutable = true;

    // State variables for the mint price and the ERC20 token used for payment
    uint public mintPrice;
    IERC20 public paymentToken;

    // Constructor function that sets the name and symbol of the NFT, and initializes the payment token and mint price
    constructor(IERC20 _paymentToken, uint _mintPrice) ERC721("HaHaHyenas", "HH") {
        paymentToken = _paymentToken;
        mintPrice = _mintPrice;
    }

    // Function to mint a new NFT
    // The function accepts a parameter indicating the number of NFTs to mint
    // It checks that the total supply limit and the wallet's mint limit will not be exceeded, and that the contract is approved to spend enough tokens
    // It then transfers the total cost from the user to the contract, and mints the specified number of NFTs
    function mint(uint numTokens) public nonReentrant {
        require(totalMinted + numTokens <= MAX_SUPPLY, "Exceeds max supply");
        require(walletMintCount[msg.sender] + numTokens <= MAX_MINT, "Exceeds wallet mint limit");
        require(paymentToken.allowance(msg.sender, address(this)) >= mintPrice * numTokens, "Contract not approved to spend tokens");
        require(paymentToken.transferFrom(msg.sender, address(this), mintPrice * numTokens), "Payment transfer failed");

        for (uint i = 0; i < numTokens; i++) {
            uint rarity = _getRarity();
            _mint(msg.sender, totalMinted);
            totalMinted++;
            walletMintCount[msg.sender]++;
        }
    }

    // Private function to get the rarity of the NFT to be minted
    // The function generates a random number and determines the rarity based on the random number and the number of tokens already minted in each rarity tier
    function _getRarity() private returns (uint) {
        require(msg.sender != owner(), "Owner cannot mint NFTs");
        uint rand = _randomModulus(100);
        if (rand < 1 && mythicMinted < MYTHIC) {
            mythicMinted++;
            return 5;
        } else if (rand < 7 && legendaryMinted < LEGENDARY) {
            legendaryMinted++;
            return 4;
        } else if (rand < 23 && epicMinted < EPIC) {
            epicMinted++;
            return 3;
        } else if (rand < 56 && rareMinted < RARE) {
            rareMinted++;
            return 2;
        } else if (commonMinted < COMMON) {
            commonMinted++;
            return 1;
        } else {
            return _getRarity();
        }
    }

    // Private function to generate a pseudo-random number
    function _randomModulus(uint modulus) private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % modulus;
    }

    // Function to set the URI for a token
    // The function checks if the metadata is mutable before setting the URI
    function setTokenURI(uint tokenId, string memory uri) public onlyOwner {
        require(metadataIsMutable, "Metadata is immutable");
        _tokenURIs[tokenId] = uri;
    }

    // Function to return the URI for a token
    function tokenURI(uint tokenId) public view override returns (string memory) {
        return _tokenURIs[tokenId];
    }

    // Function to make the metadata immutable
    function makeMetadataImmutable() public onlyOwner {
        metadataIsMutable = false;
    }

    // Function to set the mint price
    // The function can only be called by the owner of the contract
    function setMintPrice(uint _mintPrice) public onlyOwner {
        mintPrice = _mintPrice;
    }

    // Function to withdraw all tokens from the contract
    // The function checks that there are tokens to withdraw and that the transfer is successful
    // The function can only be called by the owner of the contract
    function withdraw() public onlyOwner {
        uint balance = paymentToken.balanceOf(address(this));
        require(balance > 0, "No funds to withdraw");
        require(paymentToken.transfer(owner(), balance), "Withdrawal failed");
    }
}