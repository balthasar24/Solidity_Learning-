// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract EventExample {

    event NewUserRegistered(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping(address => User) public user;

    function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = user[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        emit NewUserRegistered(msg.sender, _username);
    }
}