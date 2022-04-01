//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    struct User{
        string name;
        uint age;
        string country;
    }

    modifier addOnlyOnce(address _addr){
        require(!userAdded[_addr], "sorry, you have been added already");
        _;
    }

    mapping(address => bool) public userAdded;
    mapping(address => User) public users;

    function add(string memory _name, uint _age, string memory _country) external addOnlyOnce(msg.sender){
        User memory _user = User(_name, _age, _country);
        users[msg.sender] = _user;
        userAdded[msg.sender] = true; 
    }

    function update(string memory _name, uint _age, string memory _country) external{
        User storage _user = users[msg.sender];
        _user.name = _name;
        _user.age = _age;
        _user.country = _country;
    }
    
}