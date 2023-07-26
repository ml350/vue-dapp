// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
/*global process*/
/*eslint no-undef: "error"*/
import hre from 'hardhat';

async function main() {
  const [deployer] = await hre.ethers.getSigners()
  console.log(
    'Deploying contracts with the account:',
    deployer.address,
  )
  const paymentToken = '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2'
  const mintPrice = hre.ethers.parseEther('0.001');
  const Hyenas = await hre.ethers.getContractFactory('HaHaHyenas')
  const deploy = await Hyenas.deploy(paymentToken, mintPrice)

  console.log('HaHa Hyenas deployed to the:', deploy.address)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })