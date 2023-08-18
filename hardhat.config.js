require("@nomicfoundation/hardhat-toolbox");

const API_KEY = 'GEvBPdBG-HpcwLWR4LAAPceLStiPEdQU';

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks:{
    goerli:{
      url: `https://eth-goerli.g.alchemy.com/v2/${API_KEY}`,
      accounts:["271bd9ead56e7ee5c5974c3ca41a4b6f3f9fc98df46265bac1892cd562b053b5"]
    } 
  },
  etherscan: {
    apiKey: "1UHDXEXEES2XKKCZF3ED4G837E4H3FQJBG",
  },
};

// lawyer: 0x0Ea6Dd27D4793b9b03a2749B3934F14EC24A4f4f
//payee: 0x354e386d90E4C67ded6edB4EA960Cd1731E4C5FA
// payer: 0xdB8D358C5641da7b978cce828D0C9244c98d59fB