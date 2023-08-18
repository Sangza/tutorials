// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Erc115.sol";

contract Nft is ERC115{
    string public name;
    string public symbol;
    uint256 public tokenCount;

    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }

    function uri(uint256 tokenId) public view returns(string memory){
        return _tokenURIs[tokenId];
    }

    function mint(uint256 amount, string memory _uri)  public  {
      require(msg.sender != address(0),"mint to the zero address");
      tokenCount += 1;
      balance[tokenCount][msg.sender] += amount;
      _tokenURIs[tokenCount] = _uri;
      emit TransferSingle(msg.sender, address(0), msg.sender, tokenCount, amount);  
    }

    // function batchMint(uint[] calldata  amount, string[] memory _uri) public{
    //     require(msg.sender != address(0),"mint to the zero address");
    //   tokenCount += 1;
    //   balance[tokenCount][msg.sender] += amount;
    //   _tokenURIs[tokenCount] = _uri; 
    //   emit TransferBatch(msg.sender, address(0), msg.sender, tokenCount, amount);
    // }

    function supportsInterface(bytes4 interfaceId) public pure override returns(bool){
        return interfaceId == 0xd9b67a26 || interfaceId == 0x0e89341c;
    }
}