const hre = require("hardhat");

async function main() {
 
const lawyer = await hre.ethers.getSigners();
console.log(lawyer);


const Usdt = await hre.ethers.getContractFactory("Usdt");
const usdt = await Usdt.connect(lawyer).deploy();
await usdt.deployed();


console.log(balance);

}