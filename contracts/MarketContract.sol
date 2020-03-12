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

    function addHouseToSeller(uint _id, uint _id_seller, string memory _name, uint _price, 
    string memory _addressHouse, uint _surface, string memory _description) public {
        house.push(House(_id, _id_seller, _name, _price, _addressHouse, _surface, _description));
    }

    function getNumberOfHouse() public view returns (uint) {
        return house.length;
    }

    function getHouse(uint _id) public view returns (House memory) {
        require(house[_id].id == _id);
        return house[_id];
    }

    function newTransaction(Seller memory _seller, Buyer memory _buyer, uint _idHouse) internal {
        // 1) recevoir et alimenter les infos du buyer et du seller
        seller = _seller;
        buyer = _buyer;
        // 2) buyer acheter le produit
        delete house[_idHouse];
        // 3) vérifier si la somme qui met est égale à la somme qui l'envoie
        // 4) l'argent du buyer est envoyé au seller et on retire le produit de la liste
    }
    
}