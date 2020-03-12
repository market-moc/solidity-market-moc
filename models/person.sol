pragma solidity >=0.4.21 <0.7.0;

contract PersonModel {
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
}