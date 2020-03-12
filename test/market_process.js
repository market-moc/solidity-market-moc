const marketProcess = artifacts.require("MarketContract");

contract("MarketContract", accounts => {
    it('test add house', async () => {
        let meta = await marketProcess.deployed();
        await meta.addHouseToSeller(1, 1, "White house", 15, "rue des fleurs", 50, "blablabla");
        let id = await meta.getNumberOfHouse.call();
        let house = await meta.getHouse.call(id - 1);
        assert.equal(house.id, id);
    })
});

