import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contract with the account:", deployer.address);

  // Replace this with the actual ERC20 token address on the network you're deploying to
  const tokenAddress = "0x488Cdc396B5EdeC1c6da0Da00d1Ab2f5c9a63C03"; 

  // Get the contract factory and deploy the contract
  const TokenVault = await ethers.getContractFactory("TokenVault");
  const tokenVault = await TokenVault.deploy(tokenAddress);

  // Wait for the contract to be deployed
  await tokenVault.waitForDeployment();

  console.log("TokenVault contract deployed at:", tokenVault.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
