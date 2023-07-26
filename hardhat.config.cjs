/* eslint-disable @typescript-eslint/no-var-requires */
/*global require, module, process*/
/*eslint no-undef: "error"*/

require('@nomicfoundation/hardhat-toolbox') 
require('dotenv').config(); 

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: '0.8.19',
  paths: {
    artifacts: './src/artifacts',
  },
  networks: {
    hardhat: {
      chainId: 5,
    },
    goerli: {
      url: 'https://eth-goerli.g.alchemy.com/v2/pyhnNvRT2yBPE-57XJFTOkxNGfF4MUBN',
      accounts: [`0x${process.env.PRIVATE_KEY}`],
      gasPrice: 20000000000 // 20 gwei
    },
  },
} 