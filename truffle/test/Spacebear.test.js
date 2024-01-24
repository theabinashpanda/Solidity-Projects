const Spacebear = artifacts.require("Spacebear");

contract("...",(accounts)=> {
    it("should credit an NFT to a specific account",async()=>{
        const SpacebearInstance = await Spacebear.deployed();
        // await SpacebearInstance.safeMint(accounts[1],"spacebear_1.json");
        let txResult = await SpacebearInstance.safeMint(accounts[1],"spacebear_1.json");
        // console.log(txResult);
        // assert.equal(txResult.logs[0].event,"Transfer","Event is not a Transfer event");
        // assert.equal(txResult.logs[0].args.from,"0x0000000000000000000000000000000000000000","From is not the zero address");
        console.log(txResult.logs[0].args);
        truffleAssert.eventEmitted(txResult, 'Transfer', {from: '0x0000000000000000000000000000000000000000', to: accounts[1], tokenId: web3.utils.toBN("0")});
        assert.equal(await SpacebearInstance.ownerOf(0),accounts[1],"Owner of Token 1 is not equal to account 2");
    });

})
