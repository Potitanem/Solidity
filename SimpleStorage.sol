// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


contract SimpleStorage {
    // if no value fo unit256 then equel 0
    uint256 myfavoriteNumber; // 0

   // uint256[] listFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople; 

    // Person public  Den = Person({favoriteNumber: 10, name:"Den"});

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }
    
    //view, pure    
    function retrieve() public view returns(uint256)  {
        return myfavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}

contract Animals{
    struct Animal{
        string name;
        uint256 age;
    }
    Animal[] public listOfAnimal = [Animal({name:"Fox", age:10}), Animal({name:"Dog", age:4}), Animal({name:"Cat", age:3})];

    function getAnimals(string memory _name, uint256 _age) public{
        listOfAnimal.push(Animal(_name, _age));
    }

    function getLenght() public view returns(uint256){
        return listOfAnimal.length;
    }
}