/*global require, module*/
/*eslint no-undef: "error"*/

require('@nomicfoundation/hardhat-toolbox')
require('@nomiclabs/hardhat-waffle')
require('dotenv')


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: '0.8.19',
  paths: {
    artifacts: './src/artifacts',
  },
  networks: {
    hardhat: {
      chainId: 1337,
    },
    mumbai: {
      url: 'https://eth-mainnet.g.alchemy.com/v2/3GYZeNv_fZ4LaPuIROMDAom6oh4FSWsq',
      accounts: 'private-key here',
    },
  },
}
