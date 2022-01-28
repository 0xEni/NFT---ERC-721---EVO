// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract EvoNFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("EvoNFT", "Evo9") {
        console.log("This is my Evo NFT contract!");
    }

    event NewEvoNFTMinted(address sender, uint256 tokenId);

    function mintEvoNFT() public {
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://gateway.pinata.cloud/ipfs/QmRw5zFV5ctmX5HQa6AgmsiiRCHrJo1MypFSbpsm3ZEfcQ");

        _tokenIds.increment();

        emit NewEvoNFTMinted(msg.sender, newItemId);
    }
}