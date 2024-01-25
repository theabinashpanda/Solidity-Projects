(async () => {
    try {
        const Spacebear = await hre.ethers.getContractFactory("Spacebear");
        const spacebearInstance = await Spacebear.deploy();
        await spacebearInstance.waitForDeployment();
        //deployed() and address are no longer there for hardhat-toolbox
        console.log(`Deploy contract at ${await spacebearInstance.getAddress()}`);
    } catch (err) {
        console.error(err);
        process.exitCode = 1;
    }
  })();
   