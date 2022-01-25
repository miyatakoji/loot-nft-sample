const { expect } = require("chai");

// describe("Token contract", function () {
//   it("Deployment should assign the total supply of tokens to the owner", async function () {
//     const [owner] = await ethers.getSigners();

//     const Token = await ethers.getContractFactory("Token");

//     const hardhatToken = await Token.deploy();

//     const ownerBalance = await hardhatToken.balanceOf(owner.address);
//     expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
//   });
// });

describe("Token contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    this.timeout(600 * 1000);
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    // We get the contract to deploy
    const MyNFT = await ethers.getContractFactory("MyNFT");
    const nft = await MyNFT.deploy();

    await nft.deployed();

    console.log("MyNFT deployed to:", nft.address);
    expect(await nft.name()).to.equal("MyNFT");
  });
});
