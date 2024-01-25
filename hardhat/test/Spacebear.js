const {expect} = require("chai");
const hre = require("hardhat");
describe("Spacebear",function() {
    it("is possible to mint a token",async()=>{
        const Spacebear = await hre.ethers.getContractFactory("Spacebear");
        const spacebearInstance = await Spacebear.deploy();
        const [owner,otherAccount] = await ethers.getSigners();
        await spacebearInstance.safeMint(otherAccount.address);
        expect(await spacebearInstance.ownerOf(0)).to.equal(otherAccount.address);
    })

    it("fails to transfer tokens from the wrong address",async()=>{
        const Spacebear = await hre.ethers.getContractFactory("Spacebear");
        const spacebearInstance = await Spacebear.deploy();
        const [owner,otherAccount,notTheNFTOwner] = await ethers.getSigners();
        await spacebearInstance.safeMint(otherAccount.address);
        expect(await spacebearInstance.ownerOf(0)).to.equal(otherAccount.address);
        await expect(spacebearInstance.connect(notTheNFTOwner).transferFrom(otherAccount.address,notTheNFTOwner.address,0));
    })
})