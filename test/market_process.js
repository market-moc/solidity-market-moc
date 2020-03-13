const marketProcess = artifacts.require("MarketContract");

contract("MarketContract", accounts => {
    it('test add house', async () => {
        let meta = await marketProcess.deployed();
        await meta.addHouseToSeller(1, 1, "White house", 400, "rue des fleurs", 50, "blablabla");
        await meta.addHouseToSeller(1, 1, "White house", 400, "rue des fleurs", 50, "blablabla");
        let id = await meta.getNumberOfHouse.call();
        console.log(id);
        // let house = await meta.getHouse.call(id - 1);
        // assert.equal(house.id, id);
    })

    // it('new transaction', async () => {
    //     let meta = await marketProcess.deployed();
    //     await meta.addHouseToSeller(2, 1, "Black house", 300, "rue des leurres", 50, "blablabla2");
    //     await meta.newTransaction(1, 300);
    //     let numberOfHouse = await meta.getNumberOfHouse.call();
    //     let house = await meta.getHouse.call(0);
    //     console.log(house);
    //     assert.equal(numberOfHouse, 1);
    // })
});

