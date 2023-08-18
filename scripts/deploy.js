// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
 
const see = await hre.ethers.getSigners();
// console.log(see.map((items)=> items.address))
 
const Crud = await hre.ethers.getContractFactory("Crud");
const crud = await Crud.deploy();
await crud.deployed();

const totalEmployee1 = await crud.TotalEmployee();
const response = await crud.create("sangz","sangzokenyidm@gmail.com",12, "0x5FbDB2315678afecb367f032d93F642f64180aa3");

const second = await crud.create('sangz','dontdeserve@gmail.com',22,"0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2");
const third = await crud.create('awele','loveofmylife@gmail.com',43,"0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db");

 
// const employees = await crud.Employeer(0);
// console.log(employees)
// //  await crud.update("ucheokenyidm@gmail.com","uchechukwu");
// // const employees2 = await crud.Employeer(0)

// // console.log(employees2)
// console.log(response,second,third)
// await crud.delEmploye('dontdeserve@gmail.com')
 const totalEmployee2 = await crud.TotalEmployee();
 console.log(totalEmployee1,totalEmployee2);
// //  const totalEmployee3 = await crud.TotalEmployee();
// //  console.log(totalEmployee3); 




  console.log(
    `Lock with 1 ETH and unlock timestamp deployed to ${crud.address}`
  );
}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});




