const hre = require("hardhat");

async function main() {
 
const [lawyer] = await hre.ethers.getSigners();



const Nft = await hre.ethers.getContractFactory("NFTs");
const nft = await Nft.deploy('Collection','CL','https://ipfs.io/ipfs/QmYxrWRUgBYssNCSKjuBiCf6kEDqrK98oivBwV6TrhqChb/','0xbfD2135BFfbb0B5378b56643c2Df8a87552Bfa23');

 await nft.deployed();

 
console.log(nft.address)
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  
