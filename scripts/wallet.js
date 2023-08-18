const hre = require("hardhat");
const { EDIT_DISTANCE_THRESHOLD } = require("hardhat/internal/constants");

async function main() {
 
const [owner1,owner2,owner3,recepient1] = await hre.ethers.getSigners();
threshold = 2;

const MultiSignerWallet = await hre.ethers.getContractFactory("MultiSignerWallet");
const wallet = await MultiSignerWallet.deploy([owner1.address,owner2.address,owner3.address],threshold);
await wallet.deployed();
const contractBalance = await hre.ethers.provider.getBalance(wallet.address);
await wallet.deposit({value: 2})


const owner = await wallet.getOwner();
console.log(owner);
const transfer = await wallet.createTransfer(2,recepient1.address);
await transfer.wait();
const transfers = await wallet.getTransfer();
console.log(transfers);
const approve1 = await wallet.connect(owner1).approveTransfer(0);
await approve1.wait();
const contractBalance2 = await hre.ethers.provider.getBalance(recepient1.address);
const approve2 = await wallet.connect(owner2).approveTransfer(0);
await approve2.wait();
const contractBalance3 = await hre.ethers.provider.getBalance(recepient1.address);
const transfer2 =  await wallet.getTransfer();
console.log(transfer2); 

  console.log(
    `deployed to ${wallet.address}`,contractBalance2,contractBalance3
  );
}



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});




