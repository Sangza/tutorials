// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Collections{

    mapping(address => uint256) public balances;

    mapping(uint256 => address) public owners;
    
    mapping(address => mapping(address => bool))private _operatorAppprovals;

    mapping(uint256 => address) private _tokenApprovals;

     event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

     event Approval(address indexed _owner, address indexed _approvevd, uint256 indexed _tokenId);

     event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

   function balanceOf(address _owner) public view returns (uint256){
      return balances[_owner];
      }

   function ownerOf(uint256 _tokenId) public view returns (address){
    address owner = owners[_tokenId];
     require(owner != address(0), "just rest ");
     return owner;
 }
   
   function setApprovalForAll(address _operator, bool _approved) external{
        _operatorAppprovals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
   }

   function isApprovedForAll(address _owner, address _operator) public view returns (bool){
            return _operatorAppprovals[_owner][_operator];
   }
    function approve(address _approved, uint256 _tokenId) public payable{
        address owner = ownerOf(_tokenId);
        require(msg.sender == owner || isApprovedForAll(owner,msg.sender),"msg.sender is not the owner or operator");
        _tokenApprovals[_tokenId] = _approved;
        emit Approval(owner, _approved, _tokenId);
  }
    function getApproved(uint256 _tokenId) public view returns (address){
        require(owners[_tokenId] != address(0), "Token ID is invalid");
        return _tokenApprovals[_tokenId];
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public payable{
         address owner = ownerOf(_tokenId);

         require(msg.sender == owner || getApproved(_tokenId) == msg.sender || isApprovedForAll(owner, msg.sender),"msg.sender is not owner or approved address for transfer" );

         require(owner == _from, 'from adddress is not the owner');
         require(_to != address(0), "Address is zero address");

         approve(address(0), _tokenId);  

         balances[_from] -= 1;
         balances[_to] += 1;
         owners[_tokenId] = _to;

         emit Transfer(_from, _to, _tokenId);
    }
   function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes  memory data) public payable{
         transferFrom(_from, _to, _tokenId);
         require(_checkOnERC721Received(),'Receiver not implement');
   }
   function _checkOnERC721Received() private pure returns(bool){
    return true;
   }

   function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable{
     safeTransferFrom(_from, _to, _tokenId, '');
   }
   
  function supportsInterface(bytes4 interfaceId) public pure virtual returns (bool){
    return interfaceId == 0x80ac58cd;
  }
}

