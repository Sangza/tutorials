const hre = require("hardhat");

async function main() {
 
const [lawyer] = await hre.ethers.getSigners();



const Escrow = await hre.ethers.getContractFactory("Escrow");
const escrow = await Escrow.connect(lawyer).deploy("0x354e386d90E4C67ded6edB4EA960Cd1731E4C5FA","0xdB8D358C5641da7b978cce828D0C9244c98d59fB",10000000000000);

 await escrow.deployed();

 
console.log(escrow.address)
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  
