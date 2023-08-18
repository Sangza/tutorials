const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MultiSignerWallet",  function () {
  let wallet
it("Setup", async function () {
      
       const MultiSignerWallet = await ethers.getContractFactory("MultiSignerWallet");
       const  [owner,owner2,owner3] = await ethers.getSigners();

       wallet = await MultiSignerWallet.deploy([owner.address,owner2.address,owner3.address],2);
       await wallet.deployed();
      
   });
  
it("starting up the contract with the constructor", async function(){
    expect(await wallet.getOwner()).to.equal([owner.address,owner2.address,owner3.address])
});
// it("create employee data",async function(){
//   const createRd = await crud.create("sangz","sangzokenyidm@gmail.com",12, "0x5FbDB2315678afecb367f032d93F642f64180aa3");
//   await createRd.wait();
//   expect (await crud.TotalEmployee()).to.equal(1)
// })
// it("update employee data", async function(){
//   const employee1 =await crud.Employeer(0)
//   const upDate= await crud.update('sangzokenyidm@gmail.com','uchechukwu');
//   await upDate.wait();
//   const employees2 = crud.Employeer(0)

//   expect(await crud.TotalEmployee(1)).to.equal(employees2);
// })
});