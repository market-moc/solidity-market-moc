pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

// import "../models/house.sol";
// import "../models/person.sol";

contract MarketContract {
    struct House {
        uint id;
        uint id_seller;
        string name;
        uint price;
        string addressHouse;
        uint surface;
        string description;
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
    Buyer private buyer;
    House[] private house;
    mapping (uint => uint) houseOwner;
    event logData(uint, uint);

    function addHouseToSeller(uint _id, uint _id_seller, string memory _name, uint _price, 
    string memory _addressHouse, uint _surface, string memory _description) public {
        uint id = house.push(House(_id, _id_seller, _name, _price, _addressHouse, _surface, _description));
        houseOwner[id] = id;
    }

    function getNumberOfHouse() public view returns (uint) {
        return house.length;
    }

    function getHouse(uint _id) public view returns (House memory) {
        //require(house[_id].id == _id);
        return house[_id];
    }

    function setPerson(uint _id, string memory _name, string memory _addressPerson, bytes memory _action) public {
        if(keccak256(_action) == keccak256('seller')) {
            seller = Seller(_id, _name, _addressPerson);
        } else {
            buyer = Buyer(_id, _name, _addressPerson);
        }
    }

    function newTransaction(uint _idHouse, uint monneyBuyer) external {
        // 1) vérifier si la somme qui met est égale à la somme qui l'envoie
        emit logData(house[_idHouse].price, monneyBuyer);
        require(house[_idHouse].price == monneyBuyer);
        // 2) buyer acheter le produit
        removeHouse(_idHouse);
        // 3) l'argent du buyer est envoyé au seller
    }

    function removeHouse(uint _id) internal {
        uint index = houseOwner[_id];
        //if(!index) return;
        house[index] = house[house.length-1];
        house.length--;
    }
    
}