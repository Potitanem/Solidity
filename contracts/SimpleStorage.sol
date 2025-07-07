// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


contract SimpleStorage {
    // if no value fo unit256 then equel 0
    uint256 myFavoriteNumber; // 0

   // uint256[] listFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople; 

    // Person public  Den = Person({favoriteNumber: 10, name:"Den"});
    mapping (string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }
    
    //view, pure    
    function retrieve() public view returns(uint256)  {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavouriteNumber[_name] = _favoriteNumber;
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}
