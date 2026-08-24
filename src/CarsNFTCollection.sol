// SPDX-License-Identifier: MIT

pragma solidity 0.8.35;

/**
 * @title CarsNFTCollection
 * @author Jose L Imoberdorf
 * @dev A simple NFT collection contract for cars
*/

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract CarsNFTCollection is ERC721 {

    using Strings for uint256; // Indication to use the library and type data to assign

    uint256 public currentTokenId; // 0 by default
    uint256 public totalSupply; // Tokens to mint
    string  public  baseUri;

    event MintNFT(address userAddress_, uint256 tokenId_);

    constructor(string memory name_, string memory symbol_, uint256 totalSupply_, string memory baseUri_) ERC721(name_, symbol_){
        totalSupply = totalSupply_;
        baseUri = baseUri_;
    }

    /**
     * @dev Mints a new NFT
     */
    function mint() external{
        require(currentTokenId < totalSupply, " Sold out");
        _safeMint(msg.sender, currentTokenId);
        uint256 id = currentTokenId;
        currentTokenId++; //suma 1 

        emit MintNFT(msg.sender, id); // muestra ek token anterior

    }
    
    /**
     * @dev Returns the base URI for the NFTs
    */
    function _baseURI() internal override view virtual returns (string memory) {
        return baseUri;
    }

    /**
     * @dev Returns the token URI for a given token ID
     * @param tokenId The ID of the token to retrieve the URI for
     * @return The token URI as a string
     */
    function tokenURI(uint256 tokenId) public view override virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : ""; 
    }


}





