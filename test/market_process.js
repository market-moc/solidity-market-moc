const marketProcess = artifacts.require("MarketContract");

contract("MarketContract", accounts => {
    it('test add house', async () => {
        let meta = await marketProcess.deployed();
        await meta.addHouseToSeller("appartement", 400, "rue des fleurs", 50, "blablabla");
        await meta.addHouseToSeller("appartement", 300, "rue des rouges", 50, "blablabla1111");
        let numberOfMusic = await meta.getNumberOfHouse.call();
        assert.equal(numberOfMusic, 2);
    })
    it('test houses', async () => {
        let meta = await marketProcess.deployed();
        await meta.addHouseToSeller("appartement", 400, "rue des fleurs", 50, "blablabla");
        await meta.addHouseToSeller("appartement", 300, "rue des rouges", 20, "blablabla1111");
        let houses = await meta.getHouses.call();
        assert.notEqual(houses, []);
    })
    it('new transaction', async () => {
        let meta = await marketProcess.deployed();
        let houses = await meta.getHouses.call();
        let index = houses[0].indexOf('appartement');
        await meta.newTransaction(index, {from: '0xB1544bD4520b2aDeB3b919DCA6af0A77e7197D7A', value: 2});
        let transaction = meta.getTransaction.call();
        assert.notEqual(transaction, {});
    })
});

