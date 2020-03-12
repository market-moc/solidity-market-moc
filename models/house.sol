pragma solidity >=0.4.21 <0.7.0;

contract HouseModels {
    struct House {
        uint id;
        string name;
        uint price;
        string addressHouse;
        uint surface;
        string description;
    }
}