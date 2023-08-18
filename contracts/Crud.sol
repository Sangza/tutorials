// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Crud{

    struct employee{
        string name; 
        string email;
        uint256 age;
        address walletAdress;
    }

    employee[] public Employeer;
    uint256 public TotalEmployee; 

   constructor(){
    TotalEmployee = 0;
   }

   function create (string memory name, string  memory email, uint256 age, address walletAdress) public returns (uint256){
    employee memory newEmployee = employee(name, email,age,walletAdress);
    Employeer.push(newEmployee);
    TotalEmployee++;
    return TotalEmployee;
   }

   function update(string memory email,string memory name) external returns(bool){
     for(uint i = 0; i  < TotalEmployee; i++){
            if(compareStrings(Employeer[i].email, email)){
                Employeer[i].name = name;
                return true;
            }
     }
     return false;
   } 

   function delEmploye(string memory email)external returns(bool){
    assert(TotalEmployee > 0);
    for(uint i = 0 ; i < TotalEmployee; i++){
        if(compareStrings(Employeer[i].email, email)){
            Employeer[i] =  Employeer[TotalEmployee - 1];
            delete Employeer[TotalEmployee - 1];
            TotalEmployee--;
            return true;
        }

    }
    return false;
   }


   

function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

}