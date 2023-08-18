// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ERC115{

    mapping(uint256 => mapping(address => uint256)) internal balance;

      mapping(address => mapping(address => bool))private _operatorAppprovals;

    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

     event TransferSingle(address indexed _operator, address indexed _from, address indexed _to, uint256 _id, uint256 _value);

     event TransferBatch(address indexed _operator, address indexed _from, address indexed _to, uint256[] _ids, uint256[] _values);


   
   function balanceOf(address account, uint256 id) public view returns (uint256){
    require(account != address(0), "Address is Zero");
    return balance[id][account];
   }
  
function balanceOfBatch(address[] memory accounts, uint256[] memory ids) public view returns (uint256[] memory){
         require(accounts.length == ids.length,"Accounts and ids are not the same length");
         uint256[] memory batchBalance = new uint256[](accounts.length);

         for(uint256 i = 0; i < accounts.length; i++){
           batchBalance[i] = balanceOf(accounts[i], ids[i]);
         }

         return batchBalance;
}

  function setApprovalForAll(address _operator, bool _approved) external{
        _operatorAppprovals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
   }

   function isApprovedForAll(address _owner, address _operator) public view returns (bool){
            return _operatorAppprovals[_owner][_operator];
   }

   function _transfer(address from, address to, uint256 id, uint256 amount) private{
    uint256  fromBalance = balance[id][from];
    require(fromBalance >= amount, 'insufficient Balance');
    balance[id][from] = fromBalance - amount;
    balance[id][to] += amount;
   }

  function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata _data) external{
   require(msg.sender == from || isApprovedForAll(from, msg.sender), 'msg.sender is not the operator or owner');
   require(to != address(0), 'Address is 0');
   _transfer(from, to, id, amount);
  emit TransferSingle(msg.sender, from, to, id, amount);
  require(_checkOnERC115Received(), 'Receiver is not implemented');
  }

   function _checkOnERC115Received() private pure returns(bool){
    return true;
   }

    function safeBatchTransferFrom(address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes calldata _data) external{
        require(msg.sender == from || isApprovedForAll(from, msg.sender),"msg.sender is not the operator or owner");
        require(to != address(0), "Address is 0");
        require(ids.length == amounts.length,"IDs and amount should be of same length");

          for (uint256 i = 0; i < ids.length; i++){
            uint256 id = ids[i];
            uint256 amount = amounts[i]; 

            _transfer(from, to, id, amount);

          }
       emit TransferBatch(msg.sender, from, to, ids, amounts);
       require(_checkOnBatchERC115Received(),"Receiver is not implemented");
    }

    function _checkOnBatchERC115Received() private pure returns(bool){
    return true;
   }
  function supportsInterface(bytes4 interfaceId) public pure virtual returns(bool){
    return interfaceId == 0xd9b67a26;
  }


}