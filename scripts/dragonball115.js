const hre = require("hardhat");

async function main() {
 
const [payee] = await hre.ethers.getSigners();



const Nft = await hre.ethers.getContractFactory("Nft");
const token = await Nft.connect(payee).deploy("ArabicLetter","AL");
await token.deployed();
console.log("success , Contract was deployed to", token.address);
const nft = await token.mint(10,'https://ipfs.io/ipfs/QmYxrWRUgBYssNCSKjuBiCf6kEDqrK98oivBwV6TrhqChb/14.json');
console.log(nft)
;}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });