// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Nft.sol";

contract DragonBallz is Collections{
    string public name;

    string public symbol;

    uint256 public tokenCount;

    mapping(uint => string) private tokenURIs;

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }
    // https: url: consist all the information regarding metadata
    function tokenURI(uint256 _tokenId) public view returns(string memory){
        require(owners[_tokenId] != address(0), "TokenId does not exist");
         return tokenURIs[_tokenId];
    }
 
    //create a new Nft inside our collection
    function mint (string memory _tokenURI) public{
        tokenCount += 1;
        balances[msg.sender] += 1;
        owners[tokenCount] = msg.sender;
        tokenURIs[tokenCount] = _tokenURI;

        emit Transfer(address(0), msg.sender, tokenCount);
    }
    function supportsInterface(bytes4 interfaceId)public pure override returns(bool){
        return interfaceId == 0x5b5e139f || interfaceId == 0x80ac58cd;
    }
}