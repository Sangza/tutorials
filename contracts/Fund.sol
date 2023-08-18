// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Fund{

  event Transfer(
    address indexed sender,
    uint amount
  );  

 function sendEther(address payable sender,uint amount)  external payable{
    require(address(this).balance >= amount, "Insufficient Amount" );
    sender.transfer(amount);
    emit Transfer(sender, amount);
 }

} 