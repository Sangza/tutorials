const hre = require("hardhat");

async function main() {
 
const [lawyer] = await hre.ethers.getSigners();



const DragonBallz = await hre.ethers.getContractFactory("DragonBallz");
const token = await DragonBallz.connect(lawyer).deploy("WebbedWitch","Ww");
await token.deployed();
console.log("success , Contract was deployed to", token.address);
const nft = await token.mint('https://ipfs.io/ipfs/QmYxrWRUgBYssNCSKjuBiCf6kEDqrK98oivBwV6TrhqChb/1.json');
console.log(nft)
;}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });