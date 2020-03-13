pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract MarketContract {
    struct House {
        string tp;
        uint price;
        string addressHouse;
        uint surface;
        string description;
    }

    struct Transaction {
        address buyerId;
        address sellerId;
        House house;
        uint date;
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
    Transaction[] private transaction;
    Buyer private buyer;
    House[] private house;
    mapping (uint => address) houseOwner;
    mapping (uint => address) from;
    mapping (uint => address) to;
    event logData(address);

    function addHouseToSeller(string memory _tp, uint _price,
    string memory _addressHouse, uint _surface, string memory _description) public {
        uint id = house.push(House(_tp, _price, _addressHouse, _surface, _description)) - 1;
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

    function getTransaction() external view returns (Transaction[] memory) {
        return transaction;
    }

    function setTransaction(uint _idHouse) internal {
        transaction.push(Transaction(msg.sender, houseOwner[_idHouse], house[_idHouse], now));
    }

    function setPerson(uint _id, string memory _name, string memory _addressPerson, bytes memory _action) public {
        if(keccak256(_action) == keccak256('seller')) {
            seller = Seller(_id, _name, _addressPerson);
        } else {
            buyer = Buyer(_id, _name, _addressPerson);
            from[buyer.id] = msg.sender;
        }
    }

    function newTransaction(uint _idHouse) public payable returns(Transaction memory) {
       address payable _idSeller = address(uint(houseOwner[_idHouse]));
       address payable idBuyer = address(uint(msg.sender));
       idBuyer.transfer(msg.value);
       setTransaction(_idHouse);
       removeHouse(_idHouse);
    }

    function removeHouse(uint _id) internal {
        require(houseOwner[_id] == msg.sender);
        house[_id] = house[house.length-1];
        house.length--;
    }
}
