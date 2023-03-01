// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // the version of solidity .!

contract SimpleStorage {
    // boolean, uint, int , address , bytes. bytes 32 is maximum
    // address is the address wallert to iditify a string become a address. 
    // bool hasFavoriteNumber = true;
    uint256 public favoriteNumber; // if we create a variable and don't set any value , it's value will zero = 0,with string it's value is empty
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = 0x4324C9430767e83dE995e10C241a04c6C8b3B042;
    // bytes32 favoriteBytes = "cat";
    //Struct and array: Với Struct 

    // Communication public miniMunation = Communication({firstAddress: 3,secondString: "Mr.Robinson"});
    
    mapping(string => uint256) public findFavoriteNumber;
    // tạo biến mapping như cách tạo biến uint256 như mình có 

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256 public favoriteNumbersList;
    People[] public people;

    
    // Example : if we have a value in array , that a maximum list in this variable .
    // if we keep it's emptry, the array can grow and shrink as we add .
    // 0: 10,Aliltle, 1: 20,Bliltle, 2: 30,CLillte

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    // How to push value in to array .
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber,_name));
        findFavoriteNumber[_name] = _favoriteNumber;
    }
}

// 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B