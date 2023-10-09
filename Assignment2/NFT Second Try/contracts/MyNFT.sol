// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
//  import "./node_modules/@openzeppelin/contracts/utils/Counters.sol";
//import "./node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";        


contract FiredGuys is ERC721, ERC721URIStorage, Ownable {

    mapping(string => uint8) existingURIs;

    //using Counters for Counters.Counter;
    //Counters.Counter private _tokenIdCounter;

    uint256 private _tokenIdCounter;
    
    constructor() ERC721("FiredGuys", "MTK") {}
    
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }
    
    function safeMint(address to, string memory uri) public onlyOwner {
        //uint256 tokenId = _tokenIdCounter.current();
        uint256 tokenId = _tokenIdCounter;
        //_tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        _tokenIdCounter += 1;
    }
     
    // The following functions are overrides required by Solidity.
    
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }
    
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function isContentOwned(string memory uri) public view returns (bool) {
        return existingURIs[uri] == 1;
    }

    function payToMint(
        address recipient,
        string memory metadataURI
    ) public payable returns (uint256) {
        require(existingURIs[metadataURI] != 1, 'NFT already minted!');
        require (msg.value >= 0.05 ether, 'Need to pay up!');

        //uint256 newItemId = _tokenIdCounter.current();
        uint256 newItemId = _tokenIdCounter;
        //_tokenIdCounter.increment();
        _tokenIdCounter += 1;
        existingURIs[metadataURI] = 1;

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, metadataURI);

        return newItemId;
    }

}