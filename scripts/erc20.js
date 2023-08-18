const hre = require("hardhat");

async function main() {
 
const lawyer = await hre.ethers.getSigners();
console.log(lawyer);


const Token = await hre.ethers.getContractFactory("SangzToken");
const token = await Token.connect(lawyer).deploy('SangzTo','sT',18,1000000);
await token.deployed();

const balance = await token.connect(lawyer).balanceOf(lawyer);
console.log(balance);

}