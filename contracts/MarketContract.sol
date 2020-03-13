pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

// import "../models/house.sol";
// import "../models/person.sol";

contract MarketContract {
    struct House {
        string tp;
        uint price;
        string addressHouse;
        uint surface;
        string description;
    }

    struct Transaction {
        uint buyerId;
        uint sellerId;
        House[] house;
        string date;
    }

    struct Seller {
        uint id;
        string name;
        string addressPerson;
    }

    struct Buyer {
        uint id;
        string name;
        string addressPerson;
    }

    Seller private seller;
    Transaction private transaction;
    Buyer private buyer;
    House[] private house;
    mapping (uint => address) houseOwner;
    mapping (uint => address) from;
    mapping (uint => address) to;
    event logData(uint);

    function addHouseToSeller(string memory _tp, uint _price,
    string memory _addressHouse, uint _surface, string memory _description) public {
        uint id = house.push(House(_tp, _price, _addressHouse, _surface, _description)) - 1;
        emit logData(id);
        houseOwner[id] = msg.sender;
    }

    function getNumberOfHouse() public view returns (uint) {
        return house.length;
    }

    function getHouse(uint _id) public view returns (House memory) {
        return house[_id];
    }

    function getHouses() external view returns (House[] memory) {
        return house;
    }

    function getTransaction(uint _idHouse) external view returns (Transaction memory) {
        transaction = Transaction(buyer.id, seller.id, houseOwner[_idHouse], now);
        return transaction;
    }

    function setPerson(uint _id, string memory _name, string memory _addressPerson, bytes memory _action) public {
        if(keccak256(_action) == keccak256('seller')) {
            seller = Seller(_id, _name, _addressPerson);
        } else {
            buyer = Buyer(_id, _name, _addressPerson);
            from[seller.id] = msg.sender;
        }
    }

    function getAdressBuyer() internal view returns (address) {
        require(bytes(buyer.name).length > 0);
        Buyer memory _buyer = buyer;
        return from[setPerson.id];
    }

    function newTransaction(uint _idHouse) public payable returns(string memory) {
       require(msg.value == house[_idHouse].price);
       address payable _buyerAdress = address(uint(getAdressBuyer()));
       _buyerAdress.transfer(msg.value);
       removeHouse(_idHouse);
       return "Done transaction";
    }

    function removeHouse(uint _id) internal {
        require(houseOwner[_id] == msg.sender);
        delete house[_id];
    }
}
