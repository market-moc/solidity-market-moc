const marketProcess = artifacts.require("MarketContract");

contract("MarketContract", accounts => {
    it('test add house', async () => {
        let meta = await marketProcess.deployed();
        let newHouse = {id: 1, id_seller: 1, name: "White house", price: 15, addressHouse: "rue des fleurs", surface: 50, description: "blablabla"};
        let id = await meta.addHouseToSeller(newHouse);
        let house = await meta.getHouse(id);
        assert.equal(house.id, newHouse.id);
    })
});

